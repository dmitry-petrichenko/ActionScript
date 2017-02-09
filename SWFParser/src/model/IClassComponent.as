package model 
{

	/**
	 * ...
	 * @author 
	 */

	public interface IClassComponent 
	{
		function get importText():String;
		function get declarationText():String;
		function get initializationText():String;
		function get destroyText():String;
	}
}