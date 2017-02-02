if (!isServer) exitWith {};

// set to full moon date
if (TIME_OF_DAY == 1000) then {
    TIME_OF_DAY = (random 10.5) + 6.5;
    diag_log "Random time of day.";
};
diag_log format ["Setting time of day to %1.", TIME_OF_DAY];
setDate [2015, 2, 2, TIME_OF_DAY, 1];

missionNamespace setVariable ["koka_init_setTimeDone",true,true];
