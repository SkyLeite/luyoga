---@param enum table
---@param value any
---@return string?
function enumKey(enum, value)
    for k, v in pairs(enum) do
        if v == value then
            return k      
        end
    end

    return nil
end

function calcIndex(index)
    if index == nil then
        return 0
    elseif index >= 1 then
        return index - 1
    else
        error("Index cannot be negative")
    end
end