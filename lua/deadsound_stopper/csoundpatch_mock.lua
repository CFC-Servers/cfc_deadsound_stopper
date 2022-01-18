local isfunction = isfunction

local function noop() return nil end
local function ret( r ) return function() return r end end

CSoundPatchMock = {
    GetDSP = ret( 0 ),
    GetPitch = ret( 0 ),
    GetSoundLevel = ret( 0 ),
    GetVolume = ret( 0 ),
    IsPlaying = ret( false ),
    _IsMock = true
}

local soundPatch = FindMetaTable( "CSoundPatch" )
for k, v in pairs( soundPatch ) do
    if not CSoundPatchMock[k] then
        CSoundPatchMock[k] = isfunction( v ) and noop or v
    end
end
