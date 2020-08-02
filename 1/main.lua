-- ref:
-- https://love2d.org/wiki/love.draw
-- https://love2d.org/wiki/love.graphics
function love.draw()
    -- note: coordinate system starts from top left corner,
    -- so to move down we increase y
    love.graphics.rectangle("fill", 0, 40, 20, 60)
end
