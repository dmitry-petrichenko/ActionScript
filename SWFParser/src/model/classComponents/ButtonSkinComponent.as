package model.classComponents 
{
	import model.IClassComponent;
	
	/**
	 * ...
	 * @author 
	 */
	public class ButtonSkinComponent implements IClassComponent 
	{
		private var _name:String;
		
		public function ButtonSkinComponent(name:String) 
		{
			_name = name;
		}
		
		/* INTERFACE model.IClassComponent */
		
		public function get importText():String 
		{
			return "import ButtonSkin;";
		}
		
		public function get declarationText():String 
		{
			return "private var _" + _name + ":ButtonSkin;";
		}
		
		public function get initializationText():String 
		{
			return "_" + _name + " = " + "new ButtonSkin(_template." + _name + ", '"+ _name +"');";
		}
		
		public function get destroyText():String 
		{
			return "_" + _name + ".destroy();";
		}
		
	}

}