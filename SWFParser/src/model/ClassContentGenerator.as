package model 
{
	import files.SettingsLoader;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import global.Utils;
	import model.classComponents.ButtonSkinComponent;
	import model.classComponents.TemplateComponent;
	import model.classComponents.TextFieldComponent;
	import model.classContents.ClassContent;
	import model.classContents.SpriteSuperClass;
	import parsers.Parser;

	public class ClassContentGenerator 
	{
		//=========================================================================
		// CONSTANTS
		//=========================================================================

		private const TEXT_FIELD:String = "TextField";

		//=========================================================================
		// PRIVATE PROPERTIES
		//=========================================================================

		private var _targetClass:Object;
		private var _classContent:IClassContent;
		private var _buttons:Vector.<IClassComponent>;
		private var _textFields:Vector.<IClassComponent>;
		private var _classPackage:String;
		private var _classContentText:String = "";

		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function ClassContentGenerator(targetClass:Object, classPackage:String) 
		{
			_buttons = new Vector.<IClassComponent>();
			_textFields = new Vector.<IClassComponent>();
			
			_classPackage = classPackage;
			_targetClass = targetClass;
			
			var names:Vector.<String> = getComponentsNames(targetClass);
			distributeComponents(names);
			
			_classContent = new ClassContent(classPackage, new SpriteSuperClass());
			
			addComponent(new TemplateComponent(classPackage));
			
			for each (var item:IClassComponent in _textFields) 
			{
				addComponent(item);
			}
			
			for each (item in _buttons) 
			{
				addComponent(item);
			}
		}


		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================

		public function get contentText():String
		{
			var p:Parser = new Parser(_classContent.contentText, Utils.getClassNameByPath(_classPackage), SettingsLoader.structure, SettingsLoader.appearance);
			return p.newContent;
		}

		//=========================================================================
		// PRIVATE METHODS
		//=========================================================================

		private function distributeComponents(names:Vector.<String>):void 
		{
			for each (var name:String in names) 
			{
				if (name.search("TextField") != -1)
					_textFields.push(new TextFieldComponent(name))
				else if (name.search("Button") != -1)
					_buttons.push(new ButtonSkinComponent(name))
				else
					continue;
			}
		}

		private function getComponentsNames(targetClass:Object):Vector.<String> 
		{
			var componentsNames:Vector.<String> = new Vector.<String>();
			var myObject:DisplayObjectContainer = DisplayObjectContainer(targetClass);
			
			for (var i:int = 0; i < myObject.numChildren; i++)
			{
				componentsNames.push(myObject.getChildAt(i).name);
			}
			
			return componentsNames;
		}

		private function addComponent(component:IClassComponent):void 
		{
			_classContent.addComponentImports(component.importText);
			_classContent.addComponentDeclaration(component.declarationText);
			_classContent.addComponentInitialization(component.initializationText);
			_classContent.addComponentDestroy(component.destroyText);
		}

	}
}