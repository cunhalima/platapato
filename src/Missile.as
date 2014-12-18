package {
    import org.flixel.*;

    public class Missile extends PlayerBullet {
        private var speed: Number;

        public function Missile() {
            super();
            makeGraphic(8, 2, 0xffffffff);
            speed = 300;
        }

        public function shoot(shooter: FlxSprite, dir:uint):void {
            startShooting();
            x = shooter.x + 16;
            y = shooter.y + 8;
            velocity.x = speed;
            if (dir == LEFT) {
                velocity.x *= -1;
            }
            velocity.y = 0;
        }
    }
}



