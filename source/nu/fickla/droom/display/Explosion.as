package nu.fickla.droom.display {
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;

	public class Explosion extends MovieClip {
		private var stageRef : Stage;

		public function Explosion(stageRef : Stage, x : int, y : int) : void {
			this.stageRef = stageRef;
			this.x = x;
			this.y = y;
			scaleX = scaleY = .5;
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}

		private function loop(evt : Event) : void {
			if (currentFrame == totalFrames) removeSelf();
		}

		private function removeSelf() : void {
			removeEventListener(Event.ENTER_FRAME, loop);
			if (stageRef.contains(this)) stageRef.removeChild(this);
		}
	}
}