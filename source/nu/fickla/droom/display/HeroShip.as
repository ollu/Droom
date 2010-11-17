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
		private var activeKeys : Array;

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
			this.addEventListener(Event.ENTER_FRAME, moveShip);
		}

		private function moveShip(event : Event) : void
		{
			if(isKeyDown(Keyboard.LEFT) == true){
				this.x -= 5;
			}
			
			if(isKeyDown(Keyboard.RIGHT) == true){
				this.x += 5;
			}
			
			if(isKeyDown(Keyboard.UP) == true){
				this.y -= 5;
			}
			
			if(isKeyDown(Keyboard.DOWN) == true){
				this.y += 5;
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