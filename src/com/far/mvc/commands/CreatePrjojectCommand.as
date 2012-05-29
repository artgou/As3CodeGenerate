package com.far.mvc.commands
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-17 下午11:07:37
	 *
	 * 创建菜单和工程对话框
	 */
	import com.far.mvc.mediators.views.CreateProjectView;

	import org.robotlegs.mvcs.SignalCommand;

	public class CreatePrjojectCommand extends SignalCommand
	{
		[Inject]
		public var createProjectview:CreateProjectView;

		override public function execute():void
		{
          contextView.addChild(createProjectview);
		}

	}
}
