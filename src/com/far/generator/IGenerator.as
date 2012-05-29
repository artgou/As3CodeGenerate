package com.far.generator
{
	import com.far.analysis.GeneratedFile;
	import com.far.analysis.PseudoClass;

	public interface IGenerator
	{
		function generator(pOriginalFile:PseudoClass):GeneratedFile;
	}
}