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