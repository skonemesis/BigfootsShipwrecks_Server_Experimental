/*
 * ExileServer_BigfootsShipwrecks_addMoneyToCrateCommand.sqf
 *
 * Adds a random amount of poptabs to a crate based on a configured probability distribution.
 * 
 * Updated by: sko & Ghost PGM DEV TEAM (02/13/2025)
 */

if (!isServer) exitWith {};

// Define private variables
private ["_wreckId", "_crate", "_randomDistributionSeed", "_enableCrateFillDebug", "_countPoptabs"];

// Extract parameters
_wreckId = _this select 0;                 // Unique ID for the wreck
_crate = _this select 1;                   // Crate object
_randomDistributionSeed = _this select 2;  // Weighted random distribution array
_enableCrateFillDebug = _this select 3;    // Boolean to enable debugging logs

// Validate crate before adding money
if (isNil "_crate" || {isNull _crate}) exitWith {
    format["[Bigfoot's Shipwrecks] ERROR: Invalid crate object for wreck [%1]. Money not added.", _wreckId] call ExileServer_BigfootsShipwrecks_util_logCommand;
};

// Select a random poptab amount based on weighted probability
_countPoptabs = _randomDistributionSeed selectRandomWeighted [
    500,   0.2,  // 20% chance to get 500 poptabs
    5000,  0.6,  // 60% chance to get 5,000 poptabs
    50000, 0.05  // 5% chance to get 50,000 poptabs (rare jackpot)
];

// Ensure the poptab amount is never below the minimum
if (_countPoptabs < 500) then { _countPoptabs = 500; };

// Store money in crate
_crate setVariable ["ExileMoney", _countPoptabs, true];

// Log poptab addition if debugging is enabled
if (_enableCrateFillDebug) then 
{
    format["[Bigfoot's Shipwrecks] 💰 Crate [%2] received [%1] poptabs.", _countPoptabs, _wreckId] call ExileServer_BigfootsShipwrecks_util_logCommand;
};
