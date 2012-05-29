package com.far.mvc.commands
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-20 下午5:49:52
	 * 
	 * 创建主视图类
	 */
	import com.far.mvc.mediators.views.CreateProjectView;
	import com.far.mvc.mediators.views.MainBoxView;
	import com.far.mvc.mediators.views.PackageListView;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	public class CreateMainViewCommand extends SignalCommand
	{
		[Inject]
		public var mainbox:MainBoxView;
		[Inject]
		public var createProjectview:CreateProjectView;
		[Inject]
		public var packagelist:PackageListView;
	
		
		//mapSignal时将signal .dispatch的值传递的值临时映射。执行完execute方法后将映射解除
		[Inject]
		public var defaultPackage:String;
		
		override public function execute():void
		{
			//先移除创建工程对话框
			if(createProjectview.parent==contextView){
				contextView.removeChild(createProjectview);
			}
			contextView.addChild(mainbox);
			packagelist.addPackage(defaultPackage);
		}
	}
}