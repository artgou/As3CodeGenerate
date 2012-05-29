package  com.far.mvc.models
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-20 下午9:33:01
	 *
	 */
	import com.far.generator.ClassGenerator;
	import com.far.generator.EventGenerator;
	import com.far.generator.InterfaceGenerator;
	import com.far.generator.SingletonGenerator;
	import com.far.mvc.mediators.views.GengratorClassView;
	import com.far.mvc.mediators.views.GengratorEventView;
	import com.far.mvc.mediators.views.GengratorInterFaceView;
	import com.far.mvc.mediators.views.GengratorMacroClassView;
	import com.far.mvc.mediators.views.GengratorMacroEventView;
	import com.far.mvc.mediators.views.GengratorMacroInterfaceView;
	import com.far.mvc.mediators.views.GengratorMacroSingtonView;
	import com.far.mvc.mediators.views.GengratorSingtonView;
	import com.far.mvc.models.vo.PackageListItem;
	
	import org.robotlegs.mvcs.Actor;

	public class ProjectValueActor extends Actor
	{
		public var currentSelectPackage:PackageListItem;
		public var createtypeIndex:int=-1;  //选中生成哪种类型
		public var fileCode:String=""; //生成的代码
		public var storeCode:Array=[];
		
		
		
		
		public static var typeConfig:Array=["int", "Number", "String", "Boolean", "uint", "Object", "void",
			"Class", "Math","Array", "Function", "XML", "XMLList", "Date", "RegExp", "Namespace","ArgumentError","DefinitionError","URIError","Vector","VerifyError"
			,"Error","EvalError","ReferenceError","SecurityError","TypeError","RangeError","JSON","QName"];
		
		public  function hasType(value:String):Boolean
		{
			return typeConfig.indexOf(value) != -1;
		}
		
		private   const fileType:String="actionscript";
		public   const syntaxHBegin:String='<html>' + 
			'<head>' + 
			'<link type="text/css" rel="stylesheet" href="syntax_highlight/SyntaxHighlighter.css" />' + 
			'<script  src="syntax_highlight/shCore.js"></script>' + 
			'<script   src="syntax_highlight/shBrushAS3.js"></script>' + 
			'<script   src="syntax_highlight/shBrushXml.js"></script>' + 
			'<script   src="syntax_highlight/shBrushPhp.js"></script>' + 					
			'<script  >' + 
			'window.onload = function () {' + 
			'dp.SyntaxHighlighter.ClipboardSwf = "syntax_highlight/clipboard.swf";' + 
			'dp.SyntaxHighlighter.HighlightAll("code");' + 
			'}' + 
			'</script>' + 
			'</head>' + 
			'<body>' + 
			'<textarea name="code" class="'+fileType+':nocontrols">';
		public   const syntaxHEnd:String="</textarea></body></html>";
	}
}
