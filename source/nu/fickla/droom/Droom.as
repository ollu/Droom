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
			heroShip.x = 60;
			heroShip.y = stage.stageHeight / 2;
		}
				
	}
}