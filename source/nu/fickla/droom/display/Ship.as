package nu.fickla.droom.display {
	import nu.fickla.droom.Droom;
	import nu.fickla.droom.utils.Key;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;

	public class Ship extends MovieClip {
		private var speed : uint = 4;
		public var shipShield : uint = 0;
		public var shipHealth : uint = 100;
		private var healthBar : GUIStatusBar;
		private var shieldBar : GUIStatusBar;
		// Fire related variables
		private var fireTimer : Timer;
		private var canFire : Boolean = true;

		public function Ship() {
			addEventListener(Event.ADDED_TO_STAGE, readyOnStage, false, 0, true);
		}

		private function readyOnStage(event : Event) : void {
			healthBar = new GUIStatusBar(100);
			shieldBar = new GUIStatusBar(0);
			healthBar.x = 5;
			healthBar.y = 5;
			shieldBar.x = healthBar.x;
			shieldBar.y = healthBar.y + 12;

			stage.addChild(healthBar);
			stage.addChild(shieldBar);

			this.x = 100;
			this.y = stage.stageHeight / 2;

			Key.init(stage);

			fireTimer = new Timer(300, 1);
			fireTimer.addEventListener(TimerEvent.TIMER, fireTimerComplete, false, 0, true);

			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}

		public function loop(event : Event) : void {
			if (Key.isDown(Keyboard.RIGHT)) {
				x > stage.stageWidth - 60 ? x = stage.stageWidth - 40 : x = x + speed;
			}

			if (Key.isDown(Keyboard.LEFT)) {
				x < 70 ? x = 60 : x = x - speed;
			}

			if (Key.isDown(Keyboard.UP)) {
				y < 60 ? y = 50 : y = y - speed;
			}

			if (Key.isDown(Keyboard.DOWN)) {
				y > stage.stageHeight - 40 ? y = stage.stageHeight - 30 : y = y + speed;
			}

			if (Key.isDown(Keyboard.SPACE)) {
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
			stage.addChild(new Missile(x, y));
		}

		private function fireTimerComplete(evt : Event) : void {
			canFire = true;
		}

		public function takeDamage(damage : uint) : void {
			if (shipShield > 0) {
				shipShield -= damage;
				// Shield.update(shipShield);
			} else {
				shipHealth -= damage;
				// Health.update(shipHealth);
			}
		}

		private function explode() : void {
			var explosion : Explosion = new Explosion(stage, x, y);
			stage.addChild(explosion);
			removeSelf();
		}

		private function removeSelf() : void {
			removeEventListener(Event.ENTER_FRAME, loop);
			if (stage.contains(this)) stage.removeChild(this);
		}
	}
}