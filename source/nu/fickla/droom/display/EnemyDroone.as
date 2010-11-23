package nu.fickla.droom.display {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class EnemyDroone extends MovieClip {
		private var speed : uint = 4;
		private var heroRef : Ship;

		// Fire related variables
		private var fireTimer : Timer;
		private var canFire : Boolean = false;

		public function EnemyDroone(heroRef : Ship, yPos : int) : void {
			
			this.heroRef = heroRef;
			x = 800;
			
			if (yPos == 1) {
				y = 50;
			} else {
				y = 280;
			}
			scaleX = scaleY = .7;

			fireTimer = new Timer(500 + Math.random() * 500);
			fireTimer.addEventListener(TimerEvent.TIMER, fireTimerComplete, false, 0, true);
			fireTimer.start();
		}

		public function move() : void {
			x -= speed;

			// When our hero is in line and range shoot him down
			if (y - 15 < heroRef.y && y + 15 > heroRef.y && x - 200 < heroRef.x && x + 200 > heroRef.x) {
				if (canFire) {
					fire();
					canFire = false;
				}
			}
		}

		private function fire() : void {
			stage.addChild(new EnemyMissile(stage, heroRef, x, y));
		}

		private function fireTimerComplete(evt : Event) : void {
			canFire = true;
		}
	}
}