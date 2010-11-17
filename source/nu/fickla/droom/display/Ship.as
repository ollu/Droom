package nu.fickla.droom.display
{
	import flash.display.Sprite;

	public class Ship extends Sprite
	{
		private var _health : int;
		private var _shieldUp : Boolean;
		private var _moving : Boolean;
		
		public function Ship()
		{
			_shieldUp 	= false;
			_moving 	= false;
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
				
		public function set health(value : int) :void
		{
			_health = value;
		}
		
		public function get health() : int
		{
			return _health;
		}
		
		public function set shieldUp(value : Boolean) : void
		{
			_shieldUp = value;	
		}
		
		public function get shieldUp() : Boolean
		{
			return _shieldUp;
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