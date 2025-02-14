/*
 * Bigfoot's Shipwrecks - Create Shipwreck Marker
 * Updated by: sko & Ghost PGM DEV TEAM
 *
 * Creates a marker at a shipwreck location to help players locate wrecks.
 */

private ["_marker", "_markerId", "_markerPosition", "_markerText"];

// Extract parameters
_markerId = _this select 0;                                                       // Unique ID for the marker
_markerPosition = _this select 1;                                                 // Position where the marker will be placed
_markerText = if (count _this > 2) then { _this select 2 } else { "Shipwreck" };  // Default text if not provided

// Ensure marker ID is unique
_markerId = format ["Shipwreck_%1", _markerId];

// Check if marker already exists before creating it
if !(markerExists _markerId) then
{
    _marker = createMarkerLocal [_markerId, _markerPosition];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "c_ship";                                                   // Shipwreck marker icon
    _marker setMarkerColor "ColorBlue";                                               // Blue for ocean markers
    _marker setMarkerText _markerText;                                                // Set marker text

    // Log marker creation
    format["[Shipwrecks] Created marker [%1] at position [%2] with label [%3]", _markerId, _markerPosition, _markerText] call ExileServer_BigfootsShipwrecks_util_logCommand;
};
