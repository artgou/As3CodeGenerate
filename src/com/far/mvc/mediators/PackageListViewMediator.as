package com.far.mvc.mediators
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-17 下午3:00:59
	 *
	 */
	import com.far.mvc.mediators.views.PackageListView;
	import com.far.mvc.models.vo.PackageListItem;
	import com.far.mvc.signals.SelectClassSignal;
	import com.far.mvc.signals.SelectPackageSignal;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;

	public class PackageListViewMediator extends Mediator
	{
		[Inject]
		public var packageListView:PackageListView;
		[Inject]
		public var selectPackageSignal:SelectPackageSignal;
		[Inject]
		public var selectClassSignal:SelectClassSignal;

		public function PackageListViewMediator()
		{
		}

		override public function onRemove():void
		{
			packageListView._treeList.removeEventListener(Event.SELECT, selectHandler);
		}

		override public function onRegister():void
		{
			packageListView._treeList.addEventListener(Event.SELECT, selectHandler);
		}

		protected function selectHandler(event:Event=null):void
		{
			var packlistItem:PackageListItem=packageListView._treeList.selectedItem as PackageListItem;
			packageListView._currentPackage=packlistItem; //与选中的节点保持一致
			if (packlistItem.isPackage)
			{
				selectPackageSignal.dispatch(packlistItem);
			}
			else
			{
				selectClassSignal.dispatch(packlistItem);
			}
		}


	}
}
