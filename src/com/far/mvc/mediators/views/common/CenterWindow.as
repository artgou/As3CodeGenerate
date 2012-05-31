package com.far.mvc.mediators.views.common
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-23 下午7:35:15
	 *
	 */
	import com.bit101.components.Window;

	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.events.MouseEvent;

	public class CenterWindow extends Window
	{
		[Inject(name="mystage")]
		public var mystage:Stage;

		public function CenterWindow(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0, title:String="Window")
		{
			super(parent, xpos, ypos, title);
		}

		[PostConstruct(order=1)]
		public function inits():void
		{
			this.hasCloseButton=true;
			this.hasMinimizeButton=true;
			this.width=400;
			this.height=300;
			this.x=(mystage.stageWidth - this.width) / 2;
			this.y=(mystage.stageHeight - this.height) / 2;
			this._closeButton.addEventListener(MouseEvent.CLICK, closeClickHandler);
		}

		protected function closeClickHandler(event:MouseEvent):void
		{
//			this._closeButton.removeEventListener(MouseEvent.CLICK, closeClickHandler);
			this.parent.removeChild(this);
		}
	}
}
