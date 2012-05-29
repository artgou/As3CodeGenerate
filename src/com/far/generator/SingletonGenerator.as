package com.far.generator
{
	import com.far.analysis.GeneratedFile;
	import com.far.analysis.PseudoClass;
	import com.far.analysis.TemplateManager;

	public class SingletonGenerator   implements IGenerator
	{
		[Inject]
		public var templateMgr:TemplateManager ;
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
		public function generator(pOriginalFile:PseudoClass):GeneratedFile
		{
			var pTemplate:String = templateMgr.singletonTemplateStr ;
			
			var str:String = pTemplate.replace(/\*MAINPACKAGE\*/g, pOriginalFile.packageName);
//			str =  str.replace(/\*CLASSNAME\*/g, pName);
			
			var asFile:GeneratedFile = new GeneratedFile(pOriginalFile.classNames, "as", pOriginalFile.packageName);
			asFile.code = str ;
			
			return asFile;
		}
	}
}