package com.far.mvc.models.vo
{
	import com.far.analysis.GeneratedFile;

	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-20 下午9:48:55
	 * 
	 */
	public   dynamic class PackageListItem
	{
		public var label:String;
		public var data:String;
		public var items:Array=[];
		public var isPackage:Boolean;
		public var genFile:GeneratedFile;
		public function PackageListItem(labels:String,datas:String,isPackages:Boolean=true,genFiles:GeneratedFile=null)
		{
			 this.data = datas;
			 this.label= labels;
			 this.isPackage = isPackages;
			 this.genFile = genFiles;
		}

	

	}
}