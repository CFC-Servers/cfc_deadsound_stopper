# cfc_deadsound_stopper
Stops invalid sounds from being created

## Intro
Server owners who use more verbose console settings might end up seeing this a lot in console:
```
CSoundEmitterSystemBase::GetParametersForSound:  No such sound 0
CSoundEmitterSystemBase::GetParametersForSound:  No such sound
CSoundEmitterSystemBase::GetParametersForSound:  No such sound Error
CSoundEmitterSystemBase::GetParametersForSound:  No such sound common/null.wav
CSoundEmitterSystemBase::GetParametersForSound:  No such sound nil
```

This happens any time `CreateSound` is called with a sound that doesn't exist.

Made worse by things like E2, that allow players to essentially run `CreateSound` on any string they'd like

This tool aims to stop the console spam, help diagnose the issue, and eventually provide in-line solutions.


## Functionality

Right now, if `CreateSound` is called with a path that matches the most common sources of spam, it'll print an error trace serverside and return a mocked/inert `CSoundPatch` object.

This object will behave just like the real thing, but.. it won't actually do anything.

It also has a property, `_IsMock = true` that lets you identify if it's been mocked. Conceivably, this could be used to give a user feedback that they tried creating an invalid sound, so they deal with the spam instead of you.
