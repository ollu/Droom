package nu.fickla.droom.display
{
	import flash.display.Sprite;

	public class Ship extends Sprite
	{
		private var _moving : Boolean;
		
		public function Ship()
		{

		}

		public function move(direction : String, value : int) : void
		{
			if(direction == "x")
				this.x += value;
			else
				this.y += value;
		}
		
		public function takeDamage() : void
		{
			
		}
		
		public function set moving(value : Boolean) : void
		{
			_moving = value;
		}
		
		public function get moving() : Boolean
		{
			return _moving;
		}
	}
}