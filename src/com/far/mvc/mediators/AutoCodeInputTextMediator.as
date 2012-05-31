package com.far.mvc.mediators
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-21 上午7:22:33
	 *
	 */
	import com.far.mvc.mediators.views.common.AutoCodeInputText;
	import com.far.mvc.signals.ClickInputSignal;
	import com.far.mvc.signals.EnterAutoKeySignal;
	import com.far.mvc.signals.FocusInputSignal;
	import com.far.mvc.signals.SelectAutoCodeListItemSignal;
	
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;

	public class AutoCodeInputTextMediator extends Mediator
	{
		[Inject]
		public var autoCodeInput:AutoCodeInputText;
		[Inject]
		public var selectautoList:SelectAutoCodeListItemSignal;
		[Inject]
		public var enterkey:EnterAutoKeySignal;
		[Inject]
		public var clickInput:ClickInputSignal;
		[Inject]
		public var focusInput:FocusInputSignal;

		public function AutoCodeInputTextMediator()
		{
		}

		override public function onRegister():void
		{
			autoCodeInput.inputText.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			autoCodeInput.inputText.addEventListener(MouseEvent.CLICK,clickInputText);
			autoCodeInput.inputText.addEventListener(FocusEvent.FOCUS_OUT,FocusHandler);
			selectautoList.add(selectItem);
		}
		
		protected function FocusHandler(event:FocusEvent):void
		{
			focusInput.dispatch();
		}
		
		protected function clickInputText(event:MouseEvent):void
		{
			clickInput.dispatch(event);
		}
		
		private function selectItem(item:Object):void
		{
			autoCodeInput.inputText.text=item.label;
			autoCodeInput.packageName=item.data == "顶级" ? "" : item.data;
		}

		protected function keyUpHandler(event:KeyboardEvent):void
		{
			event.stopImmediatePropagation();
			enterkey.dispatch(event);
		}



		override public function onRemove():void
		{
			autoCodeInput.inputText.removeEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			autoCodeInput.inputText.removeEventListener(MouseEvent.CLICK,clickInputText);
			autoCodeInput.inputText.removeEventListener(FocusEvent.FOCUS_OUT,FocusHandler);
			selectautoList.remove(selectItem);
		}


	}
}
