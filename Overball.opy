#Global variables

globalvar Ball 0
globalvar __currentMap___ 1
globalvar Ball2 2
globalvar Team1GoalEffect 3
globalvar Team2GoalEffect 4
globalvar MapPositions 5
globalvar MapCenter 7
globalvar BallEffect 8
globalvar IsBallPickedUp 9
globalvar BallPosition 10
globalvar CurrentBallHolder 11
globalvar LastBallHolder 12
globalvar Assister 13
globalvar AssembleHeroTimerConstant 14
globalvar BallColor 15
globalvar HasGoalBeenScored 16
globalvar I 17
globalvar CameraPositionOnGoalScored 18
globalvar Team1Goals 19
globalvar Team2Goals 20
globalvar GoalsToWin 23
globalvar MinutesOnTimer 24
globalvar TensOnTimer 26
globalvar SecondsOnTimer 27
globalvar TimerStarted 28
globalvar TimerHud 29
globalvar __currentMap____ 30


#Player variables

playervar IsBallPickUpable 0
playervar Goals 1
playervar Assists 2
playervar BallIcon 4
playervar ArrowColor 5


rule "OverPy Map Detection":
    if getCurrentMap() in [Map.AYUTTHAYA, Map.ANTARCTIC_PENINSULA, Map.BLACK_FOREST, Map.BLACK_FOREST, Map.BLIZZ_WORLD, Map.BLIZZ_WORLD, Map.BUSAN, Map.BUSAN, Map.BUSAN, Map.CASTILLO, Map.CHATEAU_GUILLARD, Map.CHATEAU_GUILLARD, Map.CIRCUIT_ROYAL, Map.COLOSSEO, Map.DORADO, Map.ECOPOINT_ANTARCTICA, Map.ECOPOINT_ANTARCTICA, Map.EICHENWALDE, Map.EICHENWALDE, Map.ESPERANCA, Map.HANAMURA, Map.HANAMURA, Map.HAVANA, Map.HOLLYWOOD, Map.HOLLYWOOD, Map.HORIZON_LUNAR_COLONY, Map.ILIOS, Map.ILIOS, Map.ILIOS, Map.ILIOS, Map.JUNKENSTEIN, Map.JUNKERTOWN, Map.KANEZAKA, Map.KINGS_ROW, Map.KINGS_ROW, Map.LIJIANG_CONTROL_CENTER, Map.LIJIANG_CONTROL_CENTER, Map.LIJIANG_GARDEN, Map.LIJIANG_GARDEN, Map.LIJIANG_NIGHT_MARKET, Map.LIJIANG_NIGHT_MARKET, Map.LIJIANG_TOWER, Map.LIJIANG_TOWER, Map.MALEVENTO, Map.MIDTOWN, Map.NECROPOLIS, Map.NEPAL, Map.NEPAL, Map.NEPAL, Map.NEPAL, Map.NEPAL, Map.NEW_QUEEN_STREET, Map.OASIS, Map.OASIS, Map.OASIS, Map.OASIS, Map.PARAISO, Map.PARIS, Map.PETRA, Map.PRACTICE_RANGE, Map.RIALTO, Map.ROUTE66, Map.TEMPLE_OF_ANUBIS, Map.VOLSKAYA, Map.WATCHPOINT_GIBRALTAR, Map.WORKSHOP_CHAMBER, Map.WORKSHOP_EXPANSE, Map.WORKSHOP_EXPANSE, Map.WORKSHOP_GREEN_SCREEN, Map.WORKSHOP_ISLAND, Map.WORKSHOP_ISLAND, Map.SHAMBALI_MONASTERY]:
        __currentMap___ = getCurrentMap()
        return
    __currentMap___ = raycast(vect(500, 100, 500), vect(-500, -100, -500), null, null, false).getHitPosition()
    if __currentMap___ == vect(0, 0, 0) or __currentMap___ == vect(-500, -100, -500):
        __currentMap___ = raycast(vect(30, 5, 0), vect(-30, -10, -10), null, null, false).getHitPosition()
        if __currentMap___ == vect(-30, -10, -10):
            __currentMap___ = raycast(vect(200, 20, 100), vect(100, -100, -100), null, null, false).getHitPosition()
            if __currentMap___ == vect(100, -100, -100):
                __currentMap___ = raycast(vect(300, 20, -100), vect(300, -100, 100), null, null, false).getHitPosition()
                if __currentMap___ == vect(300, -100, 100):
                    __currentMap___ = raycast(vect(50, 100, -150), vect(-50, -100, -160), null, null, false).getHitPosition()
                    if __currentMap___ == vect(-50, -100, -160):
                        __currentMap___ = raycast(vect(0, 300, 340), vect(0, -100, -300), null, null, false).getHitPosition()
                        if __currentMap___ == vect(0, -100, -300):
                            __currentMap___ = raycast(vect(140, 10, -240), vect(200, -10, -300), null, null, false).getHitPosition()
                            if __currentMap___ == vect(200, -10, -300):
                                __currentMap___ = raycast(vect(-180, 30, 60), vect(-180, -50, -60), null, null, false).getHitPosition()
    __currentMap___ = 100 * ceil(__currentMap___.y) + 10 * round(__currentMap___.x) + floor(__currentMap___.z)
    if __currentMap___ == 10121:
        __currentMap___ = raycast(vect(-60, 20, -60), vect(60, -10, 60), null, null, false).getHitPosition()
        if __currentMap___ == vect(60, -10, 60):
            __currentMap___ = raycast(vect(-180, -70, 60), vect(-180, -100, -60), null, null, false).getHitPosition()
        __currentMap___ = 100 * ceil(__currentMap___.y) + 10 * round(__currentMap___.x) + floor(__currentMap___.z)


rule "OverPy Map Detection":
    if __currentMap___ in [Map.AYUTTHAYA, Map.ANTARCTIC_PENINSULA, Map.BLACK_FOREST, Map.BLACK_FOREST, Map.BLIZZ_WORLD, Map.BLIZZ_WORLD, Map.BUSAN, Map.BUSAN, Map.BUSAN, Map.CASTILLO, Map.CHATEAU_GUILLARD, Map.CHATEAU_GUILLARD, Map.CIRCUIT_ROYAL, Map.COLOSSEO, Map.DORADO, Map.ECOPOINT_ANTARCTICA, Map.ECOPOINT_ANTARCTICA, Map.EICHENWALDE, Map.EICHENWALDE, Map.ESPERANCA, Map.HANAMURA, Map.HANAMURA, Map.HAVANA, Map.HOLLYWOOD, Map.HOLLYWOOD, Map.HORIZON_LUNAR_COLONY, Map.ILIOS, Map.ILIOS, Map.ILIOS, Map.ILIOS, Map.JUNKENSTEIN, Map.JUNKERTOWN, Map.KANEZAKA, Map.KINGS_ROW, Map.KINGS_ROW, Map.LIJIANG_CONTROL_CENTER, Map.LIJIANG_CONTROL_CENTER, Map.LIJIANG_GARDEN, Map.LIJIANG_GARDEN, Map.LIJIANG_NIGHT_MARKET, Map.LIJIANG_NIGHT_MARKET, Map.LIJIANG_TOWER, Map.LIJIANG_TOWER, Map.MALEVENTO, Map.MIDTOWN, Map.NECROPOLIS, Map.NEPAL, Map.NEPAL, Map.NEPAL, Map.NEPAL, Map.NEPAL, Map.NEW_QUEEN_STREET, Map.OASIS, Map.OASIS, Map.OASIS, Map.OASIS, Map.PARAISO, Map.PARIS, Map.PETRA, Map.PRACTICE_RANGE, Map.RIALTO, Map.ROUTE66, Map.TEMPLE_OF_ANUBIS, Map.VOLSKAYA, Map.WATCHPOINT_GIBRALTAR, Map.WORKSHOP_CHAMBER, Map.WORKSHOP_EXPANSE, Map.WORKSHOP_EXPANSE, Map.WORKSHOP_GREEN_SCREEN, Map.WORKSHOP_ISLAND, Map.WORKSHOP_ISLAND, Map.SHAMBALI_MONASTERY]:
        __currentMap____ = __currentMap___
        return
    __currentMap____ = raycast(vect(500, 100, 500), vect(-500, -100, -500), null, null, false).getHitPosition()
    if __currentMap____ == vect(0, 0, 0) or __currentMap____ == vect(-500, -100, -500):
        __currentMap____ = raycast(vect(30, 5, 0), vect(-30, -10, -10), null, null, false).getHitPosition()
        if __currentMap____ == vect(-30, -10, -10):
            __currentMap____ = raycast(vect(200, 20, 100), vect(100, -100, -100), null, null, false).getHitPosition()
            if __currentMap____ == vect(100, -100, -100):
                __currentMap____ = raycast(vect(300, 20, -100), vect(300, -100, 100), null, null, false).getHitPosition()
                if __currentMap____ == vect(300, -100, 100):
                    __currentMap____ = raycast(vect(50, 100, -150), vect(-50, -100, -160), null, null, false).getHitPosition()
                    if __currentMap____ == vect(-50, -100, -160):
                        __currentMap____ = raycast(vect(0, 300, 340), vect(0, -100, -300), null, null, false).getHitPosition()
                        if __currentMap____ == vect(0, -100, -300):
                            __currentMap____ = raycast(vect(140, 10, -240), vect(200, -10, -300), null, null, false).getHitPosition()
                            if __currentMap____ == vect(200, -10, -300):
                                __currentMap____ = raycast(vect(-180, 30, 60), vect(-180, -50, -60), null, null, false).getHitPosition()
    __currentMap____ = 100 * ceil(__currentMap____.y) + 10 * round(__currentMap____.x) + floor(__currentMap____.z)
    if __currentMap____ == 10121:
        __currentMap____ = raycast(vect(-60, 20, -60), vect(60, -10, 60), null, null, false).getHitPosition()
        if __currentMap____ == vect(60, -10, 60):
            __currentMap____ = raycast(vect(-180, -70, 60), vect(-180, -100, -60), null, null, false).getHitPosition()
        __currentMap____ = 100 * ceil(__currentMap____.y) + 10 * round(__currentMap____.x) + floor(__currentMap____.z)


rule "Initialize global variables":
    IsBallPickedUp = false
    AssembleHeroTimerConstant = 10
    BallColor = Color.TURQUOISE
    HasGoalBeenScored = false
    I = 0
    Team1Goals = 0
    Team2Goals = 0
    MinutesOnTimer = 10
    TensOnTimer = 0
    SecondsOnTimer = 0
    TimerStarted = false


rule "Initialize player variables":
    @Event eachPlayer
    
    eventPlayer.IsBallPickUpable = false
    eventPlayer.ArrowColor = Color.WHITE


rule "Initialise Map Locations":
    if __currentMap____ == Map.ILIOS and getCurrentObjective() == 2:
        MapPositions = vect(4.58, 61.54, -178.27)
        MapPositions = MapPositions.concat(vect(-5.78, 61.54, -146.79))
        MapPositions = MapPositions.concat(vect(63.68, 61.54, -146.65))
        MapPositions = MapPositions.concat(vect(53.34, 61.54, -177.56))
        MapPositions = MapPositions.concat(vect(95, 63, -156.5))
        MapPositions = MapPositions.concat(vect(-37, 63, -156.5))
        MapPositions = MapPositions.concat(vect(116.19, 61.54, -159.01))
        MapPositions = MapPositions.concat(vect(-58.49, 61.54, -158.87))
        MapCenter = vect(28.25, 58.62, -157.29)
    if __currentMap____ == Map.NEPAL and getCurrentObjective() == 2:
        MapPositions = vect(104.37, 129.25, 0.029)
        MapPositions = MapPositions.concat(vect(56.955, 129.25, -24.005))
        MapPositions = MapPositions.concat(vect(56.913, 129.25, 24.033))
        MapPositions = MapPositions.concat(vect(0, 0, 0))
        MapPositions = MapPositions.concat(vect(80.973, 132.05, -48.138))
        MapPositions = MapPositions.concat(vect(80.979, 132.05, 47.977))
        MapPositions = MapPositions.concat(vect(81.692, 131.05, -69.271))
        MapPositions = MapPositions.concat(vect(81.137, 131.05, 70.557))
        MapCenter = vect(83.273, 129.7, 0.03)
    if __currentMap____ == Map.BUSAN and getCurrentObjective() == 0:
        MapCenter = vect(51.853, 7.348, -92.651)
        MapPositions = vect(19.455, 14.348, -109.096)
        MapPositions = MapPositions.concat(vect(45.843, 11.348, -117.135))
        MapPositions = MapPositions.concat(vect(58.057, 11.348, -117.169))
        MapPositions = MapPositions.concat(vect(84.106, 14.348, -109.167))
        MapPositions = MapPositions.concat(vect(9.582, 16.946, -125.565))
        MapPositions = MapPositions.concat(vect(93.601, 16.649, -125.578))
        MapPositions = MapPositions.concat(vect(-6.489, 17.283, -125.451))
        MapPositions = MapPositions.concat(vect(107.939, 17.283, -125.774))
    if __currentMap____ == Map.ILIOS and getCurrentObjective() == 0:
        MapCenter = vect(357.379, -24.464, -51.101)
        MapPositions = vect(338.886, -22.502, -33.726)
        MapPositions = MapPositions.concat(vect(331.662, -22.488, -51.337))
        MapPositions = MapPositions.concat(vect(63.68, 61.54, -146.65))
        MapPositions = MapPositions.concat(vect(53.34, 61.54, -177.56))
        MapPositions = MapPositions.concat(vect(350.499, -21.806, 10.814))
        MapPositions = MapPositions.concat(vect(307.351, -22.025, -90.265))
        MapPositions = MapPositions.concat(vect(332.107, -24.48, 28.34))
        MapPositions = MapPositions.concat(vect(284.292, -24.468, -86.981))
    if __currentMap____ == Map.LIJIANG_TOWER and getCurrentObjective() == 0:
        MapCenter = vect(1, -2, -60)
        MapPositions = vect(33.711, 1.212, -28.007)
        MapPositions = MapPositions.concat(vect(900, 900, 900))
        MapPositions = MapPositions.concat(vect(900, 900, 900))
        MapPositions = MapPositions.concat(vect(-31.71, 1.212, -27.463))
        MapPositions = MapPositions.concat(vect(43.205, 3.352, -29.162))
        MapPositions = MapPositions.concat(vect(-40.992, 3.352, -29.164))
        MapPositions = MapPositions.concat(vect(62.616, 3.352, -33.501))
        MapPositions = MapPositions.concat(vect(-61.764, 3.352, -32.17))
    if __currentMap____ == Map.OASIS and getCurrentObjective() == 0:
        MapCenter = vect(143.5, 2, 247.5)
        MapPositions = vect(900, 900, 900)
        MapPositions = MapPositions.concat(vect(900, 900, 900))
        MapPositions = MapPositions.concat(vect(900, 900, 900))
        MapPositions = MapPositions.concat(vect(900, 900, 900))
        MapPositions = MapPositions.concat(vect(121, 5, 295))
        MapPositions = MapPositions.concat(vect(191, 5, 225.5))
        MapPositions = MapPositions.concat(vect(100, 1, 300))
        MapPositions = MapPositions.concat(vect(200, 1, 200))


rule "Match Settings":
    AssembleHeroTimerConstant = createWorkshopSetting(int[-2147483648:2147483647], "Match Settings", "Assemble Heroes Timer", 10, 0)
    GoalsToWin = createWorkshopSetting(int[-2147483648:2147483647], "Match Settings", "Goals To Win", 5, 0)
    MinutesOnTimer = createWorkshopSetting(int[-2147483648:2147483647], "Match Settings", "Minutes on Timer", 10, 0)


rule "Startup":
    disableScoring()
    disableGamemodeCompletion()


rule "Timer":
    @Condition TimerStarted == true
    
    hudText(getAllPlayers(), "{0}:{1}{2}".format(MinutesOnTimer, TensOnTimer, SecondsOnTimer), "", "", HudPosition.TOP, -1, Color.WHITE, Color.WHITE, Color.WHITE, HudReeval.STRING, SpecVisibility.ALWAYS)
    TimerHud = getLastCreatedText()
    while true:
        if SecondsOnTimer < 0 and TensOnTimer == 0 and MinutesOnTimer > 0:
            MinutesOnTimer -= 1
            TensOnTimer = 5
            SecondsOnTimer = 9
        if SecondsOnTimer < 0 and TensOnTimer > 0:
            TensOnTimer -= 1
            SecondsOnTimer = 9
        wait(1)
        SecondsOnTimer -= 1


rule "Timer ends":
    @Condition MinutesOnTimer == 0
    @Condition SecondsOnTimer == 0
    @Condition TensOnTimer == 0
    
    destroyHudText(TimerHud)
    if Team1Goals > Team2Goals:
        Ball.teleport(vect(10000, 10000, 10000))
        getAllPlayers().respawn()
        getAllPlayers().startForcingThrottle(0, 0, 0, 0, 0, 0)
        setSlowMotion(10)
        getAllPlayers().startCamera(MapCenter + vect(-8, 2, 0), MapCenter, 0)
        bigMessage(getPlayers(Team.1), "{0}!".format("You Win"))
        bigMessage(getPlayers(Team.2), "{0}!".format("You Lose"))
        getPlayersInSlot(0, Team.1).teleport(MapCenter + vect(0, 0, -2))
        getPlayersInSlot(1, Team.1).teleport(MapCenter + vect(0, 0, -1))
        getPlayersInSlot(2, Team.1).teleport(MapCenter + vect(0, 0, 0))
        getPlayersInSlot(3, Team.1).teleport(MapCenter + vect(0, 0, 1))
        getPlayersInSlot(4, Team.1).teleport(MapCenter + vect(0, 0, 2))
        declareTeamVictory(Team.1)
    elif Team2Goals > Team1Goals:
        getAllPlayers().startCamera(MapCenter + vect(-8, 2, 0), MapCenter, 0)
        Ball.teleport(vect(10000, 10000, 10000))
        getAllPlayers().respawn()
        getAllPlayers().startForcingThrottle(0, 0, 0, 0, 0, 0)
        setSlowMotion(10)
        bigMessage(getPlayers(Team.1), "{0}!".format("You Lose"))
        bigMessage(getPlayers(Team.2), "{0}!".format("You Win"))
        getPlayersInSlot(0, Team.2).teleport(MapCenter + vect(0, 0, -2))
        getPlayersInSlot(1, Team.2).teleport(MapCenter + vect(0, 0, -1))
        getPlayersInSlot(2, Team.2).teleport(MapCenter + vect(0, 0, 0))
        getPlayersInSlot(3, Team.2).teleport(MapCenter + vect(0, 0, 1))
        getPlayersInSlot(4, Team.2).teleport(MapCenter + vect(0, 0, 2))
        declareTeamVictory(Team.2)
    else:
        bigMessage(getAllPlayers(), "NEXT GOAL WINS!")
        Team1Goals = GoalsToWin - 1
        Team2Goals = GoalsToWin - 1


rule "When Bots spawns/Spawn Ball":
    @Condition isGameInProgress() == true
    @Condition isAssemblingHeroes() == false
    @Condition isMatchBetweenRounds() == false
    @Condition isInSetup() == false
    
    createDummy(Hero.TORBJORN, Team.1, 5, MapCenter, vect(0, 0, 0))
    createDummy(Hero.TORBJORN, Team.2, 5, MapCenter, vect(0, 0, 0))
    Ball = getPlayersInSlot(5, Team.1)
    Ball2 = getPlayersInSlot(5, Team.2)
    Ball.teleport(MapCenter)
    Ball2.teleport(MapCenter)
    createEffect(getAllPlayers(), Effect.SPHERE, BallColor, Ball.getPosition() + vect(0, 1, 0), 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    BallEffect = getLastCreatedEntity()
    getPlayersInSlot(5, Team.ALL).setStatusEffect(null, Status.STUNNED, 9999)
    getPlayersInSlot(5, Team.ALL).setStatusEffect(null, Status.PHASED_OUT, 9999)
    Ball.setInvisibility(Invis.ALL)
    Ball2.setInvisibility(Invis.ALL)
    BallPosition = Ball.getPosition()
    chase(BallPosition, Ball.getPosition(), rate=999999, ChaseReeval.DESTINATION_AND_RATE)
    TimerStarted = true
    wait(3)
    getAllPlayers().IsBallPickUpable = true


rule "On Player Move/join":
    @Event playerJoined
    @Condition isGameInProgress() == true
    
    wait(5)
    eventPlayer.IsBallPickUpable = true


rule "On Player leaves/moves with ball":
    @Event playerLeft
    @Condition isGameInProgress() == true
    @Condition CurrentBallHolder == eventPlayer
    
    Assister = null
    CurrentBallHolder = null
    IsBallPickedUp = false
    Ball.teleport(eventPlayer.getPosition() + Vector.UP)
    Ball2.teleport(eventPlayer.getPosition() + Vector.UP)
    chase(BallPosition, Ball.getPosition() + eventPlayer.getFacingDirection() + vect(0, 1, 0), rate=9999, ChaseReeval.DESTINATION_AND_RATE)
    destroyEffect(BallEffect)
    createEffect(getAllPlayers(), Effect.SPHERE, BallColor, BallPosition, 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    BallEffect = getLastCreatedEntity()


rule "Spawn Goals":
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.TEAM_1, MapPositions[4], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    Team1GoalEffect = getLastCreatedEntity()
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.TEAM_2, MapPositions[5], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    Team2GoalEffect = getLastCreatedEntity()


rule "Create jump pads":
    createEffect(getAllPlayers(), Effect.RING, Color.GREEN, MapPositions[0], 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.RING, Color.GREEN, MapPositions[1], 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.RING, Color.GREEN, MapPositions[2], 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.RING, Color.GREEN, MapPositions[3], 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)


rule "Picking up the ball":
    @Event eachPlayer
    @Condition eventPlayer != Ball
    @Condition eventPlayer != Ball2
    @Condition IsBallPickedUp == false
    @Condition eventPlayer.isInSpawnRoom() == false
    @Condition distance(eventPlayer, Ball.getPosition()) <= 1.75
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isInSpawnRoom() == false
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.IsBallPickUpable == true
    @Condition Hero.TORBJORN == getPlayersInSlot(5, Team.1).getCurrentHero()
    @Condition Hero.TORBJORN == getPlayersInSlot(5, Team.2).getCurrentHero()
    @Condition isAssemblingHeroes() == false
    
    BallPosition = eventPlayer.getPosition()
    chase(BallPosition, eventPlayer.getPosition() + eventPlayer.getFacingDirection() + vect(0, 1, 0), rate=99999, ChaseReeval.DESTINATION_AND_RATE)
    destroyEffect(BallEffect)
    createEffect(getAllPlayers(), Effect.SPHERE, BallColor, BallPosition, 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    BallEffect = getLastCreatedEntity()
    eventPlayer.IsBallPickUpable = false
    IsBallPickedUp = true
    playEffect(eventPlayer, DynamicEffect.BUFF_IMPACT_SOUND, Color.AQUA, eventPlayer.getPosition(), 30)
    eventPlayer.setStatusEffect(null, Status.HACKED, 9999)
    CurrentBallHolder = eventPlayer
    LastBallHolder = eventPlayer
    eventPlayer.forceButtonPress(Button.ABILITY_1)


rule "Throwing ball":
    @Event eachPlayer
    @Condition eventPlayer != Ball
    @Condition eventPlayer != Ball2
    @Condition CurrentBallHolder == eventPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    Ball.teleport(eventPlayer.getPosition() + eventPlayer.getFacingDirection() + vect(0, 1.5, 0))
    Ball2.teleport(eventPlayer.getPosition() + eventPlayer.getFacingDirection() + vect(0, 1.5, 0))
    destroyEffect(BallEffect)
    chase(BallPosition, Ball.getPosition(), rate=9999, ChaseReeval.DESTINATION_AND_RATE)
    createEffect(getAllPlayers(), Effect.SPHERE, BallColor, BallPosition + vect(0, 0.5, 0), 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    BallEffect = getLastCreatedEntity()
    Ball.applyImpulse(eventPlayer.getFacingDirection(), 35, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    Ball2.applyImpulse(eventPlayer.getFacingDirection(), 35, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    IsBallPickedUp = false
    CurrentBallHolder = null
    wait(1.5)
    eventPlayer.IsBallPickUpable = true
    eventPlayer.clearStatusEffect(Status.HACKED)
    eventPlayer.clearStatusEffect(Status.HACKED)
    Assister = eventPlayer


rule "ball off edge":
    @Event playerDied
    @Condition (eventPlayer == Ball or eventPlayer == Ball2) == true
    
    CurrentBallHolder = null
    Ball.respawn()
    Ball.teleport(MapCenter)
    Ball2.respawn()
    Ball2.teleport(MapCenter)
    chase(BallPosition, eventPlayer.getPosition() + eventPlayer.getFacingDirection() + vect(0, 1, 0), rate=9999, ChaseReeval.DESTINATION_AND_RATE)
    destroyEffect(BallEffect)
    createEffect(getAllPlayers(), Effect.SPHERE, BallColor, BallPosition, 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    BallEffect = getLastCreatedEntity()


rule "Death with ball":
    @Event playerDied
    @Condition eventPlayer == CurrentBallHolder
    
    Assister = null
    CurrentBallHolder = null
    IsBallPickedUp = false
    Ball.teleport(eventPlayer.getPosition() + Vector.UP)
    Ball2.teleport(eventPlayer.getPosition() + Vector.UP)
    chase(BallPosition, Ball.getPosition() + eventPlayer.getFacingDirection() + vect(0, 1, 0), rate=9999, ChaseReeval.DESTINATION_AND_RATE)
    destroyEffect(BallEffect)
    createEffect(getAllPlayers(), Effect.SPHERE, BallColor, BallPosition, 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    BallEffect = getLastCreatedEntity()
    eventPlayer.clearStatusEffect(Status.HACKED)
    eventPlayer.clearStatusEffect(Status.HACKED)
    eventPlayer.IsBallPickUpable = true


rule "Team 2 Scores":
    @Condition distance(Ball, MapPositions[4]) <= 1.5
    @Condition isGameInProgress() == true
    @Condition IsBallPickedUp == false
    
    HasGoalBeenScored = true
    Ball.teleport(vect(1000, 1000, 1000))
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.WHITE, MapPositions[4], 100)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.PURPLE, MapPositions[4], 1)
    setSlowMotion(10)
    getAllPlayers().startCamera(CameraPositionOnGoalScored, LastBallHolder.getPosition() + vect(0, 1, 0), 10)
    if LastBallHolder.getTeam() == Team.1:
        bigMessage(getAllPlayers(), "{0} {1}".format(LastBallHolder, "Scored An Own Goal!"))
    else:
        bigMessage(getAllPlayers(), "{0} {1}".format(LastBallHolder, "Scored a Goal!"))
    if Assister.getTeam() == Team.2 and Assister != null:
        smallMessage(getAllPlayers(), "{0} {1}".format(Assister, "Assisted!"))
    wait(0.75)
    setSlowMotion(100)
    HasGoalBeenScored = false
    getAllPlayers().respawn()
    Ball.teleport(MapPositions[6])
    Ball2.teleport(MapPositions[6])
    getAllPlayers().stopCamera()
    LastBallHolder.Goals += 1
    Team2Goals += 1
    Assister.Assists += 1


rule "Team 1 Scores":
    @Condition distance(Ball, MapPositions[5]) <= 1.5
    @Condition isGameInProgress() == true
    @Condition IsBallPickedUp == false
    
    I = 0
    HasGoalBeenScored = true
    Ball.teleport(vect(1000, 1000, 1000))
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.WHITE, MapPositions[5], 100)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.PURPLE, MapPositions[5], 1)
    setSlowMotion(10)
    getAllPlayers().startCamera(CameraPositionOnGoalScored, LastBallHolder.getPosition() + vect(0, 1, 0), 10)
    if LastBallHolder.getTeam() == Team.2:
        bigMessage(getAllPlayers(), "{0} {1}".format(LastBallHolder, "Scored An Own Goal!"))
    else:
        bigMessage(getAllPlayers(), "{0} {1}".format(LastBallHolder, "Scored a Goal!"))
    if Assister.getTeam() == Team.1 and Assister != null:
        smallMessage(getAllPlayers(), "{0} {1}".format(Assister, "Assisted!"))
    wait(0.75)
    setSlowMotion(100)
    HasGoalBeenScored = false
    getAllPlayers().respawn()
    Ball.teleport(MapPositions[7])
    Ball2.teleport(MapPositions[7])
    getAllPlayers().stopCamera()
    LastBallHolder.Goals += 1
    Team1Goals += 1


rule "Scoreboard - Goals for Team 1":
    hudText(getPlayers(Team.1), "", "", "My Team {0} - {1} Enemy Team".format(Team1Goals, Team2Goals), HudPosition.TOP, 0, Color.GREEN, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)


rule "Scoreboard - Goals for Team 2":
    hudText(getPlayers(Team.2), "", "", "My Team {0} - {1} Enemy Team".format(Team2Goals, Team1Goals), HudPosition.TOP, 0, Color.GREEN, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)


rule "Icon for player holding ball":
    @Event eachPlayer
    @Condition IsBallPickedUp == true
    @Condition CurrentBallHolder != eventPlayer
    
    if eventPlayer.getTeam() == CurrentBallHolder.getTeam():
        if eventPlayer.getTeam() == Team.1:
            eventPlayer.ArrowColor = Color.TEAM_1
        else:
            eventPlayer.ArrowColor = Color.TEAM_2
    else:
        if eventPlayer.getTeam() == Team.1:
            eventPlayer.ArrowColor = Color.TEAM_2
        else:
            eventPlayer.ArrowColor = Color.TEAM_1
    destroyIcon(eventPlayer.BallIcon)
    createIcon(eventPlayer, CurrentBallHolder + vect(0, 2, 0), Icon.ARROW_DOWN, IconReeval.POSITION_AND_COLOR, eventPlayer.ArrowColor, true)
    eventPlayer.BallIcon = getLastCreatedEntity()


rule "icon for ball on ground":
    @Event eachPlayer
    @Condition IsBallPickedUp == false
    @Condition isGameInProgress() == true
    
    eventPlayer.ArrowColor = Color.WHITE
    destroyIcon(eventPlayer.BallIcon)
    createIcon(eventPlayer, BallPosition + vect(0, 1, 0), Icon.ARROW_DOWN, IconReeval.VISIBILITY_POSITION_AND_COLOR, eventPlayer.ArrowColor, true)
    eventPlayer.BallIcon = getLastCreatedEntity()


rule "icon while held":
    @Event eachPlayer
    @Condition IsBallPickedUp == true
    @Condition CurrentBallHolder == eventPlayer
    
    destroyIcon(eventPlayer.BallIcon)


rule "Icon for team 1 goal":
    @Event eachPlayer
    @Condition eventPlayer.getTeam() == Team.2
    
    createIcon(eventPlayer, MapPositions[4], Icon.FLAG, IconReeval.VISIBILITY_POSITION_AND_COLOR, Color.RED, true)


rule "Icon for team 2 goal":
    @Event eachPlayer
    @Condition eventPlayer.getTeam() == Team.1
    
    createIcon(eventPlayer, MapPositions[5], Icon.FLAG, IconReeval.VISIBILITY_POSITION_AND_COLOR, Color.RED, true)


rule "Winning Team 1":
    @Condition Team1Goals >= GoalsToWin
    
    Ball.teleport(vect(10000, 10000, 10000))
    getAllPlayers().respawn()
    getAllPlayers().startForcingThrottle(0, 0, 0, 0, 0, 0)
    setSlowMotion(10)
    getAllPlayers().startCamera(MapCenter + vect(-8, 2, 0), MapCenter, 0)
    bigMessage(getPlayers(Team.1), "{0}!".format("You Win"))
    bigMessage(getPlayers(Team.2), "{0}!".format("You Lose"))
    getPlayersInSlot(0, Team.1).teleport(MapCenter + vect(0, 0, -2))
    getPlayersInSlot(1, Team.1).teleport(MapCenter + vect(0, 0, -1))
    getPlayersInSlot(2, Team.1).teleport(MapCenter + vect(0, 0, 0))
    getPlayersInSlot(3, Team.1).teleport(MapCenter + vect(0, 0, 1))
    getPlayersInSlot(4, Team.1).teleport(MapCenter + vect(0, 0, 2))
    declareTeamVictory(Team.1)


rule "Winning Team 2":
    @Condition Team2Goals >= GoalsToWin
    
    getAllPlayers().startCamera(MapCenter + vect(-8, 2, 0), MapCenter, 0)
    Ball.teleport(vect(10000, 10000, 10000))
    getAllPlayers().respawn()
    getAllPlayers().startForcingThrottle(0, 0, 0, 0, 0, 0)
    setSlowMotion(10)
    bigMessage(getPlayers(Team.1), "{0}!".format("You Lose"))
    bigMessage(getPlayers(Team.2), "{0}!".format("You Win"))
    getPlayersInSlot(0, Team.2).teleport(MapCenter + vect(0, 0, -2))
    getPlayersInSlot(1, Team.2).teleport(MapCenter + vect(0, 0, -1))
    getPlayersInSlot(2, Team.2).teleport(MapCenter + vect(0, 0, 0))
    getPlayersInSlot(3, Team.2).teleport(MapCenter + vect(0, 0, 1))
    getPlayersInSlot(4, Team.2).teleport(MapCenter + vect(0, 0, 2))
    declareTeamVictory(Team.2)


rule "Jumppad":
    @Event eachPlayer
    @Condition distance(eventPlayer, MapPositions[0]) <= 2
    
    eventPlayer.applyImpulse(Vector.UP, 20, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.WHITE, eventPlayer, 100)


rule "Jumppad 2":
    @Event eachPlayer
    @Condition distance(eventPlayer, MapPositions[1]) <= 2
    
    eventPlayer.applyImpulse(Vector.UP, 20, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.WHITE, eventPlayer, 100)


rule "Jumppad 3":
    @Event eachPlayer
    @Condition distance(eventPlayer, MapPositions[2]) <= 2
    
    eventPlayer.applyImpulse(Vector.UP, 20, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.WHITE, eventPlayer, 100)


rule "Jumppad 4":
    @Event eachPlayer
    @Condition distance(eventPlayer, MapPositions[3]) <= 2
    
    eventPlayer.applyImpulse(Vector.UP, 20, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.WHITE, eventPlayer, 100)


rule "if genji deflecting":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition eventPlayer.isUsingAbility2() == true
    
    eventPlayer.IsBallPickUpable = false


rule "Genji Deflecting Ball":
    @Event eachPlayer
    @Condition distance(Ball, eventPlayer) <= 2.5
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition eventPlayer.isUsingAbility2() == true
    
    Ball.applyImpulse(eventPlayer.getFacingDirection(), 40, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    Ball2.applyImpulse(eventPlayer.getFacingDirection(), 40, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)


rule "if genji not deflecting":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition eventPlayer.isUsingAbility2() == false
    
    eventPlayer.IsBallPickUpable = true


rule "Roadhog hook ball Team 2":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.ROADHOG
    @Condition isInLoS(eventPlayer, G, BarrierLos.BLOCKED_BY_ENEMY_BARRIERS) == true
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition IsBallPickedUp == false
    @Condition eventPlayer.getTeam() == Team.2
    
    Ball2.startForcingPosition(Ball, true)
    Ball.clearStatusEffect(Status.PHASED_OUT)


rule "Loop for camera circling on goal":
    @Condition HasGoalBeenScored == true
    
    I += 1
    CameraPositionOnGoalScored = vect(LastBallHolder.getPosition().x + 2 * (cos(I * 0.1)), LastBallHolder.getPosition().y + 2, LastBallHolder.getPosition().z + 2 * (sin(I * 0.1)))
    wait()
    if RULE_CONDITION:
        goto RULE_START


rule "Clear hacked on death":
    @Event playerDied
    
    eventPlayer.clearStatusEffect(Status.HACKED)
    eventPlayer.IsBallPickUpable = true


rule "Assemble hero timer":
    @Condition isAssemblingHeroes() == true
    
    setMatchTime(AssembleHeroTimerConstant)


rule "in spawn time":
    @Condition isGameInProgress() == false
    @Condition isAssemblingHeroes() == false
    
    setMatchTime(10)


rule "Stop Game Mode function":
    @Condition isGameInProgress() == true
    @Condition isAssemblingHeroes() == false
    @Condition isInSetup() == false
    
    pauseMatchTime()


