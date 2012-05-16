package
{
	import com.far.analysis.GeneratedFile;
	import com.far.analysis.PseudoClass;
	import com.far.analysis.PseudoVariable;
	import com.far.analysis.TemplateManager;
	import com.far.generator.ClassGenerator;
	import com.far.generator.EventGenerator;
	import com.far.generator.SingletonGenerator;
	
	import flash.display.Sprite;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.html.HTMLLoader;

	public class As3CodeGenerate extends Sprite
	{
		public var fileCode:String="package" + "{" + "import flash.display.Sprite;" + "public class farutils extends Sprite" + "{" + "public function farutils()" + "	{" + "		} " + "}" + "}";
		public function As3CodeGenerate()
		{
			var htmllod:HTMLLoader=new HTMLLoader();
			htmllod.width=2000;
			htmllod.height=400;
			htmllod.placeLoadStringContentInApplicationSandbox=true;
			var str:String=SyntaxHighlighterConfig.syntaxHBegin + fileCode + SyntaxHighlighterConfig.syntaxHEnd;
			htmllod.loadString(str);
			addChild(htmllod);
			
			
			TemplateManager.getInstance().call= call;
			TemplateManager.getInstance().getTemplates("FCGTemplates_v097000/");
			
	
		}
		private  function call():void{
			var pseudo:PseudoClass = new PseudoClass();
			pseudo.className="Main";
			pseudo.packageName="com";
			pseudo.properties= Vector.<PseudoVariable>([new PseudoVariable("id","int",true)]);
			var gen:ClassGenerator = new ClassGenerator();
			var gfile:GeneratedFile = gen.generator(pseudo);
			trace(gfile.code);
			
			var eveGen:EventGenerator = new EventGenerator();
			gfile = eveGen.generator("MyEvent");
			trace(gfile.code);
			
			var sig:SingletonGenerator = new SingletonGenerator();
			gfile = sig.generator("MySig");
			trace(gfile.code);
		}
		
		
	}
}
