package nu.fickla.droom.display {
	import flash.display.Sprite;

	/**
	 * @author ollu
	 */
	public class GUIStatusBar extends Sprite {
		
		private var color : uint;
		private var _status : int;
		
		public function GUIStatusBar(value : uint, color : uint) {
			_status = value;
			this.color = color;

			graphics.beginFill(color);
			graphics.drawRect(0, 0, _status, 8);
			graphics.endFill();
		}

		private function reDrawStatusBar() : void {
			graphics.clear();
			graphics.beginFill(color);
			graphics.drawRect(0, 0, _status, 8);
			graphics.endFill();
		}

		public function set status(value : int) : void {
			if (value < 0 ) value = 0;
			_status = value;
			reDrawStatusBar();
		}
		
	}
}
