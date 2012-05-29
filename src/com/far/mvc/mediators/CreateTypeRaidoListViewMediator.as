package com.far.mvc.mediators
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-17 下午3:00:47
	 *
	 */
	import com.far.mvc.mediators.views.CreateTypeRaidoListView;
	import com.far.mvc.signals.ClickCreatButtonSignal;

	import flash.events.MouseEvent;

	import org.robotlegs.mvcs.Mediator;

	public class CreateTypeRaidoListViewMediator extends Mediator
	{
		[Inject]
		public var typeRaido:CreateTypeRaidoListView;
		[Inject]
		public var clickCreatButtonSignal:ClickCreatButtonSignal;

		public function CreateTypeRaidoListViewMediator()
		{
		}

		override public function onRegister():void
		{
			typeRaido.createButton.addEventListener(MouseEvent.CLICK, clickCreatButtonHadnler);
			typeRaido.publishButton.addEventListener(MouseEvent.CLICK, clickCreatButtonHadnler);
		}

		/**
		 *创建按钮点击事件
		 * @param event
		 *
		 */
		protected function clickCreatButtonHadnler(event:MouseEvent):void
		{
			event.stopImmediatePropagation();
			switch (event.target)
			{
				case typeRaido.createButton:
				{
					var index:int=typeRaido.radioButtonGroup.getSelectRadioButtonIndex();
					if (index != -1)
					{
						clickCreatButtonSignal.dispatch(index);
					}

					break;
				}
				case typeRaido.publishButton:
				{
					//导出所有的类
					break;
				}
			}
		}



		override public function onRemove():void
		{
			typeRaido.createButton.removeEventListener(MouseEvent.CLICK, clickCreatButtonHadnler);
			typeRaido.publishButton.removeEventListener(MouseEvent.CLICK, clickCreatButtonHadnler);
		}


	}
}
