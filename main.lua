local grid = {}

function love.load()
    WW, WH = love.graphics.getDimensions()
    gridL = 100
end

function love.draw()
    for x = 1, #grid do
        for y = 1, #grid[x] do
            local f = 1 * grid[x][y]
            love.graphics.setColor( f, f, f, 1 )
            love.graphics.rectangle( 'fill', (x - 1) * gridL, (y - 1) * gridL, gridL, gridL)
            love.graphics.setColor( 1, 1, 1, 1 )
        end
    end
end
 
-- Fill each pixel in our grid with simplex noise.
local function noise()
    for x = 1, WW / gridL do
        for y = 1, WH / gridL do
            grid[x] = grid[x] or {}
            if 0.6 < love.math.noise(x / 8 + love.math.random(), y / 8 + love.math.random()) then
                grid[x][y] = 0
            else
                grid[x][y] = 1
            end
        end
    end
end
 
function love.keypressed(key)
    noise()
    if key == "escape" then 
        love.event.quit()
    end
end

function math.round(n)
    return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end