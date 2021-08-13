class MainX

  opacity: 100

  constructor: ->
    $.on 'f9', @minus
    $.on 'f10', @add

  add: ->
    opacity = @opacity + 10
    if opacity > 100 then opacity = 100
    @opacity = opacity
    @render()

  minus: ->
    opacity = @opacity - 10
    if opacity < 0 then opacity = 0
    @opacity = opacity
    @render()

  render: ->
    opacity = 255 * (@opacity / 100)
    name = "ahk_exe #{Config.data.process}"
    `WinSet, Transparent, % opacity, % name`

# export
main = new MainX()