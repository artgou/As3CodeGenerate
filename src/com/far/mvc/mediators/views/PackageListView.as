package com.far.mvc.mediators.views
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-17 下午2:58:03
	 *
	 * 
	 * 包列表树
	 */
	import com.far.extend.TreeList;
	import com.far.mvc.models.vo.PackageListItem;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import org.swiftsuspenders.injectionpoints.PostConstructInjectionPoint;

	public class PackageListView extends Sprite
	{
		public var _treeList:TreeList;
		public var _tempItems:Array=[];
		public var _currentPackage:PackageListItem;//当前节点
		
	 

		public function PackageListView()
		{
			_treeList=new TreeList(this,0,0,[]);
		}
		
		 

		/**
		 *设置树结构的默认值
		 * 将com.far.application切割成层级结构的树
		 * @param str
		 *
		 */
		public function addPackage(str:String):void
		{
			if (!str || str == "")
			{
				return;
			}
			var arr:Array=str.split(".");
			var len:int=arr.length;
			//递归成合适的链状结构
			var mainItems:Array=_currentPackage && _currentPackage.items ? _currentPackage.items : _tempItems;
			for (var i:int=0; i < len; i++)
			{
				var item:PackageListItem;
				if (i == 0 && !_currentPackage)
				{
					item=new PackageListItem(arr[i], arr[i]);
				}
				else
				{
					item=new PackageListItem(arr[i], _currentPackage.data + "." + arr[i]);
				}
				_currentPackage=item;
				mainItems.push(item);
				mainItems=_currentPackage.items; //当前级别的容器为空

			}
			_treeList.items=_tempItems;
			_treeList.selectedItem=_currentPackage;//设置当前选中的项
		}
	}
}
