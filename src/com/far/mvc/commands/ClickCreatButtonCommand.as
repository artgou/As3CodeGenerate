package com.far.mvc.commands
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-21 上午1:35:22
	 *
	 */
	import com.bit101.components.Window;
	import com.far.mvc.mediators.views.GengratorClassView;
	import com.far.mvc.models.ProjectValueActor;
	import com.far.mvc.models.vo.GengertorViewManager;
	import com.far.mvc.models.vo.PackageListItem;
	
	import flash.display.Sprite;
	
	import org.robotlegs.mvcs.SignalCommand;

	public class ClickCreatButtonCommand extends SignalCommand
	{
		[Inject]
		public var index:int;
		[Inject]
		public var pro:ProjectValueActor;
		[Inject]
		public var cview:GengertorViewManager;

		override public function execute():void
		{
			var curr:PackageListItem=pro.currentSelectPackage;
			if (!curr.isPackage)
			{
				//当前选中的不是包
				return;
			}
			//移除之前创建的界面
			cview.removeFromStage();
			var className:Window=cview.data[index] ;
			if (className)
			{
				contextView.addChild(className);
			}
		}

	}
}
