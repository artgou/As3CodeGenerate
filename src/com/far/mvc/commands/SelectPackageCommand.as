package com.far.mvc.commands
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-20 下午9:52:11
	 * 
	 * 选择树结构的包时的默认行为
	 */
	import com.far.mvc.models.ProjectValueActor;
	import com.far.mvc.models.vo.PackageListItem;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	public class SelectPackageCommand extends SignalCommand
	{
		[Inject]
		public var provalue:ProjectValueActor;
		[Inject]
		public var packageSelect:PackageListItem;
		
		override public function execute():void
		{
			provalue.currentSelectPackage =packageSelect ;
		}
		
		
			
		
	}
}