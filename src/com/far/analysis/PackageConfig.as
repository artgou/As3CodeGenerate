package com.far.analysis
{

	/**
	 *
	 * @author davidderaedt
	 *
	 * Represents the desired package structure for the generated app
	 *
	 */

	public class PackageConfig
	{

		public var voPackageName:String="vo";
		public var eventsPackageName:String="event";
		public var mainPackageName:String="";
		public var interfacePackageName:String="interfaces";
		
		private static var instance:PackageConfig;

		public static function getInstance():PackageConfig
		{
			if (instance == null)
				instance=new PackageConfig();
			return instance;
		}
	}
}
