package com.far.analysis
{

	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-16 下午11:38:29
	 *
	 */
	public class TypeConfig extends Array
	{
		public static var data:Array=["int", "Number", "String", "Boolean", "uint", "Object", "void", "Class", "Math", "Function", "XML", "XMLList", "Date", "RegExp", "Namespace"];

		public static function hasType(value:String):Boolean
		{
			return data.indexOf(value) != -1;
		}
	}
}
