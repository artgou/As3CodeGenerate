package com.far.analysis
{
	/**
	 * 
	 * @author davidderaedt
	 * 
	 * Represents a class (result of code parsing)
	 * 
	 */	
	
	public class PseudoClass
	{

		public var packageName:String = "" ;//包名
		public var className:String ;		 //类名
		public var properties:Vector.<PseudoVariable>; //要定义 的属性
		public var methods:Vector.<PseudoClassMethod>;//要定义的方法
		
	}
}