params ["_classname"];

private _pos = getPosATL player;
private _grp = group player;
private _unit = _grp createUnit [_classname, _pos, [], 5, "NONE"];
[_unit] joinSilent _grp;
_unit setVariable ["PAR_Grp_ID", format["Bros_%1", PAR_Grp_ID], true];
PAR_AI_bros = PAR_AI_bros + [_unit];
[_unit] spawn PAR_fn_AI_Damage_EH;
_unit enableIRLasers true;
_unit enableGunLights "Auto";
_unit setUnitRank "PRIVATE";
_unit setSkill 0.6;

if (GRLIB_opfor_english) then {
    //[_unit, _spk] remoteExec ["setSpeaker", 0];
    _unit setSpeaker (format ["Male0%1ENG",selectRandom [2,3,4,5,6,7,8,9]]);
};

[_unit, configOf _unit] call BIS_fnc_loadInventory;
if (_classname in units_loadout_overide) then {
    private _path = format ["mod_template\%1\loadout\%2.sqf", GRLIB_mod_west, toLower _classname];
    [_path, _unit] call F_getTemplateFile;
};
[_unit] spawn F_fixModUnit;
stats_blufor_soldiers_recruited = stats_blufor_soldiers_recruited + 1;
publicVariable "stats_blufor_soldiers_recruited";
build_refresh = true;