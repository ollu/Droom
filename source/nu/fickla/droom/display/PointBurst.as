package nu.fickla.droom.display {
	import nu.fickla.droom.Droom;
	import nu.fickla.utils.Library;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.GlowFilter;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;

	public class PointBurst extends Sprite {
		
		private var whimsyScoreFont : Font;
		private var scoreText : TextField;

		public function PointBurst(x : Number, y : Number, score : uint) : void {
			this.x = x;
			this.y = y;

			whimsyScoreFont = Library.createFont("WhimsyScoreFont");
			scoreText = createScoreTextField(whimsyScoreFont);
			scoreText.text = score.toString();
			addChild(scoreText);
			scoreText.x = scoreText.y = -10;
			
			Droom.playerScore += score;
			addEventListener(Event.ENTER_FRAME, animate, false, 0, true);
		}

		private function animate(evt : Event) : void {
			alpha -= .1;
			scaleX = scaleY += .5;
			if (alpha < 0) removeSelf();
		}

		private function createScoreTextField(fontFace : Font) : TextField {
			var tf : TextField;
			tf = new TextField();
			tf.type = TextFieldType.DYNAMIC;
			tf.width = 80;
			tf.height = 20;
			tf.embedFonts = true;
			tf.filters = [new GlowFilter(0xCCCCCC, 1, 4, 4, 100, 3, true, true)];
						
			var format:TextFormat = new TextFormat();
            format.font = fontFace.fontName;
            format.color = 0xCCCCCC;
            format.size = 14;

            tf.defaultTextFormat = format;
            return tf;
		}

		private function removeSelf() : void {
			removeEventListener(Event.ENTER_FRAME, animate);
			if (stage.contains(this)) stage.removeChild(this);
		}
	}
}