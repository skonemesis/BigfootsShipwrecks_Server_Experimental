/*
 * postInit.sqf - Bigfoot's Shipwrecks
 * 
 * Loads config values and starts the shipwreck spawner after the mission initializes.
 * 
 * Updated by: sko & Ghost PGM DEV TEAM
 */

format["PostInit started..."] call ExileServer_BigfootsShipwrecks_util_logCommand;

// Load server configuration
call compile preprocessFileLineNumbers "BigfootsShipwrecks_Server\config\config.sqf";

// Verify that config variables loaded correctly
if (isNil "BS_count_shipwrecks") exitWith {
    format["ERROR: Failed to load config.sqf. Shipwreck spawner aborted!"] call ExileServer_BigfootsShipwrecks_util_logCommand;
};

// Start the shipwreck spawning system
[] call ExileServer_BigfootsShipwrecks_initialize;

format["PostInit finished"] call ExileServer_BigfootsShipwrecks_util_logCommand;
