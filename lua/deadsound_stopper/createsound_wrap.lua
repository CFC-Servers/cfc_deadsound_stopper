local Copy = table.Copy
local tostring = tostring
local lower = string.lower

-- TODO: Have this somehow look up the sounds in case people pass random strings in here
-- This should work without a manual table like this
local isInvalidSound = {
    -- General
    ["error"] = true,
    ["nil"] = true,
    ["0"] = true,
    [""] = true,
    ["common/null.wav"] = true
}

_CreateSound = _CreateSound or CreateSound
CreateSound = function( targetEnt, soundName, filter, ... )
    local lowerName = tostring( lower( soundName ) )

    if isInvalidSound[lowerName] then
        -- TODO: Remove this when we have a better understanding of how/when/where it happens
        if SERVER then
            ErrorNoHaltWithStack( "Attempted to create invalid sound!", targetEnt, soundName, filter, ... )
        end

        return Copy( CSoundPatchMock )
    end

    return _CreateSound( targetEnt, soundName, filter, ... )
end
