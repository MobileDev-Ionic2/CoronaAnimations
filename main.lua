-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local sheetOptions =
{
    width = 512,
    height = 256,
    numFrames = 8
}
local sheet_runningCat = graphics.newImageSheet( "sprites-cat-running.png", sheetOptions )

-- sequences table
local sequences_runningCat = {
    -- first sequence (consecutive frames)
    {
        name = "normalRun",
        start = 1,
        count = 8,
        time = 800,
        loopCount = 0
    },
    -- next sequence (non-consecutive frames)
    {
        name = "fastRun",
        frames = { 1,3,5,7 },
        time = 400,
        loopCount = 0
    },
}

local runningCat = display.newSprite( sheet_runningCat, sequences_runningCat )
local ground = display.newImageRect( "ground.png", 1200, 870 )
ground.y=900
local function catJump()
	runningCat:applyLinearImpulse( 0, -0.75, runningCat.x, runningCat.y )
	--tapCount = tapCount + 1
	--tapText.text = tapCount
end

local physics = require( "physics" )
physics.start()
physics.addBody( runningCat, "dynamic", { radius=50, bounce=0 } )
physics.addBody( ground, "static" )

runningCat:scale(0.5, 0.5)
runningCat:play()

runningCat:addEventListener( "tap", catJump )