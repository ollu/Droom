package nu.fickla.droom.events
{
	import flash.events.Event;
	
	/**
	 * @author ollu
	 */
	public class OutOfBoundEvent extends Event {
		
		public static const OUT_OF_BOUND : String = "Out of bound";
		
		public function OutOfBoundEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
}