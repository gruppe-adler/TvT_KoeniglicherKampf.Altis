class koka {
    class common {
        file = functions\common;

        class addKilledEH {};
        class endRound {};
        class findHouses {};
        class killMessage {};
        class nearestCoast {};
        class painEffect {};
        class randomPos {};
        class spawnCarepackage {};
    };

    class init {
        file = functions\init;

        class initIsland {};
        class initSystems {postInit = 1;};
        class lootInit {};
        class pubVars {};
        class setMissionParams {};
    };

    class missionStart {
        file = functions\missionStart;

        class blueCircles {};
        class carePackages {};
        class punishPlayer {};
        class tpToChute {};
        class winCondition {};
    };

    class setup {
        file = functions\setup;

        class generateSWfreq {};
        class moveToStartPosition {};
        class randomTeams {};
        class setSWfreq {};
        class setTimeDate {};
        class setupPlayArea {};
        class setWeather {};
        class spawnBoats {};
        class spawnLoot {};
        class spawnVehicles {};
        class startEquipment {};
        class startRound {};
    };
};
