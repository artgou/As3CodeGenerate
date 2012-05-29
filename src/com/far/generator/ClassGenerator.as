package com.far.generator
{

	import com.far.analysis.GeneratedFile;
	import com.far.analysis.PseudoClass;
	import com.far.analysis.PseudoClassMethod;
	import com.far.analysis.PseudoFunctionVariable;
	import com.far.analysis.PseudoVariable;
	import com.far.analysis.TemplateManager;
	
	import flash.utils.Dictionary;

	public class ClassGenerator   implements IGenerator
	{
		[Inject]
		public var templateMgr:TemplateManager ;
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

			var pTemplate:String=templateMgr.voTemplateStr;
			var classNames:Array=pOriginalFile.classNames;
			var str:String=pTemplate.replace(/\*VOPACKAGE\*/g, pOriginalFile.packageName);

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
			//类 名 和构造器
//			str=str.replace(/\*VO\*/g, className);
			//属性，get set
			var s:String="";
			var getsets:String="";
			for (var i:int=0; i < pOriginalFile.properties.length; i++)
			{
				var variable:PseudoVariable=pOriginalFile.properties[i];
				s+="\t\t" + "private var _" + variable.name + ":" + variable.type + ";\n";
				if (variable.isGetSet)
				{
					getsets+="\t\tpublic function get " + variable.name + "():" + variable.type + "{\n";
					getsets+="\t\t\treturn _" + variable.name + ";\n";
					getsets+="\t\t}\n\n";
					getsets+="\t\tpublic function set " + variable.name + "(pData:" + variable.type + "):void{\n";
					getsets+="\t\t\t_" + variable.name + "=pData;\n";
					getsets+="\t\t}\n\n";
				}

			}
			str=str.replace(/\*PROPERTIES\*/, s);
			str=str.replace(/\*GETTERSETTERS\*/, getsets);

			//方法
			var functions:String="";
			var methods:Vector.<PseudoClassMethod>=pOriginalFile.methods;
			if (methods)
			{
				for each (var method:PseudoClassMethod in methods)
				{
					functions+="\t\tpublic function " + method.name + "(";
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

			var asFile:GeneratedFile=new GeneratedFile(classNames, "as", pOriginalFile.packageName);
			asFile.code=str;

			return asFile;

		}




	}
}
