package com.far.generator
{
	import com.far.analysis.GeneratedFile;
	import com.far.analysis.PseudoClass;
	import com.far.analysis.PseudoClassMethod;
	import com.far.analysis.PseudoFunctionVariable;

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
			str=str.replace(/\*IMPORTS\*/, pOriginalFile.imports);
			//class, constructor
			str=str.replace(/\*INTERFACE\*/g, className);


			//方法
			var functions:String="";
			var methods:Vector.<PseudoClassMethod>=pOriginalFile.methods;
			if (methods)
			{
				for each (var method:PseudoClassMethod in methods)
				{
					functions+="\t\tfunction " + method.name + "(";
					var methodvars:Vector.<PseudoFunctionVariable>=method.arguments;
					if (methodvars)
					{
						var len:int=methodvars.length;
						for (var j:int=0; j < len; j++)
						{
							var para:PseudoFunctionVariable=methodvars[j];
							functions+=para.name + ":" + para.type;
							if (para.defaultValue)
							{
								functions+="=" + para.defaultValue;
							}
							if (j != len - 1)
							{
								functions+=",";
							}
							
						}
					}
					functions+="):" + method.returnType + "{\n";
					functions+="\t\t\t return null;\n";
					functions+="\t\t}\n\n";
					
				}
				str=str.replace(/\*FUNCTIONS\*/, functions);



		}
	}
}
