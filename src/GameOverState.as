package {
    import org.flixel.*;

    public class GameOverState extends FlxState {
        public function GameOverState(score: uint, win: Boolean=false) {
            // this variable will hold all texts
            var my_text:FlxText
            // adding the splash image on state
            // adding and styling the first text, the title itself
            if (win) {
                my_text = new FlxText(0, 20, FlxG.width, "CONGRATULATIONS");
            } else {
                my_text = new FlxText(0, 20, FlxG.width, "GAME OVER");
            }
            my_text.setFormat(null,16,0xFFFFFFFF,"center");
            add(my_text);

            my_text = new FlxText(0, 120, FlxG.width, "SCORE: " + score);
            my_text.setFormat(null,8,0xFFFFFFFF,"center");
            add(my_text);

            my_text = new FlxText(0, 200, FlxG.width, "Press SPACE to play again");
            my_text.setFormat(null,8,0xFFFFFFFF,"center")
            add(my_text);
        }

        override public function update():void {
            // checking if the player pressed SPACE...
            if (FlxG.keys.pressed("SPACE"))
            {
                //FlxG.fade.start(0xff000000, 1, on_fade_completed);
                FlxG.fade(0xff000000, 1, on_fade_completed);
                // ... if true then fade the screen to black and execute on_fade_completed function once the fade is completed
            }
            super.update();
        }

        public function on_fade_completed():void {
            // playing the game itself
            FlxG.switchState(new PlayState());
            //FlxG.state = new PlayState();
        }
    }
}

