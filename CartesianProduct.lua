local CP = {}

--Input:
-- { { 1 , 2 ,...}, { 1 , 2 ,...}, ...}
--Output: 
-- { 
--  {{ 1 },{ 1 },...}
--  {{ 2 },{ 1 },...}
--  {{...},{ 1 },...}
--  {{ 1 },{ 2 },...}
--  {{ 2 },{...},...}
--  ...
-- }

function CP.func(sets)
    local result = {}
    local set_count = #sets
    local yield = coroutine.yield 
    local function descend(depth)
        if depth == set_count then
            for k,v in pairs(sets[depth]) do
                result[depth] = v
                yield(result)
            end
        else
            for k,v in pairs(sets[depth]) do
                result[depth] = v
                descend(depth + 1)
            end
        end
    end
    return coroutine.wrap(function() descend(1) end)
end

function CP.tabl(sets)
    local result = {}
    local insert = table.insert
    for t in CP.func(sets) do
        local s = {}
        for i,v in pairs(t) do
            s[i] = v
        end
        insert(result,s)
    end
    return result
end


return CP