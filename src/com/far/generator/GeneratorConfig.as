package com.far.generator
{
	import com.far.analysis.PackageConfig;
	import com.far.analysis.TemplateManager;

	public class GeneratorConfig
	{
		public function GeneratorConfig()
		{
		}
		protected var packageConfig:PackageConfig=  PackageConfig.getInstance();
		protected var templateMgr:TemplateManager = TemplateManager.getInstance();	
		
		protected function replacePackageNames(pOriginal:String):String
		{
			if(!pOriginal)
				return "";
			var str:String = pOriginal;
			str = str.replace(/\*MAINPACKAGE\*/g, packageConfig.mainPackageName);
			str = str.replace(/\*EVENTSPACKAGE\*/g, packageConfig.eventsPackageName);
			str = str.replace(/\*VOPACKAGE\*/g, packageConfig.voPackageName);
			str = str.replace(/\*INTERFACEPACKAGE\*/g, packageConfig.interfacePackageName);
			
			return str;
		}
	}
}