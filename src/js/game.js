var mainState = {
  preload: function() {
    game.load.image('player', 'img/sophia.png');
    game.load.image('test16', 'levels/test16.png');
    game.load.tilemap('map', 'levels/test1.json', null, Phaser.Tilemap.TILED_JSON)
  },
  create: function() {

    game.physics.startSystem(Phaser.Physics.ARCADE);
    map = this.add.tilemap('map');
    map.addTilesetImage('test16');
    map.createLayer('Background');
    layer = map.createLayer('Collision');
    map.createLayer('50% Opacity');
    player = game.add.sprite(304,384, 'player');
    map.createLayer('Foreground');

    map.setCollisionBetween(1,99, true, layer);
    layer.resizeWorld();

    cursors = game.input.keyboard.createCursorKeys();

    game.physics.enable(player);
    game.camera.follow(player);
    player.body.gravity.y = 250;

  },
  update: function() {
    game.physics.arcade.collide(player, layer);

    player.body.velocity.x = 0;

    if (cursors.left.isDown) {
      player.body.velocity.x = -64;
    } else if (cursors.right.isDown) {
      player.body.velocity.x = 64;
    } else if (cursors.up.isDown) {
      player.body.velocity.y = -64;

    }

  }

}

var player = null;
var game = new Phaser.Game(640,384, Phaser.AUTO)
game.state.add('main', mainState);
game.state.start('main')
