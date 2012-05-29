package com.far.analysis
{
	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-20 下午4:21:19
	 *api管理器
	 * 
	 * 
	 */
	import com.far.mvc.signals.LoadTemplateCompleteSignal;
	import com.far.utils.NetLoad;
	
	import flash.utils.Dictionary;

	public dynamic class AutoCodeManager extends Dictionary
	{
		[Inject]
		public var loadtemlate:LoadTemplateCompleteSignal;
		

		public function AutoCodeManager()
		{
			super(true);
		}

		/**
		 *初始化默认的flash api
		 *
		 */
		public function init(pDirPath:String):void
		{
			NetLoad.getInstance().loadXML(pDirPath + "flashapi.xml", getXMLFunction, false);
		}

		private function getXMLFunction(xml:XML):void
		{
			var xmlClasss:XMLList=xml.classElement;
			for each (var classele:XML in xmlClasss)
			{
				addElement(classele.@name.toString(), classele.@packagename.toString());
			}

			//加载模板完成
			loadtemlate.dispatch();
		}

		/**
		 *添加一个类到类管理器中 
		 * @param className
		 * @param packageName
		 * 
		 * 以类首字母分成不同的Dictionary ,类名相同的类存储在一个数组中，数组存储包名
		 */		
		public function addElement(className:String, packageName:String):void
		{
			if (!className || className == "")
				return;
			var firstChar:String=className.charAt(0).toUpperCase();
			var dic:Dictionary=this[firstChar] as Dictionary;
			if (dic)
			{
				var sameClass:Array=dic[className];
				if (sameClass)
				{
					//不存在该类加入集合 
					if (sameClass.indexOf(packageName) == -1)
					{
						sameClass.push(packageName);
					}
				}
				else
				{
					sameClass=[packageName];
					dic[className]=sameClass;
				}
			}
			else
			{
				dic=new Dictionary(false);
				dic[className]=[packageName];
				this[firstChar]=dic;
			}
		}
	}
}
