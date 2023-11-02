settings {
    "main": {
        "description": "Overball! This is a football/Uplink style game mode. Walk over the ball to pick it up. Interact key to throw it. Throw the ball into the goal to score. First to 5 goals wins. You are hacked while holding the ball. Certain abillities can interact with the ball (boop, hook, mei wall, coach gun, deflect, whipshot). Crouch + interact to see score board, jump + interact to close it. CURRENTLY CODED MAPS: Ilios Ruins, Ilios Lighthouse, Nepal Sanctum, Lijiang Night market, Busan Downtown."
    },
    "gamemodes": {
        "control": {
            "enabledMaps": [
                "lijiangTower"
            ],
            "captureSpeed%": 500,
            "setValidControlPoints": "first",
            "scoreToWin": 1,
            "scoringSpeed%": 500
        },
        "general": {
            "gamemodeStartTrigger": "manual",
            "respawnTime%": 50
        }
    },
    "heroes": {
        "allTeams": {
            "disabledHeroes": [
                "junkerQueen",
                "kiriko",
                "sojourn"
            ]
        }
    }
}

#Player variables

playervar scoreboardHelper 26


rule "Initialise Map Locations":
    if getCurrentMap() == Map.ILIOS and getCurrentObjective() == 2:
        O = vect(4.58, 61.54, -178.27)
        O = O.concat(vect(-5.78, 61.54, -146.79))
        O = O.concat(vect(63.68, 61.54, -146.65))
        O = O.concat(vect(53.34, 61.54, -177.56))
        O = O.concat(vect(95, 63, -156.5))
        O = O.concat(vect(-37, 63, -156.5))
        O = O.concat(vect(116.19, 61.54, -159.01))
        O = O.concat(vect(-58.49, 61.54, -158.87))
        E = vect(28.25, 58.62, -157.29)
    if getCurrentMap() == Map.NEPAL and getCurrentObjective() == 2:
        O = vect(104.37, 129.25, 0.029)
        O = O.concat(vect(56.955, 129.25, -24.005))
        O = O.concat(vect(56.913, 129.25, 24.033))
        O = O.concat(vect(0, 0, 0))
        O = O.concat(vect(80.973, 132.05, -48.138))
        O = O.concat(vect(80.979, 132.05, 47.977))
        O = O.concat(vect(81.692, 131.05, -69.271))
        O = O.concat(vect(81.137, 131.05, 70.557))
        E = vect(83.273, 129.7, 0.03)
    if getCurrentMap() == Map.BUSAN and getCurrentObjective() == 0:
        E = vect(51.853, 7.348, -92.651)
        O = vect(19.455, 14.348, -109.096)
        O = O.concat(vect(45.843, 11.348, -117.135))
        O = O.concat(vect(58.057, 11.348, -117.169))
        O = O.concat(vect(84.106, 14.348, -109.167))
        O = O.concat(vect(9.582, 16.946, -125.565))
        O = O.concat(vect(93.601, 16.649, -125.578))
        O = O.concat(vect(-6.489, 17.283, -125.451))
        O = O.concat(vect(107.939, 17.283, -125.774))
    if getCurrentMap() == Map.ILIOS and getCurrentObjective() == 0:
        E = vect(357.379, -24.464, -51.101)
        O = vect(338.886, -22.502, -33.726)
        O = O.concat(vect(331.662, -22.488, -51.337))
        O = O.concat(vect(63.68, 61.54, -146.65))
        O = O.concat(vect(53.34, 61.54, -177.56))
        O = O.concat(vect(350.499, -21.806, 10.814))
        O = O.concat(vect(307.351, -22.025, -90.265))
        O = O.concat(vect(332.107, -24.48, 28.34))
        O = O.concat(vect(284.292, -24.468, -86.981))
    if getCurrentMap() == Map.LIJIANG_TOWER and getCurrentObjective() == 0:
        E = vect(1.031, 0.35, -61.168)
        O = vect(33.711, 1.212, -28.007)
        O = O.concat(vect(18.223, 1.352, -27.734))
        O = O.concat(vect(-16.843, 1.352, -27.74))
        O = O.concat(vect(-31.71, 1.212, -27.463))
        O = O.concat(vect(43.205, 3.352, -29.162))
        O = O.concat(vect(-40.992, 3.352, -29.164))
        O = O.concat(vect(62.616, 3.352, -33.501))
        O = O.concat(vect(-61.764, 3.352, -32.17))


rule "Assign Bot variables":
    createDummy(Hero.TORBJORN, Team.1, 5, E, vect(0, 0, 0))
    createDummy(Hero.TORBJORN, Team.2, 5, E, vect(0, 0, 0))
    G = getPlayersInSlot(5, Team.2)
    U = getPlayersInSlot(5, Team.1)
    G.setInvisibility(Invis.ALL)
    U.setInvisibility(Invis.ALL)


rule "player vars":
    @Event eachPlayer
    
    eventPlayer.X = eventPlayer
    eventPlayer.A = true
    eventPlayer.U = true
    eventPlayer.F = getPlayersInSlot(5, Team.2).getPosition()
    createIcon(eventPlayer.X, eventPlayer.F + vect(0, 1.25, 0), Icon.ARROW_DOWN, IconReeval.VISIBILITY_AND_POSITION, Color.BLUE, true)
    eventPlayer.W = null
    eventPlayer.B = 0
    eventPlayer.C = 0
    eventPlayer.E = eventPlayer.getCurrentHero()
    eventPlayer.G = getPlayers(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.D = getPlayers(eventPlayer.getTeam())
    eventPlayer.V = false
    eventPlayer.T = false
    eventPlayer.Z = null
    createIcon(eventPlayer.Z, C + vect(0, 1.25, 0), Icon.ARROW_DOWN, IconReeval.VISIBILITY_AND_POSITION, Color.RED, true)
    eventPlayer.Q = 10
    hudSubtext(eventPlayer, "Press Crouch + Interact to see Scoreboard. Press Jump + Interact to close it.", HudPosition.RIGHT, 0, Color.RED, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.scoreboardHelper = getLastCreatedText()
    eventPlayer.disableGamemodeHud()


rule "Initialise global variables and startup":
    B = false
    getAllPlayers().setRespawnTime(2)
    L = 0
    M = 0
    V = false
    N = null
    X = false
    P = 15
    S = 0
    disableGamemodeCompletion()
    getAllPlayers().disableGamemodeHud()


rule "When Bots spawns/Spawn Ball":
    @Condition getPlayersInSlot(5, Team.2).hasSpawned() == true
    @Condition getPlayersInSlot(5, Team.1).hasSpawned() == true
    @Condition isGameInProgress() == true
    
    pauseMatchTime()
    setMatchTime(0)
    U.teleport(E)
    G.teleport(E)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, G.getPosition() + vect(0, 1, 0), 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    D = getLastCreatedEntity()
    wait(2)
    getPlayersInSlot(5, Team.ALL).setStatusEffect(null, Status.STUNNED, 9999)
    wait(0.25)
    getPlayersInSlot(5, Team.ALL).setStatusEffect(null, Status.PHASED_OUT, 9999)
    G.setGravity(130)
    U.setGravity(130)


rule "Spawn Goals":
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.TEAM_1, O[4], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    J = getLastCreatedEntity()
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.TEAM_2, O[5], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    K = getLastCreatedEntity()


rule "Create jump pads":
    createEffect(getAllPlayers(), Effect.RING, Color.GREEN, O[0], 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.RING, Color.GREEN, O[1], 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.RING, Color.GREEN, O[2], 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.RING, Color.GREEN, O[3], 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)


rule "Ball off map":
    @Event playerDied
    @Condition eventPlayer == G
    
    destroyEffect(D)
    G.respawn()
    createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, G + vect(0, 1, 0), 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    D = getLastCreatedEntity()


rule "Picking up the ball":
    @Event eachPlayer
    @Condition G == getPlayersInSlot(5, Team.2)
    @Condition B == false
    @Condition distance(eventPlayer, G.getPosition()) <= 2.5
    @Condition eventPlayer != G
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.A == true
    @Condition eventPlayer.isInSpawnRoom() == false
    @Condition eventPlayer.isDead() == false
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.U == true
    @Condition eventPlayer != getPlayersInSlot(5, Team.1)
    @Condition isGameInProgress() == true
    
    destroyEffect(D)
    G.applyImpulse(-1 * eventPlayer.getVelocity(), G.getSpeed(), Relativity.TO_WORLD, Impulse.INCORPORATE_CONTRARY_MOTION)
    B = true
    C = eventPlayer
    G.teleport(vect(10000, 10000, 10000))
    createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, eventPlayer + eventPlayer.getFacingDirection() + vect(0, 1, 0), 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    D = getLastCreatedEntity()
    playEffect(eventPlayer, DynamicEffect.BUFF_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 50)
    G.setGravity(0)
    eventPlayer.setStatusEffect(null, Status.HACKED, 9999)


rule "Throwing ball":
    @Event eachPlayer
    @Condition B == true
    @Condition C == eventPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    G.setGravity(130)
    destroyEffect(D)
    G.teleport(eventPlayer.getPosition() + eventPlayer.getFacingDirection() * 3 + vect(0, 1, 0))
    createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, G.getPosition() + vect(0, 0.5, 0), 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    D = getLastCreatedEntity()
    G.applyImpulse(eventPlayer.getFacingDirection(), 35, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    destroyIcon(eventPlayer.F)
    B = false
    C = null
    Y = N
    N = eventPlayer
    wait(1)
    eventPlayer.clearStatusEffect(Status.HACKED)


rule "Death with ball":
    @Event playerDied
    @Condition eventPlayer == C
    
    G.setGravity(130)
    destroyIcon(eventPlayer.F)
    eventPlayer.U = false
    B = false
    C = null
    destroyEffect(D)
    G.teleport(eventPlayer.getPosition() + Vector.UP)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, G + vect(0, 0.5, 0), 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    D = getLastCreatedEntity()
    eventPlayer.clearStatusEffect(Status.HACKED)
    wait(5)
    eventPlayer.U = true


rule "If Ball in spawn":
    @Condition G.isInSpawnRoom() == true
    @Condition isGameInProgress() == true
    
    G.teleport(E)


rule "goals team 2":
    @Condition distance(G, O[4]) <= 1.5
    @Condition G == getPlayersInSlot(5, Team.2)
    @Condition isGameInProgress() == true
    
    A = true
    G.teleport(vect(1000, 1000, 1000))
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.WHITE, O[4], 100)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.PURPLE, O[4], 1)
    setSlowMotion(10)
    getAllPlayers().startCamera(W, N + vect(0, 1, 0), 10)
    kill(getPlayersOnHero(Hero.DVA, Team.ALL), null)
    if N.getTeam() == Team.1:
        goto lbl_0
    bigMessage(getAllPlayers(), l"{0} {1}".format(N, l"{0}!".format(l"Scores")))
    goto lbl_1
    lbl_0:
    bigMessage(getAllPlayers(), l"{0} {1}".format(N, "Scored Own Goal"))
    lbl_1:
    wait(0.75)
    setSlowMotion(100)
    A = false
    kill(getPlayersOnHero(Hero.DVA, Team.ALL), null)
    getAllPlayers().respawn()
    G.teleport(O[6])
    getAllPlayers().stopCamera()
    M = M + 1
    if N.getTeam() == Team.1:
        goto lbl_2
    N.B = N.B + 1
    lbl_2:
    if Y.getTeam() == Team.1:
        goto lbl_3
    if N == Y:
        goto lbl_4
    Y.C = Y.C + 1
    lbl_3:
    lbl_4:
    N.Q = 10 - 2 * N.B - N.C
    Y.Q = 10 - 2 * Y.B - Y.C
    N = null
    Y = null
    F = 0
    getPlayersOnHero(Hero.SOMBRA, Team.ALL).clearStatusEffect(Status.HACKED)
    wait(1)
    getPlayersOnHero(Hero.SOMBRA, Team.ALL).startForcingButton(Button.INTERACT)
    wait(12)
    getPlayersOnHero(Hero.SOMBRA, Team.ALL).stopForcingButton(Button.INTERACT)


rule "goals team 1":
    @Condition distance(G, O[5]) <= 1.5
    @Condition G == getPlayersInSlot(5, Team.2)
    @Condition isGameInProgress() == true
    
    A = true
    G.teleport(vect(1000, 1000, 1000))
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, O[5], 100)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.PURPLE, O[5], 1)
    setSlowMotion(10)
    getAllPlayers().startCamera(W, N + vect(0, 1, 0), 10)
    kill(getPlayersOnHero(Hero.DVA, Team.ALL), null)
    if N.getTeam() == Team.2:
        goto lbl_0
    bigMessage(getAllPlayers(), l"{0} {1}".format(N, l"{0}!".format(l"Scores")))
    goto lbl_1
    lbl_0:
    bigMessage(getAllPlayers(), l"{0} {1}".format(N, "Scored Own Goal"))
    lbl_1:
    wait(0.75)
    setSlowMotion(100)
    A = false
    kill(getPlayersOnHero(Hero.DVA, Team.ALL), null)
    getAllPlayers().respawn()
    G.teleport(O[7])
    getAllPlayers().stopCamera()
    L = L + 1
    if N.getTeam() == Team.2:
        goto lbl_2
    N.B = N.B + 1
    lbl_2:
    if N == Y:
        goto lbl_3
    if Y.getTeam() == Team.2:
        goto lbl_4
    Y.C = Y.C + 1
    lbl_3:
    lbl_4:
    N.Q = 10 - 2 * N.B - N.C
    Y.Q = 10 - 2 * Y.B - Y.C
    N = null
    Y = null
    F = 0
    getPlayersOnHero(Hero.SOMBRA, Team.ALL).clearStatusEffect(Status.HACKED)
    wait(1)
    getPlayersOnHero(Hero.SOMBRA, Team.ALL).startForcingButton(Button.INTERACT)
    wait(12)
    getPlayersOnHero(Hero.SOMBRA, Team.ALL).stopForcingButton(Button.INTERACT)


rule "Show Score Team 1":
    @Event eachPlayer
    @Condition eventPlayer.getTeam() == Team.1
    
    hudHeader(eventPlayer, l"{0}: {1}".format(l"Ally", L), HudPosition.LEFT, 0, Color.TEAM_1, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    hudHeader(eventPlayer, l"{0}: {1}".format(l"Enemy", M), HudPosition.LEFT, 1, Color.TEAM_2, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)


rule "Show Score Team 2":
    @Event eachPlayer
    @Condition eventPlayer.getTeam() == Team.2
    
    hudHeader(eventPlayer, l"{0}: {1}".format(l"Ally", M), HudPosition.LEFT, 0, Color.TEAM_2, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    hudHeader(eventPlayer, l"{0}: {1}".format(l"Enemy", L), HudPosition.LEFT, 1, Color.TEAM_1, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)


rule "Icon for teammate holding ball":
    @Event eachPlayer
    @Condition C.getTeam() == eventPlayer.getTeam()
    @Condition B == true
    @Condition eventPlayer != C
    
    eventPlayer.Z = null
    eventPlayer.F = C
    eventPlayer.X = eventPlayer


rule "icon for ball on ground":
    @Event eachPlayer
    @Condition B == false
    @Condition isGameInProgress() == true
    
    destroyIcon(eventPlayer.W)
    eventPlayer.Z = null
    eventPlayer.F = G
    eventPlayer.X = eventPlayer


rule "icon while held":
    @Event eachPlayer
    @Condition B == true
    @Condition C == eventPlayer
    
    eventPlayer.Z = null
    eventPlayer.X = null


rule "Icon for enemy holding ball":
    @Event eachPlayer
    @Condition C.getTeam() == getOppositeTeam(eventPlayer.getTeam())
    @Condition B == true
    
    eventPlayer.Z = eventPlayer
    eventPlayer.X = null


rule "Icon for team 1 goal":
    @Event eachPlayer
    @Condition eventPlayer.getTeam() == getPlayersInSlot(0, Team.1).getTeam()
    @Condition C.getTeam() == eventPlayer.getTeam()
    @Condition B == true
    
    createIcon(eventPlayer, O[5] + vect(0, 2, 0), Icon.FLAG, IconReeval.VISIBILITY_AND_POSITION, Color.RED, true)
    eventPlayer.W = getLastCreatedEntity()


rule "Icon for team 2 goal":
    @Event eachPlayer
    @Condition eventPlayer.getTeam() != getPlayersInSlot(0, Team.1).getTeam()
    @Condition C.getTeam() == eventPlayer.getTeam()
    
    createIcon(eventPlayer, O[4] + vect(0, 2, 0), Icon.FLAG, IconReeval.VISIBILITY_AND_POSITION, Color.RED, true)
    eventPlayer.W = getLastCreatedEntity()


rule "Winning Team 1":
    @Condition I == Team.1
    
    G.teleport(vect(10000, 10000, 10000))
    getAllPlayers().respawn()
    getAllPlayers().startForcingThrottle(0, 0, 0, 0, 0, 0)
    setSlowMotion(10)
    getAllPlayers().startCamera(E + vect(8, 0, 0), E, 0)
    bigMessage(getPlayers(Team.1), l"{0}!".format(l"You Win"))
    bigMessage(getPlayers(Team.2), l"{0}!".format(l"You Lose"))
    getPlayersInSlot(0, Team.1).teleport(E + vect(0, 0, -2))
    getPlayersInSlot(1, Team.1).teleport(E + vect(0, 0, -1))
    getPlayersInSlot(2, Team.1).teleport(E + vect(0, 0, 0))
    getPlayersInSlot(3, Team.1).teleport(E + vect(0, 0, 1))
    getPlayersInSlot(4, Team.1).teleport(E + vect(0, 0, 2))
    declareTeamVictory(Team.1)


rule "Winning Team 2":
    @Condition I == Team.2
    
    getAllPlayers().startCamera(E + vect(8, 0, 0), E, 0)
    G.teleport(vect(10000, 10000, 10000))
    getAllPlayers().respawn()
    getAllPlayers().startForcingThrottle(0, 0, 0, 0, 0, 0)
    setSlowMotion(10)
    bigMessage(getPlayers(Team.1), l"{0}!".format(l"You Lose"))
    bigMessage(getPlayers(Team.2), l"{0}!".format(l"You Win"))
    getPlayersInSlot(0, Team.2).teleport(E + vect(0, 0, -2))
    getPlayersInSlot(1, Team.2).teleport(E + vect(0, 0, -1))
    getPlayersInSlot(2, Team.2).teleport(E + vect(0, 0, 0))
    getPlayersInSlot(3, Team.2).teleport(E + vect(0, 0, 1))
    getPlayersInSlot(4, Team.2).teleport(E + vect(0, 0, 2))
    declareTeamVictory(Team.2)


rule "Jumppad 1":
    @Event eachPlayer
    @Condition distance(eventPlayer, O[0]) <= 2
    
    eventPlayer.applyImpulse(Vector.UP, 20, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.WHITE, eventPlayer, 100)


rule "jumppad 2":
    @Event eachPlayer
    @Condition distance(eventPlayer, O[1]) <= 2
    
    eventPlayer.applyImpulse(Vector.UP, 20, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.WHITE, eventPlayer, 100)


rule "Jumppad 3":
    @Event eachPlayer
    @Condition distance(eventPlayer, O[2]) <= 2
    
    eventPlayer.applyImpulse(Vector.UP, 20, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.WHITE, eventPlayer, 100)


rule "Jumppad 4":
    @Event eachPlayer
    @Condition distance(eventPlayer, O[3]) <= 2
    
    eventPlayer.applyImpulse(Vector.UP, 20, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.WHITE, eventPlayer, 100)


rule "Genji deflecting the ball":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition G == getPlayersInSlot(5, Team.2)
    @Condition distance(eventPlayer, G.getPosition()) <= 2.5
    @Condition B == false
    @Condition eventPlayer != G
    @Condition eventPlayer.isInSpawnRoom() == false
    @Condition eventPlayer.isAlive() == true
    
    G.applyImpulse(eventPlayer.getFacingDirection(), 40, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    Y = N
    N = eventPlayer


rule "if genji deflecting":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition eventPlayer.isUsingAbility2() == true
    
    eventPlayer.A = false


rule "if genji not deflecting":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.GENJI
    @Condition eventPlayer.isUsingAbility2() == false
    
    eventPlayer.A = true


rule "Roadhog hook ball Team 1":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.ROADHOG
    @Condition isInLoS(eventPlayer, G, BarrierLos.BLOCKED_BY_ENEMY_BARRIERS) == true
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition B == false
    @Condition eventPlayer.getTeam() == Team.1
    
    G.clearStatusEffect(Status.PHASED_OUT)
    wait(0.8)
    V = true
    Y = N
    N = eventPlayer


rule "Roadhog not hooking ball team 1":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.ROADHOG
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition V == true
    
    if U.hasStatusEffect(Status.PHASED_OUT):
        goto lbl_0
    G.teleport(U)
    destroyEffect(D)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, G.getPosition() + vect(0, 0.5, 0), 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    D = getLastCreatedEntity()
    lbl_0:
    getPlayersInSlot(5, Team.ALL).setStatusEffect(null, Status.STUNNED, 9999)
    wait(0.25)
    getPlayersInSlot(5, Team.ALL).setStatusEffect(null, Status.PHASED_OUT, 9999)
    heal(G, null, 200)
    heal(U, null, 200)
    V = false


rule "Lucio boop":
    @Event eachPlayer
    @Condition eventPlayer.isFiringSecondaryFire() == true
    @Condition eventPlayer.getCurrentHero() == Hero.LUCIO
    @Condition horizontalAngleTowards(eventPlayer, G.getPosition()) <= 20
    @Condition horizontalAngleTowards(eventPlayer, G.getPosition()) >= -20
    @Condition isInLoS(eventPlayer, G.getPosition(), BarrierLos.BLOCKED_BY_ALL_BARRIERS) == true
    @Condition distance(eventPlayer, G) <= 6
    @Condition B == false
    
    G.applyImpulse(eventPlayer.getFacingDirection() + vect(0, 1, 0), 25, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    Y = N
    N = eventPlayer


rule "Ashe Coach Gun":
    @Event eachPlayer
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition eventPlayer.getCurrentHero() == Hero.ASHE
    @Condition horizontalAngleTowards(eventPlayer, G.getPosition()) <= 20
    @Condition horizontalAngleTowards(eventPlayer, G.getPosition()) >= -20
    @Condition isInLoS(eventPlayer, G.getPosition(), BarrierLos.BLOCKED_BY_ALL_BARRIERS) == true
    @Condition distance(eventPlayer, G) <= 6
    @Condition B == false
    
    wait(0.2)
    G.applyImpulse(eventPlayer.getFacingDirection() + vect(0, 1, 0), 25, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    Y = N
    N = eventPlayer


rule "hOLDING BALL HACK FAILSAFE":
    @Event eachPlayer
    @Condition eventPlayer == C
    @Condition eventPlayer.hasStatusEffect(Status.HACKED) == false
    
    eventPlayer.setStatusEffect(null, Status.HACKED, 9999)


rule "Roadhog hook ball Team 2":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.ROADHOG
    @Condition isInLoS(eventPlayer, G, BarrierLos.BLOCKED_BY_ENEMY_BARRIERS) == true
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition B == false
    @Condition eventPlayer.getTeam() == Team.2
    
    U.teleport(G)
    destroyEffect(D)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, U.getPosition() + vect(0, 0.5, 0), 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    D = getLastCreatedEntity()
    U.clearStatusEffect(Status.PHASED_OUT)
    wait(0.8)
    X = true
    N = eventPlayer


rule "Roadhog not hook ball team 2":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.ROADHOG
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition X == true
    
    if U.hasStatusEffect(Status.PHASED_OUT):
        goto lbl_0
    G.teleport(U)
    destroyEffect(D)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, Z.getPosition() + vect(0, 0.5, 0), 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    D = getLastCreatedEntity()
    lbl_0:
    getPlayersInSlot(5, Team.ALL).setStatusEffect(null, Status.STUNNED, 9999)
    wait(0.25)
    getPlayersInSlot(5, Team.ALL).setStatusEffect(null, Status.PHASED_OUT, 9999)
    heal(G, null, 200)
    heal(U, null, 200)
    X = false

rule "Reevaluate current hero":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() != eventPlayer.E
    
    eventPlayer.E = eventPlayer.getCurrentHero()


rule "create Scoreboard team 1":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.CROUCH) == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.V == false
    
    destroyHudText(eventPlayer.scoreboardHelper)
    eventPlayer.D = getPlayers(eventPlayer.getTeam())
    eventPlayer.G = getPlayers(getOppositeTeam(eventPlayer.getTeam()))
    hudHeader(eventPlayer, l"{0} {1}".format(l"Hero", l"{0} - {1}".format("Player", l"{0} - {1}".format("Goals", "Assists"))), HudPosition.RIGHT, -1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.H = getLastCreatedText()
    eventPlayer.I = eventPlayer.D[0]
    if entityExists(eventPlayer.I) == false or getPlayersInSlot(5, Team.1) == eventPlayer.I:
        goto lbl_0
    hudHeader(eventPlayer, l"{0} - {1} - {2}".format(l"{0} {1}".format(heroIcon(eventPlayer.D[0].E), eventPlayer.D[0]), eventPlayer.D[0].B, eventPlayer.D[0].C), HudPosition.RIGHT, eventPlayer.D[0].Q, Color.TEAM_1, HudReeval.VISIBILITY_SORT_ORDER_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.H = eventPlayer.H.concat(getLastCreatedText())
    lbl_0:
    eventPlayer.I = eventPlayer.D[1]
    if entityExists(eventPlayer.I) == false or getPlayersInSlot(5, Team.1) == eventPlayer.I:
        goto lbl_1
    hudHeader(eventPlayer, l"{0} - {1} - {2}".format(l"{0} {1}".format(heroIcon(eventPlayer.D[1].E), eventPlayer.D[1]), eventPlayer.D[1].B, eventPlayer.D[1].C), HudPosition.RIGHT, eventPlayer.D[1].Q, Color.TEAM_1, HudReeval.VISIBILITY_SORT_ORDER_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.H = eventPlayer.H.concat(getLastCreatedText())
    lbl_1:
    eventPlayer.I = eventPlayer.D[2]
    if entityExists(eventPlayer.I) == false or getPlayersInSlot(5, Team.1) == eventPlayer.I:
        goto lbl_2
    hudHeader(eventPlayer, l"{0} - {1} - {2}".format(l"{0} {1}".format(heroIcon(eventPlayer.D[2].E), eventPlayer.D[2]), eventPlayer.D[2].B, eventPlayer.D[22].C), HudPosition.RIGHT, eventPlayer.D[2].Q, Color.TEAM_1, HudReeval.VISIBILITY_SORT_ORDER_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.H = eventPlayer.H.concat(getLastCreatedText())
    lbl_2:
    eventPlayer.I = eventPlayer.D[3]
    if entityExists(eventPlayer.I) == false or getPlayersInSlot(5, Team.1) == eventPlayer.I:
        goto lbl_3
    hudHeader(eventPlayer, l"{0} - {1} - {2}".format(l"{0} {1}".format(heroIcon(eventPlayer.D[3].E), eventPlayer.D[3]), eventPlayer.D[3].B, eventPlayer.D[3].C), HudPosition.RIGHT, eventPlayer.D[3].Q, Color.TEAM_1, HudReeval.VISIBILITY_SORT_ORDER_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.H = eventPlayer.H.concat(getLastCreatedText())
    lbl_3:
    eventPlayer.I = eventPlayer.D[4]
    if entityExists(eventPlayer.I) == false or getPlayersInSlot(5, Team.1) == eventPlayer.I:
        goto lbl_4
    hudHeader(eventPlayer, l"{0} - {1} - {2}".format(l"{0} {1}".format(heroIcon(eventPlayer.D[4].E), eventPlayer.D[4]), eventPlayer.D[4].B, eventPlayer.D[4].C), HudPosition.RIGHT, eventPlayer.D[4].Q, Color.TEAM_1, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.H = eventPlayer.H.concat(getLastCreatedText())
    lbl_4:
    eventPlayer.I = eventPlayer.D[5]
    if entityExists(eventPlayer.I) == false or getPlayersInSlot(5, Team.1) == eventPlayer.I:
        goto lbl_5
    hudHeader(eventPlayer, l"{0} - {1} - {2}".format(l"{0} {1}".format(heroIcon(eventPlayer.D[5].E), eventPlayer.D[5]), eventPlayer.D[5].B, eventPlayer.D[5].C), HudPosition.RIGHT, eventPlayer.D[5].Q, Color.TEAM_1, HudReeval.VISIBILITY_SORT_ORDER_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.H = eventPlayer.H.concat(getLastCreatedText())
    lbl_5:
    eventPlayer.T = true


rule "create Scoreboard team 2":
    @Event eachPlayer
    @Condition eventPlayer.T == true
    
    destroyHudText(eventPlayer.scoreboardHelper)
    eventPlayer.I = eventPlayer.G[0]
    if entityExists(eventPlayer.I) == false or getPlayersInSlot(5, Team.2) == eventPlayer.I:
        goto lbl_0
    hudHeader(eventPlayer, l"{0} - {1} - {2}".format(l"{0} {1}".format(heroIcon(eventPlayer.G[0].E), eventPlayer.G[0]), eventPlayer.G[0].B, eventPlayer.G[0].C), HudPosition.RIGHT, eventPlayer.G[0].Q, Color.TEAM_2, HudReeval.VISIBILITY_SORT_ORDER_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.H = eventPlayer.H.concat(getLastCreatedText())
    lbl_0:
    eventPlayer.I = eventPlayer.G[1]
    if entityExists(eventPlayer.I) == false or getPlayersInSlot(5, Team.2) == eventPlayer.I:
        goto lbl_1
    hudHeader(eventPlayer, l"{0} - {1} - {2}".format(l"{0} {1}".format(heroIcon(eventPlayer.G[1].E), eventPlayer.G[1]), eventPlayer.G[1].B, eventPlayer.G[1].C), HudPosition.RIGHT, eventPlayer.G[1].Q, Color.TEAM_2, HudReeval.VISIBILITY_SORT_ORDER_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.H = eventPlayer.H.concat(getLastCreatedText())
    lbl_1:
    eventPlayer.I = eventPlayer.G[2]
    if entityExists(eventPlayer.I) == false or getPlayersInSlot(5, Team.2) == eventPlayer.I:
        goto lbl_2
    hudHeader(eventPlayer, l"{0} - {1} - {2}".format(l"{0} {1}".format(heroIcon(eventPlayer.G[2].E), eventPlayer.G[2]), eventPlayer.G[2].B, eventPlayer.G[2].C), HudPosition.RIGHT, eventPlayer.G[2].Q, Color.TEAM_2, HudReeval.VISIBILITY_SORT_ORDER_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.H = eventPlayer.H.concat(getLastCreatedText())
    lbl_2:
    eventPlayer.I = eventPlayer.G[3]
    if entityExists(eventPlayer.I) == false or getPlayersInSlot(5, Team.2) == eventPlayer.I:
        goto lbl_3
    hudHeader(eventPlayer, l"{0} - {1} - {2}".format(l"{0} {1}".format(heroIcon(eventPlayer.G[3].E), eventPlayer.G[3]), eventPlayer.G[3].B, eventPlayer.G[3].C), HudPosition.RIGHT, eventPlayer.G[3].Q, Color.TEAM_2, HudReeval.VISIBILITY_SORT_ORDER_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.H = eventPlayer.H.concat(getLastCreatedText())
    lbl_3:
    eventPlayer.I = eventPlayer.G[4]
    if entityExists(eventPlayer.I) == false or getPlayersInSlot(5, Team.2) == eventPlayer.I:
        goto lbl_4
    hudHeader(eventPlayer, l"{0} - {1} - {2}".format(l"{0} {1}".format(heroIcon(eventPlayer.G[4].E), eventPlayer.G[4]), eventPlayer.G[4].B, eventPlayer.G[4].C), HudPosition.RIGHT, eventPlayer.G[4].Q, Color.TEAM_2, HudReeval.VISIBILITY_SORT_ORDER_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.H = eventPlayer.H.concat(getLastCreatedText())
    lbl_4:
    eventPlayer.I = eventPlayer.G[5]
    if entityExists(eventPlayer.I) == false or getPlayersInSlot(5, Team.2) == eventPlayer.I:
        goto lbl_5
    hudHeader(eventPlayer, l"{0} - {1} - {2}".format(l"{0} {1}".format(heroIcon(eventPlayer.G[5].E), eventPlayer.G[5]), eventPlayer.G[5].B, eventPlayer.G[5].C), HudPosition.RIGHT, eventPlayer.G[5].Q, Color.TEAM_2, HudReeval.VISIBILITY_SORT_ORDER_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.H = eventPlayer.H.concat(getLastCreatedText())
    lbl_5:
    eventPlayer.V = true
    eventPlayer.T = false


rule "Destroy scoreboard":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.JUMP) == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.V == true
    
    destroyHudText(eventPlayer.H[0])
    destroyHudText(eventPlayer.H[1])
    destroyHudText(eventPlayer.H[2])
    destroyHudText(eventPlayer.H[3])
    destroyHudText(eventPlayer.H[4])
    destroyHudText(eventPlayer.H[5])
    destroyHudText(eventPlayer.H[6])
    destroyHudText(eventPlayer.H[7])
    destroyHudText(eventPlayer.H[8])
    destroyHudText(eventPlayer.H[9])
    destroyHudText(eventPlayer.H[10])
    destroyHudText(eventPlayer.H[11])
    destroyHudText(eventPlayer.H[12])
    eventPlayer.H = []
    eventPlayer.V = false
    destroyHudText(eventPlayer.scoreboardHelper)
    hudSubtext(eventPlayer, "Press Crouch + Interact to see Scoreboard. Press Jump + Interact to close it.", HudPosition.RIGHT, 0, Color.RED, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.scoreboardHelper = getLastCreatedText()


rule "Loop for camera circling on goal":
    @Condition A == true
    
    F = F + 1
    W = vect(N.getPosition().x + 2 * (cos(F * 0.1)), N.getPosition().y + 2, N.getPosition().z + 2 * (sin(F * 0.1)))
    wait()
    if RULE_CONDITION:
        goto RULE_START


rule "brig whip ball Team 1":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.BRIGITTE
    @Condition isInLoS(eventPlayer, G, BarrierLos.BLOCKED_BY_ENEMY_BARRIERS) == true
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition B == false
    @Condition eventPlayer.getTeam() == Team.1
    
    G.clearStatusEffect(Status.PHASED_OUT)
    wait(0.8)
    W = true
    Y = N
    N = eventPlayer


rule "brig not whip ball team 1":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.BRIGITTE
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition W == true
    
    if U.hasStatusEffect(Status.PHASED_OUT):
        goto lbl_0
    G.teleport(U)
    destroyEffect(D)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, G.getPosition() + vect(0, 0.5, 0), 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    D = getLastCreatedEntity()
    lbl_0:
    getPlayersInSlot(5, Team.ALL).setStatusEffect(null, Status.STUNNED, 9999)
    wait(0.25)
    getPlayersInSlot(5, Team.ALL).setStatusEffect(null, Status.PHASED_OUT, 9999)
    heal(G, null, 200)
    heal(U, null, 200)
    W = false


rule "brig whip ball Team 2":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.BRIGITTE
    @Condition isInLoS(eventPlayer, G, BarrierLos.BLOCKED_BY_ENEMY_BARRIERS) == true
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition B == false
    @Condition eventPlayer.getTeam() == Team.2
    
    U.teleport(G)
    destroyEffect(D)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, U.getPosition() + vect(0, 0.5, 0), 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    D = getLastCreatedEntity()
    U.clearStatusEffect(Status.PHASED_OUT)
    wait(0.8)
    Z = true
    N = eventPlayer


rule "Brig not whip ball team 2":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentHero() == Hero.BRIGITTE
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition Z == true
    
    if U.hasStatusEffect(Status.PHASED_OUT):
        goto lbl_0
    G.teleport(U)
    destroyEffect(D)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, Z.getPosition() + vect(0, 0.5, 0), 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    D = getLastCreatedEntity()
    lbl_0:
    getPlayersInSlot(5, Team.ALL).setStatusEffect(null, Status.STUNNED, 9999)
    wait(0.25)
    getPlayersInSlot(5, Team.ALL).setStatusEffect(null, Status.PHASED_OUT, 9999)
    heal(G, null, 200)
    heal(U, null, 200)
    Z = false


rule "Timer HUD":
    #@Condition H == -1
    @Condition isGameInProgress() == true
    
    hudHeader(getAllPlayers(), l"{0}:{1}".format(P, l"{0} {1}".format(Q, R)), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    H = getLastCreatedText()


rule "Clock":
    #@Condition T == 1
    @Condition isGameInProgress() == true
    
    wait(1)
    if R != 0:
        goto lbl_0
    R = 9
    if Q != 0:
        goto lbl_1
    Q = 5
    P = P - 1
    goto lbl_2
    lbl_1:
    Q = Q - 1
    lbl_2:
    goto lbl_3
    lbl_0:
    R = R - 1
    lbl_3:
    goto RULE_START
    if H == 1:
        return


rule "Team 1 win by goals":
    @Condition L >= 5
    
    I = Team.1


rule "Team 2 win by goals":
    @Condition M >= 5
    
    I = Team.2

rule "Time ends":
    @Condition P == 0
    @Condition Q == 0
    @Condition R == 0
    
    destroyHudText(H)
    if L <= M:
        goto lbl_0
    I = Team.1
    lbl_0:
    if L >= M:
        goto lbl_1
    I = Team.2
    lbl_1:
    if L > M or L < M:
        goto lbl_2
    L = 4
    M = 4
    bigMessage(getAllPlayers(), l"{0} {1} {2}".format(l"Next", l"Goal", l"Wins"))
    lbl_2:


rule "If player with ball leaves":
    @Condition C in getAllPlayers() == false
    @Condition C != 0
    
    G.setGravity(130)
    C = 0
    B = false
    destroyEffect(D)
    G.respawn()
    createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, G + vect(0, 1, 0), 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    D = getLastCreatedEntity()


rule "Clear hacked on death":
    @Event playerDied
    
    eventPlayer.clearStatusEffect(Status.HACKED)


rule "Assemble hero timer":
    @Condition isAssemblingHeroes() == true
    
    setMatchTime(1)


rule "in spawn time":
    @Condition isGameInProgress() == false
    @Condition isAssemblingHeroes() == false
    
    setMatchTime(5)


/*
rule "stun failsafe":
    @Condition G.hasStatusEffect(Status.STUNNED) == false
    
    G.setStatusEffect(null, Status.STUNNED, 9999)
*/

