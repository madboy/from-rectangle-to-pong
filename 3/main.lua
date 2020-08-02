-- We are introducing variables for the position of the rectangle
-- so that we can change it when the player presses keys
-- ref: https://www.lua.org/pil/1.2.html
x = 0
y = 0

-- this controls how much we want to move the rectangle when a key is pressed
-- start value is 10 so that the movement is noticeable
movement = 10

-- ref:
-- https://love2d.org/wiki/love.draw
-- https://love2d.org/wiki/love.graphics
function love.draw()
    love.graphics.rectangle("fill", x, y, 20, 60)
end

-- ref: 
-- https://love2d.org/wiki/love.keypressed
-- https://www.lua.org/pil/4.3.1.html
function love.keypressed(key, scancode, isrepeat)
    -- the coordinate system starts from the upper left corner of the window
    -- that means to move down we are increasing the y value
    if key == "down" then
        y = y + movement
    end
    if key == "right" then
        x = x + movement
    end
end
