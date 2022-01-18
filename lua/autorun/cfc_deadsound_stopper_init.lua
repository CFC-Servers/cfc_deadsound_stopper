if SERVER then
    AddCSLuaFile( "deadsound_stopper/csoundpath_mock.lua" )
    AddCSLuaFile( "deadsound_stopper/createsound_wrap.lua" )
end

include( "deadsound_stopper/csoundpath_mock.lua" )
include( "deadsound_stopper/createsound_wrap.lua" )
