-- 1. Get the list of industries
local all = game.interface.getEntities({ pos = {0,0}, radius = 90000000 }, { type="CONSTRUCTION" })

-- 2. Open a file for writing ("w" mode)
-- On Windows, this usually saves to: .../userdata/[ID]/1066780/local/
local file = io.open("industry_coords.txt", "w")

if file then
    file:write("fileName,id,name,x,y,z,\n") -- Header row
    
    for i=1, #all do
        local t = game.interface.getEntity(all[i])
        local x, y, z = t.transf[13], t.transf[14], t.transf[15]
        -- Write the formatted line to the file
        file:write(string.format("%s, %d, %s, %.3f, %.3f, %.3f,\n", t.fileName, t.id, t.name, x, y, z))
    end
    
    file:close()
    print("Success! File saved as industry_coords.txt")
else
    print("Error: Could not open file for writing.")
end