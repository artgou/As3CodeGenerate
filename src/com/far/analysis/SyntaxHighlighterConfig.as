package com.far.analysis
{
	public class SyntaxHighlighterConfig
	{
		private  static const fileType:String="actionscript";
		public  static const syntaxHBegin:String='<html>' + 
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
		public  static const syntaxHEnd:String="</textarea></body></html>";
	}
}