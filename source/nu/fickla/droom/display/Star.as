package nu.fickla.droom.display {
	import flash.display.MovieClip;

    public class Star extends MovieClip {

    private var speed:Number = 2 + Math.random() * 2;

        public function Star() {
            if (Math.random() < 0.5) {
                scaleX = scaleY = .5;
                alpha = Math.random();
            }

        }

        public function move() : void {
            if (x < -5) {
                x = 800;
                if (Math.random() < 0.5) scaleX = scaleY = .5;
            } else {
                x -= speed;
            }
        }

    }
}