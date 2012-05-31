package com.far.mvc.mediators.views.common
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-21 上午7:20:09
	 * 
	 *自动代码提示文本框
	 */
	import com.bit101.components.InputText;
	import com.bit101.components.List;
	import com.bit101.components.VBox;
	
	import flash.display.Sprite;
	
	public class AutoCodeInputText extends Sprite
	{
		public var inputText:InputText;
		public var packageName:String;
		public function AutoCodeInputText()
		{
			inputText = new InputText(this);
		}
		public function getClassType():String{
		   return packageName+inputText.text;
		}
		
	}
}