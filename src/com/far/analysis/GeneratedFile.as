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
		
		public var names:Array; //文件名
		public var code:String; //生成的代码
		public var extension:String;//后缀
		public var destination:String;		//包
		
		public function GeneratedFile(pName:Array, pExt:String, pDest:String)
		{
			names = pName;
			extension = pExt;
			destination = pDest ;			
		}
		
	 
	}
}