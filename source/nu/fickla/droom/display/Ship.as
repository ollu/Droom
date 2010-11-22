package nu.fickla.droom.display {
	import nu.fickla.droom.Droom;

	import com.senocular.utils.KeyObject;

	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;

	public class Ship extends MovieClip {
		private var stageRef : Stage;
		private var key : KeyObject;
		private var speed : uint = 4;
		public var shipShield : uint = 0;
		public var shipHealth : uint = 100;

		// Fire related variables
		private var fireTimer : Timer;
		private var canFire : Boolean = true;

		public function Ship(stageRef : Stage) {
			this.stageRef = stageRef;

			this.x = 100;
			this.y = stageRef.stageHeight / 2;

			key = new KeyObject(stageRef);

			fireTimer = new Timer(300, 1);
			fireTimer.addEventListener(TimerEvent.TIMER, fireTimerComplete, false, 0, true);

			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}

		public function loop(event : Event) : void {
			if (key.isDown(Keyboard.RIGHT)) {
				x > stageRef.stageWidth - 60 ? x = stageRef.stageWidth - 40 : x = x + speed;
			}

			if (key.isDown(Keyboard.LEFT)) {
				x < 70 ? x = 60 : x = x - speed;
			}

			if (key.isDown(Keyboard.UP)) {
				y < 60 ? y = 50 : y = y - speed;
			}

			if (key.isDown(Keyboard.DOWN)) {
				y > stageRef.stageHeight - 40 ? y = stageRef.stageHeight - 30 : y = y + speed;
			}

			if (key.isDown(Keyboard.SPACE)) {
				if (canFire) {
					fireBullet();
					canFire = false;
					fireTimer.start();
				}
			}

			checkForCollision();
		}

		private function checkForCollision() : void {
			for (var i : int = 0; i < Droom.enemyList.length; i++) {
				if (hitTestObject(Droom.enemyList[i])) {
					explode();
				}
			}
		}

		private function fireBullet() : void {
			stageRef.addChild(new Missile(stageRef, x, y));
		}

		private function fireTimerComplete(evt : Event) : void {
			canFire = true;
		}

		public function takeDamage(damage) : void {
			if (shipShield > 0) {
				shipShield -= damage;
				// Shield.update(shipShield);
			} else {
				shipHealth -= damage;
				// Health.update(shipHealth);
			}
		}

		private function explode() : void {
			var explosion : Explosion = new Explosion(stageRef, x, y);
			stageRef.addChild(explosion);
			removeSelf();
		}

		private function removeSelf() : void {
			removeEventListener(Event.ENTER_FRAME, loop);
			if (stageRef.contains(this)) stageRef.removeChild(this);
		}
	}
}