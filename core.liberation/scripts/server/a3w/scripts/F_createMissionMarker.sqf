// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: createMissionMarker.sqf
//	@file Author: AgentRev
//	LRX Integration: pSiKO

params ["_text", "_pos", "_precise"];

private _marker_zone = "";
private _marker = createMarkerLocal [format ["side_mission_%1", _text], _pos];
if (_precise) then {
	_marker setMarkerTypeLocal "mil_destroy";
	_marker setMarkerSizeLocal [1.25, 1.25];
} else {
	_pos = _pos getPos [250, random 360]; 
	_marker setMarkerPosLocal (_pos getPos [200, 270]); 
	_marker setMarkerTypeLocal "emptyicon";

	_marker_zone = createMarkerLocal [format ["side_mission_%1_zone", _text], _pos];
	_marker_zone setMarkerShapeLocal "ELLIPSE";
	_marker_zone setMarkerBrushLocal "FDiagonal";
	_marker_zone setMarkerSizeLocal [500,500];
	_marker_zone setMarkerColor "colorOPFOR";
};

_marker setMarkerShadowLocal true;
_marker setMarkerTextLocal _text;
_marker setMarkerColor "ColorRed";

[_marker, _marker_zone];