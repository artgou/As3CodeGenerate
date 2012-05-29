package com.far.generator
{
	import com.far.analysis.GeneratedFile;
	import com.far.analysis.PseudoClass;
	import com.far.analysis.PseudoClassMethod;
	import com.far.analysis.PseudoFunctionVariable;
	import com.far.analysis.TemplateManager;
	
	import flash.utils.Dictionary;

	public class InterfaceGenerator    implements IGenerator
	{
		[Inject]
		public var templateMgr:TemplateManager;
		public function InterfaceGenerator()
		{
		}

		public function generator(pOriginalFile:PseudoClass):GeneratedFile
		{
			var pTemplate:String=templateMgr.interfaceTemplateStr;
			var classNames:Array=pOriginalFile.classNames;
			//包
			var str:String= pTemplate.replace(/\*INTERFACEPACKAGE\*/g, pOriginalFile.packageName);

			//imports
			//导入语句 
			var dic:Dictionary=pOriginalFile.imports;
			var imports:String="";
			if (dic)
			{
				for (var key:String in dic)
				{
					imports+="\timport " + key + ";\n";
				}
			}
			str=str.replace(/\*IMPORTS\*/, imports);
			//class, constructor
//			str=str.replace(/\*INTERFACE\*/g, className);


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
					functions+="):" + method.returnType + "\n";
				}
				str=str.replace(/\*FUNCTIONS\*/, functions);


			}
			var asFile:GeneratedFile=new GeneratedFile(classNames, "as", pOriginalFile.packageName);
			asFile.code=str;
			return asFile;
		}
	}
}
