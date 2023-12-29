params ["_wnded", "_medic"];

if (isDedicated) exitWith {};
if !(local _wnded) exitWith {};
private _my_medic = _wnded getVariable ["PAR_myMedic", objNull];
if (local _medic && (_my_medic != _medic)) exitWith { [_medic, _wnded] call PAR_fn_medicRelease };
if (lifeState _wnded != "INCAPACITATED" || (!alive _wnded)) exitWith { [_medic, _wnded] call PAR_fn_medicRelease };

if (!isPlayer _medic) then {
  private _msg = format [localize "STR_PAR_ST_01", name _medic, name _wnded];
  [_wnded, _msg] call PAR_fn_globalchat;
  _bleedOut = _wnded getVariable ["PAR_BleedOutTimer", 0];
  _wnded setVariable ["PAR_BleedOutTimer", _bleedOut + PAR_BleedOutExtra, true];
  _medic setDir (_medic getDir _wnded);
  if (stance _medic == "PRONE") then {
    _medic switchMove "ainvppnemstpslaywrfldnon_medicother";
    _medic playMoveNow "ainvppnemstpslaywrfldnon_medicother";
  } else {
    _medic switchMove "ainvpknlmstpslaywrfldnon_medicother";
    _medic playMoveNow "ainvpknlmstpslaywrfldnon_medicother";
  };
  private _grbg = createVehicle [(selectRandom PAR_MedGarbage), getPos _wnded, [], 0, "CAN_COLLIDE"];
  _grbg spawn {sleep (60 + floor(random 30)); deleteVehicle _this};
  _cnt = 6;
  while { _cnt > 0 && (_wnded getVariable ["PAR_myMedic", objNull] == _medic) } do {
    sleep 1;
    _cnt = _cnt -1
  };
};
private _my_medic = _wnded getVariable ["PAR_myMedic", objNull];
if (local _medic && (_my_medic != _medic)) exitWith { [_medic, _wnded] call PAR_fn_medicRelease };
if (lifeState _medic == "INCAPACITATED" || (!alive _wnded)) exitWith { [_medic, _wnded] call PAR_fn_medicRelease };

// Revived
_wnded setUnconscious false;

if (GRLIB_revive == 2) then { 
  _medic removeItem "FirstAidKit";
};
if ([_medic] call PAR_is_medic) then {
  _wnded setDamage 0;
} else {
  _wnded setDamage 0.25;
};

_wnded setVariable ["PAR_isUnconscious", false, true];
if (_wnded == player) then {
  _wnded setVariable ["PAR_isDragged", 0, true];
  group _wnded selectLeader _wnded;
  private _bounty_ok = (([(GRLIB_capture_size * 2), getPosATL _medic] call F_getNearestSector) in opfor_sectors && _medic getVariable ["PAR_lastRevive",0] < time);
  if (isPlayer _medic && _bounty_ok) then {
    private _bonus = 5;
    [_medic, _wnded, _bonus] remoteExec ["PAR_remote_bounty", 2];
  };
} else {
  _wnded switchMove "amovpknlmstpsraswrfldnon"; //go up
  _wnded playMoveNow "amovpknlmstpsraswrfldnon";
  _wnded setSpeedMode (speedMode group player);
  _wnded doFollow player;
};
[_medic, _wnded] call PAR_fn_medicRelease;
[[_medic, _wnded]] call PAR_fn_fixPos;

[_wnded] spawn {
    params ["_unit"];
    uIsleep 10;   //time to recover
    _unit setCaptive false;
    _unit setVariable ["PAR_wounded", false, true];
    _unit allowDamage true;
};
