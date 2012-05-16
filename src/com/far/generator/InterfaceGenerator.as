package com.far.generator
{
	import com.far.analysis.GeneratedFile;
	import com.far.analysis.PseudoClass;
	import com.far.analysis.PseudoClassMethod;

	public class InterfaceGenerator extends GeneratorConfig
	{
		public function InterfaceGenerator()
		{
		}

		public function generator(pOriginalFile:PseudoClass):GeneratedFile
		{
			var pTemplate:String=templateMgr.voTemplateStr;
			var className:String=pOriginalFile.className;
			//包
			var str:String=replacePackageNames(pTemplate);

			//imports
			str=str.replace(/\*IMPORTS\*/, "");

			//class, constructor
			str=str.replace(/\*INTERFACE\*/g, className);


			var fuStr:String;
			for (var i:int=0; i < pOriginalFile.methods.length; i++)
			{
				var variable:PseudoClassMethod=pOriginalFile.properties[i];

				fuStr+="\t\t function " + variable.name + "():" + variable.returnType + "{\n";
				fuStr+="\t\t\treturn null;\n";
				fuStr+="\t\t}\n\n";

			}



		}
	}
}
