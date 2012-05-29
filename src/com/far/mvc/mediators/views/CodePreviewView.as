package com.far.mvc.mediators.views
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-17 下午2:59:42
	 *
	 */
	import com.far.mvc.models.ProjectValueActor;
	
	import flash.display.Sprite;
	import flash.html.HTMLLoader;

	public class CodePreviewView extends Sprite
	{
		public var htmllod:HTMLLoader;
		[Inject]
		public var proValue:ProjectValueActor;

		public function CodePreviewView()
		{
			htmllod=new HTMLLoader();
			htmllod.width=2000;
			htmllod.placeLoadStringContentInApplicationSandbox=true;
			addChild(htmllod);
		}
	}
}
