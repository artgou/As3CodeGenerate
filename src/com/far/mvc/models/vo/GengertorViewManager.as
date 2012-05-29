package com.far.mvc.models.vo
{
	import com.bit101.components.Window;
	import com.far.mvc.mediators.views.GengratorClassView;
	import com.far.mvc.mediators.views.GengratorEventView;
	import com.far.mvc.mediators.views.GengratorInterFaceView;
	import com.far.mvc.mediators.views.GengratorMacroClassView;
	import com.far.mvc.mediators.views.GengratorMacroEventView;
	import com.far.mvc.mediators.views.GengratorMacroInterfaceView;
	import com.far.mvc.mediators.views.GengratorMacroSingtonView;
	import com.far.mvc.mediators.views.GengratorSingtonView;

	import org.swiftsuspenders.injectionpoints.PostConstructInjectionPoint;


	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-23 下午3:15:28
	 *
	 * 呃 Vector不能被继承。。。难道Array 了不能被继承。。
	 */
	public class GengertorViewManager
	{
		[Inject]
		public var gengratorClassView:GengratorClassView;
		[Inject]
		public var gengratorMacroClassView:GengratorMacroClassView;
		[Inject]
		public var gengratorEventView:GengratorEventView;
		[Inject]
		public var gengratorMacroEventView:GengratorMacroEventView;
		[Inject]
		public var gengratorInterFaceView:GengratorInterFaceView;
		[Inject]
		public var gengratorMacroInterfaceView:GengratorMacroInterfaceView;
		[Inject]
		public var gengratorSingtonView:GengratorSingtonView;
		[Inject]
		public var gengratorMacroSingtonView:GengratorMacroSingtonView;

		public var data:Vector.<Window>;

		public function GengertorViewManager()
		{
		}

		public function removeFromStage():void
		{
			for (var i:int=0; i < this.data.length; i++)
			{
				var win:Window=data[i] as Window;
				if (win && win.parent)
				{
					win.parent.removeChild(win);
				}
			}

		}

		[PostConstruct(order=1)]
		public function init():void
		{
			data=Vector.<Window>([gengratorClassView,gengratorEventView, gengratorInterFaceView, gengratorSingtonView,gengratorMacroClassView,  gengratorMacroEventView, gengratorMacroInterfaceView,  gengratorMacroSingtonView]);
		}
	}
}
