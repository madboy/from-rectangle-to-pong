-- ref:
-- https://love2d.org/wiki/love.draw
-- https://love2d.org/wiki/love.graphics
function love.draw()
    love.graphics.rectangle("fill", 0, 0, 20, 60)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2, love.graphics.getHeight()/2, 20, 60)
    -- note: the placement of the rectangle starts with the upper left corner of it,
    -- so if we want to have it visible we need to adjust the start position based on its size
    love.graphics.rectangle("fill", love.graphics.getWidth()-20, love.graphics.getHeight()-60, 20, 60)
end
