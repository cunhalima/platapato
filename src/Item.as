package {
    import org.flixel.*;

    public class Item extends FlxSprite {
        [Embed(source="../assets/comidas4.png")] private var bmp:Class;
        public var itype:uint;
        public var score:uint;
        public var lives:uint;
        public var missiles:uint;
        public var bombs:uint;

        public function Item() {
            super();
            loadGraphic(bmp, true, true, 12, 11, true);
            //addAnimation("0", [0, 1, 2], 10, true);
			addAnimation("0", [3], 1, true);
            //addAnimation("1", [3, 4, 5, 4, 3], 5, true);
			addAnimation("1", [1], 1, true);
            addAnimation("2", [6], 1, true);
            addAnimation("3", [8], 1, true);
            addAnimation("4", [9], 1, true);
            kill();
            setType(0);
        }

        public function setType(T:uint):void {
            score = 0;
            lives = 0;
            missiles = 0;
            bombs = 0;
            offset.x = offset.y = 0;
            width = height = 16;
            play("" + T, true);
            itype = T;
            switch(T) {
                case 0:
                    score = 100;
                    offset.x += 5;
                    offset.y += 4;
                    width -= 10;
                    height -= 8;
                    break;
                case 1:
                    score = 0;
                    //offset.x += 2;
                    //offset.y += 4;
                    //width -= 3;
                    //height -= 4;
                    break;
                case 2:
                    missiles = 10;
                    break;
                case 3:
                    bombs = 3;
                    break;
                case 4:
                    lives = 1;
                    break;
            }
            x += offset.x;
            y += offset.y;
        }
    }
}


