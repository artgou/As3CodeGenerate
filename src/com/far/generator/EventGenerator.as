package com.far.generator
{
	
	import com.far.analysis.GeneratedFile;
	import com.far.analysis.PseudoClass;
	import com.far.analysis.TemplateManager;
	import com.far.utils.StringTools;

	public class EventGenerator   implements IGenerator
	{
		[Inject]
		public var templateMgr:TemplateManager ;
		public function EventGenerator()
		{
			super();
		}
		
		/**
		 * 
		 * @param pClassName  事件类名
		 * @param pQualifiedSuperClass 父类 默认为flash.event.Event
		 * @param pPublicProperty 要传输的数据
		 * @return 
		 * eveGen.generator("MyEvent","flash.events.XEvent","flash.display.MovieClip");
		 */		
		public function generator(pOriginalFile:PseudoClass):GeneratedFile
		{
			var pTemplate:String = templateMgr.eventTemplateStr;
			
			var str:String = pTemplate.replace(/\*EVENTSPACKAGE\*/g, pOriginalFile.packageName);
//			var lcClassName:String = StringTools.lowerFirstChar(pClassName);
			var pQualifiedSuperClass:String=pOriginalFile.pQualifiedSuperClass;
			var pPublicProperty:String = pOriginalFile.pPublicProperty;
			var superClass:String = pQualifiedSuperClass.substr(pQualifiedSuperClass.lastIndexOf(".")+1);
//			var defaultType:String = "public static const EVENT_"+pClassName.toUpperCase()+':String = "'+lcClassName+'";'
			
//			str = str.replace(/\*CLASS_NAME\*/g, pClassName);			
			str = str.replace(/\*EVENT_SUPERCLASS\*/g, superClass);			
//			str = str.replace(/\*EVENT_TYPES\*/g, "\t\t"+defaultType);
			
			var imports:String ;
			imports= "\timport "+pQualifiedSuperClass+";\n";
			
			if(pPublicProperty&&pPublicProperty.length>0)
			{
				var propertyType:String = pPublicProperty.substr(pPublicProperty.lastIndexOf(".")+1);				
				var propertyIdentifier:String = StringTools.lowerFirstChar(propertyType);
				str = str.replace(/\*PROPERTIES\*/g, "\t\tpublic var "+propertyIdentifier+":"+propertyType+";");
				str = str.replace(/\*PROPERTIES_PARAM\*/g, "p"+propertyType+":"+propertyType+", ");
				str = str.replace(/\*PROPERTIES_SET\*/g, "\t\t\t"+propertyIdentifier+"=p"+propertyType+";");				
				str = str.replace(/\*PROPERTIES_CLONE\*/g, propertyIdentifier+", ");
				imports +="\timport "+pPublicProperty+";\n";
				
			}
			else{
				str = str.replace(/\*PROPERTIES\*/g, "");
				str = str.replace(/\*PROPERTIES_PARAM\*/g, "");
				str = str.replace(/\*PROPERTIES_SET\*/g, "");				
				str = str.replace(/\*PROPERTIES_CLONE\*/g, "");
			}
			
			str = str.replace(/\*IMPORTS\*/g, imports);			
			var asFile:GeneratedFile = new GeneratedFile(pOriginalFile.classNames,"as", pOriginalFile.packageName);
			asFile.code = str ;
			
			
			return asFile;			
			
		}
	}
}