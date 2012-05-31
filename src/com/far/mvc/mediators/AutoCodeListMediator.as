package com.far.mvc.mediators
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-30 下午11:24:41
	 *
	 */
	import com.bit101.components.InputText;
	import com.far.analysis.TemplateManager;
	import com.far.mvc.mediators.views.common.AutoCodeList;
	import com.far.mvc.signals.ClickInputSignal;
	import com.far.mvc.signals.EnterAutoKeySignal;
	import com.far.mvc.signals.FocusInputSignal;
	import com.far.mvc.signals.SelectAutoCodeListItemSignal;
	import com.far.utils.StringTools;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	import org.robotlegs.mvcs.Mediator;

	public class AutoCodeListMediator extends Mediator
	{
		[Inject]
		public var autolist:AutoCodeList;
		[Inject]
		public var selectautoList:SelectAutoCodeListItemSignal;
		[Inject]
		public var template:TemplateManager;
		[Inject]
		public var enterkey:EnterAutoKeySignal;
		[Inject]
		public var clickInput:ClickInputSignal;
		[Inject]
		public var focusInput:FocusInputSignal;

		public function AutoCodeListMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			autolist.addEventListener(Event.SELECT, seleListHandler);
			enterkey.add(enterKey);
			clickInput.add(clickInputHandler);
			focusInput.add(focuOut);
		}
		
		private function focuOut():void
		{
			setListItems(false);
		}
		
		private function clickInputHandler(event:MouseEvent):void
		{
			setListItems(false);
			var input:InputText=(event.currentTarget as InputText);
			autolist.x = input.x;
			autolist.y = input.y+input.height+5;
			input.parent.addChild(autolist);
		}

		protected function seleListHandler(event:Event):void
		{
			setListItems(false);
			var obj:Object=autolist.selectedItem;
			if (obj)
			{
				selectautoList.dispatch(obj);
			}
		}

		override public function onRemove():void
		{
			autolist.removeEventListener(Event.SELECT, seleListHandler);
			clickInput.remove(clickInputHandler);
			enterkey.remove(enterKey);
		}

		private function enterKey(event:KeyboardEvent):void
		{
			var text:String=(event.currentTarget as InputText).text;
			if (!text || text == "")
			{
				setListItems(false);
				return;
			}
			//过滤 类的核心代码
			var firstCode:String=text.charAt(0).toUpperCase();
			text=StringTools.upperFirstChar(text);
			var dic:Dictionary=template.autoCodeManager;
			var listItems:Array=[];
			if (dic && dic[firstCode])
			{
				var words:Dictionary=dic[firstCode];
				if (words)
				{
					for (var classes:String in words)
					{
						if (StringTools.startWith(classes, text))
						{
							var arr:Array=words[classes];
							for (var i:int=0; i < arr.length; i++)
							{
								listItems.push({label: classes + "[" + arr[i] + "]", data: arr[i]});
							}
						}
					}
					if (listItems.length == 0)
					{
						setListItems(false);
						return;
					}

				}
				else
				{
					setListItems(false);
					return;
				}
			}
			setListItems(true, listItems);
		}

		private function setListItems(show:Boolean, items:Array=null):void
		{
			autolist.items=items || [];
			autolist.visible=show;
		}
	}
}
