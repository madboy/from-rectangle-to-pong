-- ref: 
-- https://www.lua.org/pil/1.2.html
-- https://love2d.org/wiki/love.graphics

-- Change so we can set paddle size in one place
paddle_width = 10
paddle_height = 40

-- Change so that the paddle is a not exactly on the edge
paddle_padding = 30

leftx = paddle_padding
lefty = 0

rightx = love.graphics.getWidth() - paddle_width - paddle_padding
righty = 0

movement = 10

-- Change, add size for the ball
ball_side = 10

-- Change, the players start with no points
left_points = 0
right_points = 0

-- ref:
-- https://love2d.org/wiki/love.load
-- https://love2d.org/wiki/love.graphics
-- https://love2d.org/wiki/love.graphics.newFont
function love.load()
    background = love.graphics.newImage("background.png")
    -- Change, add a font and set the size we want
    font = love.graphics.newFont(96)
end

-- ref:
-- https://love2d.org/wiki/love.draw
-- https://love2d.org/wiki/love.graphics
function love.draw()
    -- draw our net
    love.graphics.draw(background, 0, 0)

    -- Change, add showing points for players using the font we created in love.load
    love.graphics.print(left_points, font, love.graphics.getWidth() * 0.25, 0)
    love.graphics.print(right_points, font, love.graphics.getWidth() * 0.75 , 0)

    -- draw paddles
    love.graphics.rectangle("fill", leftx, lefty, paddle_width, paddle_height)
    love.graphics.rectangle("fill", rightx, righty, paddle_width, paddle_height)

    -- Change, add the ball
    love.graphics.rectangle("fill", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, ball_side, ball_side)
end

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
    if love.keyboard.isDown("x") and (lefty + paddle_height) < love.graphics.getHeight() then
        lefty = lefty + movement
    end
    
    -- right side paddle
    if love.keyboard.isDown("up") and righty > 0 then
        righty = righty - movement
    end
    if love.keyboard.isDown("down") and (righty + paddle_height) < love.graphics.getHeight() then
        righty = righty + movement
    end
end
