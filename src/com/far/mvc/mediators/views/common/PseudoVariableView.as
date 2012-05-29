package com.far.mvc.mediators.views.common
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-23 下午10:55:46
	 *
	 */
	import com.bit101.components.CheckBox;
	import com.bit101.components.HBox;
	import com.bit101.components.InputText;
	import com.bit101.components.Label;
	import com.far.analysis.PseudoVariable;
	
	import flash.display.Sprite;

	public class PseudoVariableView extends Sprite
	{
		private var hbox:HBox;
		private var proNameInput:InputText;
		private var proTypeNameInput:AutoCodeInputText;
		private var getSetCheck:CheckBox;

		public function PseudoVariableView()
		{
			hbox=new HBox(this);
			new Label(hbox, 0, 0, "属性名:");
			proNameInput=new InputText(hbox);
			new Label(hbox, 0, 0, "属性类型:");
			proTypeNameInput=new AutoCodeInputText();
			hbox.addChild(proTypeNameInput);
			getSetCheck = new CheckBox(hbox,0,0,"get/set");
		}
		
		public function getPseudoVariable():PseudoVariable{
		 return new PseudoVariable(proNameInput.text,proTypeNameInput.getClassType(),getSetCheck.selected);
		}
	}
}
