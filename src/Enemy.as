package {
    import org.flixel.*;

    public class Enemy extends FlxSprite {
        //[Embed(source="../assets/ship_1.png")] private var bmp:Class;
        //[Embed(source="../assets/shot.mp3")] private var MySound:Class;
        [Embed(source="../assets/inimigos.png")] private var bmp:Class;

        private var etype:uint;
        public var score:uint;
        private var ps:PlayState;
        private var shootTime:Number;
        private var nextShoot:Number;
        private var needground:Boolean;
        private var shooter:Boolean;
        private var shotSpeed:Number;

        public function mandist(target: FlxObject):Number {
            return Math.abs(x - target.x) + Math.abs(y - target.y);
        }

        public function Enemy() {
            super();
            if (FlxG.state is PlayState) {
                ps = PlayState(FlxG.state);
            }
            loadGraphic(bmp, true, true, 32, 32, true);
            addAnimation("0", [69, 70, 71], 10, true);
            addAnimation("1", [66, 67, 68], 10, true);
            addAnimation("2", [81, 82, 83], 10, true);
            addAnimation("3", [81, 82, 83], 10, true);
            kill();
            shootTime = 0;
            nextShoot = 10;
            setType(0);
			
			width = 32;
			offset.y = 14;
        }

        private function calcTargetPos(target:FlxSprite):FlxPoint {
            // Copiado de http://gamedev.stackexchange.com/questions/25277/how-to-calculate-shot-angle-and-velocity-to-hit-a-moving-target
            var totargX:Number;
            var totargY:Number;
            totargX = target.x - x;
            totargY = target.y - y;
            var a: Number;
            var b: Number;
            var c: Number;
            a = target.velocity.x * target.velocity.x + target.velocity.y * target.velocity.y - shotSpeed * shotSpeed;
            b = 2 * target.velocity.x * totargX + target.velocity.y * totargY;
            c = totargX * totargX + totargY * totargY;
            var p:Number = -b / (2 * a);
            var q:Number = Math.sqrt((b * b) - 4 * a * c) / (2 * a);
            var t1:Number = p - q;
            var t2:Number = p + q;
            var t:Number;
            if (t1 > t2 && t2 > 0) {
                t = t2;
            } else {
                t = t1;
            }
            var spot:FlxPoint;
            spot = new FlxPoint();
            spot.x = target.x + target.velocity.x * t
            spot.y = target.y + target.velocity.y * t
			
            return spot;
        }

        private function deadEnd():Boolean {
            var frontx:int;
            var ty:int;
            var frontTile:uint;
            var floorTile:uint;
            if (velocity.x != 0 || velocity.y != 0) {
                var hdir:int = 0;
                var vdir:int = 0;
                if (velocity.x > 0) {
                    hdir = 1;
                } else if (velocity.x < 0) {
                    hdir = -1;
                }
                if (velocity.y > 0) {
                    vdir = 1;
                } else if (velocity.y < 0) {
                    vdir = -1;
                }
                if (hdir != 0) {
                    frontx = (x + 16 + 16 * hdir) / 16;
                    ty = y / 16;
                    frontTile = ps.map.getTile(frontx, ty);
                    if (frontTile != 0) {
                        return true;
                    }
                    if (needground) {
                        floorTile = ps.map.getTile(frontx, ty + 1);
                        if (floorTile == 0) {
                            return true;
                        }
                    }
                }
            }
            return false;
        }

        override public function update():void {
            if (deadEnd()) {
                velocity.x *= -1;
                velocity.y *= -1;
				if (velocity.x > 0) {
					facing = LEFT;
				}else {
					facing = RIGHT;
				}
            }
            if (shooter) {
                shootTime = Math.max(0, shootTime - FlxG.elapsed);
                if (shootTime == 0) {
                    shootTime = nextShoot;
                    if (mandist(ps.player) < 200) {
                        //var pos:FlxPoint = calcTargetPos(ps.player);
                        ps.enemyShoot(this, ps.player.x + ps.player.width / 2, ps.player.y + ps.player.height / 2, shotSpeed);
                        //ps.enemyShoot(this, pos.x, pos.y, shotSpeed);
                    }
                }
            }
            super.update();
        }

        public function setType(T:uint):void {
            shotSpeed = 120;
            needground = false;
            shooter = false;
            etype = T;
            play("" + T, true);
            switch(T) {
                case 0:
                    score = 100;
                    velocity.x = -10;
                    velocity.y = 0;
                    shooter = true;
                    nextShoot = 2;
                    shotSpeed = 90;
                    needground = true;
                    break;
                case 1:
                    score = 100;
                    velocity.x = -10;
                    velocity.y = 0;
                    shooter = true;
                    nextShoot = 1.5;
                    shotSpeed = 90;
                    needground = true;
                    break;
                case 2:
                    score = 100;
                    velocity.x = -20;
                    velocity.y = 0;
                    shooter = true;
                    nextShoot = 1.5;
                    shotSpeed = 140;
                    needground = true;
                    break;
                case 3:
                    score = 200;
                    velocity.x = -8;
                    velocity.y = 0;
                    shooter = true;
                    shotSpeed = 100;
                    nextShoot = 1;
                    break;
            }
        }
    }
}



