// Add R3F Weapons
GRLIB_MOD_signature append ["uk3cb_"];

// Weapons + Equipements (uniforme, etc..)
(
	"
	tolower ((configName _x) select [0,6]) == 'uk3cb_' &&
	getNumber (_x >> 'scope') > 1 &&
	([(configName _x)] call is_allowed_item)
	"
	configClasses (configfile >> "CfgWeapons" )
) apply { GRLIB_whitelisted_from_arsenal pushback (configName _x) } ;

// Others object (bagpack, etc..)
(
	"
	tolower ((configName _x) select [0,6]) == 'uk3cb_' &&
	([(configName _x)] call is_allowed_item) &&
	((configName _x) iskindof 'Bag_Base') 
	"
	configClasses (configfile >> "CfgVehicles" )
) apply { GRLIB_whitelisted_from_arsenal pushback (configName _x) } ;

// Glasses
(
	"
	tolower ((configName _x) select [0,6]) == 'uk3cb_' &&
	([(configName _x)] call is_allowed_item)
	"
	configClasses (configfile >> "CfgGlasses" )
) apply { GRLIB_whitelisted_from_arsenal pushback (configName _x) } ;

// Magazines
(
	"
	tolower ((configName _x) select [0,6]) == 'uk3cb_' &&
	tolower (configName _x) find '_tracer' < 0 &&
	([(configName _x)] call is_allowed_item)
	"
	configClasses (configfile >> "CfgMagazines")
) apply { GRLIB_whitelisted_from_arsenal pushback (configName _x)} ;
