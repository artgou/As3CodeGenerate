package  com.far.analysis
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	
	/**
	 * 
	 * @author davidderaedt
	 * 
	 * Singleton used to access template files data
	 * 
	 */	
	
	public class TemplateManager
	{		
		public var eventTemplateStr:String;				
		public var voTemplateStr:String;
		public var singletonTemplateStr:String;
		public var interfaceTemplateStr:String;
		

		private static var instance:TemplateManager;
		
		public static function getInstance():TemplateManager
		{
			if(instance==null) instance = new TemplateManager();
			return instance;
		}
		
		
		
		public function getTemplates(pDirPath:String):void
		{
			eventTemplateStr = getTemplateString(pDirPath, "Event.txt");
			voTemplateStr = getTemplateString(pDirPath, "VO.txt");
			singletonTemplateStr = getTemplateString(pDirPath, "Singleton.txt");
			interfaceTemplateStr = getTemplateString(pDirPath, "Interface.txt");
			call();
		}
		
		public var call:Function;
		public static function getFileString(file:File, pEncoding:String="utf-8"):String
		{
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.READ);
			var str:String = stream.readMultiByte(stream.bytesAvailable, pEncoding);
			stream.close();
			return str;
		}	
		public function getTemplateString(pDirPath:String, pFileName:String):String
		{
			return getFileString(getTemplate(pDirPath+pFileName));	
		}
		private function getTemplate(pPath:String):File
		{
			var f:File = File.applicationDirectory.resolvePath(pPath);
			if(!f.exists) { 
				trace("Unable to find template "+f.nativePath, "ERROR");
				return new File();
			}
			
			return f;
		}
				
	}
}