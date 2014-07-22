var mainState = {
  preload: function() {
    game.load.image('player', 'img/sophia.png')
  },
  create: function() {
    game.stage.backgroundColor = '#009900';
    game.physics.startSystem(Phaser.Physics.ARCADE);
    this.player = game.add.sprite(256,384, 'player');
  },
  update: function() {
  }

}
var game = new Phaser.Game(1024,768, Phaser.AUTO)
game.state.add('main', mainState);
game.state.start('main')
