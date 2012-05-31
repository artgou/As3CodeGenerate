package com.far.mvc.signals
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-30 下午11:41:23
	 * 
	 */
	import flash.events.KeyboardEvent;
	
	import org.osflash.signals.Signal;
	
	public class EnterAutoKeySignal extends Signal
	{
		public function EnterAutoKeySignal()
		{
			super(KeyboardEvent);
		}
	}
}