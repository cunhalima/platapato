package {
    import org.flixel.*;

    public class Player extends FlxSprite {
        //[Embed(source="../assets/ship_1.png")] private var bmp:Class;
        [Embed(source="../assets/shot.mp3")] private var MySound:Class;
        [Embed(source="../assets/rabbit.png")] private var bmp:Class;
        public var weapons:FlxGroup;
        private var ps:PlayState;
        public var lives:int;
        public var score:int;
        public var speed:Number;
        public var godMode:Boolean;
        private var missiledelay: Number;
        private var missiles:FlxGroup;
        public var numMissiles:int;
        public var spartaMode:Boolean;
        private var invdelay:Number;

        public function restart():void {
            lives = 4;
            score = 0;
            speed = 80;
            numMissiles = 1000;
            missiledelay = 0;
            invdelay = 0;
        }

        public function Player(PS: PlayState) {
            var i: uint;
            ps = PS;
            super();
            loadGraphic(bmp, true, true, 32, 32, true);
            addAnimation("walk", [0, 1, 2], 8, true);
            addAnimation("idle", [1], 1, true);
            addAnimation("fall", [0], 1, true);
            play("idle");
            velocity.x = 0;
            velocity.y = 0;
            acceleration.y = 440;
            width = 22;
            height = 21;
            offset.x = 5;
            offset.y = 11;


            //FlxG.log('oi');

            weapons = new FlxGroup(32);

            missiles = new FlxGroup(16);
            for (i = 0; i < 16; i++) {
                weapons.add(missiles.add(new Missile()));
            }

            restart();
        }

        private function shoot():void {
            if (!spartaMode) {
                if (numMissiles <= 0) {
                    return;
                }
                numMissiles--;
            }
            missiledelay = 0.3;
            var m:Missile;
            m = Missile(missiles.getFirstDead());
            if (m != null) {
                FlxG.play(MySound);
                m.shoot(this, this.facing);
            }
        }

        override public function update():void {    
            missiledelay = Math.max(0, missiledelay - FlxG.elapsed);
            invdelay = Math.max(0, invdelay - FlxG.elapsed);
            var walking:Boolean = false;
            var falling:Boolean = false;
            if (FlxG.keys.LEFT) {
                walking = true;
                facing = LEFT;
                velocity.x = -speed;
            } else if (FlxG.keys.RIGHT) {
                walking = true;
                facing = RIGHT;
                velocity.x = speed;
            } else {
                velocity.x = 0;
            }
            if (!isTouching(FlxObject.FLOOR)) {
                falling = true;
            }
            if (FlxG.keys.UP && isTouching(FlxObject.FLOOR)) {
                velocity.y = -210;
                falling = true;
            }
            if (falling) {
                play("fall");
            } else {
                if (walking) {
                    play("walk");
                } else {
                    play("idle");
                }
            }
            if (FlxG.keys.SPACE) {
                if (missiledelay == 0) {
                    shoot();
                }
            }
            super.update();
        }

        public function hit():void {
            if (invdelay == 0) {
                invdelay = 0.75;
                flicker(invdelay);
                //ps.explode(x + 10, y);
                //if (!godMode) {
                lives--;
                //}
            }
        }
    }
}
