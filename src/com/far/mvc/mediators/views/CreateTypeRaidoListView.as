package com.far.mvc.mediators.views
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-17 下午2:58:39
	 *
	 */
	import com.bit101.components.PushButton;
	import com.bit101.components.RadioButton;
	import com.bit101.components.VBox;
	import com.far.extend.RadioButtonGroup;
	import com.far.mvc.models.ProjectValueActor;
	
	import flash.display.Sprite;

	public class CreateTypeRaidoListView extends Sprite
	{

		public var vbox:VBox;
		public var radioButtonGroup:RadioButtonGroup;
		public var createButton:PushButton;
		public var publishButton:PushButton;
		public const createTypeLabel:Array=["单个类", "单个事件类", "单个接口", "单例类", "多个类", "多个事件类", "多个接口类","多个单例类"];

		public function CreateTypeRaidoListView()
		{
		}

		[PostConstruct(order=1)]
		public function init():void
		{
			vbox=new VBox(this);
			vbox.spacing=20;
			var len:int=createTypeLabel.length;
			var rbu:Vector.<RadioButton>=new Vector.<RadioButton>();
			for (var i:int=0; i < len; i++)
			{
				var raido:RadioButton=new RadioButton(vbox, 0, 0, createTypeLabel[i]);
				if (i == 0)
				{
					raido.selected=true;
				}
				rbu.push(raido);
			}

			radioButtonGroup=new RadioButtonGroup(rbu);
			createButton=new PushButton(vbox, 0, 0, "创建");
			publishButton= new PushButton(vbox,0,0,"导出类");
		}
	}
}
