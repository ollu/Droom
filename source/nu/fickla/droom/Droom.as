package nu.fickla.droom {
	import nu.fickla.droom.display.Boss;
	import nu.fickla.droom.display.EnemyShip;
	import nu.fickla.droom.display.GUIStatusBar;
	import nu.fickla.droom.display.MiniBoss;
	import nu.fickla.droom.display.Ship;
	import nu.fickla.droom.display.Star;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.utils.Timer;

	// import nl.demonsters.debugger.MonsterDebugger;
	public class Droom extends Sprite {
		// public var debugger:MonsterDebugger = new MonsterDebugger(this);

		// Our hero!
		private var theShip : Ship;
		public static var playerScore : uint = 0;
		private var healthBar : GUIStatusBar;
		private var shieldBar : GUIStatusBar;

		// Keep track of every enemy
		public static var enemyList : Array = new Array();
		private var enemyShipDelay : uint;

		// How many enemy ships per wave for each level
		private var enemyWaveLength : Array = [5, 7, 9];
		private var enemyWaveCounter : uint = 0;
		private var countDownTilNextWave : Timer;

		// Wait for music
		private var enemyFirstWaveDelay : Timer;

		// Passed when we create enemy ship so we can change style of each wave
		private var enemyStartPos : int = 1;
		private var countForMiniBoss : uint = 0;
		private var countForBoss : uint = 0;

		// Current level of the game
		public static var gameLevel : uint = 0;

		// Create an instance of the Sound class
		private var soundClip : Sound = new Sound();
		private var sndChannel : SoundChannel = new SoundChannel();

		// Startscreen
		private var splashScreen : SplashScreen;

		public function Droom() : void {
			splashScreen = new SplashScreen();
			splashScreen.x = stage.stageWidth / 2;
			splashScreen.y = 130;
			stage.addChild(splashScreen);
			splashScreen.addEventListener(MouseEvent.CLICK, startGame, false, 0, true);

			stage.addEventListener(Event.MOUSE_LEAVE, windowNotActive);
			stage.addEventListener(Event.ACTIVATE, windowActive);
		}

		private function startGame(evt : MouseEvent) : void {
			// Activates keyboard input
			stage.focus = this;

			splashScreen.removeEventListener(MouseEvent.CLICK, startGame);
			stage.removeChild(splashScreen);
			splashScreen = null;

			soundClip.load(new URLRequest("game_theme.mp3"));

			// Play the sound when loaded
			soundClip.addEventListener(Event.COMPLETE, playSnd, false, 0, true);

			enemyWaveCounter = enemyWaveLength[gameLevel];

			// Background stars
			createStars(100);

			theShip = new Ship();
			stage.addChild(theShip);

			playerScore_txt.text = "0000000";

/*
			healthBar = new GUIStatusBar();
			stage.addChild(healthBar);

			shieldBar = new GUIStatusBar();
			stage.addChild(shieldBar);
*/
			enemyFirstWaveDelay = new Timer(7500, 1);
			enemyFirstWaveDelay.addEventListener(TimerEvent.TIMER, enemySetup, false, 0, true);
			enemyFirstWaveDelay.start();

			countDownTilNextWave = new Timer(3000);
			countDownTilNextWave.addEventListener(TimerEvent.TIMER, nextWave, false, 0, true);
		}

		private function enemySetup(event : Event) : void {
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}

		private function playSnd(event : Event) : void {
			// sndChannel = soundClip.play(0, int.MAX_VALUE);
		}

		private function loop(event : Event) : void {
			if (enemyWaveCounter != 0 ) {
				
				enemyShipDelay++;

				if (enemyShipDelay > 10) {
					enemyShipDelay = 0;
					enemyWaveCounter--;

					if (enemyWaveCounter == 0) countDownTilNextWave.start();

					var enemyShip : EnemyShip = new EnemyShip(theShip, enemyStartPos);
					enemyShip.addEventListener(Event.REMOVED_FROM_STAGE, removeEnemy, false, 0, true);
					stage.addChild(enemyShip);
					enemyList.push(enemyShip);
				}
			}
		}

		private function nextWave(event : Event) : void {
			if (countForMiniBoss != 3) {
				countForMiniBoss++;
				enemyWaveCounter = enemyWaveLength[gameLevel];

				// Switch between top and bottom position
				enemyStartPos *= -1;
			} else if (countForBoss != 2) {
				countForMiniBoss = 0;
				countForBoss++;
				var miniBoss : MiniBoss = new MiniBoss(theShip);
				stage.addChild(miniBoss);
				miniBoss.addEventListener(Event.REMOVED_FROM_STAGE, removeEnemy, false, 0, true);
				enemyList.push(miniBoss);
			} else {
				countForBoss = 0;
				countForMiniBoss = 0;
				var boss : Boss = new Boss(theShip);
				stage.addChild(boss);
				boss.addEventListener(Event.REMOVED_FROM_STAGE, removeEnemy, false, 0, true);
				enemyList.push(boss);
			}

			countDownTilNextWave.stop();
		}

		private function createStars(amount : uint) : void {
			for (var i : uint = 0; i < amount; i++ ) {
				var star : Star = new Star();
				star.x = Math.random() * stage.stageWidth;
				star.y = 5 + Math.random() * stage.stageHeight - 10;
				addChild(star);
			}
			;
		}

		private function removeEnemy(event : Event) : void {
			event.currentTarget.removeEventListener(Event.REMOVED_FROM_STAGE, removeEnemy);
			enemyList.splice(enemyList.indexOf(event.currentTarget), 1);

			updateScoreBoard();

			// Start timer when miniBoss and boss is gone
			if (!countDownTilNextWave.running) countDownTilNextWave.start();
		}

		private function updateScoreBoard() : void {
			var tempScore : String = String(playerScore + 10000000).substr(1, 7);
			playerScore_txt.text = tempScore;
		}

		private function windowNotActive(event : Event) : void {
			trace("PAUSE GAME!");
			// gamePaused = new Paused();
			// gamePaused.x = stage.stageHeight / 2;
			// gamePaused.y = stage.stageWidth / 2;
			// stage.addChild(gamePaused);
		}

		private function windowActive(evt : Event) : void {
			// stage.removeChild(gamePaused);
			// gamePaused = null;
		}
	}
}