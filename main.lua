local composer = require ("composer")
audio.reserveChannels (3)

audio.setVolume (0.1, {channel = 3})

system.setIdleTimer ( false ) -- impede da tela apagar
display.setStatusBar( display.HiddenStatusBar )
system.activate( "multitouch" )

composer.gotoScene ("menu")

 -- local musicaFundo = audio.loadStream ("audios/fundoMenu.mp3")
-- 	audio.play (musicaFundo, {channel=3, loops=-1})