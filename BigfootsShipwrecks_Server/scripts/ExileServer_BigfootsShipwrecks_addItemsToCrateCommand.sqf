/*
 * Bigfoot's Shipwrecks - Add Items to Crate
 * Updated by: sko & Ghost PGM DEV TEAM
 *
 * Adds randomized loot to a crate based on configured loot settings.
 */

if (!isServer) exitWith {};

// Define private variables
private ["_actualCount", "_actualAdditionalCount", "_cargoItems", "_chance", "_class", "_count", "_crate", "_enableCrateFillDebug", "_minCount", "_possibleAdditionalCount", "_wreckId"];

// Extract parameters
_wreckId = _this select 0;                 // Unique ID for the wreck
_crate = _this select 1;                   // Crate object
_cargoItems = _this select 2;              // List of items to be added to the crate
_enableCrateFillDebug = _this select 3;    // Boolean to enable debugging logs

// Loop through each loot entry
{
    _class = _x select 0;                  // Item class or array of possible items
    _minCount = _x select 1;               // Guaranteed number of items
    _possibleAdditionalCount = _x select 2;// Max additional random items
    _chance = _x select 3;                 // Spawn chance (percentage)

    // Only add item if the random roll is successful
    if (_chance > random 100) then 
    {
        // If multiple possible items, pick one at random
        if (typeName _class == "ARRAY" && {count _class > 0}) then
        {
            _class = selectRandom _class;
        };

        // Determine final item count
        _actualAdditionalCount = floor(random (_possibleAdditionalCount + 1));
        _actualCount = _minCount + _actualAdditionalCount;

        // Ensure crate always gets at least one item if intended
        if (_actualCount < 1 && _minCount > 0) then
        {
            _actualCount = 1;
        };
        
        // Add item to crate
        _crate addItemCargoGlobal [_class, _actualCount];

        // Log addition if debugging is enabled
        if (_enableCrateFillDebug) then 
        {
            diag_log format ["[Bigfoot's Shipwrecks] Added [%1] [%2] to crate [%3].", _actualCount, _class, _wreckId];
        };
    };
} foreach _cargoItems;
