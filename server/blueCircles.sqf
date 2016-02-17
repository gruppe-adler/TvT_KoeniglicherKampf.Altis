/* Generates blue circles and ends the game if no winner
*
* Executed after round start via init.sqf on server
*/

private ["_circleSizes", "_circleID", "_initialRadius", "_searchRadius", "_marker", "_circleInterval", "_firstCircle", "_messagetext"];
_initialRadius = (ISLAND_CONFIG select (ISLANDS find worldName)) select 3;
_circleSizes = (ISLAND_CONFIG select (ISLANDS find worldName)) select 4;
_circleID = 0;

//Define 0th circle as playarea, so that carepackages may spawn before the first circle
NEWCIRCLEPOS = PLAYAREACENTER;
NEWCIRCLESIZE = ISLAND_PLAYAREASIZE;
publicVariable "NEWCIRCLEPOS";
publicVariable "NEWCIRCLESIZE";

//How often are new circles spawned?
_circleInterval = (GAME_TIME - TIME_UNTIL_FIRST_CIRCLE - TIME_UNTIL_GETIN_FIRST) / (count _circleSizes);
if (_circleInterval < (TIME_UNTIL_GETIN - 30)) then {
	_circleInterval = (TIME_UNTIL_GETIN - 30);
};

//Setting in init.sqf
diag_log format ["blueCircles initialized - waiting %1 seconds until first circle spawns", TIME_UNTIL_FIRST_CIRCLE];
sleep TIME_UNTIL_FIRST_CIRCLE;

//Log
diag_log "blue circles starting...";
diag_log "Settings:";
diag_log format ["Initial Radius: %1", _initialRadius];
diag_log format ["Circle Interval: %1", _circleInterval];


//Main loop
for [{_i = 0},{_i < (count _circleSizes)},{_i = _i + 1}] do {

	NEWCIRCLESIZE = _circleSizes select _i;

	if (_i == 0) then {
		//Initial searchradius for first circle
		_searchRadius = _initialRadius;
		_firstCircle = true;
	}
	else
	{
		//Calculate searchradius for new circle center
		_searchRadius = (_circleSizes select (_i- 1)) - (_circleSizes select _i);
		_firstCircle = false;
	};

	//Search for new circle center
	diag_log format ["New circle center search radius: %1", _searchradius];
	diag_log format ["Searching for new circle center."];
	
	NEWCIRCLEPOS = [NEWCIRCLEPOS, [0,_searchradius], [0,360]] call SHK_pos;
	diag_log format ["New circle center found at %1", NEWCIRCLEPOS];

	//Is it the first circle?
	if (!_firstCircle) then {
		if (!DEBUG_MODE) then {
			deleteMarker _marker;
		};
	};

	//Add Marker
	_markername = format ["bluecircle_%1", _i];
	_marker = createMarker [_markername, NEWCIRCLEPOS];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerBrush "Border";
	_marker setMarkerColor "ColorBlue";
	_marker setMarkerSize [NEWCIRCLESIZE, NEWCIRCLESIZE];
	diag_log format ["Circle marker %1 created at %2 with a size of %3", _markername, getMarkerPos _marker, getMarkerSize _marker];

	publicVariable "NEWCIRCLEPOS";
	publicVariable "NEWCIRCLESIZE";
	diag_log format ["New circle variables broadcasted:"];
	diag_log format ["Position %1", NEWCIRCLEPOS];
	diag_log format ["Size: %1", NEWCIRCLESIZE];

	//Broadcast message and variables
	["Map updated!",0,0,4,1] remoteExec ["BIS_fnc_dynamicText",0,false];

	//Is it the first circle?
	if (_firstCircle) then {
		diag_log format ["First circle spawned. Waiting first circle sleep time: %1 seconds", TIME_UNTIL_GETIN_FIRST];

		sleep 10;
		_messagetext = format ["In %1 minutes, play will be limited to the area inside the blue circle.", (TIME_UNTIL_GETIN_FIRST / 60)];
		[_messagetext,0,0,4,1] remoteExec ["BIS_fnc_dynamicText",0,false];

		//Wait the extra time and tell clients to start punishing players
		sleep (TIME_UNTIL_GETIN_FIRST - TIME_UNTIL_GETIN);
		_messagetext = format ["In %1 minutes, play will be limited to the area inside blue circle!", (TIME_UNTIL_GETIN / 60)];
		[_messagetext,0,0,4,1] remoteExec ["BIS_fnc_dynamicText",0,false];
		sleep TIME_UNTIL_GETIN;

		CIRCLESSTARTED = true;
		publicVariable "CIRCLESSTARTED";
	}
	else 
	{
		sleep 10; 
		_messagetext = format ["You have %1 minutes to get inside the new blue circle!", (TIME_UNTIL_GETIN / 60)];
		[_messagetext,0,0,4,1] remoteExec ["BIS_fnc_dynamicText",0,false];
	};

	//Sleep until next circle
	sleep _circleInterval;
};

//Circles over - End game
["Game ending in a draw in 1 minute!",0,0,6,1] remoteExec ["BIS_fnc_dynamicText",0,false];
sleep 60;
["LOST"] call BIS_fnc_endMissionServer;
