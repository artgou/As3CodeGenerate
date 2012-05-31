package com.far.mvc.signals
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-30 下午11:46:30
	 * 
	 */
	import flash.events.MouseEvent;
	
	import org.osflash.signals.Signal;
	
	public class ClickInputSignal extends Signal
	{
		public function ClickInputSignal()
		{
			super(MouseEvent);
		}
	}
}