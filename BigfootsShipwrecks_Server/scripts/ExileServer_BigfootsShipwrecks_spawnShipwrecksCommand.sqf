/*
 * Bigfoot's Shipwrecks - Spawn Shipwrecks Command
 * Updated by: sko & Ghost PGM DEV TEAM
 * 
 * This script handles the spawning of shipwrecks at random locations based on configuration settings.
 */

if (!isServer) exitWith {};

private ["_wreckagePosition", "_wreck", "_wreckType", "_crate", "_crateType", "_cratePosition", "_retryCount", "_maxRetries", "_isValid"];
private _spawnedWrecks = [];

// Log function start
["[Shipwrecks] Starting Shipwreck Spawn Process..."] call ExileServer_BigfootsShipwrecks_util_logCommand;

// Ensure wreck count is valid
private _wreckCount = BS_count_shipwrecks;
if (isNil "_wreckCount" || { _wreckCount <= 0 }) exitWith 
{
    ["[Shipwrecks] ERROR: Invalid wreck count! Check `BS_count_shipwrecks` in config.sqf"] call ExileServer_BigfootsShipwrecks_util_logCommand;
};

// Loop to spawn wrecks
for "_i" from 1 to _wreckCount do
{
    _isValid = false;
    _retryCount = 0;
    _maxRetries = 5;

    while { !_isValid && _retryCount < _maxRetries } do 
    {
        _wreckagePosition = [BS_locations_center, BS_locations_distance_min, BS_locations_distance_max, 0, 0, 10, 0] call BIS_fnc_findSafePos;
        
        // Ensure wreck does not overlap another wreck
        _isValid = true;
        {
            if (_wreckagePosition distance _x < 500) then { _isValid = false; }; // 500m min distance
        } forEach _spawnedWrecks;

        _retryCount = _retryCount + 1;
    };

    if (!_isValid) exitWith 
    {
        ["[Shipwrecks] WARNING: Could not find a safe spawn position for wreck."] call ExileServer_BigfootsShipwrecks_util_logCommand;
    };

    _spawnedWrecks pushBack _wreckagePosition;

    // Spawn wreck
    _wreckType = selectRandom BS_class_wreckage;
    _wreck = createVehicle [_wreckType, _wreckagePosition, [], 0, "NONE"];
    
    // Ensure proper alignment
    private _surfaceNormal = surfaceNormal _wreckagePosition;
    if (abs (_surfaceNormal select 2) < 0.5) then { _surfaceNormal = [0, 0, 1]; };
    _wreck setVectorUp _surfaceNormal;

    format["[Shipwrecks] Spawned wreck: %1 at %2", _wreckType, _wreckagePosition] call ExileServer_BigfootsShipwrecks_util_logCommand;

    // Spawn crate near wreck
    _crateType = selectRandom BS_class_crate;
    _cratePosition = [_wreckagePosition, BS_locations_crateWreckOffset, random 360] call BIS_fnc_relPos;
    _crate = createVehicle [_crateType, _cratePosition, [], 0, "CAN_COLLIDE"];

    format["[Shipwrecks] Spawned crate: %1 at %2 (near wreck)", _crateType, _cratePosition] call ExileServer_BigfootsShipwrecks_util_logCommand;
};

["[Shipwrecks] Finished spawning Shipwrecks."] call ExileServer_BigfootsShipwrecks_util_logCommand;
