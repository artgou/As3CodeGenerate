package com.far.mvc.signals
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-20 下午5:48:31
	 * 
	 * 
	 * 创建主视图通讯 类
	 */
	import org.osflash.signals.Signal;
	
	public class CreateMainViewSignal extends Signal
	{
		public function CreateMainViewSignal()
		{
			super(String);
		}
	}
}