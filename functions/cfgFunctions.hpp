class koka {
    class common {
        file = functions\common;

        class addKilledEH {};
        class endRound {};
        class killMessage {};
        class nearestCoast {};
        class painEffect {};
        class spawnCarepackage {};
        class spawnLoot {};
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
        class spawnVehicles {};
        class startEquipment {};
        class startRound {};
    };
};
