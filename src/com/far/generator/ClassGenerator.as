package com.far.generator
{
	
	import com.far.analysis.GeneratedFile;
	import com.far.analysis.PackageConfig;
	import com.far.analysis.PseudoClass;
	import com.far.analysis.PseudoVariable;
	import com.far.analysis.TemplateManager;

	public class ClassGenerator extends GeneratorConfig  
	{
		public function ClassGenerator()
		{
			super();
		}
 	
		/**
		 * 
		 * @param pOriginalFile  类对象，包括对应的属性方法
		 * @return 
		 * 
		 */		
		public function generator(pOriginalFile:PseudoClass):GeneratedFile
		{
			
			var pTemplate:String = templateMgr.voTemplateStr;
			var className:String= pOriginalFile.className;
			var str:String = replacePackageNames(pTemplate);
			
			//imports
			str = str.replace(/\*IMPORTS\*/, "");
			
			//class, constructor
			str = str.replace(/\*VO\*/g, className);
			
			//properties
			var s:String="";
			
			var getsets:String="";
			for ( var i:int = 0 ; i < pOriginalFile.properties.length ; i++)
			{
				var variable:PseudoVariable = pOriginalFile.properties[i] ;
				s+="\t\t"+"private var _"+ variable.name+":"+variable.type+";\n";	
				if(variable.isGetSet)
				{
					getsets+="\t\tpublic function get "+variable.name+"():"+variable.type+"{\n";		
					getsets+="\t\t\treturn _"+variable.name+";\n";
					getsets+="\t\t}\n\n";
					getsets+="\t\tpublic function set "+variable.name+"(pData:"+variable.type+"):void{\n";		
					getsets+="\t\t\t_"+variable.name+"=pData;\n";
					getsets+="\t\t}\n\n";
				}
				
			}
			str =  str.replace(/\*PROPERTIES\*/, s);
			str =  str.replace(/\*GETTERSETTERS\*/, getsets);
			
			var asFile:GeneratedFile = new GeneratedFile(className, "as", packageConfig.voPackageName);
			asFile.code = str ;
			
			return asFile;
			
		}
		
	
		
		
	}
}