package {
    import org.flixel.*;

    public class EnemyBullet extends Bullet {
        //public static const speed: Number = 120;

        public function EnemyBullet() {
            super();
            makeGraphic(4, 4, 0xffffffff);
        }

        public function shoot(shooter: Enemy, tx:Number, ty:Number, sp:Number):void {
            startShooting();
            x = shooter.x + 16;
            y = shooter.y + 8;
            ///*
            var dx:Number;
            var dy:Number;
            var dist:Number;
            dx = tx - x;
            dy = ty - y;
            dist = Math.sqrt(dx * dx + dy * dy);
            if (dist < 1) {
                dx = -1;
                dy = 0;
            } else {
                dx /= dist;
                dy /= dist;
            }
            velocity.x = sp * dx;
            velocity.y = sp * dy;
            //*/
            //x = shooter.x;
            //y = shooter.y;
            //velocity.x = 0;
            //velocity.y = 0;
        }
    }
}

