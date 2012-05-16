package com.far.analysis
{
	import flash.utils.Dictionary;

	/**
	 *
	 * @author davidderaedt
	 *
	 * Represents a class (result of code parsing)
	 *
	 */

	public class PseudoClass
	{

		public var packageName:String=""; //包名
		public var className:String; //类名
		private var _properties:Vector.<PseudoVariable>=new Vector.<PseudoVariable>(); //要定义 的属性
		private var _methods:Vector.<PseudoClassMethod>=new Vector.<PseudoClassMethod>(); //要定义的方法
		private var _imports:Dictionary=new Dictionary(true); //要导入的类

		public function get imports():Dictionary
		{
			return _imports;
		}

		public function get methods():Vector.<PseudoClassMethod>
		{
			return _methods;
		}

		public function get properties():Vector.<PseudoVariable>
		{
			return _properties;
		}

		/**
		 * 设置类方法，方法包括 方法参数 ，参数类型(参数类型传递进来应该为全称如com.far.VO),参数默认值，返回值(为String时加双引号)
		 * @param value
		 *
		 */
		public function set methods(value:Vector.<PseudoClassMethod>):void
		{
			for each (var psMe:PseudoClassMethod in value)
			{
				var psmeVes:Vector.<PseudoFunctionVariable>=psMe.arguments;
				if (psmeVes)
				{
					for each (var psmeVe:PseudoFunctionVariable in psmeVes)
					{
						if (!TypeConfig.hasType(psmeVe.type))
						{
							imports[psmeVe.type]=true;
						}
						psmeVe.type=psmeVe.type.substr(psmeVe.type.lastIndexOf(".") + 1);
						if (psmeVe.type && psmeVe.type == "String" && psmeVe.defaultValue)
						{
							psmeVe.defaultValue='"' + psmeVe.defaultValue + '"';
						}
					}

				}
				var returnType:String=psMe.returnType;
				if(returnType){
					if (!TypeConfig.hasType(returnType))
					{
						imports[psMe.returnType]=true;
					}
					psMe.returnType =psMe.returnType.substr(psMe.returnType.lastIndexOf(".") + 1);
				}else{
					psMe.returnType="void";
				}
			}
			_methods=value;
		}

		/**
		 * 设置类属性
		 * @param value
		 *
		 */
		public function set properties(value:Vector.<PseudoVariable>):void
		{
			for each (var ps:PseudoVariable in value)
			{
				if (!TypeConfig.hasType(ps.type))
				{
					imports[ps.type]=true;
				}
				ps.type=ps.type.substr(ps.type.lastIndexOf("." + 1));
			}
			_properties=value;
		}


	}
}
