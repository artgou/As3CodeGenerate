package com.far.mvc.commands
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-17 下午8:34:01
	 *
	 * 加载模板和自动代码提示文件
	 */
	import com.far.analysis.TemplateManager;

	import org.robotlegs.mvcs.Command;

	public class LoadTemplateCommand extends Command
	{
		[Inject]
		public var temlate:TemplateManager;

		override public function execute():void
		{
			temlate.getTemplates("FCGTemplates_v097000/");
		}


	}
}
