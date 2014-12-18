package {
    import org.flixel.*;

    public class TitleState extends FlxState {
        // embedding a png file given a relative path
        [Embed(source="../assets/title.png")] private var splash_image:Class;
        public function TitleState() {
            // declaring the sprite variable that will hold the splash image
            var splash:FlxSprite = new FlxSprite(0,0,splash_image);
            // this variable will hold all texts
            var my_text:FlxText
            // adding the splash image on state
            add(splash);
            // adding and styling the first text, the title itself
            my_text = new FlxText(0, 40, FlxG.width, "EVIL RABBIT AND THE CARROT CAKE")
            my_text.setFormat(null, 16, 0xFF0000FF, "center")
            add(my_text);
            // adding and styling a text saying the player has to press SPACE to play
            my_text = new FlxText(0, 200, FlxG.width, "Press SPACE to begin")
            my_text.setFormat(null, 8, 0xFF000000, "center");
            add(my_text);
            my_text = new FlxText(0, 220, FlxG.width, "Press G to read the Player Guide")
            my_text.setFormat(null, 8, 0xFFFFFF00, "center");
            add(my_text);
            my_text = new FlxText(0, 10, FlxG.width, "Developed by Alex, Doglas and Gustavo - all rights reserved")
            my_text.setFormat(null, 8, 0xFFFFFF00, "center");
            add(my_text);
        }

        override public function update():void {
            // checking if the player pressed SPACE...
            if (FlxG.keys.pressed("SPACE")) {
                //FlxG.fade.start(0xff000000, 1, on_fade_completed);
                FlxG.fade(0xff000000, 1, on_fade_completed);
                // ... if true then fade the screen to black and execute on_fade_completed function once the fade is completed
            } else if (FlxG.keys.pressed("G")) {
                FlxG.switchState(new GuideState());
                return;
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

