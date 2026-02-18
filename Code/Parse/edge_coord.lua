--{
--  hasBus = false,
--  hasTram = false,
--  id = 107353,
--  node0 = 107116,
--  node0pos = { -2771.0737304688, 6195.8618164063, 2.3499984741211, },
--  node0tangent = { -43.58048248291, 13.219250679016, 0, },
--  node1 = 100331,
--  node1pos = { -2814.9775390625, 6206.1455078125, 2.3589704036713, },
--  node1tangent = { -44.15115737915, 7.3795757293701, 0.01770300976932, },
--  streetType = "",
--  track = true,
--  type = "BASE_EDGE",
--}

-- 1. Get the list of edges
local all = game.interface.getEntities({ pos = {0,0}, radius = 90000000 }, { type="CONSTRUCTION" })

-- 2. Open a file for writing ("w" mode)
-- On Windows, this usually saves to: .../userdata/[ID]/1066780/local/
local file = io.open("edge_coords.txt", "w")

if file then
    file:write("id,node0,x_0,y_0,z_0,node1,x_1,y_1,z_1,bus,tram,track,streetType\n") -- Header row
    
    for i=1, #all do
        local t = game.interface.getEntity(all[i])
        local x_0, y_0, z_0 = t.node0pos[1], t.node0pos[2], t.node0pos[3]
        local x_1, y_1, z_1 = t.node1pos[1], t.node1pos[2], t.node1pos[3]
        -- Write the formatted line to the file
        file:write(string.format("%d, %d, %.3f, %.3f, %.3f, %d, %.3f, %.3f, %.3f,%s,%s,%s,%s,\n",
        t.id, t.node0, x_0, y_0, z_0, t.node1, x_1, y_1, z_1, t.hasBus, t.hasTram,
        t.track, t.streetType))
    end
    
    file:close()
    print("Success! File saved as edges_coords.txt")
else
    print("Error: Could not open file for writing.")
end