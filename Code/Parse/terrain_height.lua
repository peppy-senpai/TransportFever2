local file = io.open("terrain_height.csv", "w")

if file then
    file:write("x,y,z\n")

x_start, x_end, x_step = -7168, 7168, 30
y_start, y_end, y_step = -7168, 7168, 30

for y=y_start, y_end, y_step do
    for x=x_start, x_end, x_step do
        z = game.interface.getHeight({x, y})
        file:write(string.format("%.3f, %.3f, %.3f,\n", x, y, z))
    end
end
file:close()
    print("Success! File saved as industry_coords.txt")
else
    print("Error: Could not open file for writing.")
end