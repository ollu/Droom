package nu.fickla.droom.display
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import nu.fickla.droom.events.OutOfBoundEvent;
	
	public class Missile extends Sprite
	{
		
		private var missileSpeed:Number = 16;
		private var missileTimer : Timer;
		private var outOfBound : Boolean;
		
		public function Missile(shipPosX : int, shipPosY : int)
		{
			x = shipPosX + 40;
			y = shipPosY + 5;
			
			outOfBound = false;
			addEventListener(Event.ADDED_TO_STAGE, addedToStage, false, 0, true);
		}
		
		private function addedToStage(event : Event) : void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);

			missileTimer = new Timer(10);
			missileTimer.addEventListener(TimerEvent.TIMER, moveMissile, false, 0, true);
			missileTimer.start();
		}
		
		private function moveMissile(event : TimerEvent) : void
		{
			x += missileSpeed;
			
			if(outOfBound)
			{
				var newEvent : OutOfBoundEvent = new OutOfBoundEvent(OutOfBoundEvent.OUT_OF_BOUND);
				dispatchEvent(newEvent);
			}
		}
	}
}