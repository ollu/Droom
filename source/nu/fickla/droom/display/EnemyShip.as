package nu.fickla.droom.display {
	import com.greensock.TweenLite;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class EnemyShip extends MovieClip {
		private var speed : uint = 7;
		private var heroRef : Ship;
		private var toY : uint;

		// Fire related variables
		private var fireTimer : Timer;
		private var canFire : Boolean = false;

		public function EnemyShip(heroRef : Ship, yPos : int) : void {
			
			addEventListener(Event.ADDED_TO_STAGE, readyOnStage, false, 0, true);

			this.heroRef = heroRef;
			x = 800;
			if (yPos == 1) {
				y = 50;
				toY = 90;
			} else {
				y = 280;
				toY = 240;
			}
			scaleX = scaleY = .7;
			TweenLite.to(this, .9, {y:toY, delay:1.5});

			fireTimer = new Timer(500 + Math.random() * 500);
			fireTimer.addEventListener(TimerEvent.TIMER, fireTimerComplete, false, 0, true);
			fireTimer.start();

			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}

		private function readyOnStage(event : Event) : void {
		}

		private function loop(evt : Event) : void {
			x -= speed;
			if (x < -50) removeSelf();

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

		public function takeDamage() : void {
			explode();
		}

		private function explode() : void {
			var explosion : Explosion = new Explosion(stage, x, y);
			stage.addChild(explosion);
			var pointBurst : PointBurst = new PointBurst(x, y, 50);
			stage.addChild(pointBurst);
			removeSelf();
		}

		private function removeSelf() : void {
			removeEventListener(Event.ENTER_FRAME, loop);
			if (stage.contains(this)) stage.removeChild(this);
		}
	}
}