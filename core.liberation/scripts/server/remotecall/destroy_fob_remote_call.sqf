if (!isServer && hasInterface) exitWith {};
params [ "_fob_pos" ];

[_fob_pos, 5] remoteExec ["remote_call_fob", 0];
[_fob_pos] spawn destroy_fob;
