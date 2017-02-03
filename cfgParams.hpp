//======================================================================= PARAMETERS
class Params
{
	class debugmode
	{
		title = "Debug Mode";
		values[] = {true, false};
		texts[] = {"On", "Off"};
		default = true;
	};

	class randomteams
	{
		title = "Random Teams";
		values[] = {true, false};
		texts[] = {"On", "Off"};
		default = true;
	};

	class teamsize
	{
		title = "Random Teams - Size";
		values[] = {1,2,3,4,5};
		texts[] = {"1","2","3","4","5"};
		default = 2;
	};

	class circleInterval
	{
		title = "Game Pace";
		values[] = {200,300,400};
		texts[] = {"Fast", "Normal", "Slow"};
		default = 300;
	};

	class scopes
	{
		title = "High Powered Scopes";
		values[] = {true, false};
		texts[] = {"Normal", "Rare"};
		default = false;
	};

	class WeatherSetting
    {
		title = "Weather";
		values[] = {0,1,2,3};
		texts[] = {"Sunny Day","Rainy Day","Cloudy Day","Random"};
		default = 3;
    };

	class TimeOfDay
	{
		title = "Time of Day";
		values[] = {6.5,7,8,9,10,11,12,13,14,15,16,17,1000};
		texts[] = {"06:30", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "Random"};
		default = 1000;
	};

	class lootamount
	{
		title = "Loot";
		values[] = {40,65,80};
		texts[] = {"Low", "Normal", "High"};
		default = 65;
	};

	class vehicleamount
	{
		title = "Amount of Vehicles";
		values[] = {0,1,2};
		texts[] = {"Low", "Normal", "High"};
		default = 1;
	};

	class armedvehicles
	{
		title = "Armed Vehicles";
		values[] = {true, false};
		texts[] = {"On", "Off"};
		default = false;
	};
};
