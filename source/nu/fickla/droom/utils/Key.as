package nu.fickla.droom.utils {
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	/**
	 * @author ollu
	 */
	public class Key {
		private static var keys : Object = new Object();

		public static function init(stage : Stage) : void {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, checkKeysDown, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, checkKeysUp, false, 0, true);
		}

		private static function checkKeysDown(event : KeyboardEvent) : void {
			keys[event.keyCode] = true;
		}

		private static function checkKeysUp(event : KeyboardEvent) : void {
			delete keys[event.keyCode];
		}

		public static function isDown(number : uint) : Boolean {
			return (number in keys);
		}
	}
}