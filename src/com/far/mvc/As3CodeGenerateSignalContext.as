package com.far.mvc
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-17 下午2:43:15
	 *
	 */
	import com.far.analysis.AutoCodeManager;
	import com.far.analysis.TemplateManager;
	import com.far.generator.ClassGenerator;
	import com.far.generator.EventGenerator;
	import com.far.generator.InterfaceGenerator;
	import com.far.generator.SingletonGenerator;
	import com.far.mvc.commands.ClickCreatButtonCommand;
	import com.far.mvc.commands.CreateClassCommand;
	import com.far.mvc.commands.CreateMainViewCommand;
	import com.far.mvc.commands.CreatePrjojectCommand;
	import com.far.mvc.commands.LoadTemplateCommand;
	import com.far.mvc.commands.SelectPackageCommand;
	import com.far.mvc.mediators.AutoCodeInputTextMediator;
	import com.far.mvc.mediators.CodePreviewViewMeidator;
	import com.far.mvc.mediators.CreateProjectViewMediator;
	import com.far.mvc.mediators.CreateTypeRaidoListViewMediator;
	import com.far.mvc.mediators.GengratorClassViewMediator;
	import com.far.mvc.mediators.GengratorEventViewMediator;
	import com.far.mvc.mediators.GengratorInterFaceViewMediator;
	import com.far.mvc.mediators.GengratorMacroClassViewMediator;
	import com.far.mvc.mediators.GengratorMacroEventViewMediator;
	import com.far.mvc.mediators.GengratorMacroInterfaceViewMediator;
	import com.far.mvc.mediators.GengratorMacroSingtonViewMediator;
	import com.far.mvc.mediators.GengratorSingtonViewMediator;
	import com.far.mvc.mediators.PackageListViewMediator;
	import com.far.mvc.mediators.views.CodePreviewView;
	import com.far.mvc.mediators.views.CreateProjectView;
	import com.far.mvc.mediators.views.CreateTypeRaidoListView;
	import com.far.mvc.mediators.views.GengratorClassView;
	import com.far.mvc.mediators.views.GengratorEventView;
	import com.far.mvc.mediators.views.GengratorInterFaceView;
	import com.far.mvc.mediators.views.GengratorMacroClassView;
	import com.far.mvc.mediators.views.GengratorMacroEventView;
	import com.far.mvc.mediators.views.GengratorMacroInterfaceView;
	import com.far.mvc.mediators.views.GengratorMacroSingtonView;
	import com.far.mvc.mediators.views.GengratorSingtonView;
	import com.far.mvc.mediators.views.MainBoxView;
	import com.far.mvc.mediators.views.PackageListView;
	import com.far.mvc.mediators.views.common.AutoCodeInputText;
	import com.far.mvc.models.ProjectValueActor;
	import com.far.mvc.models.vo.GengertorManager;
	import com.far.mvc.models.vo.GengertorViewManager;
	import com.far.mvc.signals.ClickCreatButtonSignal;
	import com.far.mvc.signals.CreateClassSignal;
	import com.far.mvc.signals.CreateMainViewSignal;
	import com.far.mvc.signals.LoadTemplateCompleteSignal;
	import com.far.mvc.signals.SelectClassSignal;
	import com.far.mvc.signals.SelectPackageSignal;

	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.SignalContext;

	public class As3CodeGenerateSignalContext extends SignalContext
	{
		public function As3CodeGenerateSignalContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}

		override public function shutdown():void
		{
		}

		override public function startup():void
		{
			//加载模板和类模板
			injector.mapSingleton(AutoCodeManager);
			injector.mapSingleton(TemplateManager);
			injector.mapSingleton(ProjectValueActor);
			injector.mapSingleton(SelectClassSignal);

			//代码模板管理
			injector.mapSingleton(ClassGenerator);
			injector.mapSingleton(EventGenerator);
			injector.mapSingleton(SingletonGenerator);
			injector.mapSingleton(InterfaceGenerator);
			injector.mapSingleton(GengertorManager);

			//创建项目视图只要一个单例
			injector.mapValue(Stage, contextView.stage, "mystage");
			injector.mapSingleton(CreateProjectView);
			injector.mapSingleton(PackageListView);
			injector.mapSingleton(CreateTypeRaidoListView);
			injector.mapSingleton(CodePreviewView);
			injector.mapSingleton(MainBoxView);


			//绑定  生成类视图窗口
			injector.mapSingleton(GengratorClassView);
			injector.mapSingleton(GengratorMacroClassView);
			injector.mapSingleton(GengratorEventView);
			injector.mapSingleton(GengratorMacroEventView);
			injector.mapSingleton(GengratorInterFaceView);
			injector.mapSingleton(GengratorMacroInterfaceView);
			injector.mapSingleton(GengratorSingtonView);
			injector.mapSingleton(GengratorMacroSingtonView);
			injector.mapSingleton(GengertorViewManager);

			//Signal绑定的命令
			signalCommandMap.mapSignalClass(LoadTemplateCompleteSignal, CreatePrjojectCommand, true);
			signalCommandMap.mapSignalClass(CreateMainViewSignal, CreateMainViewCommand, true);
			signalCommandMap.mapSignalClass(SelectPackageSignal, SelectPackageCommand);
			signalCommandMap.mapSignalClass(ClickCreatButtonSignal, ClickCreatButtonCommand);
			signalCommandMap.mapSignalClass(CreateClassSignal, CreateClassCommand);


			// 主视图
			mediatorMap.mapView(CreateProjectView, CreateProjectViewMediator);
			mediatorMap.mapView(CodePreviewView, CodePreviewViewMeidator);
			mediatorMap.mapView(CreateTypeRaidoListView, CreateTypeRaidoListViewMediator);
			mediatorMap.mapView(PackageListView, PackageListViewMediator);

			//绑定Mediator
			mediatorMap.mapView(AutoCodeInputText, AutoCodeInputTextMediator);
			mediatorMap.mapView(GengratorClassView, GengratorClassViewMediator);
			mediatorMap.mapView(GengratorMacroClassView, GengratorMacroClassViewMediator);
			mediatorMap.mapView(GengratorEventView, GengratorEventViewMediator);
			mediatorMap.mapView(GengratorMacroEventView, GengratorMacroEventViewMediator);
			mediatorMap.mapView(GengratorInterFaceView, GengratorInterFaceViewMediator);
			mediatorMap.mapView(GengratorMacroInterfaceView, GengratorMacroInterfaceViewMediator);
			mediatorMap.mapView(GengratorSingtonView, GengratorSingtonViewMediator);
			mediatorMap.mapView(GengratorMacroSingtonView, GengratorMacroSingtonViewMediator);


          //启动
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, LoadTemplateCommand);
			super.startup();
		}


	}
}
