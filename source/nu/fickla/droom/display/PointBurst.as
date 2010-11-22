package nu.fickla.droom.display {
	import nu.fickla.droom.Droom;

	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;

	public class PointBurst extends MovieClip {

		public function PointBurst(x : Number, y : Number, score : uint) : void {
			this.x = x;
			this.y = y;
			score_txt.text = score.toString();
			Droom.playerScore += score;
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}

		private function loop(evt : Event) : void {
			alpha -= .1;
			scaleX = scaleY += .5;
			if (alpha < 0) removeSelf();
		}

		private function removeSelf() : void {
			removeEventListener(Event.ENTER_FRAME, loop);
			if (stage.contains(this)) stage.removeChild(this);
		}
	}
}