package nu.fickla.droom.display {
    import flash.display.MovieClip;
    import flash.display.Stage;
    import flash.events.Event;

    public class EnemyMissile extends MovieClip {

        private var stageRef:Stage;
        private var heroRef:Ship;
        private var speed:uint = 14;

        public function EnemyMissile(stageRef:Stage, heroRef:Ship, x:uint, y:uint) {
            this.stageRef = stageRef;
            this.heroRef = heroRef;
            this.x = x - 30;
            this.y = y + 5;

            addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
        }

        private function loop(e:Event):void {
            x -= speed;
            if (x > stageRef.stageWidth || x < -10) removeSelf();
            if (hitTestObject(heroRef)) {
                removeSelf();
            }
        }

        private function removeSelf():void {
            removeEventListener(Event.ENTER_FRAME, loop);
            if (stageRef.contains(this)) stageRef.removeChild(this);
        }

    }
}