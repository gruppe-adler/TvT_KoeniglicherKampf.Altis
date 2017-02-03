/* Randomizes teams as per mission parameters
*
* Executed via init.sqf on server
*/

if (!isServer) exitWith {};

private ["_players","_numberOfTeams", "_teammember", "_teamleadID"];

missionNamespace setVariable ["TEAMSETUPSTARTED",true,true];

if (!(RANDOM_TEAMS) || ((count playableUnits) == 1)) then {
	TEAMLEADERS = [];
	{
		_groupLeader = leader _x;
		TEAMLEADERS = TEAMLEADERS + [_groupleader];
	} forEach allGroups;
};

//set kill EHs
{
	[_x] call koka_fnc_addKilledEH;
} forEach playableUnits;


_players = playableUnits;
_numberOfTeams = ceil ((count _players) / TEAM_SIZE);
TEAMLEADERS = [];

//Delete existing groups
{
	[_x] joinSilent grpNull;
} forEach _players;

//Enough players?
if (_numberOfTeams < 2 && (count _players) > 1) then {
	diag_log "Unable to randomize teams - not enough players.";
	diag_log format ["Number of players: %1", (count _players)];
	diag_log format ["Teamsize selected: %1", TEAM_SIZE];
	_numberOfTeams = 2;
} else {
	diag_log format ["Randomizing %1 players into %2 teams", (count _players), _numberOfTeams];
};

//Select teamleaders
for [{_i = 0},{_i < _numberOfTeams},{_i = _i + 1}] do {
	_teamlead = selectRandom _players;
	_players = _players - [_teamlead];
	TEAMLEADERS = TEAMLEADERS + [_teamlead];
};

//Teamleader names for log
diag_log "Teamleaders selected:";
{
	diag_log str (name _x);
} forEach TEAMLEADERS;


//Add remaining players to teamleaders
for [{_i = 0},{_i < (TEAM_SIZE - 1)}, {_i = _i + 1}] do {
	_teamleadID = 0;
	{
		if ((count _players) == 0) then {
			diag_log "No more players to add to teamleaders - uneven teams";

		} else {
			_teammember = selectRandom _players;
			_players = _players - [_teammember];
			[_teammember] joinSilent _x;
			diag_log format ["%1 added to %2's team.", (name _teammember), (name _x)];
		};

		_teamleadID = _teamleadID +1;
	} forEach TEAMLEADERS;
};

missionNamespace setVariable ["koka_init_randomTeamsDone",true,true];
