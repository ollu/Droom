package nu.fickla.droom.display {
	import flash.display.Sprite;

	/**
	 * @author ollu
	 */
	public class GUIStatusBar extends Sprite {
		
		private var statusBar : Sprite;
		private var background : Sprite;
		private var color : int;
		private var _status : int;
		
		public function GUIStatusBar(value : int) {
			_status = value;
			
			if (value > 0)
				color = 0xCC0000;
			else
				color = 0x003366;
			
			
			background = new Sprite();
			background.graphics.beginFill(0xCCCCCC);
			background.graphics.drawRect(0, 0, 102, 12);
			
			statusBar = new Sprite();
			statusBar.graphics.beginFill(color);
			statusBar.graphics.drawRect(1, 1, _status, 10);
			statusBar.graphics.endFill();
			addChild(statusBar);
		}

		private function reDrawStatusBar() : void {
			statusBar.graphics.clear();
			statusBar.graphics.beginFill(0xCCCCCC);
			statusBar.graphics.drawRect(1, 1, _status, 10);
			statusBar.graphics.endFill();
		}

		public function get status() : int {
			return _status;
		}

		public function set status(value : int) : void {
			_status = value;
			reDrawStatusBar();
		}
		
	}
}
