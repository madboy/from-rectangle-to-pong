-- We are introducing variables for the positions of the rectangles
-- so that we can change it when the player presses keys
-- ref: 
-- https://www.lua.org/pil/1.2.html
-- https://love2d.org/wiki/love.graphics
leftx = 0
lefty = 0

rightx = love.graphics.getWidth() - 20
righty = 0

movement = 10

-- ref:
-- https://love2d.org/wiki/love.draw
-- https://love2d.org/wiki/love.graphics
function love.draw()
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
    
    -- right side paddle
    if key == "down" then
        righty = righty + movement
    end
end
