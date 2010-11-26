package nu.fickla.utils {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.system.ApplicationDomain;
	import flash.text.Font;

	/**
	 * @author erik
	 */
	public class Library {
		
		public static function createBitmap(linkage:String):Bitmap {
			return new Bitmap( createBitmapData( linkage ) );
		}

		public static function createBitmapData(linkage:String):BitmapData {
			return new (ApplicationDomain.currentDomain.getDefinition( linkage ))( 0, 0 ) as BitmapData;
		}

		public static function createSimpleButton(linkage:String):SimpleButton {
			return new (ApplicationDomain.currentDomain.getDefinition( linkage ))() as SimpleButton;
		}

		public static function createSprite(linkage:String):Sprite {
			return new (ApplicationDomain.currentDomain.getDefinition( linkage ))() as Sprite;
		}

		public static function createFont(linkage:String):Font {
			return new (ApplicationDomain.currentDomain.getDefinition( linkage ))() as Font;
		}
		
	}
}
