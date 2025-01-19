
local composer = require( "composer" )

local scene = composer.newScene()


-- local function gotoGame ()
-- 	composer.gotoScene ("game", {time = 500, effect="crossFade"})
-- end

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen


		backGroup = display.newGroup ()
	sceneGroup:insert (backGroup)

	mainGroup = display.newGroup ()
	sceneGroup:insert (mainGroup)

	uiGroup = display.newGroup ()
	sceneGroup:insert (uiGroup)


		local bg = display.newImageRect (backGroup, "imagens/voceGanhou12.png", 1280/2, 720/2)
		bg.x = display.contentCenterX
		bg.y = display.contentCenterY

		local botaoVoltar = display.newImageRect (mainGroup, "imagens/voltar.png", 121/3, 91/3)
		botaoVoltar.x = 35
		botaoVoltar.y = 0

		

end
-- botaoVoltar:addEventListener ("tap", gotoMenu)

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
		composer.removeScene ("faseConcluida12")
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
-- -----------------------------------------------------------------------------------

return scene
