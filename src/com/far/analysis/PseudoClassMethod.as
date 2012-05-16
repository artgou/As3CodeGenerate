package  com.far.analysis
{
	
	/**
	 * 
	 * @author davidderaedt
	 * 
	 * Represents a class method
	 * 
	 */	
	 
	public class PseudoClassMethod
	{
		
		public var name:String;
		public var arguments:Vector.<PseudoFunctionVariable>;
		public var returnType:String="Object";
		
		public function PseudoClassMethod(names:String,argumentss:Vector.<PseudoFunctionVariable>,returntypes:String){
			this.name=names;
			this.arguments=argumentss;
			this.returnType=returntypes;
		}
		
		
	}
}