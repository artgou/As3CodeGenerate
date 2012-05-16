package com.far.generator
{
	import com.far.analysis.GeneratedFile;

	public class SingletonGenerator extends GeneratorConfig  
	{
		public function SingletonGenerator()
		{
			super();
		}
		
		/**
		 * 
		 * @param pName 类名
		 * @return 
		 * 
		 */		
		public function generator(pName:String):GeneratedFile
		{
			var pTemplate:String = templateMgr.singletonTemplateStr ;
			
			var str:String = replacePackageNames(pTemplate);
			str =  str.replace(/\*CLASSNAME\*/g, pName);
			
			var asFile:GeneratedFile = new GeneratedFile(pName, "as", "");
			asFile.code = str ;
			
			return asFile;
		}
	}
}