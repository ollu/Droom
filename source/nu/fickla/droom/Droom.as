package nu.fickla.droom
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import nu.fickla.droom.display.HeroShip;
	
	public class Droom extends Sprite
	{
		private var heroShip : HeroShip;
		
		public function Droom()
		{
			trace("Droom started");
			heroShip = new HeroShip();
			addChild(heroShip);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
		
		private function keyDown(event : KeyboardEvent) : void
		{
			switch(event.keyCode)
			{
				case Keyboard.LEFT :
					heroShip.move("x", -5);
					heroShip.moving = true;
					break;
				case Keyboard.RIGHT :
					heroShip.move("x", 5);
					break;
				case Keyboard.UP :
					heroShip.move("y", -5);
					break;
				case Keyboard.DOWN :
					heroShip.move("y", 5);
					break;
				case Keyboard.SPACE :
					trace("SPACE");
					break;
			}
		}
		
		private function keyUp(event : KeyboardEvent) : void
		{
			
		}
		
	}
}