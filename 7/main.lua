-- ref: 
-- https://www.lua.org/pil/1.2.html
-- https://love2d.org/wiki/love.graphics
leftx = 0
lefty = 0

rightx = love.graphics.getWidth() - 20
righty = 0

movement = 10

-- ref:
-- https://love2d.org/wiki/love.load
-- https://love2d.org/wiki/love.graphics
function love.load()
    background = love.graphics.newImage("background.png")
end

-- ref:
-- https://love2d.org/wiki/love.draw
-- https://love2d.org/wiki/love.graphics
function love.draw()
    love.graphics.draw(background, 0, 0)
    love.graphics.rectangle("fill", leftx, lefty, 20, 60)
    love.graphics.rectangle("fill", rightx, righty, 20, 60)
end

-- You might have noticed that we are able to move outside of the window
-- Let's change it so that the paddle movement is limited
-- ref: 
-- https://love2d.org/wiki/love.keyboard
-- https://love2d.org/wiki/love.update
-- https://www.lua.org/pil/4.3.1.html
-- https://www.lua.org/pil/3.3.html
function love.update(dt)
    -- left side paddle
   if love.keyboard.isDown("s") and lefty > 0 then
        lefty = lefty - movement
    end
    if love.keyboard.isDown("x") and (lefty + 60) < love.graphics.getHeight() then
        lefty = lefty + movement
    end
    
    -- right side paddle
    if love.keyboard.isDown("up") then
        righty = righty - movement
    end
    if love.keyboard.isDown("down") then
        righty = righty + movement
    end
end
