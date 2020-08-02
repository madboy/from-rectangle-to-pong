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
    -- see love.load for how we got the background image
    love.graphics.draw(background, 0, 0)
    love.graphics.rectangle("fill", leftx, lefty, 20, 60)
    love.graphics.rectangle("fill", rightx, righty, 20, 60)
end

-- ref: 
-- https://love2d.org/wiki/love.keypressed
-- https://www.lua.org/pil/4.3.1.html
function love.keypressed(key, scancode, isrepeat)
    -- left side paddle
    if key == "s" then
        lefty = lefty - movement
    end
    if key == "x" then
        lefty = lefty + movement
    end
    
    -- right side paddle
    if key == "up" then
        righty = righty - movement
    end
    if key == "down" then
        righty = righty + movement
    end
end


