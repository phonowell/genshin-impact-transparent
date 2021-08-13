class ConfigX

  data: {}
  source: 'config.ini'

  constructor: ->

    # debug
    @data.isDebug = @read 'debug/debug', 0

    # basic
    @data.region = @read 'basic/region', 'en'
    if @data.region == 'en'
      @data.process = 'GenshinImpact.exe'
    else @data.process = 'YuanShen.exe'

  read: (key, defaultValue = '') ->
    [__section__, __key__] = $.split key, '/'
    `IniRead, __result__, % this.source, % __section__, % __key__, % defaultValue`
    return $.toLowerCase __result__

# execute
Config = new ConfigX()