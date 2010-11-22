package nu.fickla.droom.display {
	import com.greensock.TweenLite;

	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class Boss extends MovieClip {
		private var stageRef : Stage;
		private var heroRef : Ship
		private var speed : uint = 5;
		private var health : uint = 100;
		private var fireTimer : Timer;
		private var canFire : Boolean = true;

		public function Boss(stageRef, heroRef) {
			this.stageRef = stageRef;
			this.heroRef = heroRef;
			scaleX = scaleY = .8;
			this.x = 850;
			this.y = stageRef.stageHeight / 2;
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);

			TweenLite.to(this, 2, {x:500, onComplete:onFinishTween, onCompleteParams:[5]});

			fireTimer = new Timer(100);
			fireTimer.addEventListener(TimerEvent.TIMER, fireTimerComplete, false, 0, true);
			fireTimer.start();
		}

		function loop(evt : Event) : void {
			// When our hero is in line and range shoot him down
			if (y - 5 < heroRef.y && y + 25 > heroRef.y) {
				if (canFire) {
					fire();
					canFire = false;
				}
			}
		}

		private function onFinishTween(param) {
			switch (param) {
				case 1:
					TweenLite.to(this, 1.5, {x:500, y:50, onComplete:onFinishTween, onCompleteParams:[2]});
					break;
				case 2:
					TweenLite.to(this, 1.5, {x:500, y:250, onComplete:onFinishTween, onCompleteParams:[3]});
					break;
				case 3:
					TweenLite.to(this, 1.5, {x:720, y:50, onComplete:onFinishTween, onCompleteParams:[4]});
					break;
				case 4:
					TweenLite.to(this, 1.5, {x:720, y:250, onComplete:onFinishTween, onCompleteParams:[5]});
					break;
				case 5:
					TweenLite.to(this, 1.5, {x:500, y:160, onComplete:onFinishTween, onCompleteParams:[6]});
					break;
				case 6:
					TweenLite.to(this, 1.5, {x:720, y:160, onComplete:onFinishTween, onCompleteParams:[1]});
					break;
			}
		}

		private function fire() : void {
			stageRef.addChild(new EnemyMissile(stageRef, heroRef, x, y + 10));
			stageRef.addChild(new EnemyMissile(stageRef, heroRef, x - 10, y));
		}

		private function fireTimerComplete(evt : Event) : void {
			canFire = true;
		}

		public function takeDamage() : void {
			health -= 5;
			if (health <= 0) explode();
		}

		private function explode() : void {
			var explosion : Explosion = new Explosion(stageRef, x, y);
			stageRef.addChild(explosion);
			var pointBurst : PointBurst = new PointBurst(stageRef, x, y, 5000);
			stageRef.addChild(pointBurst);
			removeSelf();
		}

		function removeSelf() : void {
			removeEventListener(Event.ENTER_FRAME, loop);
			if (stageRef.contains(this)) stageRef.removeChild(this);
		}
	}
}