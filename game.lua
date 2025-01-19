local composer = require( "composer" )
local scene = composer.newScene()

local physics = require ("physics")
physics.start ()
physics.setGravity (0, 0)
physics.setDrawMode ("normal")

-- sprite dos botoes
local spriteOpcoes =
{

  frames= 
  { 
    { -- 1) menu
      x= 0,
      y= 0,
      width= 125,
      height= 100
    },
    { -- 2) botao direita
      x= 0,
      y= 100,
      width= 125,
      height= 100
    },
    {-- 3) on/off
      x= 0,
      y= 200,
      width= 125,
      height= 100
    },
    { -- 4) configurações
      x= 0,
      y= 300,
      width= 125,
      height= 100 
    }, 
    { -- 5) mensagens
      x= 0, 
      y= 400, 
      width= 125,
      height= 100
    },
    { -- 6) pause
      x= 125,
      y= 0,
      width= 125,
      height= 100
    },
    { -- 7) botao esquerda
      x= 125,
      y= 100,
      width= 125,
      height= 100
    },
    {-- 8) return
      x= 125,
      y= 200,
      width= 125,
      height= 100
    },
    { -- 9) volume
      x= 125,
      y= 300,
      width= 125,
      height= 100 
    }, 
    { -- 10) compras
      x= 125, 
      y= 400, 
      width= 125,
      height= 100
      },
    { -- 11) play
      x= 250,
      y= 0,
      width= 125,
      height= 100
    },
    { -- 12) cima
      x= 250,
      y= 100,
      width= 125,
      height= 100
    },
    {-- 13) x/não
      x= 250,
      y= 200,
      width= 125,
      height= 100
    },
    { -- 14) ajuda
      x= 250,
      y= 300,
      width= 125,
      height= 100 
    }, 
    { -- 15) recordes
      x= 250, 
      y= 400, 
      width= 125,
      height= 100
    },
    { -- 16) home
      x= 375,
      y= 0,
      width= 125,
      height= 100
    },
    { -- 17) botao baixo
      x= 375,
      y= 100,
      width= 125,
      height= 100
    },
    {-- 18) yes
      x= 375,
      y= 200,
      width= 125,
      height= 100
    },
    { -- 19) segurança
      x= 375,
      y= 300,
      width= 125,
      height= 100 
    }, 
    { -- 20) música
      x= 375, 
      y= 400, 
      width= 125,
      height= 100
      } 
  }
}

local sprite2 = graphics.newImageSheet  ("imagens/button.png", spriteOpcoes)

-- para funcionar a lixeira corretamente
local lataInv = false
local papelInv = false
local plasticoInv = false
local vidroInv = false
local contador = 0 
local musicaPuzzle = audio.loadStream( "audios/audiopuzzle.mp3")
local somVidro = audio.loadSound ("audios/somVidro.mp3")
local somPlastico = audio.loadSound ("audios/audioPlastico.mp3")
local somPapel = audio.loadSound ("audios/audioPapel.mp3")
local somMetal = audio.loadSound ("audios/somMetal.mp3")

audio.reserveChannels (1)
audio.setVolume (0.1, {channel = 1})

audio.reserveChannels (2)
audio.setVolume (0.5, {channel = 2})


local function gotoMenu ()
	composer.gotoScene ("menu", {time= 500, effect="crossFade"})
end

function scene:create( event )

	local sceneGroup = self.view
	
	backGroup = display.newGroup ()
	sceneGroup:insert (backGroup)

	mainGroup = display.newGroup ()
	sceneGroup:insert (mainGroup)

	lixosGroup = display.newGroup ()
	sceneGroup:insert (lixosGroup)

	uiGroup = display.newGroup ()
	sceneGroup:insert (uiGroup)

audio.play (musicaPuzzle, {channel = 1, loops = -1})

local spriteHeroi = graphics.newImageSheet ("imagens/heroi.png", {width=102, height=152, numFrames=16})
--para saber o tamanho do frame, basta dividir a largura do arquivo pela quantidade de objetos na horizontal da folha
--Tamaho do Frame 256 (dessa sprite em  questão)

local sprite1Animacao = {
  --{nome="", frameInicial=, continuação, tempo=, loopins=}
  {name="parado", start=1, count=1, time=1000, loopCount=0},
  {name="cima", start=5, count=4, time=900, loopCount=0},
  {name="baixo", start=1, count=4, time= 900, loopCount=0},
  {name="esquerda", start=9, count=4, time= 900, loopCount=0},
  {name="direita", start=13, count=4, time= 900, loopCount=0}
}

local player = display.newSprite(uiGroup, spriteHeroi, sprite1Animacao)
player.x = display.contentCenterX 
player.y = display.contentCenterY + 125
physics.addBody (player, "dynamic", {radius = 18})
player.id = "Heroi"
player.xScale=0.3
player.yScale=0.3
player:setSequence ("parado")
player:play ()

	local buttons = {}

buttons [1] = display.newImageRect (uiGroup, sprite2, 2, 75, 60)
buttons [1].x = -55
buttons [1].y = 275
buttons [1].alpha = 0.7
buttons [1].xScale = 0.4
buttons [1].yScale = 0.4
buttons [1].myName = "left"

buttons[2] = display.newImageRect (uiGroup, sprite2, 7,75,60)
buttons[2].x = -19 
buttons[2].y = 275
buttons[2].alpha = 0.7
buttons[2].xScale = 0.4
buttons[2].yScale = 0.4
buttons[2].myName = "right"

buttons[3] = display.newImageRect (uiGroup, sprite2, 12,75, 60)
buttons[3].x = -34
buttons[3].y = 258
buttons[3].alpha = 0.7
buttons[3].xScale = 0.4
buttons[3].yScale = 0.4
buttons[3].myName = "up"

buttons[4] = display.newImageRect (uiGroup, sprite2, 17,75, 60)
buttons[4].x = -33
buttons[4].y = 292
buttons[4].alpha = 0.7
buttons[4].xScale = 0.4
buttons[4].yScale = 0.4
buttons[4].myName = "down"

local passosX = 0
local passosY = 0

local touchFunction = function (e)
	if e.phase == "began" or e.phase == "moved" then 
		if e.target.myName == "left" then
			passosX = -3
			passosY = 0
			player:setSequence("esquerda")
     		player:play ()
      		player.xScale = 0.3
      		player.yScale = 0.3

		elseif e.target.myName == "right" then
			passosX = 3
			passosY = 0
			player:setSequence("direita")
    		player:play()
     		player.xScale = 0.3
     		player.yScale = 0.3

		elseif e.target.myName == "up" then
			passosY = -3
			passosX = 0
			player:setSequence("cima")
    		player:play()
      		player.xScale = 0.3
      		player.yScale = 0.3
		elseif e.target.myName == "down" then
			passosY = 3
			passosX = 0
			player:setSequence("baixo")
    		player:play()
      		player.xScale = 0.3
      		player.yScale = 0.3
		end
	else
		passosY = 0
		passosX = 0
		player:setSequence("parado")
      	player:play()
     	player.xScale = 0.3
      	player.yScale = 0.3
	end
end

local j = 1

for j= 1, #buttons do
	buttons[j]:addEventListener( "touch", touchFunction )
end

local update = function ()
	player.x = player.x + passosX
	player.y = player.y + passosY
end

Runtime:addEventListener( "enterFrame", update )


local bgPuzzle = display.newImageRect (backGroup, "imagens/bgPuzzle.png", 640*0.75, 561*0.65)
bgPuzzle.x = display.contentCenterX - 10
bgPuzzle.y = display.contentCenterY
bgPuzzle.xScale = 0.9
bgPuzzle.yScale = 0.8

local botaoVoltar = display.newImageRect (mainGroup, "imagens/voltar.png", 121/3, 91/3)
botaoVoltar.x = -5
botaoVoltar.y = 35
local function aoTocarBotao()
	Runtime:removeEventListener("enterFrame", update) 
    -- Chamar a função para voltar ao menu ou realizar outras ações
    gotoMenu() 
end

botaoVoltar:addEventListener("tap", aoTocarBotao)

local mochila = display.newImageRect(mainGroup, "imagens/mochila.png", 416/14, 416/14)
mochila.x = 500
mochila.y = 40	

local lixos = {}
local l = 1

lixos[1] = display.newImageRect (lixosGroup,"imagens/garrafaVidro.png", 280/15, 617/47) 
lixos[1].x = 25
lixos[1].y = 45
lixos[1].id = "Vidro"

lixos[2] = display.newImageRect (lixosGroup, "imagens/garrafaPlastico.png", 500/10, 500/10)
lixos[2].x = display.contentCenterX
lixos[2].y = display.contentCenterY + 70
lixos[2].id = "Plastico"

lixos[3] = display.newImageRect (lixosGroup, "imagens/papel.png", 390/15, 370/15)
lixos[3].x = 390
lixos[3].y = 25
lixos[3].id = "Papel"

lixos[4] = display.newImageRect (lixosGroup, "imagens/lata.png", 483/30, 515/30)
lixos[4].x = 120
lixos[4].y = 70
lixos[4].id = "Lata"

for l = 1, #lixos do
	physics.addBody (lixos[l],"dynamic", {radius = 5, isSensor = true})
	transition.to (lixos[l], {iterations= -1, time=100000, rotation= -1000})
end


local lixeiras = {}
local lx = 1 

lixeiras [1] = display.newImageRect (lixosGroup, "imagens/lixoPlastico.png", 178/7, 205/7)
lixeiras [1].x = 299
lixeiras [1].y = 227
lixeiras [1].id = "lixeiraPlastico"

lixeiras [2] = display.newImageRect (lixosGroup, "imagens/lixoVidro.png", 186/7, 211/7)
lixeiras [2].x = 282
lixeiras [2].y = 228
lixeiras [2].id = "lixeiraVidro"

lixeiras [3] = display.newImageRect (lixosGroup, "imagens/lixoMetal.png", 224/7,227/7)
lixeiras [3].x = 80
lixeiras [3].y = 190
lixeiras [3].id = "lixeiraMetal"

lixeiras [4] = display.newImageRect (lixosGroup, "imagens/lixoPapel.png", 176/7, 207/7)
lixeiras [4].x = 315
lixeiras [4].y = 228
lixeiras [4].id = "lixeiraPapel"

for lx = 1, #lixeiras do 
	physics.addBody (lixeiras[lx], "static", {radius = 5})
end

		local barreiraMercado = display.newRect(uiGroup, display.contentCenterX - 20, display.contentCenterY - 10, 180, 130)
		transition.to (barreiraMercado, {alpha = 0, time =1})
		physics.addBody (barreiraMercado, "static")

		local cao = display.newRect(uiGroup, display.contentCenterX - 50, display.contentCenterY + 60, 45, 20)
		transition.to (cao, {alpha = 0})
		physics.addBody (cao, "static")

		local carro = display.newRect(uiGroup, 420, 260, 50, 30)
		transition.to (carro, {alpha = 0, time =1})
		physics.addBody (carro, "static")

		local gol = display.newRect(uiGroup, 360, 35, 10, 40)
		transition.to (gol, {alpha = 0, time =1})
		physics.addBody (gol, "static")

		local meninoOculos = display.newRect(uiGroup, 400, 120, 20, 30)
		transition.to (meninoOculos, {alpha = 0, time =1})
		physics.addBody (meninoOculos, "static")

		local meninoMoicano = display.newRect(uiGroup, 105, 225, 30, 40)
		transition.to (meninoMoicano, {alpha = 0, time =1})
		physics.addBody (meninoMoicano, "static")

		local maquina = display.newRect(uiGroup, 110, 175, 40, 40)
		transition.to (maquina, {alpha = 0, time =1})
		physics.addBody (maquina, "static")

		local grade = display.newRect(uiGroup, 90, 40, 20, 100)
		transition.to (grade, {alpha = 0, time =1})
		physics.addBody (grade, "static")

		local grade1 = display.newRect(uiGroup, 110, 90, 50, 10)
		transition.to (grade1, {alpha = 0, time =1})
		physics.addBody (grade1, "static")

local cima = display.newRect (uiGroup,display.contentCenterX, - 14, 500, 50)
physics.addBody (cima, "static")
cima.id = "Teto"
transition.to (cima, {alpha = 0, time =1})

local baixo = display.newRect (uiGroup,display.contentCenterX, 320, 500, 50)
physics.addBody (baixo, "static")
baixo.id = "Chão"
transition.to (baixo, {alpha = 0, time =1})

local esquerda = display.newRect (uiGroup,-15, display.contentCenterY, 50, 500)
physics.addBody (esquerda, "static")
esquerda.id = "ParedeEsquerda"
transition.to (esquerda, {alpha = 0, time =1})

local direita = display.newRect (uiGroup,480, display.contentCenterY, 50, 500)
physics.addBody (direita, "static")
direita.id = "ParedeDireita"
transition.to (direita, {alpha = 0, time =1})

local function onCollision (self, event)
	if (event.phase == "began") then 
		if event.other.id == "Vidro" then
			transition.pause( lixos[1] )
			transition.to (lixos[1], {x= 500, y= 80,rotation = 270,time = 1, alpha = 1})
			print ("colidiu")
			audio.play (somVidro, {channel = 2})
			vidroInv = true

			elseif event.other.id == "lixeiraVidro" then
				if (vidroInv == true) then 
				display.remove( lixos[1] )
				vidroInv = false
				contador = contador + 1
				print (contador)
				audio.play (somVidro, {channel = 2})
				end

		elseif event.other.id == "Plastico" then
			transition.pause( lixos[2] )		
		   	transition.to (lixos[2], {x= 500, y= 110,rotation = 90, time = 1})
		   	print ("colidiu")
		   	audio.play (somPlastico, {channel = 2})
		   	plasticoInv = true 

			elseif event.other.id == "lixeiraPlastico" then
				if (plasticoInv == true) then 
				display.remove (lixos[2])
				plasticoInv = false
				contador = contador + 1
				print (contador)
				audio.play (somPlastico, {channel = 2})
				end

		elseif event.other.id == "Papel" then
			transition.pause( lixos[3] )
			transition.to (lixos[3], {x= 500, y= 140,rotation = 270,time = 1})
			print ("colidiu")
			papelInv = true 
			audio.play (somPapel, {channel = 2})

			elseif event.other.id == "lixeiraPapel" then
				if (papelInv == true) then 
				display.remove (lixos[3])
				papelInv = false
				contador = contador + 1
				print (contador)
				audio.play (somPapel, {channel = 2})
				end

		elseif event.other.id == "Lata" then
			transition.pause( lixos[4] )
			transition.to (lixos[4], {x= 500, y= 170, rotation=30,time = 1})
			print ("colidiu")
			lataInv = true 
			audio.play (somMetal, {channel = 2})

			elseif event.other.id == "lixeiraMetal" then
				if (lataInv == true) then 
				display.remove (lixos[4])
				lataInv = false
				contador = contador + 1
				print (contador)
				audio.play (somMetal, {channel = 2})
				end
			
			if (contador == 4) then 
				Runtime:removeEventListener ( "enterFrame", update )
				local botao1 = display.newImageRect (uiGroup, sprite2, 15, 75, 60)
				botao1.x = display.contentCenterX
				botao1.y = display.contentCenterY
				botao1:addEventListener( "tap", gotoMenu)
			end
		end	
	end 
end
	physics.start ()
	player.collision = onCollision
	player:addEventListener ("collision")



end
-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
	end
end

function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
		Runtime:removeEventListener( "enterFrame", update )
		audio.stop (1)
		physics.pause( )
		composer.removeScene ("game")
		
	end
end

-- destroy()
function scene:destroy( event )
Runtime:removeEventListener( "enterFrame", update )
	local sceneGroup = self.view



end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
