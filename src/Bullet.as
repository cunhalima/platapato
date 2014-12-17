package {
    import org.flixel.*;

    public class Bullet extends FlxSprite {
        private var WorldWidth:uint;
        private var WorldHeight:uint;

        public function Bullet() {
            kill();
        }

        public function startShooting():void {
            if (FlxG.state is PlayState) {
                var s:PlayState = PlayState(FlxG.state);
                WorldWidth = s.WorldWidth;
                WorldHeight = s.WorldHeight;
            }
            revive();
        }

        override public function update():void {
            super.update();
            if (x < 0 || y < 0 || x >= WorldWidth || y >= WorldHeight) {
                kill();
            }
        }
    }
}


