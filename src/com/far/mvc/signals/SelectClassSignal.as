package com.far.mvc.signals
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-21 下午4:01:36
	 * 
	 */
	import com.far.mvc.models.vo.PackageListItem;
	
	import org.osflash.signals.Signal;
	
	public class SelectClassSignal extends Signal
	{
		public function SelectClassSignal()
		{
			super(PackageListItem);
		}
	}
}