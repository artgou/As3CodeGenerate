package
{
	import com.bit101.components.Component;
	import com.bit101.components.Style;
	import com.far.mvc.As3CodeGenerateSignalContext;
	
	import flash.events.Event;
	
	import org.osflash.signals.natives.base.SignalSprite;
	import org.robotlegs.mvcs.SignalContext;

	[SWF(frameRate="30", width="1024", height="600")]
	public class As3CodeGenerate extends SignalSprite
	{
		private var _codeSignal:SignalContext;

		public function As3CodeGenerate()
		{
			this.signals.addedToStage.addOnce(start);
		}

		private function start(event:Event):void
		{
			Component.initStage(stage);
			Style.embedFonts=false;
			Style.fontName="宋体";
			Style.fontSize=12;
			_codeSignal=new As3CodeGenerateSignalContext(this);
		}



	}
}
