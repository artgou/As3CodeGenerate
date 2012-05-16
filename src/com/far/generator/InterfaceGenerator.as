package com.far.generator
{
	import com.far.analysis.GeneratedFile;
	import com.far.analysis.PseudoClass;

	public class InterfaceGenerator extends GeneratorConfig
	{
		public function InterfaceGenerator()
		{
		}

		public function generator(pOriginalFile:PseudoClass):GeneratedFile
		{
			var pTemplate:String = templateMgr.voTemplateStr;
			var className:String= pOriginalFile.className;
			//包
			var str:String = replacePackageNames(pTemplate);
          
		}
	}
}
