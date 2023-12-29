params ["_vehicle", "_lst_a3"];
if (count _lst_a3 == 0) exitWith {};

{ 
	if (count _x == 2) then {
		_vehicle addItemCargo [(_x select 0), (_x select 1)];
	};
	if (count _x == 3) then {
		private _class = (_x select 0);	
		private _container = [_vehicle, _class] call F_addContainerCargo;
		[_container] call F_clearCargo;
		private _items = (_x select 1) select 0;
		{
			_container addItemCargo [_x, (_items select 1) select (_forEachIndex - 1)];
		} forEach (_items select 0);
		private _mag = (_x select 1) select 1;
		{
			_container addItemCargo [_x, (_mag select 1) select (_forEachIndex - 1)];
		} forEach (_mag select 0);		
	};
	if (count _x == 7) then {
		_vehicle addWeaponWithAttachmentsCargo [_x, 1];
	};
} forEach _lst_a3;
