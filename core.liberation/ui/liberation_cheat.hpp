class liberation_cheat {
  idd = 5204;
	movingEnable = false;
	controlsBackground[] = {};
	controls[] = {
	  "OuterBG1", 
	  "OuterBG_F1", 
	  "InnerBG1", 
	  "InnerBG_F1", 
	  "Header",
	  "AmmoButton",
	  "FuelButton",
	  "SkipTimeButton",
    "UnlockButton",
    "DeleteButton",
	  "Item01Button",
	  "Item02Button",
	  "CancelButton",
    "CheatInfo01",
    "Cheat_cb_1607",
    "Cheat_cb_text"
	};
	objects[] = {};
  class AmmoButton: StdButton
  {
    idc = 1600;
        action = "[player, 200] remoteExec ['addScore', 2];hint 'Score changed !'";

    text = "Add 200 Points"; 
    x = 0.2275 * safezoneW + safezoneX;
    y = 0.26 * safezoneH + safezoneY;
    w = 0.0875 * safezoneW;
    h = 0.04 * safezoneH;
  };
  class FuelButton: StdButton
  {
    idc = 1601;
    action = "['Box_NATO_AmmoVeh_F', player getRelPos[3, 0], false] remoteExec ['boxSetup', 2]; hint 'AmmoBox spawned !'";

    text = "Spawn AmmoBox"; 
    x = 0.2275 * safezoneW + safezoneX;
    y = 0.312 * safezoneH + safezoneY;
    w = 0.0875 * safezoneW;
    h = 0.04 * safezoneH;
  };
  class GREUH_RscStructuredText{
    access = 0;
    type = 13;
    idc = -1;
    style = 0;
    colorText[] = {1,1,1,1};
      class Attributes
      {
        font = "PuristaMedium";
        color = "#ffffff";
        align = "left";
        shadow = 1;
      };
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.1;
    text = "";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    shadow = 1;
  };
  class RscCheckBox
  {
    idc = -1;
    type = 7; // CT_CHECKBOXES
    style = 2; // ST_CENTER
    x = 0.25;
    y = 0.25;
    w = 0.5;
    h = 0.5;
    colorSelectedBg[] = {0, 0, 0, 0.2}; // selected item bg color
    colorText[] = {0, 1, 0, 1}; // checkbox unchecked color
    colorTextSelect[] = {1, 0, 0, 1}; // checkbox checked color
    colorBackground[] = {0, 0, 1, 0.3}; // control generic BG color
    font = "RobotoCondensed";
    sizeEx = 0.04;
  };

  class Item01Button: StdButton
  {
    idc = 1602;
    action = "'B_Heli_Attack_01_F' createVehicle (player getRelPos[15, 0]);hint 'Heli spawned !'";

    text = "Spawn BlackFooot Heli";
    x = 0.2275 * safezoneW + safezoneX;
    y = 0.364 * safezoneH + safezoneY;
    w = 0.0875 * safezoneW;
    h = 0.04 * safezoneH;
  };
  class Item02Button: StdButton
  {
    idc = 1603;
    action = "'B_supplyCrate_F' createVehicle (player getRelPos[3, 0]);hint 'Arsenal spawned !'";
    text = "Spawn Arsenal";
    x = 0.2275 * safezoneW + safezoneX;
    y = 0.416 * safezoneH + safezoneY;
    w = 0.0875 * safezoneW;
    h = 0.04 * safezoneH;
  };
  class SkipTimeButton: StdButton
  {
    idc = 1604;
    action = "10 remoteExec ['SkipTime', 2];hint 'Time Forward...'";
    text = "Skip Time +10H";
    x = 0.2275 * safezoneW + safezoneX;
    y = 0.468 * safezoneH + safezoneY;
    w = 0.0875 * safezoneW;
    h = 0.04 * safezoneH;
  };
  class UnlockButton: StdButton
  {
    idc = 1609;
    action = "_x = cursorobject;_x setvariable ['R3F_LOG_disabled', false, true];_x setvariable ['GRLIB_vehicle_owner', '', true];hint format ['%1 Unlocked.',typeOf _x]";
    text = "Unlock Vehicle";
    x = 0.2275 * safezoneW + safezoneX;
    y = 0.520 * safezoneH + safezoneY;
    w = 0.0875 * safezoneW;
    h = 0.04 * safezoneH;
  };
  class DeleteButton: StdButton
  {
    idc = 1610;
    action = "deleteVehicle (cursorObject)";
    text = "Delete Object";
    x = 0.2275 * safezoneW + safezoneX;
    y = 0.572 * safezoneH + safezoneY;
    w = 0.0875 * safezoneW;
    h = 0.04 * safezoneH;
  };

  class CheatInfo01: GREUH_RscStructuredText
  {
    idc = 1606;
    text = "<t size='0.7'>[ ALT + LMB ] on Map = Teleport</t>";
    x = 0.2 * safezoneW + safezoneX;
    y = 0.68 * safezoneH + safezoneY;
    w = 0.125 * safezoneW;
    h = 0.02 * safezoneH;
    sizeEx = -2 * GUI_GRID_H;
  };
  class Cheat_cb_1607: RscCheckbox
  {
    idc = 1607;
    text = "GodMode"; //--- ToDo: Localize;
    x = 0.4125 * safezoneW + safezoneX;
    y = 0.68 * safezoneH + safezoneY;
    w = 0.0125 * safezoneW;
    h = 0.02 * safezoneH;
    columns = 1;
    rows = 1;
    strings[] = {"O"};
    checked_strings[] = {"X"};
    onCheckBoxesSelChanged = "[_this] execVM 'scripts\client\misc\godmode.sqf';";
  };
  class Cheat_cb_text: GREUH_RscStructuredText
  {
    idc = 1608;
    text = "<t size='0.7'>GodMode :</t>"; //--- ToDo: Localize;
    x = 0.3625 * safezoneW + safezoneX;
    y = 0.68 * safezoneH + safezoneY;
    w = 0.05 * safezoneW;
    h = 0.02 * safezoneH;
  };
  class CancelButton: StdButton
  {
    idc = 1605;
    action = "closeDialog 0";

    text = "OK"; 
    x = 0.269271 * safezoneW + safezoneX;
    y = 0.71 * safezoneH + safezoneY;
    w = 0.09 * safezoneW;
    h = 0.035 * safezoneH;
  };
  class OuterBG1: StdBG
  {
    colorBackground[] = COLOR_BROWN;
    x = 0.19175 * safezoneW + safezoneX;
    y = 0.1324 * safezoneH + safezoneY;
    w = 0.25 * safezoneW;
    h = 0.62 * safezoneH;
  };
  class OuterBG_F1: OuterBG1
  {
		style = ST_FRAME;
  };
  class InnerBG1: OuterBG1
  {
    colorBackground[] = COLOR_GREEN;
    x = 0.1985 * safezoneW + safezoneX;
    y = 0.1916 * safezoneH + safezoneY;
    w = 0.2375 * safezoneW;
    h = 0.512 * safezoneH;
  };
  class InnerBG_F1: InnerBG1
  {
  	style = ST_FRAME;
  };
  class Header: StdHeader
  {
    text = "-- CHEAT MENU --"; 
    x = 0.1985 * safezoneW + safezoneX;
    y = 0.1444 * safezoneH + safezoneY;
    w = 0.2375 * safezoneW;
    h = 0.04 * safezoneH;
  };
};