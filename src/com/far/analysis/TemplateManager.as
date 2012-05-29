package  com.far.analysis
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	
	/**
	 * 
	 * @author far
	 * 
	 * 模板管理器
	 * 
	 */	
	
	public class TemplateManager
	{		
		public var eventTemplateStr:String;				//事件模板
		public var voTemplateStr:String;    //对象模板
		public var singletonTemplateStr:String;//单例模板
		public var interfaceTemplateStr:String;//接口模板
		

		
		[Inject]
		public var autoCodeManager:AutoCodeManager; //自动代码提示
		public function getTemplates(pDirPath:String):void
		{
			eventTemplateStr = getTemplateString(pDirPath, "Event.txt");
			voTemplateStr = getTemplateString(pDirPath, "VO.txt");
			singletonTemplateStr = getTemplateString(pDirPath, "Singleton.txt");
			interfaceTemplateStr = getTemplateString(pDirPath, "Interface.txt");
			autoCodeManager.init(pDirPath);

		}
		
		/**
		 *读取文件 
		 * @param pDirPath  路径
		 * @param pFileName 文件名
		 * @return 
		 * 
		 */		
		public function getTemplateString(pDirPath:String, pFileName:String):String
		{
			var file:File = File.applicationDirectory.resolvePath(pDirPath+pFileName);
			if(!file.exists) { 
				trace("Unable to find template "+file.nativePath, "ERROR");
				file= new File();
			}
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.READ);
			var str:String = stream.readMultiByte(stream.bytesAvailable, "utf-8");
			stream.close();
			return str;
		}
	
				
	}
}