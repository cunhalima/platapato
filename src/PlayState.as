package {
    import org.flixel.*;

    public class PlayState extends FlxState {
        //[Embed(source="../assets/bg.png")] private var bgBMP:Class;
        //[Embed(source="../assets/bg2.png")] private var bg2BMP:Class;
        //[Embed(source="../assets/rabbit.png")] private var rabbitBMP:Class;
        [Embed(source="../assets/tiles.png")] private var tilemapBMP:Class;
        [Embed(source="../assets/map01.txt", mimeType = "application/octet-stream")] private var map01Data:Class
        //[Embed(source="../assets/pick.mp3")] private var pickSND:Class;
        public var WorldWidth:uint;
        public var WorldHeight:uint;
        public var map:FlxTilemap;
        public var player:Player;
        private var currLevel:uint;
        private var hud:HUD;
        private var fTimer:Number;
        private var iTimer:Number;
        public static const GRAVITY: Number = 200;

        override public function create():void {
            super.create();
            player = new Player(this);
            hud = new HUD(player);
            add(player);
            map = new FlxTilemap();
            add(map);
            changeMap(1, false);
            add(hud);
            fTimer = 0;
        }
        /*
        private function TilemapCallback(Moving:FlxObject,Idle:FlxObject):Boolean {
            if ((Moving is Bullet) && (Idle is FlxTilemap)) {
                return (Idle as FlxTilemap).overlapsWithCallback(Moving);
            }
            return false;
        }
        */

        /*
        private function TilemapHit(Moving:FlxObject,Idle:FlxObject):Boolean {
            if (Moving is PlayerWeapon) {
                Moving.kill();
                explode(Moving.x, Moving.y);
            }
            return true;
        }
        */
        /*
        private function DestroyableHit(Moving:FlxObject,Destroyable:FlxObject):Boolean {
            if (Moving is Bullet) {
                Moving.kill();
                explode(Moving.x, Moving.y);
            }
            if (Destroyable is Enemy) {
                var e:Enemy = Enemy(Destroyable as Enemy);
                e.kill();
                explode(e.x, e.y);
                player.score += e.score;
            }
            return true;
        }
        */

        override public function update():void {
            fTimer += FlxG.elapsed * 16;
            iTimer = int(fTimer)
            super.update();
            if (player.alive) {
                FlxG.collide(player, map);
                /*
                if (FlxG.collide(player, map)) {
                    player.hit();
                }
                if (FlxG.overlap(player, enemies, DestroyableHit)) {
                    player.hit();
                }
                if (FlxG.overlap(enemyshots, player, DestroyableHit)) {
                    player.hit();
                }
                FlxG.overlap(player, items, null, GetItem);
                //FlxG.overlap(weapons, map, TilemapHit, TilemapCallback);
                FlxG.overlap(weapons, map, DestroyableHit, TilemapCallback);
                FlxG.overlap(enemyshots, map, DestroyableHit, TilemapCallback);
                FlxG.overlap(weapons, enemies, null, DestroyableHit);
                //FlxG.overlap(bombs, enemies, null, DestroyableHit);
                */
                /*
                if (player.lives <= 0) {
                    player.kill();
                    GameOverCountdown = 2;
                    return;
                }
                if (player.x + player.width >= map.width) {
                    nextLevel();
                }
                */
            } else {
                /*
                GameOverCountdown = Math.max(0, GameOverCountdown - FlxG.elapsed);
                if (GameOverCountdown == 0) {
                    FlxG.switchState(new GameOverState(player.score));
                }
                */
            }
            /*
            if (FlxG.keys.justPressed("F1")) {
                changeMap(1, false);
            } else if (FlxG.keys.justPressed("F2")) {
                changeMap(2, false);
            } else if (FlxG.keys.justPressed("F3")) {
                changeMap(3, false);
            } else if (FlxG.keys.justPressed("F4")) {
                changeMap(4, false);
            } else if (FlxG.keys.justPressed("F5")) {
                changeMap(5, false);
            } else if (FlxG.keys.justPressed("F6")) {
                changeMap(6, false);
            } else if (FlxG.keys.justPressed("F7")) {
                changeMap(7, false);
            } else if (FlxG.keys.justPressed("F8")) {
                changeMap(8, false);
            } else if (FlxG.keys.justPressed("I")) {
                player.godMode = !player.godMode;
            } else if (FlxG.keys.justPressed("S")) {
                player.spartaMode = !player.spartaMode;
            } else if (FlxG.keys.justPressed("R")) {
                changeMap(currLevel, false);
            }
            */
        }

        private function resetSprites():void {
            /*
            var i:uint;
            var sprite:FlxSprite;
            for (i = 0; i < items.length; i++) {
                sprite = items.members[i];
                sprite.kill();
            }
            for (i = 0; i < enemies.length; i++) {
                sprite = enemies.members[i];
                sprite.kill();
            }
            for (i = 0; i < weapons.length; i++) {
                sprite = weapons.members[i];
                sprite.kill();
            }
            for (i = 0; i < explosions.length; i++) {
                sprite = explosions.members[i];
                sprite.kill();
            }
            for (i = 0; i < enemyshots.length; i++) {
                sprite = enemyshots.members[i];
                sprite.kill();
            }
            */
        }

        private function spawnMap(MapData: Class):void {
            map.loadMap(new MapData, tilemapBMP, 0, 0, FlxTilemap.OFF, 0, 1, 1);
            //map.setTileProperties(70, FlxObject.NONE, null, null, 10);
            var x:uint;
            var y:uint;
            for (y = 0; y < map.heightInTiles; y++) {
                for (x = 0; x < map.widthInTiles; x++) {
                    var tile:uint;
                    /*
                    tile = map.getTile(x, y);
                    if (tile >= 80) {
                        map.setTile(x, y, 0);
                        if (tile >= 90) {
                            spawnEnemy(x, y, tile - 90);
                        } else {
                            spawnItem(x, y, tile - 80);
                        }
                    }
                    */
                }
            }
        }

        private function changeMap(M: uint, keepY: Boolean = true):void {
            M = Math.max(1, M);
            var initialY: int = 0;
            resetSprites();
            var mapData:Class;
            mapData = map01Data;
            switch(M) {
                case 1: mapData = map01Data; initialY = 64; break;
                /*
                case 2: mapData = map02Data; initialY = 80; break;
                case 3: mapData = map03Data; initialY = 26 * 16; break;
                case 4: mapData = map04Data; initialY = 7 * 16; break;
                case 5: mapData = map05Data; initialY = 11 * 16; break;
                case 6: mapData = map06Data; initialY = 12 * 16; break;
                case 7: mapData = map07Data; initialY = 21 * 16; break;
                case 8: mapData = map08Data; initialY = 15 * 16; break;
                */
            }
            spawnMap(mapData);

            // Fix Camera bounds
            FlxG.worldBounds = new FlxRect(0, 0, map.width, map.height);
            FlxG.camera.setBounds(0, 0, map.width, map.height);
            FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
            currLevel = M;

            // set player position
            player.x = 0;
            if (!keepY) {
                player.y = initialY;
            }
            player.velocity.x = 0;
            player.velocity.y = 0;
            WorldWidth = map.width;
            WorldHeight = map.height;

        }

        private function nextLevel():void {
            changeMap(currLevel + 1);
        }
        /*
        public function enemyShoot(Who:Enemy, tx:Number, ty:Number, sp:Number):void {
            var m:EnemyBullet;
            m = EnemyBullet(enemyshots.getFirstDead());
            if (m != null) {
                m.shoot(Who, tx, ty, sp);
                FlxG.play(pickSND);
            }
        }
        */
    }
}
