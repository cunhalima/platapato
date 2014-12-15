package {
    import org.flixel.*;

    public class HUD extends FlxGroup {
        private var lives:int;
        private var score:int;

        private var livesSprite:FlxText;
        private var scoreSprite:FlxText;

        private var player:Player;
        
        public function addStatic(TargetObject:FlxText):FlxText {
            TargetObject.shadow = 0xff000000;
            TargetObject.scrollFactor.x = 0;
            TargetObject.scrollFactor.y = 0;
            add(TargetObject);
            return TargetObject;
        }

        public function HUD(P: Player) {
            super();
            player = P;
            scoreSprite = new FlxText(6, FlxG.height - 16, 100, "");
            livesSprite = new FlxText(250, FlxG.height - 16, 100, "");
            addStatic(livesSprite);
            addStatic(scoreSprite);

            lives = -1;
            score = -1;
        }

        override public function draw(): void {
            if (lives != player.lives) {
                lives = player.lives;
                livesSprite.text = "Lives: " + lives;
            }
            if (score != player.score) {
                score = player.score;
                scoreSprite.text = "Score: " + score;
            }
            super.draw();
        }
    }
}


