package com.far.mvc.mediators.views
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-17 下午2:59:20
	 *
	 */
	import com.bit101.components.HBox;
	import com.bit101.components.InputText;
	import com.bit101.components.Label;
	import com.bit101.components.PushButton;
	import com.bit101.components.ScrollPane;
	import com.bit101.components.VBox;
	import com.far.mvc.mediators.views.common.AutoCodeInputText;
	import com.far.mvc.mediators.views.common.CenterWindow;
	import com.far.mvc.mediators.views.common.PseudoVariableView;


	public class GengratorClassView extends CenterWindow
	{
		public var addProButton:PushButton;
		public var addFunButton:PushButton;
		
		public var proScor:ScrollPane;
		public var proVbox:VBox;
		public var funScor:ScrollPane;

		[PostConstruct(order=1)]
		public function initWindow():void
		{
			this.title="创建类";
			var conatiner:VBox=new VBox(this.content);
			var classNameHbox:HBox=new HBox(conatiner);
			var classLabel:Label=new Label(classNameHbox, 0, 0, "类名");
			var classNameInput:InputText=new InputText(classNameHbox);
			addProButton=new PushButton(classNameHbox, 0, 0, "添加属性");
			addFunButton=new PushButton(classNameHbox, 0, 0, "添加方法");
			
			proScor = new ScrollPane(conatiner);
			proVbox = new VBox(proScor);
			proVbox.spacing=0;
			var autocoe:PseudoVariableView=new PseudoVariableView(); //PseudoVariableView 中的隐藏List占用了高度
			proVbox.addChild(autocoe);
			trace(autocoe.height);
			var autocoe1:PseudoVariableView=new PseudoVariableView();
			proVbox.addChild(new Label(null,0,0,"haha"));
			
			funScor = new ScrollPane(conatiner);
			
			proVbox.width=proScor.width= funScor.width= this.width;
			proScor.autoHideScrollBar=funScor.autoHideScrollBar=true;
		}
	}
}
