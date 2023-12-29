params ["",	"",	"",	"_cmd",	["_classname",""]];

if (_cmd == "add" && _classname != "") exitWith {
	private _pos = getPosATL player;
	private _my_dog = createAgent [_classname, _pos, [], 5, "CAN_COLLIDE"];
	_my_dog setVariable ["BIS_fnc_animalBehaviour_disable", true];
	_my_dog allowDamage false;
	player setVariable ["my_dog", _my_dog, true];
	private _dog_snd = selectRandom ["dog1.wss", "dog2.wss", "dog3.wss"];
	private _tone = [_dog_snd, random [0.7, 1, 1.5]];
	_my_dog setVariable ["my_dog_tone", _tone];
	_my_dog setDir (_my_dog getDir player);
	[_my_dog, _tone] spawn dog_bark;
	private _id = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler [
		"Draw",
		"
			private _map = _this select 0;
			private _icon = 'a3\animals_f\data\ui\map_animals_ca.paa';
			private _size = 16;
			private _my_dog = player getVariable ['my_dog', nil];
			if (!isNil '_my_dog' && isNull objectParent player) then {
				_map drawIcon [_icon, [0.85,0.4,0,1], (getPosATL _my_dog), _size, _size, 0];
			};
		"
	];
	_my_dog setVariable ["my_dog_marker", _id];
	build_refresh = true;
};

private _my_dog = player getVariable ["my_dog", nil];
if (!isNil "_my_dog") then {

	if (_cmd == "del") then {
		_msg = format [localize "STR_DISMISS_DOG"];
		_result = [_msg, localize "STR_WARNING", true, true] call BIS_fnc_guiMessage;
		if (_result) then {
			player setVariable ["my_dog", nil, true];
			_my_dog setDir (_my_dog getDir player);
			[_my_dog, ["dog4.wss", 1]] spawn dog_bark;
			sleep 4;
			_id = _my_dog getVariable ["my_dog_marker", 0];
			(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw", _id];
			deleteVehicle _my_dog;
		};
	};

	if (_cmd == "find") then {
		_enemy_lst = (getPos player) nearEntities ["Man", 300];
		_enemy_lst = _enemy_lst select {alive _x && (side _x == GRLIB_side_enemy || {_x getVariable ["GRLIB_is_prisoner", false]})};

		_msg = localize "STR_DOG_FOUND_NOTHING";
		if (count _enemy_lst > 0) then {
			_enemy_lst = _enemy_lst apply {[_x distance2D player, _x]};
			_enemy_lst sort true;
			_dist = (_enemy_lst select 0) select 0;
			_man = (_enemy_lst select 0) select 1;
			_msg = format [localize "STR_DOG_FOUND", round (_dist)];
			_my_dog setVariable ["do_find", _man];
			_my_dog stop false;
		};
		gamelogic globalChat _msg;
	};

	if (_cmd == "find_gun") then {
		_my_dog_pos = getPosATL _my_dog;
		_weapons_lst = nearestObjects [_my_dog_pos, ["GroundWeaponHolder", "WeaponHolderSimulated"], 200];
		_weapons_lst = _weapons_lst select {
			_wp = ((getWeaponCargo _x) select 0);
			if (count _wp > 0) then {
				_wp_info = (_wp select 0) call BIS_fnc_weaponComponents;
				_wp_weapon = format ["Weapon_%1", (_wp_info select 0)];
				([_wp_weapon, ["Weapon_Base_F", "Launcher_Base_F"]] call F_itemIsInClass);
			} else { false };
		};
		_msg = localize "STR_DOG_FOUND_NOTHING";
		if (count _weapons_lst > 0) then {
			_weapons_lst = _weapons_lst apply {[_x distance2D _my_dog_pos, _x]};
			_weapons_lst sort true;
			_dist = (_weapons_lst select 0) select 0;
			_man = (_weapons_lst select 0) select 1;
			_msg = format [localize "STR_DOG_FOUND", round (_dist)];
			_my_dog setVariable ["do_find", _man];
			_my_dog stop false;
		};
		gamelogic globalChat _msg;
	};

	if (_cmd == "patrol") then {
		private _dog_pos = getPosATL player;
		private _radius = 80;
		private _patrolcorners = [
			[ (_dog_pos select 0) - _radius, (_dog_pos select 1) - _radius, 0 ],
			[ (_dog_pos select 0) + _radius, (_dog_pos select 1) - _radius, 0 ],
			[ (_dog_pos select 0) + _radius, (_dog_pos select 1) + _radius, 0 ],
			[ (_dog_pos select 0) - _radius, (_dog_pos select 1) + _radius, 0 ]
		];
		_my_dog setVariable ["do_find_wp", _patrolcorners];
		_my_dog setVariable ["do_find", (_patrolcorners select 0)];
		_my_dog stop false;
	};

	if (_cmd == "recall") then {
		_my_dog setVariable ["do_find", nil];
		_my_dog setVariable ["do_find_wp", nil];
		_my_dog stop false;
	};

	if (_cmd == "stop") then {
		_my_dog setVariable ["do_find", nil];
		_my_dog setVariable ["do_find_wp", nil];
		_my_dog stop true;
		_my_dog playMove "Dog_Stop";
	};

};
