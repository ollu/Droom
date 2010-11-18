package nu.fickla.droom.display
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;

	public class HeroShip extends Ship
	{

		/**
		 *	PROPERTIES
		 */
		private var moveShipTimer : Timer;
		private var activeKeys : Array;

		/**
		 *	METHODS
		 */
		
		public function HeroShip()
		{
			canFire = true;
			speed 	= 10;
			
			// Hide the shield of the ship
			this.shield.visible = false;
			
			// Get all keyboard key numbers
			activeKeys = createActiveKeys();

			addEventListener(Event.ADDED_TO_STAGE, addedToStage, false, 0, true);
			
			fireTimer = new Timer(300, 1);
			fireTimer.addEventListener(TimerEvent.TIMER, fireTimerComplete, false, 0, true);
			
		}
		
		private function addedToStage(event : Event) : void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			
			moveShipTimer = new Timer(10);
			moveShipTimer.addEventListener(TimerEvent.TIMER, moveShip, false, 0, true);
			moveShipTimer.start();
		}

		private function moveShip(event : Event) : void
		{
			if(isKeyDown(Keyboard.LEFT) == true){
				x < 70 ? x = 60 : x = x - speed;
				
			}
			
			if(isKeyDown(Keyboard.RIGHT) == true){
				//x > stage.stageWidth - 45 ? x = stage.stageWidth - 40 - speed : x = x + speed;
				x > 705 ? x = 715 - speed : x = x + speed;
			}
			
			if(isKeyDown(Keyboard.UP) == true){
				y < 60 ? y = 50 : y = y - speed;
			}
			
			if(isKeyDown(Keyboard.DOWN) == true){
				y > stage.stageHeight - 40 ? y = stage.stageHeight - 30 : y = y + speed;
			}
			
			if(isKeyDown(Keyboard.SPACE) == true){
				if(canFire)
				{
					fire();
					canFire = false;
					fireTimer.start();
				}
			}
		}
		
		private function fire() : void
		{
			stage.addChild(new Missile(x, y));
		}

		private function fireTimerComplete(event : Event) :void
		{
			canFire = true;
		}
		
		private function keyDown(event : KeyboardEvent) : void
		{
			activeKeys[event.keyCode][1] = true;
		}
		
		private function keyUp(event:KeyboardEvent) : void
		{
			activeKeys[event.keyCode][1] = false;
		}
		
		private function isKeyDown(X) : Boolean
		{
			return activeKeys[X][1];
		}
		
		private function createActiveKeys() : Array
		{
			var arr : Array = new Array();
			for(var i : int = 0; i < 222; i++){
				arr.push([i,false]);
			}
			return arr;
		}
	}
}