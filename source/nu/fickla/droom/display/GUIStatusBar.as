package nu.fickla.droom.display {
	import flash.display.Sprite;

	/**
	 * @author ollu
	 */
	public class GUIStatusBar extends Sprite {
		
		private var statusBar : Sprite;
		private var _status : int;
		
		public function GUIStatusBar(initValue : int) {
			_status = initValue;
			statusBar = new Sprite();
			statusBar.graphics.beginFill(0xFF);
			statusBar.graphics.drawRect(0, 0, 100, 10);
			statusBar.graphics.endFill();
			addChild(statusBar);
		}

		public function get status() : int {
			return _status;
		}

		public function set status(damage : int) : void {
			_status = damage;
		}
		
	}
}
