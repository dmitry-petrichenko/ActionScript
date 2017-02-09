package model 
{

	/**
	 * ...
	 * @author Dima Petrichenko
	 */

	public interface IClassContent 
	{
		function addComponentImports(value:String):void;
		function addComponentDeclaration(value:String):void;
		function addComponentInitialization(value:String):void;
		function addComponentDestroy(value:String):void;
		function get contentText():String;
	}
}