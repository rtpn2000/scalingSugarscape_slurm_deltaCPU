# Scaling Sugarscape using SLURM on Delta CPU.  

#### Project Overview:  
Python implementation of the Sugarscape agent-based computational model introduced in Growing Artificial Societies (1996) by Epstein and Axtell.  
Inspired by previous work from Herve Lange (https://github.com/langerv/sugarscape) and Joshua Palicka (https://github.com/joshuapalicka/sugarscape).  
This project was completed as part of the course CPSC 5520 - Distributed Systems. 

#### Contributors:  
This project was a collaborative effort with contributions from multiple team members.  

#### Team Members:  
Krishna Koushik Parimi  
Navven Kumar Pallanti

#### Requirements:  
Bash
Python 3
SLURM (for executing the simulation on an NCSA Delta CPU)
TkInter

#### Usage:  
make test

#### Note:  
This implementation is done with headless mode == true (which disables GUI).
Make sure to change the account name from "bcob-delta-cpu" to your account name in slurmgen.sh before executing. 
You can find your account name by running 'accounts' in your terminal.
#SBATCH --account=bcob-delta-cpu

#### Makefile Options:  
make clean
    Clean up working files and logs created by the software.
    Note: This will remove any JSON files created by the other make options.

make data
    Run several random seeds comparing selected decision models.
    Note: Results will be saved in the data subdirectory.

make plots
    Generate graph plots from any JSON files in the data subdirectory.
    Note: Plots are dependent on a dataset existing and will be created if necessary.

make seeds
    Generate a set of random seeds comparing selected decision models.
    Note: Results will be saved in the data subdirectory.

make setup
    Change preconfigured settings for Bash and Python aliases.
    Note: Changed settings may alter the Makefile and configuration file in place.

make test
    By running this simulation it will execute the slurmgen.sh script with config.json as the configuration file and stores a local log in log.json format.

#### Preconfigured Examples from Growing Artificial Societies:  
A selection of examples can be found in the examples directory.
Each demonstrates a concept from the book Growing Artificial Societies.
Examples are included to demonstrate adherence to or deviation from the source material.

immediate_growback.json:
    Agent sugar collection with immediate sugar growback (pgs. 21-26).

constant_growback.json:
    Agent sugar collection with constant sugar growback (pgs. 28-30).

agent_replacement.json:
    Agent replacement with constant sugar growback (pgs. 32-33).

seasonal_migration.json:
    Agent migration with seasonal sugar growback (pgs. 43-45).

pollution_formation.json:
    Agent sugar collection with constant sugar growback and pollution (pgs. 45-50).

reproduction_basic.json:
    Agent reproduction with constant sugar growback (pgs. 55-58).

reproduction_limited.json:
    Agent reproduction with lower infertility age, lower reproduction cost, and constant sugar growback (pgs. 64-66).

reproduction_inheritance.json:
    Agent reproduction with child wealth inheritance and constant sugar growback (pgs. 67-68).

cultural_tagging.json
    Agent cultural tagging with constant sugar growback (pgs. 72-79).

combat_unlimited.json:
    Agent combat with unlimited combat loot and constant sugar growback (pgs. 82-83).

combat_limited.json:
    Agent combat with unlimited combat loot and constant sugar growback (pgs. 86-90).

spice_growback.json:
    Agent sugar and spice collection with constant sugar and spice growback (pgs. 96-99).

trade_basic.json:
    Agent sugar and spice collection with trading and constant sugar and spice growback (pgs. 101-107).

trade_replacement.json:
    Agent trading with agent replacement and constant sugar and spice growback (pgs. 120-122).

trade_pollution.json:
    Agent trading with sugar pollution and constant sugar and spice growback (pgs. 127-129).

foresight_basic.json:
    Agent sugar and spice collection with foresight consideration and constant sugar and spice growback (pgs. 129-130).

lending_basic.json:
    Agent sugar and spice collection with lending and constant sugar and spice growback (pgs. 131-133).

disease_basic.json:
    Agent sugar and spice collection with disease and constant sugar and spice growback (pgs. 141-147).

#### JSON Configuration File Options:  
The simulation provides a default set of options in a dictionary in the sugarscape.py file.
A JSON configuration file can be passed to the simulation, overwriting the default configuration, with the --conf option.

agentAggressionFactor: [float, float]
    Set the aggressiveness of an agent.
    Note: The more aggressive an agent the more likely they will be enticed by combat options.
    Default: [0, 0]

agentBaseInterestRate: [float, float]
    Set the interest rate for an agent's lending as a percentage.
    Default: [0.0, 0.0]

agentDecisionModel: string
    Set the agent decision model for different decision-making.
    Options: "altruisticHalfLookaheadBinary", "altruisticHalfLookaheadTop", "benthamHalfLookaheadBinary", "benthamHalfLookaheadTop", "benthamNoLookaheadBinary", "benthamNoLookaheadTop", "egoisticHalfLookaheadBinary", "egoisticHalfLookaheadTop", "none", "rawSugarscape"
    Default: "none"

agentDecisionModelData: object
    Set additional data for the agent decision model.
    Note: Not currently implemented.

agentDecisionModelFactor: [float, float]
    Set the agent weight of their decision model over biological imperatives.
    Default: [0, 0]

agentFemaleInfertilityAge: [int, int]
    Set the timestep age at which female agents become infertile.
    Default: [0, 0]

agentFemaleFertilityAge: [int, int]
    Set the timestep age at which female agents become fertile.
    Default: [0, 0]

agentFertilityFactor: [float, float]
    Set the fertility bonus for the agent.
    The higher the factor, the fewer resources the agent expends to reproduce.
    Default: [0, 0]

agentImmuneSystemLength: int
    Set the length of agent immune system tags to an integer length.
    Default: 0

agentInheritancePolicy: string
    Set wealth inheritance policy on agent death to the given string.
    Options: "children". "daughters", "friends", "none", "sons"
    Default: "none"

agentLendingFactor: [float, float]
    Set lending aggressiveness of agent.
    The more aggressive an agent is in lending, the higher the offered interest rate will be.
    Default: [0, 0]

agentLoanDuration: [int, int]
    Set the agent's provided loan duration in timesteps.
    Default: [0, 0]

agentLookaheadFactor: [int, int]
    Set the agent's consideration of metabolic costs in timesteps ahead.
    Default: [0, 0]

agentMaleInfertilityAge: [int, int]
    Set the timestep age at which male agents become infertile.
    Default: [0, 0]

agentMaleFertilityAge: [int, int]
    Set the timestep age at which male agents become fertile.
    Default: [0, 0].

agentMaleToFemaleRatio: float
    Set the ratio of males to females in starting population as a real number.
    Default: 1.0

agentMaxAge: [int, int]
    Set maximum agent age in timesteps.
    Note: A value of -1 indicates an infinitely lived agent.
    Default: [-1, -1]

agentMaxFriends: [int, int]
    Set a maximum number of friends tracked by an agent.
    Default: [0, 0]

agentMovement: [int, int]
    Set maximum movement distance per timestep for an agent.
    Default: [1, 6]

agentMovementMode: string
    Set the directionality used to figure out which cells an agent can move to.
    Options: "cardinal", "radial"
    Default: "cardinal"

agentReplacements: int
    Set the maximum number of agents to replace in the environment on agent death.
    Default: 0

agentSelfishnessFactor: [float, float]
    Set the agent weight of how egoistic ethical decisions are
    Note: Valid range is [0.0, 1.0], use -1 to disable
    Default: [-1, -1]

agentSpiceMetabolism: [float, float]
    Set agent metabolism for spice per timestep.
    Default: [0, 0]

agentStartingSpice: [float, float]
    Set agent starting spice hold.
    Default: [0, 0]

agentStartingSugar: [float, float]
    Set agent starting sugar hold.
    Default: [10, 40]

agentStartingQuadrants: [int (, int, int, int)]
    Set quadrant agents will initially be placed.
    Quadrant 1 begins in the top left.
    Quadrant 2 begins in the top right.
    Quadrant 3 begins in the bottom right.
    Quadrant 4 begins in the bottom left.
    Default: [1, 2, 3, 4]

agentSugarMetabolism: [float, float]
    Set agent metabolism for sugar per timestep.
    Default: [1, 4]

agentTagStringLength: int
    Set agent cultural tags string length.
    Default: 0

agentTradeFactor: [float, float]
    Set agent trade aggressiveness.
    Note: The more aggressive in trading an agent, the more resources they will attempt to trade.
    Default: [0, 0]

agentUniversalSpice: [float, float]
    Set the amount agents receive for universal basic spice income.
    Default: [0, 0]

agentUniversalSugar: [float, float]
    Set the amount agents receive for universal basic sugar income. 
    Default: [0, 0]

agentVision: [int, int]
    Set the distance in the four cardinal directions an agent can see.
    Default: [1, 6]

agentVisionMode: string
    Set the directionality used to figure out which cells an agent can see.
    Options: "cardinal", "radial"
    Default: "cardinal"

debugMode: [string, ...]
    Set the debug printing mode.
    Options: "agent", "all", "cell", "disease", "environment", "ethics", "none",  "sugarscape"
    Default: "none"
    Note: Some options may cause no output in the current implementation.
          Can select multiple debug modes simultaneously.

diseaseAggressionPenalty: [float, float]
    Set the impact a disease will have on an agent's aggressiveness.
    Note: Negative values constitute an aggressiveness decrease.
    Default: [0, 0]

diseaseFertilityPenalty: [float, float]
    Set the impact a disease will have on an agent's fertility.
    Note: Negative values constitute a fertility decrease.
    Default: [0, 0]

diseaseMovementPenalty: [int, int]
    Set the impact a disease will have on an agent's movement distance.
    Note: Negative values constitute a decrease in movement range.
    Default: [0, 0]

diseaseSpiceMetabolismPenalty: [float, float]
    Set the impact a disease will have on an agent's spice metabolism rate.
    Note: Negative values constitute a decrease in agent spice metabolism.
    Default: [0, 0]

diseaseSugarMetabolismPenalty: [float, float]
    Set the impact a disease will have on an agent's sugar metabolism rate.
    Note: Negative values constitute a decrease in agent sugar metabolism.
    Default: [0, 0]

diseaseTagStringLength: [int, int]
    Set the length of disease tags.
    The longer the length, the longer an agent will have the disease.
    Default: [0, 0]

diseaseVisionPenalty: [int, int]
    Set the impact a disease will have on an agent's vision.
    Note: Negative values constitute a decrease in agent vision.
    Default: [0, 0]

environmentHeight: int
    Set the height in cells of the Sugarscape environment.
    Default: 50

environmentMaxCombatLoot: float
    Set the maximum reward agents receive from winning combat.
    Default: 0

environmentMaxSpice: int
    Set the maximum amount of spice at any cell in the environment.
    This amount will only be present at spice peaks.
    Default: 0

environmentMaxSugar: int
    Set the maximum amount of sugar in any cell in the environment.
    This amount will only be present at sugar peaks.
    Default: 4

environmentMaxTribes: int
    Set the maximum number of tribes in the starting population.
    Default: 0

environmentPollutionDiffusionDelay: int
    Set the delay interval in timesteps when pollution is diffused across the environment.
    Default: 0

environmentSeasonalGrowbackDelay: int
    Set the delay interval in timesteps when resources are regrown when the cell is in a dry season.
    Default: 0

environmentSeasonInterval: int
    Set the interval in timesteps when environment seasons change.
    Seasons change along the equator of the environment.
    Default: 0

environmentSpiceConsumptionPollutionFactor: float
    Set the amount of pollution generated by an agent consuming spice in a cell.
    Default: 0

environmentSpiceProductionPollutionFactor: float
    Set the amount of pollution generated by an agent collecting spice in a cell.
    Default: 0

environmentSpiceRegrowRate: int
    Set the amount of spice regrown across the environment per timestep.
    Each cell can only grow up to its maximum spice value.
    Default: 0

environmentSugarConsumptionPollutionFactor: float
    Set the amount of pollution generated by an agent consuming sugar in a cell.
    Default: 0

environmentSugarProductionPollutionFactor: float
    Set the amount of pollution generated by an agent collecting sugar in a cell.
    Default: 0

environmentSugarRegrowRate: int
    Set the amount of sugar regrown across the environment per timestep.
    Each cell can only grow up to its maximum sugar value.
    Default: 1

environmentUniversalSpiceIncomeInterval: int
    Set the interval in timesteps when the environment produces universal basic spice income.
    Default: 0

environmentUniversalSugarIncomeInterval: int
    Set the interval in timesteps when the environment produces universal basic sugar income.
    Default: 0

environmentWidth: int
    Set the width in cells of the Sugarscape environment.
    Default: 50

headlessMode: bool
    Set whether the GUI is enabled.
    Default: false

interfaceHeight: int
    Set the number of pixels for GUI height.
    Note: Values below zero will cause the interface to fit to 1/2 total display height.
    Default: 1000

interfaceWidth: int
    Set the number of pixels for GUI width.
    Default: 900
    Note: Values below zero will cause the interface to fit to 1/2 total display width.

logfile: path
    Set the path of the log file.
    Default: ""

profileMode: bool
    Set whether performance profiling mode is enabled.
    Default: false

seed: int
    Set the seed value for the random number generator.
    Note: A value of -1 causes the simulation to generate a random seed.
    Note: Reusing a seed ensures deterministic simulation outcomes.
    Default: -1

startingAgents: int
    Set the number of agents placed in the initial population.
    Default: 500

startingDiseases: int
    Set the number of diseases placed in the initial population.
    Default: 0

timesteps: int
    Set the number of timesteps the simulation runs.
    Note: A value of -1 causes the simulation to run forever or until there are no more living agents.
    Default: 200

Other JSON Configurable Options:
bashAlias: string
    Set the alias to the local Bash installation.
    Note: Bash is required to run the data collection.
    Default: "bash"

decisionModels: [string, ...]
    Set the decision models (ethical theories) to be tested in data collection.
    Default: ["benthamHalfLookaheadBinary", "egoisticHalfLookaheadBinary", "rawSugarscape"]

jobUpdateFrequency: int
    Set the frequency at which the number of remaining jobs is reported.
    Default: 5

numParallelSimJobs: int
    Set the number of simulations to run in parallel during data collection.
    Default: 1

numSeeds: int
    Set the number of random seeds to be tested in data collection.
    Default: 100

plots: [string, ...]
    Set the plots to be created once data has been collected.
    Default: ["population", "meanttl", "starvationCombat", "wealth", "wealthNormalized"]

plotTimesteps: int
    Set the number of timesteps to plot in graphs as the X axis.
    Note: This option does not control how many timesteps the simulation runs.
    Default: 1000

pythonAlias: string
    Set the alias to the local Python 3 installation.
    Note: Python 3 is required to run the simulation.
    Default: "python"
