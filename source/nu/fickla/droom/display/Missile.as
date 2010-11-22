package nu.fickla.droom.display {
	import nu.fickla.droom.Droom;

	import flash.display.MovieClip;
	import flash.events.Event;

	public class Missile extends MovieClip {
		private var bulletSpeed : Number = 16;

		public function Missile(x : Number, y : Number) : void {
			this.x = x + 40;
			this.y = y + 5;

			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}

		private function loop(e : Event) : void {
			// Move missile forward
			x += bulletSpeed;
			for (var i : int = 0; i < Droom.enemyList.length; i++) {
				if (hitTestObject(Droom.enemyList[i])) {
					Droom.enemyList[i].takeDamage();
					removeSelf();
				}
			}
			// Remove missile when going of stage
			if (x > stage.stageWidth) removeSelf();
		}

		private function removeSelf() : void {
			removeEventListener(Event.ENTER_FRAME, loop);
			if (stage.contains(this)) stage.removeChild(this);
		}
	}
}