package com.far.mvc.models.vo
{
	import com.far.generator.ClassGenerator;
	import com.far.generator.EventGenerator;
	import com.far.generator.IGenerator;
	import com.far.generator.InterfaceGenerator;
	import com.far.generator.SingletonGenerator;

	/**
	 * @author far
	 * @E-mail: wujiyu115@gmail.com
	 * @version 1.0.0
	 * 创建时间：2012-5-23 下午4:01:25
	 *
	 */
	public class GengertorManager extends Array
	{
		[Inject]
		public var classGenerator:ClassGenerator;
		[Inject]
		public var eventGenerator:EventGenerator;
		[Inject]
		public var singletonGenerator:SingletonGenerator;
		[Inject]
		public var interfaceGenerator:InterfaceGenerator;
		public var data:Vector.<IGenerator>;

		[PostConstruct(order="1")]
		public function init():void
		{
			data=Vector.<IGenerator>([classGenerator, eventGenerator, singletonGenerator, interfaceGenerator, classGenerator, eventGenerator, singletonGenerator, interfaceGenerator]);

		}
	}
}
