package com.far.mvc.mediators
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-17 下午3:00:21
	 * 
	 */
	import com.far.analysis.GeneratedFile;
	import com.far.mvc.models.ProjectValueActor;
	import com.far.mvc.signals.SelectClassSignal;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class CodePreviewViewMeidator extends Mediator
	{
		[Inject]
		public var selectClassSignal:SelectClassSignal;
		public function CodePreviewViewMeidator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			selectClassSignal.add(selecClassHandler);
		}
		
		//选择一个类，查看代码
		private function selecClassHandler(gen:GeneratedFile):void
		{
//			gen.names[0];
		}
		
		override public function onRemove():void
		{
		 
		}
		
		
	}
}