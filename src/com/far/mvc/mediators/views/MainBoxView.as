package com.far.mvc.mediators.views
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-20 下午8:14:50
	 *
	 */
	import com.bit101.components.HBox;
	import com.bit101.components.Panel;
	import com.far.mvc.models.vo.PackageListItem;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	
	public class MainBoxView extends Sprite
	{
		private var hbox:HBox;
		[Inject]
		public var packagelist:PackageListView;
		[Inject]
		public var tyeraido:CreateTypeRaidoListView;
		[Inject]
		public var codepreview:CodePreviewView;
		[Inject (name="mystage")]
		public var thisStage:Stage;

		public function MainBoxView()
		{
			
		}
		[PostConstruct(order=1)]
		public function init():void{
			var panel:Panel = new Panel(this);
			panel.setSize(thisStage.stageWidth,thisStage.stageHeight);
			hbox=new HBox(panel);
			hbox.height=thisStage.stageHeight;
			packagelist._treeList.setSize(200,thisStage.stageHeight);
			tyeraido.vbox.height = thisStage.stageHeight;
			codepreview.htmllod.height =  thisStage.stageHeight;
			hbox.addChild(packagelist);
			hbox.addChild(tyeraido);
			hbox.addChild(codepreview);
		}

		
	}
}