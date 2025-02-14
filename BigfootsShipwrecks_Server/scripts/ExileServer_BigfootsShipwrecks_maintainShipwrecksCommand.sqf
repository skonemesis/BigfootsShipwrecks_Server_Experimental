/*
 * Bigfoot's Shipwrecks - Maintain Shipwreck Events
 * Updated by: sko & Ghost PGM DEV TEAM
 *
 * Monitors shipwrecks, removes markers when players approach, and sends notifications.
 */

if (!isServer) exitWith {};

// Define private variables
private ["_activeMarkers", "_markerId", "_markerPosition", "_coords", "_message", "_playersNearby", "_isPlayerInRange"];
private _claimedCrates = [];

// Extract parameters
private _countWrecks = _this select 0;                    // Total shipwrecks to track
private _crateClaimMessageRadius = _this select 1;        // Detection radius for players
private _showCrateClaimMessage = _this select 2;          // Enable/disable global notifications

// Get all active shipwreck markers
_activeMarkers = allMapMarkers select { _x find "Shipwreck_" == 0 };

if (count _activeMarkers == 0) exitWith 
{
    ["[Shipwrecks] No active shipwreck markers detected."] call ExileServer_BigfootsShipwrecks_util_logCommand;
};

// Loop through active shipwreck sites
{
    _markerId = _x;
    
    // Ensure marker exists
    if !(_markerId in _activeMarkers) exitWith {};

    _markerPosition = getMarkerPos _markerId;

    // Check if any player is within the specified radius
    _playersNearby = allPlayers select { _x distance _markerPosition <= _crateClaimMessageRadius };
    _isPlayerInRange = count _playersNearby > 0;

    if (_isPlayerInRange && !(_markerId in _claimedCrates)) then 
    {
        // Log that the crate was found
        format["[Shipwrecks] Crate found at [%1].", _markerPosition] call ExileServer_BigfootsShipwrecks_util_logCommand;

        // Remove the marker to indicate crate recovery
        deleteMarker _markerId;
        _claimedCrates pushBack _markerId;

        // If enabled, notify all players that the crate has been found
        if (_showCrateClaimMessage) then 
        {
            _coords = mapGridPosition _markerPosition;
            _message = format ["📢 A crashed crate has been recovered from coordinates %1.", _coords];

            // Send notification to all clients
            ["Info", "Shipwreck Loot Recovered!", _message] call ExileServer_BigfootsShipwrecks_sendClientNotificationCommand;

            // Broadcast chat message to all players
            ["systemChatRequest", [_message]] call ExileServer_system_network_send_broadcast;
        };  
    };
} forEach _activeMarkers;
