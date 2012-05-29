package com.far.mvc.commands
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-21 下午2:42:25
	 *
	 * 创建各种类时 .
	 *   1添加到代码生成容器中
	 *   2并加入到自动代码容器中
	 *    a----Action---com.far
	 *                      ---com.a
	 *   3显示在树结构中
	 *   [{label:"",items[{label:"",itmes:[]}]}]
	 */
	import com.far.analysis.GeneratedFile;
	import com.far.analysis.PseudoClass;
	import com.far.analysis.TemplateManager;
	import com.far.generator.IGenerator;
	import com.far.mvc.models.ProjectValueActor;
	import com.far.mvc.models.vo.GengertorManager;
	import com.far.mvc.models.vo.PackageListItem;
	
	import flashx.textLayout.formats.LeadingModel;
	
	import org.robotlegs.mvcs.SignalCommand;

	public class CreateClassCommand extends SignalCommand
	{
		[Inject]
		public var projectActio:ProjectValueActor;
		[Inject]
		public var pseuClass:PseudoClass;
		[Inject]
		public var template:TemplateManager;
		[Inject]
		public var gengerManagers:GengertorManager;

		public function CreateClassCommand()
		{

			if (projectActio.createtypeIndex == -1)
			{
				return;
			}
			var generator:IGenerator=gengerManagers.data[projectActio.createtypeIndex] as IGenerator;
			//生成代码
			var genFile:GeneratedFile = generator.generator(pseuClass);
			//1添加到代码生成容器中
//			projectActio.storeCode.push(genFile);

			// 2并加入到自动代码容器中
			var cls:Array=genFile.names;
			for (var i:int=0; i < cls.length; i++)
			{
				template.autoCodeManager.addElement(cls[i], genFile.destination);
			}
			//3显示在树结构中
			var curr:PackageListItem=projectActio.currentSelectPackage;
			if (curr.items)
			{
				curr.items.push(new PackageListItem(pseuClass.classNames[0] + "+", pseuClass.packageName, false, genFile));
			}
		}
	}
}