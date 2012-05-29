package com.far.mvc.mediators.views
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-17 下午2:57:32
	 *
	 *
	 * 创建项目视图
	 */
	import com.bit101.components.InputText;
	import com.bit101.components.Panel;
	import com.bit101.components.PushButton;
	import com.bit101.components.VBox;
	import com.bit101.components.Window;

	import flash.display.Sprite;
	import flash.display.Stage;


	public class CreateProjectView extends Sprite
	{
		private var win:Window;
		private var vbox:VBox;
		public var enterpackage:InputText;
		public var enterButton:PushButton;

		[Inject(name="mystage")]
		public var mystage:Stage;

		public function CreateProjectView()
		{

		}

		[PostConstruct(order=1)]
		public function init():void
		{
			win=new Window(this, 0, 0, "创建项目");
			win.width=200;
			win.height=100;
			vbox=new VBox(win.content);
			enterpackage=new InputText(vbox, 0, 0, "com.far.application");
			enterButton=new PushButton(vbox, 0, 0, "确定");
			vbox.x=(win.width - vbox.width) / 2;
			vbox.y=(win.content.height - vbox.height) / 2;
			this.x=(mystage.stageWidth - win.width) / 2;
			this.y=(mystage.stageHeight - win.height) / 2;
		}
	}
}
