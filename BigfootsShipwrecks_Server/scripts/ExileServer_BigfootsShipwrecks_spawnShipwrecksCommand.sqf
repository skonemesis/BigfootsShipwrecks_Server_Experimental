/*
 * Bigfoot's Shipwrecks - Spawn Shipwrecks Command
 * Updated by: sko & Ghost PGM DEV TEAM
 * 
 * This script handles the spawning of shipwrecks at random locations based on configuration settings.
 * It ensures safe positioning, creates wrecks and crates, and logs important details.
 *
 * Key Features:
 * - Spawns shipwrecks in random locations using `BIS_fnc_findSafePos`.
 * - Creates loot crates near wrecks.
 * - Logs the process for debugging and tracking.
 *
 * Configurable Variables (Defined in config.sqf):
 * - BS_count_shipwrecks: Number of shipwrecks to spawn.
 * - BS_locations_center: Center position for wreck spawn area.
 * - BS_locations_distance_min: Minimum spawn distance from the center.
 * - BS_locations_distance_max: Maximum spawn distance from the center.
 * - BS_class_wreckage: List of possible shipwreck types.
 * - BS_class_crate: List of possible loot crate types.
 * - BS_loot_itemCargo: List of possible loot items.
 * - BS_loot_count_poptabs_seed: Randomized poptab rewards.
 * - BS_debug_logCrateFill: Enables logging for debugging.
 */

if (!isServer) exitWith {};

// Ensure config variables exist
if (isNil "BS_count_shipwrecks" || {BS_count_shipwrecks <= 0}) exitWith {
    format["ERROR: Configuration variables not loaded. Wreck spawning aborted!"] call ExileServer_BigfootsShipwrecks_util_logCommand;
};

format["Starting Shipwreck Spawn Process..."] call ExileServer_BigfootsShipwrecks_util_logCommand;

// Loop to spawn wrecks
for "_i" from 1 to BS_count_shipwrecks do
{
    _wreckagePosition = [BS_locations_center, BS_locations_distance_min, BS_locations_distance_max, 0, 2, 10, -1] call BIS_fnc_findSafePos;
    
    // Validate spawn position
    if (count _wreckagePosition == 0) then 
    {
        format["WARNING: Could not find a safe position for wreck spawn!"] call ExileServer_BigfootsShipwrecks_util_logCommand;
        continue;
    };

    _wreckType = selectRandom BS_class_wreckage;
    _wreck = createVehicle [_wreckType, _wreckagePosition, [], 0, "CAN_COLLIDE"];
    _wreck setVectorUp surfaceNormal _wreckagePosition;

    format["Spawned wreck: %1 at %2", _wreckType, _wreckagePosition] call ExileServer_BigfootsShipwrecks_util_logCommand;

    // Ensure crate spawns in water near the wreck
    _crateType = selectRandom BS_class_crate;
    _cratePosition = [_wreckagePosition, BS_locations_crateWreckOffset] call BIS_fnc_findSafePos;
    _crate = createVehicle [_crateType, _cratePosition, [], 0, "CAN_COLLIDE"];

    format["Spawned crate: %1 at %2", _crateType, _cratePosition] call ExileServer_BigfootsShipwrecks_util_logCommand;
};

format["Finished spawning Shipwrecks."] call ExileServer_BigfootsShipwrecks_util_logCommand;
