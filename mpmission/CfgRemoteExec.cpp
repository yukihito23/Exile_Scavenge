class CfgRemoteExec 
{
    class Functions 
    {
        mode = 2;
        jip = 0;
		class fnc_AdminReq 												{ allowedTargets=2; };
		class ExileServer_system_network_dispatchIncomingMessage 		{ allowedTargets=2; };
		class ExileExpansionServer_network_event_onPlayerConnected		{ allowedTargets=0; };
		class ExileExpansionServer_object_player_setScavengedObjects	{ allowedTargets=0; };
		class ExileExpansionClient_object_player_setScavengedObjects	{ allowedTargets=0; };
		class BIS_fnc_holdActionAdd										{ allowedTargets=0; };
		class BIS_fnc_holdActionRemove									{ allowedTargets=0; };
    };
    class Commands
    {
		mode=0;
		jip=0;
    };
};