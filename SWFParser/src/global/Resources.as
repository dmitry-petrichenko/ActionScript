package global 
{
	import events.StreamEvent;
	import flash.display.LoaderInfo;
	import flash.filesystem.File;

	/**
	 * ...
	 * @author ...
	 */

	public class Resources 
	{
		//=========================================================================
		// PUBLIC PROPERTIES
		//=========================================================================

		public static var SFWContentLoaderInfo:LoaderInfo;
		public static var guiPath:String = ""; 

		//=========================================================================
		// CONSTRUCTOR
		//=========================================================================

		public function Resources() 
		{
			
		}


		//=========================================================================
		// PUBLIC METHODS
		//=========================================================================

		public static function initialize():void
		{
			Stream.addEventListener(StreamEvent.LOAD_FILE_COMPLETE, onLoadComplete);
			Stream.addEventListener(StreamEvent.LOAD_FOLDER_COMPLETE, onLoadFolderComplete);
		}
		
		private static function onLoadFolderComplete(event:StreamEvent):void 
		{
			guiPath = File(event.data.file).nativePath;
		}

		//=========================================================================
		// PRIVATE METHODS
		//=========================================================================

		private static function onLoadComplete(event:StreamEvent):void 
		{
			SFWContentLoaderInfo = event.data.loader.contentLoaderInfo;
		}

	}
}