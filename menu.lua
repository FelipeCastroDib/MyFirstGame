local composer = require( "composer" )

local scene = composer.newScene()


local function gotoGame ()
	composer.gotoScene ("game", {time= 300, effect="crossFade"})
end


local backGroup

local mainGroup

local uiGroup

function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
		--Tela 1:
	
	backGroup = display.newGroup ()
	sceneGroup:insert (backGroup)

	mainGroup = display.newGroup ()
	sceneGroup:insert (mainGroup)

	uiGroup = display.newGroup ()
	sceneGroup:insert (uiGroup)

		local bg = display.newImageRect (backGroup, "imagens/telaPrincipal.jpeg", 1120/3, 1120/3)
		bg.x = display.contentCenterX
		bg.y = display.contentCenterY

		local play = display.newImageRect (backGroup, "imagens/play.png", 360/2, 360/2)
		play.x = display.contentCenterX
		play.y = display.contentCenterY + 115

			play:addEventListener ("tap", gotoGame)
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


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
		
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end

-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene