/* Adds localized briefing
*
* executed via init.sqf on clients
*/

player createDiaryRecord ["Diary", [localize "str_GRAD_brief2title", localize "str_GRAD_gameplay"]];
player createDiaryRecord ["Diary", ["Story", localize "str_GRAD_story"]];
