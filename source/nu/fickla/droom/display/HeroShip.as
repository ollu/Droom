package nu.fickla.droom.display
{
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	import flash.display.Stage;

	public class HeroShip extends Ship
	{
		
		//private var fireTimer:Timer;
		private var moveShipTimer : Timer;
		private var activeKeys : Array;
		
		private var speed : int = 5;

		public function HeroShip()
		{
			trace("Our hero is added to the stage");

			this.shield.visible = false;
			activeKeys = createActiveKeys();

			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
		}
		
		private function addedToStage(event : Event) : void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			addEventListener(Event.ENTER_FRAME, moveShip);
			
		}

		private function moveShip(event : Event) : void
		{
			if(isKeyDown(Keyboard.LEFT) == true){
				x < 70 ? x = 60 : x = x - speed;
				
			}
			
			if(isKeyDown(Keyboard.RIGHT) == true){
				x > stage.stageWidth - 45 ? x = stage.stageWidth - 35 : x = x + speed;
			}
			
			if(isKeyDown(Keyboard.UP) == true){
				y < 60 ? y = 50 : y = y - speed;
			}
			
			if(isKeyDown(Keyboard.DOWN) == true){
				y > stage.stageHeight - 40 ? y = stage.stageHeight - 30 : y = y + speed;
			}
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