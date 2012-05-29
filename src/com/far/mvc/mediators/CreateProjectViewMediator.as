package com.far.mvc.mediators
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-17 下午3:01:16
	 *
	 */
	import com.far.mvc.mediators.views.CreateProjectView;
	import com.far.mvc.signals.CreateMainViewSignal;
	
	import flash.events.MouseEvent;
	
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.Mediator;

	public class CreateProjectViewMediator extends Mediator
	{
		[Inject]
		public var createProjectView:CreateProjectView;
		[Inject]
		public var createMainViewSignal:CreateMainViewSignal;

		public function CreateProjectViewMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			createProjectView.enterButton.addEventListener(MouseEvent.CLICK, clickHandler);
		}

		protected function clickHandler(event:MouseEvent):void
		{
			//创建项目，传递默认包
			createMainViewSignal.dispatch(createProjectView.enterpackage.text);
		}

		override public function onRemove():void
		{
			createProjectView.enterButton.removeEventListener(MouseEvent.CLICK, clickHandler);
		}


	}
}
