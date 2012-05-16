package  com.far.analysis
{
	/**
	 * 
	 * @author davidderaedt
	 * 
	 * Class representing a generated file
	 * 
	 * The application using FGL should be responsible for the actual system file creation
	 * 
	 */
	
	public class GeneratedFile
	{
		
		public var name:String; //文件名
		public var code:String; //生成的代码
		public var extension:String;//后缀
		public var destination:String;		
		
		public function GeneratedFile(pName:String, pExt:String, pDest:String)
		{
			name = pName;
			extension = pExt;
			destination = pDest ;			
		}
		
		public function get nameWithExt():String
		{
			return name+"."+extension;
		}
	}
}