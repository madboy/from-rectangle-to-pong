-- ref: 
-- https://www.lua.org/pil/1.2.html
-- https://love2d.org/wiki/love.graphics

paddle_width = 10
paddle_height = 40

paddle_padding = 30

leftx = paddle_padding
lefty = 0

rightx = love.graphics.getWidth() - paddle_width - paddle_padding
righty = 0

movement = 10

ball_side = 10
ball_startx = love.graphics.getWidth() / 2
ball_starty =  love.graphics.getHeight() / 2
ball_x = ball_startx
ball_y = ball_starty
-- Change so that the ball can move in both x and y direction
ball_movement_x = 8
ball_movement_y = 4

left_points = 0
right_points = 0

-- ref:
-- https://love2d.org/wiki/love.load
-- https://love2d.org/wiki/love.graphics
-- https://love2d.org/wiki/love.graphics.newFont
function love.load()
    background = love.graphics.newImage("background.png")
    font = love.graphics.newFont(96)
end

-- ref:
-- https://love2d.org/wiki/love.draw
-- https://love2d.org/wiki/love.graphics
function love.draw()
    -- draw our net
    love.graphics.draw(background, 0, 0)

    -- print current points
    love.graphics.print(left_points, font, love.graphics.getWidth() * 0.25, 0)
    love.graphics.print(right_points, font, love.graphics.getWidth() * 0.75 , 0)

    -- draw paddles
    love.graphics.rectangle("fill", leftx, lefty, paddle_width, paddle_height)
    love.graphics.rectangle("fill", rightx, righty, paddle_width, paddle_height)

    love.graphics.rectangle("fill", ball_x, ball_y, ball_side, ball_side)
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

    if (ball_x >= rightx and ball_x <= (rightx + paddle_width)) and (ball_y >= righty and ball_y <= (righty + paddle_height)) then
        ball_movement_x = -ball_movement_x
    end

    if (ball_x <= (leftx + paddle_width) and ball_x >= leftx) and (ball_y >= lefty and ball_y <= (lefty + paddle_height)) then
        ball_movement_x = -ball_movement_x
    end

    if ball_y < 0 or ball_y > love.graphics.getHeight() then
        ball_movement_y = -ball_movement_y
    end

    ball_x = ball_x + ball_movement_x
    -- Change, update the ball y position
    ball_y = ball_y + ball_movement_y

    -- score points
    if ball_x < 0 then
        right_points = right_points + 1
        ball_x = ball_startx
    end

    if ball_x > love.graphics.getWidth() then
        left_points = left_points + 1
        ball_x = ball_startx
    end
end
