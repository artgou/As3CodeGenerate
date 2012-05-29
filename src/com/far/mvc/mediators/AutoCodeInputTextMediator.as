package com.far.mvc.mediators
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-21 上午7:22:33
	 *
	 */
	import com.bit101.components.InputText;
	import com.far.analysis.TemplateManager;
	import com.far.mvc.mediators.views.common.AutoCodeInputText;
	import com.far.utils.StringTools;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.text.ReturnKeyLabel;
	import flash.utils.Dictionary;
	
	import mx.utils.StringUtil;
	
	import org.robotlegs.mvcs.Mediator;

	public class AutoCodeInputTextMediator extends Mediator
	{
		[Inject]
		public var autoCodeInput:AutoCodeInputText;
		[Inject]
		public var template:TemplateManager;
		

		public function AutoCodeInputTextMediator()
		{
		}

		override public function onRegister():void
		{
			autoCodeInput.inputText.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			autoCodeInput.list.addEventListener(Event.SELECT, seleListHandler);
		}

		protected function seleListHandler(event:Event):void
		{
			var obj:Object =autoCodeInput.list.selectedItem;
			autoCodeInput.inputText.text =obj.label;
			autoCodeInput.packageName=obj.data=="顶级"?"":obj.data;
			setListItems(false);
		}

		protected function keyUpHandler(event:KeyboardEvent):void
		{
			event.stopImmediatePropagation();
			var text:String=(event.currentTarget as InputText).text;
			if (!text || text == "")
			{
				setListItems(false);
				return;
			}
			//过滤 类的核心代码
			var firstCode:String=text.charAt(0).toUpperCase();
			text= StringTools.upperFirstChar(text);
			var dic:Dictionary=template.autoCodeManager;
			var listItems:Array=[];
			if (dic && dic[firstCode])
			{
				var words:Dictionary=dic[firstCode];
				if (words)
				{
					for  (var classes:String in words)
					{
						if (StringTools.startWith(classes, text))
						{
							var arr:Array=words[classes];
							for (var i:int=0; i < arr.length; i++)
							{
								listItems.push({label:classes + "[" + arr[i] + "]",data:arr[i]});
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
			autoCodeInput.list.items=items||[];
			autoCodeInput.list.visible=show;
//			autoCodeInput.inputText.text="";
		}

		override public function onRemove():void
		{
			autoCodeInput.inputText.removeEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			autoCodeInput.list.removeEventListener(Event.SELECT, seleListHandler);
		}


	}
}
