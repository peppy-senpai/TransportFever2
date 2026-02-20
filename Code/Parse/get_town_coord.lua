--{
--  counts = { },
--  id = 32698,
--  lu2cargoInfo = { },
--  name = "Istanbul",
--  position = { -6004, 3696, 5.8499984741211, },
--  townDestCounts = { },
--  type = "TOWN",
--  useLinesCounts = { },
--  useLinesPercentage = -1,
--}

local file = io.open("town_coord.csv", "w")

if file then
    file:write("id,name,x,y,z\n")

local all = game.interface.getTowns()

for i=1, #all do
    town = game.interface.getEntity(all[i])
    file:write(string.format("%d,%s,%.3f, %.3f, %.3f,\n", town.id, town.name,town.position[1],town.position[2], town.position[3]))
end

file:close()
    print("Success! File saved as industry_coords.txt")
else
    print("Error: Could not open file for writing.")
end