package com.far.mvc.signals
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-21 下午2:43:02
	 * 
	 */
	import com.far.analysis.PseudoClass;
	
	import org.osflash.signals.Signal;
	
	public class CreateClassSignal extends Signal
	{
		public function CreateClassSignal()
		{
			super(PseudoClass);
		}
	}
}