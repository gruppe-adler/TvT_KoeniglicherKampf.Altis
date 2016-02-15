//whole island?
if (ISLAND_USEWHOLE) then {
	PLAYAREACENTER = ISLAND_CENTER;
	diag_log "Using whole island as play area.";
}
else {
	PLAYAREACENTER = [ISLAND_CENTER, [0, ISLAND_PLAYAREASEARCHRADIUS], [0,360]] call SHK_pos;
	_marker = createMarker ["island_playareamarker", PLAYAREACENTER];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerBrush "Border";
	_marker setMarkerColor "ColorBlack";
	_marker setMarkerSize [ISLAND_PLAYAREASIZE, ISLAND_PLAYAREASIZE];

	diag_log format ["Using circle around %1 with radius %2 as play area.", PLAYAREACENTER, ISLAND_PLAYAREASIZE];
};