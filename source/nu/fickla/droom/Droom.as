package nu.fickla.droom {
	import nu.fickla.droom.display.Boss;
	import nu.fickla.droom.display.EnemyDroone;
	import nu.fickla.droom.display.Explosion;
	import nu.fickla.droom.display.GUIStatusBar;
	import nu.fickla.droom.display.MiniBoss;
	import nu.fickla.droom.display.PointBurst;
	import nu.fickla.droom.display.Ship;
	import nu.fickla.droom.display.Star;

	import com.senocular.utils.KeyObject;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.ui.Keyboard;
	import flash.utils.Timer;

	// import nl.demonsters.debugger.MonsterDebugger;
	public class Droom extends Sprite {
		// public var debugger:MonsterDebugger = new MonsterDebugger(this);
		// Our hero!
		private var theHero : Ship;
		public static var playerScore : uint = 0;
		private var healthBar : GUIStatusBar;
		private var shieldBar : GUIStatusBar;
		private var key : KeyObject;
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
		private var gameTimer : Timer;
		// Create an instance of the Sound class
		private var soundClip : Sound = new Sound();
		private var sndChannel : SoundChannel = new SoundChannel();
		
		private var starList : Array;

		public function Droom() : void {
			startGame();
		}

		private function startGame() : void {
			// Activates keyboard input
			stage.focus = this;

			soundClip.load(new URLRequest("game_theme.mp3"));

			// Play the sound when loaded
			soundClip.addEventListener(Event.COMPLETE, playSnd, false, 0, true);

			enemyWaveCounter = enemyWaveLength[gameLevel];

			// Background stars
			starList = createStars(100);

			// Create out hero
			theHero = new Ship();
			theHero.speed = 4;
			theHero.addEventListener(Event.ADDED_TO_STAGE, readyOnStage, false, 0, true);
			stage.addChild(theHero);

			playerScore_txt.text = "0000000";

			healthBar = new GUIStatusBar(100);
			stage.addChild(healthBar);

			shieldBar = new GUIStatusBar(0);
			stage.addChild(shieldBar);

			enemyFirstWaveDelay = new Timer(7500, 1);
			enemyFirstWaveDelay.addEventListener(TimerEvent.TIMER, enemySetup, false, 0, true);
			enemyFirstWaveDelay.start();

			countDownTilNextWave = new Timer(3000);
			countDownTilNextWave.addEventListener(TimerEvent.TIMER, nextWave, false, 0, true);
		}

		private function readyOnStage(event : Event) : void {
			key = new KeyObject(stage);

			gameTimer = new Timer(10);
			gameTimer.addEventListener(TimerEvent.TIMER, gameMover, false, 0, true);
			gameTimer.start();
		}

		private function gameMover(event : TimerEvent) : void {
			shipHandler();
			
			moveStars();
			
			if (enemyList)
				moveEnemies();
				
			// checkForCollisions();
			// checkForHits();
				
		}

		private function moveEnemies() : void {
			for each(var enemy : EnemyDroone in enemyList) {
				enemy.move();
			}
			
		}
		
		private function moveStars() :void {
			for each(var star : Star in starList)
				star.move();
		}

		private function shipHandler() : void {
			var xPos : int = theHero.x;
			var yPos : int = theHero.y;
			var speed : uint = theHero.speed;

			if (key.isDown(Keyboard.RIGHT)) {
				xPos > stage.stageWidth - 60 ? xPos = stage.stageWidth - 40 : theHero.x += speed;
			}

			if (key.isDown(Keyboard.LEFT)) {
				xPos < 70 ? xPos = 60 : theHero.x -= speed;
			}

			if (key.isDown(Keyboard.UP)) {
				yPos < 60 ? yPos = 50 : theHero.y = yPos - speed;
			}

			if (key.isDown(Keyboard.DOWN)) {
				yPos > stage.stageHeight - 40 ? yPos = stage.stageHeight - 30 : theHero.y += speed;
			}

			// if (key.isDown(Keyboard.SPACE)) {
			// if (canFire) {
			// fireBullet();
			// canFire = false;
			// fireTimer.start();
			// }
			// }
		}

		private function enemySetup(event : Event) : void {
			addEventListener(Event.ENTER_FRAME, createEnemyShips, false, 0, true);
		}

		private function playSnd(event : Event) : void {
			// sndChannel = soundClip.play(0, int.MAX_VALUE);
		}

		private function createEnemyShips(event : Event) : void {
			if (enemyWaveCounter != 0 ) {
				enemyShipDelay++;

				if (enemyShipDelay > 10) {
					enemyShipDelay = 0;
					enemyWaveCounter--;

					if (enemyWaveCounter == 0) countDownTilNextWave.start();

					var enemyShip : EnemyDroone = new EnemyDroone(theHero, enemyStartPos);
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
				var miniBoss : MiniBoss = new MiniBoss(theHero);
				stage.addChild(miniBoss);
				miniBoss.addEventListener(Event.REMOVED_FROM_STAGE, removeEnemy, false, 0, true);
				enemyList.push(miniBoss);
			} else {
				countForBoss = 0;
				countForMiniBoss = 0;
				var boss : Boss = new Boss(theHero);
				stage.addChild(boss);
				boss.addEventListener(Event.REMOVED_FROM_STAGE, removeEnemy, false, 0, true);
				enemyList.push(boss);
			}

			countDownTilNextWave.stop();
		}

		private function createStars(amount : uint) : Array {
			var stars : Array = new Array();
			
			for (var i : uint = 0; i < amount; i++ ) {
				var star : Star = new Star();
				star.x = Math.random() * stage.stageWidth;
				star.y = 5 + Math.random() * stage.stageHeight - 10;
				addChild(star);
				stars.push(star);
			};
			return stars;
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

		private function checkForCollisions() : void {
			for (var i : int = 0; i < Droom.enemyList.length; i++) {
				if (hitTestObject(Droom.enemyList[i])) {
					theHero.explode();
				}
			}
		}
		
		private function explode() : void {
			var explosion : Explosion = new Explosion(stage, x, y);
			stage.addChild(explosion);
			var pointBurst : PointBurst = new PointBurst(x, y, 50);
			stage.addChild(pointBurst);
		}
		// End class and package
	}
}