package com.far.mvc.mediators.views.common
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-30 下午11:18:34
	 *
	 */
	import com.bit101.components.List;

	import flash.display.DisplayObjectContainer;

	public class AutoCodeList extends List
	{
		public static var autoList:AutoCodeList=new AutoCodeList();

		public function AutoCodeList(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0, items:Array=null)
		{
			super(parent, xpos, ypos, items);
		}

	}
}
