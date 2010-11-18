package nu.fickla.droom.display
{
	import flash.display.Sprite;
	import flash.utils.Timer;

	public class Ship extends Sprite
	{
		
		public var fireTimer : Timer;
		public var canFire : Boolean;
		public var speed : int;
		
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

	}
}