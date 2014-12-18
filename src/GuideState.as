package {
    import org.flixel.*;

    public class GuideState extends FlxState {
        public function GuideState() {
            var my_text:FlxText
            // adding and styling the first text, the title itself
            my_text = new FlxText(0, 20, FlxG.width, "PLAYER GUIDE")
            my_text.setFormat(null,16,0xFFFFFFFF,"center")
            add(my_text);
            // adding and styling a text saying the player has to press SPACE to play
            my_text = new FlxText(0, 200, FlxG.width, "Press SPACE to begin")
            my_text.setFormat(null, 8, 0xFFFFFFFF, "center");
            add(my_text);

            add(new FlxText(0, 80, FlxG.width,
            "You have to kill the bad animals and eat your favorite carrot cake.\n" +
            "Press UP to jump.\n" +
            "Press LEFT/RIGHT to run left/right.\n" +
            "Press SPACE to fire lasers.\n"));
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
        }
    }
}

