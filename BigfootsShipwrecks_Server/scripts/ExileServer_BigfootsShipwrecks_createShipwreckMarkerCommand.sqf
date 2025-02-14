/*
 * ExileServer_BigfootsShipwrecks_createShipwreckMarkerCommand.sqf
 *
 * Creates a marker at a shipwreck location to help players locate wrecks.
 * 
 * Updated by: sko & Ghost PGM DEV TEAM (02/13/2025)
 */

private ["_marker", "_markerId", "_markerPosition", "_markerText"];

// Extract parameters
_markerId = _this select 0;        // Unique ID for the marker
_markerPosition = _this select 1;  // Position where the marker will be placed
_markerText = if (count _this > 2) then { _this select 2 } else { "Shipwreck" };  // Default text if not provided

// Ensure marker ID follows proper format
_markerId = format ["Shipwreck_%1", _markerId];

// Sanity check: Ensure the marker position is valid
if (_markerPosition isEqualTo [0,0,0]) exitWith {
    format["ERROR: Invalid marker position for [%1] - Skipping marker creation.", _markerId] call ExileServer_BigfootsShipwrecks_util_logCommand;
};

// Create the marker
_marker = createMarker [_markerId, _markerPosition];
_marker setMarkerShape "ICON";
_marker setMarkerType "c_ship";         // Shipwreck marker icon
_marker setMarkerColor "ColorBlue";     // Blue for ocean markers
_marker setMarkerText _markerText;      // Set marker text

// Log marker creation
format["Created marker [%1] at position [%2] with label [%3]", _markerId, _markerPosition, _markerText] call ExileServer_BigfootsShipwrecks_util_logCommand;
