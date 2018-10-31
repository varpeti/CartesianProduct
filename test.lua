local cp = require("CartesianProduct")

local input =
{
    {1,2,3,4},{"a","b"},{"-","|"}
}

local shouldbe =
{
    {1,"a","-",},
    {1,"a","|",},
    {1,"b","-",},
    {1,"b","|",},
    {2,"a","-",},
    {2,"a","|",},
    {2,"b","-",},
    {2,"b","|",},
    {3,"a","-",},
    {3,"a","|",},
    {3,"b","-",},
    {3,"b","|",},
    {4,"a","-",},
    {4,"a","|",},
    {4,"b","-",},
    {4,"b","|",},
}

local output = cp.tabl(input)

for i=1,#output do
    for j=1,#output[i] do
        assert(output[i][j]==shouldbe[i][j], "["..i.."]["..j.."] '"..output[i][j].."' != '"..shouldbe[i][j].."'" )
    end
end

print("Succes!")
