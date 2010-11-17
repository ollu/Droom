package nu.fickla.droom.display
{
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.display.Stage;

	public class HeroShip extends Ship
	{
		
		//private var fireTimer:Timer;
		private var canFire:Boolean = true;

		public function HeroShip()
		{
			trace("Our hero is added to the stage");
		}
		
		public function traceKey(evt : KeyboardEvent)
		{
		}
	}
}