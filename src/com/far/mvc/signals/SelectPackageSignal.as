package com.far.mvc.signals
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-20 下午9:45:32
	 * 
	 * 选中包
	 */
	import com.far.mvc.models.vo.PackageListItem;
	
	import org.osflash.signals.Signal;
	
	public class SelectPackageSignal extends Signal
	{
		public function SelectPackageSignal()
		{
			super(PackageListItem);
		}
	}
}