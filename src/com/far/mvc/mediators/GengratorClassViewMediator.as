package com.far.mvc.mediators
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-17 下午3:00:36
	 *
	 */
	import com.far.mvc.mediators.views.GengratorClassView;
	import com.far.mvc.mediators.views.common.PseudoVariableView;

	import flash.events.MouseEvent;

	import org.robotlegs.mvcs.Mediator;

	public class GengratorClassViewMediator extends Mediator
	{
		[Inject]
		public var geclassview:GengratorClassView;

		override public function onRegister():void
		{
			geclassview.addProButton.addEventListener(MouseEvent.CLICK, clickHandler);
			geclassview.addFunButton.addEventListener(MouseEvent.CLICK, clickHandler);
		}

		protected function clickHandler(event:MouseEvent):void
		{
			switch (event.target)
			{
				case geclassview.addProButton:
				{
					geclassview.proVbox.addChild(new PseudoVariableView());
					break;
				}

				case geclassview.addFunButton:
				{

					break;
				}
			}
		}

		override public function onRemove():void
		{

		}

	}
}
