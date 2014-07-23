exports = this

class Game
  constructor: (game) ->
    @game = game
    @player = null
    @layer = null
    @cursors = null

  preload: ->
    @game.load.image('player', 'img/sophia.png')
    @game.load.image('test16', 'levels/test16.png')
    @game.load.tilemap('map', 'levels/test1.json', null, Phaser.Tilemap.TILED_JSON)

  create: ->
    @game.physics.startSystem(Phaser.Physics.ARCADE);
    map = this.add.tilemap('map')
    map.addTilesetImage('test16')
    map.createLayer('Background')
    @layer = map.createLayer('Collision')
    map.createLayer('50% Opacity')
    @player = game.add.sprite(304,384, 'player')
    map.createLayer('Foreground')

    map.setCollisionBetween(1,99, true, @layer)
    @layer.resizeWorld()

    @cursors = game.input.keyboard.createCursorKeys()

    @game.physics.enable(@player)
    @game.camera.follow(@player)
    @player.body.gravity.y = 250

  update: ->
    @game.physics.arcade.collide(@player, @layer)

    @player.body.velocity.x = 0

    if (@cursors.left.isDown)
      @player.body.velocity.x = -128
    else if (@cursors.right.isDown)
      @player.body.velocity.x = 128

    if (@cursors.up.isDown)
      @player.body.velocity.y = -128

exports.Game = Game