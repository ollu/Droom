package nu.fickla.droom.display {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class Ship extends MovieClip {
		private var _speed : uint;
		private var _shipShield : uint;
		private var _shipHealth : uint;
		
		// Fire related variables
		private var fireTimer : Timer;
		private var canFire : Boolean = true;

		public function Ship() {
			addEventListener(Event.ADDED_TO_STAGE, readyOnStage, false, 0, true);
		}

		private function readyOnStage(event : Event) : void {
			this.x = 100;
			this.y = stage.stageHeight / 2;

			fireTimer = new Timer(300, 1);
			fireTimer.addEventListener(TimerEvent.TIMER, fireTimerComplete, false, 0, true);
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

		public function explode() : void {
			var explosion : Explosion = new Explosion(stage, x, y);
			stage.addChild(explosion);
		}

		public function get speed() : uint {
			return _speed;
		}

		public function set speed(speed : uint) : void {
			_speed = speed;
		}

		public function get shipShield() : uint {
			return _shipShield;
		}

		public function set shipShield(shipShield : uint) : void {
			_shipShield = shipShield;
		}

		public function get shipHealth() : uint {
			return _shipHealth;
		}

		public function set shipHealth(shipHealth : uint) : void {
			_shipHealth = shipHealth;
		}
	}
}