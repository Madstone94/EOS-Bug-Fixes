_namespace = "DEFAULTS"
_id = "POLICE"

maxSuspicion = 100
minSuspicion = 0

-- pressure frequency = pressureBaseFrequency - (pressureNotorietyWeight * notoriety) + (pressureRatingWeight * factionRating)
pressureBaseFrequency = 1000    -- The base number of days when police apply pressure demands to a faction
pressureNotorietyWeight = 0     -- The amount to multiply the notoriety value which will be subtracted from base frequency
pressureRatingWeight = 500      -- The amount to multiply the police rating (scaled between between -1 and 1) value which will be added

-- Reasons to Demand Cash
demandCashReasons =     -- The reasons offered by police when demanding cash. (Optional list of months during the year when the reason applies)
{
    { "$PoliceDemandCash_Retirement" },     --$ We need a donation for the Chief's retirement fund. {0:C0} should cover it.
    { "$PoliceDemandCash_Action" },         --$ We need a slice of the action. Pay up {0:C0} or else.
    { "$PoliceDemandCash_Party", {11, 12}}, --$ We need a small contribution for the Christmas party. {0:C0} should do it.
}

demandCashBaseAmount            = 1000  -- The base amount for cash demanded
demandCashNotorietyMultiplier   = 0.01     -- The amount to multiply the notoriety value that will be multiplied by the demandCashBaseAmount

maxRatingForPressure = -1    -- The maximum target faction rating score before pressure is considered by police
minPressureFrequency = 30    -- The minimum number of days between applying police pressure on the same faction

-- Note suspicion for the individual racket types is in the various config files for that type, BarDataConfig.lua, CasinoDataConfig.lua, BrothelDataConfig.lua and BreweryDataConfig.lua
suspicionForBuildingSize =
{
    [1] = 10, -- Small
    [2] = 15, -- Medium
    [3] = 20, -- Large
}

maxNumExploreTactics = 30
maxNumExploreTacticsPerNeighborhood =
{
    Large = 4,
    Medium = 3,
    Small = 2,
}

maxNumInvestigateTactics = 3
maxNumInvestigateTacticsTacticsPerNeighborhood =
{
    Large = 2,
    Medium = 1,
    Small = 1,
}

factionRatingInvestigateModifier =  -- The contribution towards the investigate suspicion level depending on the faction rating with the police
{
    enemyOfTheState = 10,
    wantedSuspect = 5,
    nobody  = -5,
    honoraryDeputy = -10,
}

maxNumRaidTacticsPerPoliceFaction = 1

maxNumPressureTactics = 1

maxConcurrentAgendas = maxNumExploreTactics + maxNumInvestigateTactics + maxNumPressureTactics

minDurationBetweenSuspicionChecks = 120 -- The number of seconds after the last time police checked a building before they can check it again for suspicious activity
minDurationBetweenInvestigations = 300 -- The number of seconds after investigating a building before the police check it again
numExploreWaypoints = 4

numInvestigateDays = 5
suspicionChangePerInvestigateDay = 6
suspicionChangePerDeflectLevel = -1

raidSurrenderNotoriety = 20 -- The amount of notoriety lost after surrendering to a raid
raidLostNotoriety = 10 -- The amount of notoriety lost after losing a raid

notorietyForRaidFaction =
{
    ["FACTION.CHICAGO_POLICE"] = { min = 0, max = 49},
    ["FACTION.BUREAU_OF_PROHIBITION"] = { min = 50, max = 89},
    ["FACTION.BUREAU_OF_INVESTIGATION"] = { min = 90, max = 100},
}

suspicionAfterRaidBribe = 0 -- The suspicion level to set the building after a raid bribe
suspicionAfterRaidShutdown = 0 -- The suspicion level to set the building after a raid shutdown
suspicionAfterRaidFailed = 0 -- The suspicion level to set the building after the raid failed

raidBuildingShutdownDuration = 92 -- The number of days to shutdown a building after a successful police raid

raidSquadsPerBuildingSize = -- The squads to send depending on building size and police faction
{
    ["FACTION.CHICAGO_POLICE"] =
    {
        Small =
        {
            { power = 2 },
            { power = 3 },
        },
        Medium =
        {
            { power = 3 },
            { power = 4 },
        },
        Large =
        {
            { power = 3 },
            { power = 5 },
        },
    },

    ["FACTION.BUREAU_OF_PROHIBITION"] =
    {
        Small =
        {
            { power = 3 },
            { power = 3 },
        },
        Medium =
        {
            { power = 3 },
            { power = 4 },
        },
        Large =
        {
            { power = 3 },
            { power = 5 },
        },
    },

    ["FACTION.BUREAU_OF_INVESTIGATION"] =
    {
        Small =
        {
            { power = 3 },
            { power = 3 },
        },
        Medium =
        {
            { power = 3 },
            { power = 4 },
        },
        Large =
        {
            { power = 3 },
            { power = 5 },
        },
    }
}

closedSuspicionRate = 5  -- The amount of suspicion to lower per day when the building is closed

--------------------------
-- Raid Bribe Values
--------------------------

raidBribeSuccessChance =    -- The chance of the bribe succeeding, depending on the faction
{
    ["FACTION.CHICAGO_POLICE"] = 0.8,
    ["FACTION.BUREAU_OF_PROHIBITION"] = 0.5,
    ["FACTION.BUREAU_OF_INVESTIGATION"] = 0,
}

raidMinBribeAmount = 1000 -- The minimum cost of the bribe

raidBribeNotorietyAmounts = -- The base cost of the bribe, depending on the notoriety
{
    { notoriety = 0,  amount = 1000},
    { notoriety = 50, amount = 2500},
    { notoriety = 80, amount = 7500},
}

raidBribeFactionMultipliers = -- How much to affect the base bribe cost, depending on the faction rating
{
    enemyOfTheState = 1.25,
    wantedSuspect = 1.1,
    nobody = 1,
    honoraryDeputy = 0.8,
}

raidBribeExpensesConsideration = -- The number of weeks expenses to have in cash before considering a bribe to a faction
{
    ["FACTION.CHICAGO_POLICE"] = 4,
    ["FACTION.BUREAU_OF_PROHIBITION"] = 12,
    ["FACTION.BUREAU_OF_INVESTIGATION"] = 12,
}

raidBribeCriticalFailChance = -- The critical fail chance if a bribe fails
{
    -- ["FACTION.CHICAGO_POLICE"] = 0,   -- No critical fail roll
    ["FACTION.BUREAU_OF_PROHIBITION"] = 0.3,
    -- ["FACTION.BUREAU_OF_INVESTIGATION"] = 0, -- No critical fail roll
}

raidBribeCriticalFailSquadPower = 3 -- The power of the extra squad added if the raidBribe critically fails

--------------------------
-- Raid Chance Values
--------------------------

notorietyRaidFactionWeight = 100    -- The contribution towards the raid chance depending on how notorious you are (is multiplied by notoriety / 100)

numRacketsRaidFactionWeight =       -- The contribution towards the raid chance depending on how many rackets they own (note, the table must be kept in order of num rackets)
{
    { num = 0,  weight = 0  },
    { num = 2,  weight = 10 },
    { num = 5,  weight = 20 },
    { num = 10, weight = 30 },
    { num = 20, weight = 50 },
}

largeRacketsFactionWeight =         -- The contribution towards the raid chance depending on owning large rackets (note, the table must be kept in order of num rackets)
{
    { num = 0,  weight = 0 },
    { num = 1,  weight = 10},
    { num = 2,  weight = 20},
    { num = 3,  weight = 30},
    { num = 5,  weight = 50},
    { num = 7,  weight = 100},
}

numBreweriesFactionWeight =         -- The contribution towards the raid chance depending on owning breweries (note, the table must be kept in order of num breweries)
{
    { num = 0,  weight = 0 },
    { num = 1,  weight = 20},
    { num = 2,  weight = 40},
    { num = 3,  weight = 60},
    { num = 5,  weight = 100},
    { num = 7,  weight = 200},
}

factionRatingFactionWeight =        -- The contribution towards the raid chance depending on the faction rating with the police
{
    enemyOfTheState = 200,
    wantedSuspect = 100,
    nobody  = 30,
    honoraryDeputy = 0,
}

netIncomeRaidFactionWeight =        -- The contribution towards the raid chanced depending on your net income (note, the table must be kept in order of income)
{
    { income = 0,       multiplier = 1  },
    { income = 10000,   multiplier = 2  },
}

coolingOffPeriodDuration = 4        -- The number of months in the cooling off period before raiding a faction again
coolingOffPeriodRaidFactionWeight =
{
    { numRaids = 1, multiplier = 0.25 },
    { numRaids = 2, multiplier = 0.1 },
    { numRaids = 3, multiplier = 0 },
}

