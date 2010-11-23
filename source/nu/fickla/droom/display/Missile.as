package nu.fickla.droom.display {
	import flash.display.Sprite;

	public class Missile extends Sprite {
		private var _speed : Number = 16;

		public function Missile(x : Number, y : Number) : void {

			this.x = x + 40;
			this.y = y + 5;
		}

		public function move() : void {
			x += _speed;
		}

		public function get speed() : Number {
			return _speed;
		}

		public function set speed(speed : Number) : void {
			_speed = speed;
		}
	}
}