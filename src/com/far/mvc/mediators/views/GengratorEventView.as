package com.far.mvc.mediators.views
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-21 上午10:25:47
	 * 
	 */
	import com.far.mvc.mediators.views.common.CenterWindow;
	
	public class GengratorEventView extends CenterWindow
	{
		public function GengratorEventView()
		{
		 
		}
		[PostConstruct(order=1)]
		public function initWindow():void{
			this.title ="创建单个事件类";
		}
	}
}