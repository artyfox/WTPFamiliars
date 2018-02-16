BEGIN ~WTPFAMP2~

IF ~ReputationGT(%famsummoner%,18)~ THEN BEGIN 62 // from:
   SAY @31
   IF ~~ THEN DO ~ChangeEnemyAlly(Myself,NEUTRAL)SetGlobal("#GFAMGO","GLOBAL",1)~ EXIT
END

IF ~Global("#GHARAS","GLOBAL",2)~ THEN BEGIN 52 // from:
   SAY @21
   IF ~Global("#GMIRPEN","GLOBAL",0)~ THEN DO ~IncrementGlobal("#GHARAS","GLOBAL",1)SetGlobal("#GMIRPEN","GLOBAL",1)SetGlobalTimer("#GFAMHAR","GLOBAL",7200)~ EXIT
   IF ~GlobalGT("#GMIRPEN","GLOBAL",0)~ THEN DO ~IncrementGlobal("#GHARAS","GLOBAL",1)SetGlobalTimer("#GFAMHAR","GLOBAL",7200)~ EXIT
END

IF ~Global("#GHARAS","GLOBAL",5)~ THEN BEGIN 53 // from:
   SAY @22
   IF ~GlobalLT("#GMIRPEN","GLOBAL",2)~ THEN DO ~IncrementGlobal("#GHARAS","GLOBAL",1)SetGlobal("#GMIRPEN","GLOBAL",2)SetGlobalTimer("#GFAMHAR","GLOBAL",14400)~ EXIT
   IF ~Global("#GMIRPEN","GLOBAL",2)~ THEN DO ~IncrementGlobal("#GHARAS","GLOBAL",1)SetGlobalTimer("#GFAMHAR","GLOBAL",14400)~ EXIT
END

IF ~Global("#GHARAS","GLOBAL",8)~ THEN BEGIN 54 // from:
   SAY @23
   IF ~~ THEN DO ~ChangeEnemyAlly(Myself,NEUTRAL)SetGlobal("#GFAMGO","GLOBAL",1)~ EXIT
END

IF ~Global("#GINPACK","GLOBAL",1)~ THEN BEGIN 45 // from:
   SAY @12
   IF ~~ THEN DO ~IncrementGlobal("#GINPACK","GLOBAL",1)SetGlobalTimer("#GWANOUT","GLOBAL",120)SetGlobalTimer("#GSTAOUT","GLOBAL",1200)DestroySelf()~ EXIT
END

IF ~Global("#GINPACK","GLOBAL",3)~ THEN BEGIN 46 // from:
   SAY @13
   IF ~~ THEN DO ~IncrementGlobal("#GINPACK","GLOBAL",1)SetGlobalTimer("#GWANOUT","GLOBAL",90)SetGlobalTimer("#GSTAOUT","GLOBAL",1200)DestroySelf()~ EXIT
END

IF ~Global("#GINPACK","GLOBAL",5)~ THEN BEGIN 47 // from:
   SAY @14
   IF ~~ THEN DO ~IncrementGlobal("#GINPACK","GLOBAL",1)SetGlobalTimer("#GWANOUT","GLOBAL",60)SetGlobalTimer("#GSTAOUT","GLOBAL",1200)DestroySelf()~ EXIT
END

IF ~!InPartySlot(LastTalkedToBy,0)~ THEN BEGIN 0 // from:
  SAY #58326 /* ~The creature stares with open derision, sticking out its forked tongue rudely.  It scoots off to <CHARNAME>.  Obviously it doesn't want to talk to you...~ */
  IF ~~ THEN DO ~MoveToObject(%famsummoner%)ClearActions(Myself)~ EXIT
END

IF ~InPartySlot(LastTalkedToBy,0)~ THEN BEGIN 1 // from:
  SAY #58327 /* ~The impish creature regards you suspiciously, wary of a kick or slap headed its way, before sidling a step or two closer.  "Yeah, boss?  You want something?"~ */
  IF ~CombatCounterLT(1)!TriggerOverride(%famsummoner%,Detect([ENEMY]))!GlobalsEqual("#GFAMLVL","#GPLALVL")~ THEN REPLY @19 GOTO 51
  IF ~CombatCounterLT(1)!TriggerOverride(%famsummoner%,Detect([ENEMY]))!InventoryFull(%famsummoner%)Global("WTPFAMLE","GLOBAL",2)!GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #58328 /* ~Come here.  You're going in my pack, for now.~ */ GOTO 2
  IF ~CombatCounterLT(1)!TriggerOverride(%famsummoner%,Detect([ENEMY]))!InventoryFull(%famsummoner%)Global("WTPFAMNE","GLOBAL",2)!GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #58868 /* ~Come here.  You're going in my pack, for now.~ */ GOTO 25
  IF ~CombatCounterLT(1)!TriggerOverride(%famsummoner%,Detect([ENEMY]))!InventoryFull(%famsummoner%)Global("WTPFAMCE","GLOBAL",2)!GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #58869 /* ~Come here.  You're going in my pack, for now.~ */ GOTO 26
  IF ~CombatCounterLT(1)!TriggerOverride(%famsummoner%,Detect([ENEMY]))!InventoryFull(%famsummoner%)GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #58328 /* ~Come here.  You're going in my pack, for now.~ */ GOTO 48
  IF ~OR(2)!CombatCounterLT(1)TriggerOverride(%famsummoner%,Detect([ENEMY]))!InventoryFull(%famsummoner%)Global("WTPFAMLE","GLOBAL",2)OR(2)HPPercentLT(Myself,50)HPPercentLT(%famsummoner%,30)%IsInBG1%~ THEN REPLY @25 GOTO 56
  IF ~OR(2)!CombatCounterLT(1)TriggerOverride(%famsummoner%,Detect([ENEMY]))!InventoryFull(%famsummoner%)Global("WTPFAMLE","GLOBAL",2)OR(2)HPPercentLT(Myself,50)HPPercentLT(%famsummoner%,45)%IsInSoA%~ THEN REPLY @25 GOTO 56
  IF ~OR(2)!CombatCounterLT(1)TriggerOverride(%famsummoner%,Detect([ENEMY]))!InventoryFull(%famsummoner%)Global("WTPFAMLE","GLOBAL",2)OR(2)HPPercentLT(Myself,50)HPPercentLT(%famsummoner%,60)%IsInToB%~ THEN REPLY @25 GOTO 56
  IF ~OR(2)!CombatCounterLT(1)TriggerOverride(%famsummoner%,Detect([ENEMY]))!InventoryFull(%famsummoner%)Global("WTPFAMNE","GLOBAL",2)OR(2)HPPercentLT(Myself,50)HPPercentLT(%famsummoner%,30)%IsInBG1%~ THEN REPLY @25 GOTO 57
  IF ~OR(2)!CombatCounterLT(1)TriggerOverride(%famsummoner%,Detect([ENEMY]))!InventoryFull(%famsummoner%)Global("WTPFAMNE","GLOBAL",2)OR(2)HPPercentLT(Myself,50)HPPercentLT(%famsummoner%,45)%IsInSoA%~ THEN REPLY @25 GOTO 57
  IF ~OR(2)!CombatCounterLT(1)TriggerOverride(%famsummoner%,Detect([ENEMY]))!InventoryFull(%famsummoner%)Global("WTPFAMNE","GLOBAL",2)OR(2)HPPercentLT(Myself,50)HPPercentLT(%famsummoner%,60)%IsInToB%~ THEN REPLY @25 GOTO 57
  IF ~OR(2)!CombatCounterLT(1)TriggerOverride(%famsummoner%,Detect([ENEMY]))!InventoryFull(%famsummoner%)Global("WTPFAMCE","GLOBAL",2)OR(2)HPPercentLT(Myself,50)HPPercentLT(%famsummoner%,30)%IsInBG1%~ THEN REPLY @25 GOTO 58
  IF ~OR(2)!CombatCounterLT(1)TriggerOverride(%famsummoner%,Detect([ENEMY]))!InventoryFull(%famsummoner%)Global("WTPFAMCE","GLOBAL",2)OR(2)HPPercentLT(Myself,50)HPPercentLT(%famsummoner%,45)%IsInSoA%~ THEN REPLY @25 GOTO 58
  IF ~OR(2)!CombatCounterLT(1)TriggerOverride(%famsummoner%,Detect([ENEMY]))!InventoryFull(%famsummoner%)Global("WTPFAMCE","GLOBAL",2)OR(2)HPPercentLT(Myself,50)HPPercentLT(%famsummoner%,60)%IsInToB%~ THEN REPLY @25 GOTO 58
  IF ~OR(2)!CombatCounterLT(1)TriggerOverride(%famsummoner%,Detect([ENEMY]))!InventoryFull(%famsummoner%)HPPercentGT(Myself,50)HPPercentGT(%famsummoner%,30)%IsInBG1%~ THEN REPLY @25 GOTO 61
  IF ~OR(2)!CombatCounterLT(1)TriggerOverride(%famsummoner%,Detect([ENEMY]))!InventoryFull(%famsummoner%)HPPercentGT(Myself,50)HPPercentGT(%famsummoner%,45)%IsInSoA%~ THEN REPLY @25 GOTO 61
  IF ~OR(2)!CombatCounterLT(1)TriggerOverride(%famsummoner%,Detect([ENEMY]))!InventoryFull(%famsummoner%)HPPercentGT(Myself,50)HPPercentGT(%famsummoner%,60)%IsInToB%~ THEN REPLY @25 GOTO 61
  IF ~CombatCounterLT(1)!TriggerOverride(%famsummoner%,Detect([ENEMY]))Range(LastTalkedToBy,3)~ THEN REPLY #58330 /* ~Don't be so frightened of me, idiot.  (pet the familiar)~ */ GOTO 3
  IF ~CombatCounterLT(1)!TriggerOverride(%famsummoner%,Detect([ENEMY]))Range(LastTalkedToBy,3)~ THEN REPLY #58386 /* ~(slap it in the head)~ */ GOTO 21
  IF ~CombatCounterLT(1)!TriggerOverride(%famsummoner%,Detect([ENEMY]))!HPPercentLT(Myself,100)~ THEN REPLY #73435 /* ~(feed the familiar)~ */ GOTO 27
  IF ~CombatCounterLT(1)!TriggerOverride(%famsummoner%,Detect([ENEMY]))HPPercentLT(Myself,100)~ THEN REPLY #73436 /* ~(feed the familiar)~ */ GOTO 28
  IF ~CombatCounterLT(1)!TriggerOverride(%famsummoner%,Detect([ENEMY]))%IsInBG1%~ THEN REPLY #58353 /* ~Do have any advice for me, my familiar?~ */ GOTO 34
  IF ~CombatCounterLT(1)!TriggerOverride(%famsummoner%,Detect([ENEMY]))%IsInSoA%~ THEN REPLY #58353 /* ~Do have any advice for me, my familiar?~ */ GOTO 4
  IF ~CombatCounterLT(1)!TriggerOverride(%famsummoner%,Detect([ENEMY]))%IsInToB%~ THEN REPLY #58353 /* ~Do have any advice for me, my familiar?~ */ GOTO 30
  IF ~CombatCounterLT(1)!TriggerOverride(%famsummoner%,Detect([ENEMY]))~ THEN REPLY #58354 /* ~Are you alright, familiar?  All is well?~ */ GOTO 13
  IF ~CombatCounterLT(1)!TriggerOverride(%famsummoner%,Detect([ENEMY]))Global("#GAFTER","GLOBAL",0)~ THEN REPLY @15 GOTO 49
  IF ~CombatCounterLT(1)!TriggerOverride(%famsummoner%,Detect([ENEMY]))Global("#GAFTER","GLOBAL",1)~ THEN REPLY @16 GOTO 50
  IF ~CombatCounterLT(1)!TriggerOverride(%famsummoner%,Detect([ENEMY]))ReputationGT(%famsummoner%,15)~ THEN REPLY #58355 /* ~Never mind.  Just keep moving.~ */ GOTO 55
  IF ~CombatCounterLT(1)!TriggerOverride(%famsummoner%,Detect([ENEMY]))ReputationLT(%famsummoner%,6)~ THEN REPLY #58355 /* ~Never mind.  Just keep moving.~ */ GOTO 59
  IF ~CombatCounterLT(1)!TriggerOverride(%famsummoner%,Detect([ENEMY]))ReputationLT(%famsummoner%,16)ReputationGT(%famsummoner%,5)~ THEN REPLY #58355 /* ~Never mind.  Just keep moving.~ */ GOTO 20
  IF ~OR(2)!CombatCounterLT(1)TriggerOverride(%famsummoner%,Detect([ENEMY]))~ THEN REPLY @28 GOTO 60
END

IF ~~ THEN BEGIN 2 // from:
  SAY #72634 /* ~"Oh, sure.  Stick me in your smelly pack.  Ever thought of putting some mint in there?  Baaah..."  Reluctantly, the imp crawls into your pack.~ */
  IF ~~ THEN DO ~GivePartyAllEquipment()ReallyForceSpellRES("wtpclear",Myself)Wait(1)GiveItemCreate("wtpfmimp",%famsummoner%,0,0,0)SetGlobalTimer("#GWANOUT","GLOBAL",300)SetGlobalTimer("#GSTAOUT","GLOBAL",1200)DestroySelf()~ EXIT
END

IF ~~ THEN BEGIN 3 // from:
  SAY #58331 /* ~It seems disgusted as you pat it on the head.  "Oh, now I'm a cute little bunny?  Give me a break, boss."  The imp darts away and does a heebie-jeebie dance.~ */
  IF ~!GlobalsEqual("#GFAMLVL","#GPLALVL")~ THEN REPLY @19 GOTO 51
  IF ~!InventoryFull(%famsummoner%)Global("WTPFAMLE","GLOBAL",2)!GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #58332 /* ~Come here, then.  Get in my pack.~ */ GOTO 2
  IF ~!InventoryFull(%famsummoner%)Global("WTPFAMNE","GLOBAL",2)!GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #59468 /* ~Come here, then.  Get in my pack.~ */ GOTO 25
  IF ~!InventoryFull(%famsummoner%)Global("WTPFAMCE","GLOBAL",2)!GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #59469 /* ~Come here, then.  Get in my pack.~ */ GOTO 26
  IF ~!InventoryFull(%famsummoner%)GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #59469 /* ~Come here, then.  Get in my pack.~ */ GOTO 48
  IF ~Range(LastTalkedToBy,3)~ THEN REPLY #58387 /* ~(slap it in the head)~ */ GOTO 21
  IF ~%IsInBG1%~ THEN REPLY #58353 /* ~Do have any advice for me, my familiar?~ */ GOTO 34
  IF ~%IsInSoA%~ THEN REPLY #58353 /* ~Do have any advice for me, my familiar?~ */ GOTO 4
  IF ~%IsInToB%~ THEN REPLY #58353 /* ~Do have any advice for me, my familiar?~ */ GOTO 30
  IF ~~ THEN REPLY #58354 /* ~Are you alright, familiar?  All is well?~ */ GOTO 13
  IF ~Global("#GAFTER","GLOBAL",0)~ THEN REPLY @15 GOTO 49
  IF ~Global("#GAFTER","GLOBAL",1)~ THEN REPLY @16 GOTO 50
  IF ~ReputationGT(%famsummoner%,17)~ THEN REPLY #58351 /* ~Alright, let's just keep going.~ */ GOTO 55
  IF ~ReputationLT(%famsummoner%,6)~ THEN REPLY #58351 /* ~Alright, let's just keep going.~ */ GOTO 59
  IF ~ReputationLT(%famsummoner%,17)ReputationGT(%famsummoner%,6)~ THEN REPLY #58351 /* ~Alright, let's just keep going.~ */ GOTO 20
END

IF ~~ THEN BEGIN 4 // from:
  SAY #58334 /* ~It looks at you incredulously, wondering if you are serious or if this is a prelude to a slap.  "You want *me* to give *you* advice, boss?  That's a first."~ */
  IF ~Global("chapter","GLOBAL",%bg2_chapter_1%)AreaType(DUNGEON)~ THEN GOTO 5
  IF ~Global("chapter","GLOBAL",%bg2_chapter_1%)!AreaType(DUNGEON)~ THEN GOTO 6
  IF ~Global("chapter","GLOBAL",%bg2_chapter_2%)~ THEN GOTO 7
  IF ~Global("chapter","GLOBAL",%bg2_chapter_3%)~ THEN GOTO 8
  IF ~Global("chapter","GLOBAL",%bg2_chapter_4%)~ THEN GOTO 9
  IF ~Global("chapter","GLOBAL",%bg2_chapter_5%)~ THEN GOTO 10
  IF ~Global("chapter","GLOBAL",%bg2_chapter_6%)~ THEN GOTO 11
  IF ~Global("chapter","GLOBAL",%bg2_chapter_7%)~ THEN GOTO 12
END

IF ~~ THEN BEGIN 5 // from:
  SAY #58335 /* ~It looks around a few moments before turning back to you.  "Yeah, I got advice.  Get your tail outta here, or hadn't you figured that out?  Sheesh, yer dumb."~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 6 // from:
  SAY #58336 /* ~It its eyes in an exaggerated fashion.  "What?  Now I'm your tourist guide?  Do whatever you want, boss.  Go kill a king or something, sheesh."~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 7 // from:
  SAY #58337 /* ~"Let's see... advice.  Advice... advice.  Oh, yeah, I know... STOP BUGGIN' ME!!  Yeah, that's the ticket..."~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 8 // from:
  SAY #58338 /* ~"Well heck, I guess you just do what you're told, eh?  Now, if you'd listened to me right off the bat, boss, you never would've gotten into this mess..."~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 9 // from:
  SAY #58339 /* ~It gives looks about and gives a quick shiver.  "Yeah, I got advice right, boss.  Stick your head between your legs an' kiss your butt good-bye."~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 10 // from:
  SAY #58340 /* ~The demon looks about.  "What?  Seems like a cheery enough place.  Slaughter the locals, set yourself up as absolute ruler and tyrant.  Works for me."~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 11 // from:
  SAY #58341 /* ~The creature looks quizzical.  "Isn't it obvious?  You get to that elven city.  All that pillaging, there's gotta be treasure ripe for the taking.  Sheesh."~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 12 // from:
  SAY #58342 /* ~"But you want my advice?  I'd say you're screwed, boss.  But that's just my opinion.  You can go ahead and do whatever you want."~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 13 // from:
  SAY #58344 /* ~It looks at you suspiciously, its sulfur eyes squinting.  "Hmph.  Since when are you so interested in me, boss?  Up 'til now its all been you you you."~ */
  IF ~HPPercentLT(Myself,100)!HPPercentLT(Myself,50)~ THEN GOTO 14
  IF ~HPPercentLT(Myself,50)~ THEN GOTO 15
  IF ~!HPPercentLT(Myself,100)RandomNum(4,1)~ THEN GOTO 16
  IF ~!HPPercentLT(Myself,100)RandomNum(4,2)~ THEN GOTO 17
  IF ~!HPPercentLT(Myself,100)RandomNum(4,3)~ THEN GOTO 18
  IF ~!HPPercentLT(Myself,100)RandomNum(4,4)~ THEN GOTO 19
END

IF ~~ THEN BEGIN 14 // from:
  SAY #58345 /* ~"But if you're really concerned, you could get me some healing.  I got scratches, you know... you wouldn't want me to die, would you?  I'm too useful!"~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 15 // from:
  SAY #58346 /* ~"But since you're asking, I could use healing.  Ichor's running bad... you wouldn't want to send me back to the planes, would you?  *That* would be a shame..."~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 16 // from:
  SAY #58347 /* ~"But, hmmmn, let me see.  I'm kinda hungry.  How about a puppy sandwich?  A steak?  A chicken sacrifice?  C'mon, throw me a bone, here, sheesh!"~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 17 // from:
  SAY #58348 /* ~"But since you asked, I think you should get more gold.  I wanna sleep in a BIG bag of gold.  I could swim in it... yeah, that's it, swim in the gold... yeah..."~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 18 // from:
  SAY #58349 /* ~"But I would like to say that you run around too much.  Here, there, back again... sheesh!  Don't you ever stop a while, set up shop?  Gimme a break, boss!"~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 19 // from:
  SAY #58350 /* ~"But since you asked, I wanna register a complaint.  Where's all *my* magical stuff?  I want a big sword... and a bag of holding... and some wands, yeah, wands..."~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 20 // from:
  SAY #58352 /* ~It looks ahead and sighs, scratching its rear luridly.  "Oh, sure.  Only, what, another fifty years of wanderin' around?  Don't you ever settle down?  Sheesh..."~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 21 // from:
  SAY #58388 /* ~The imp reels from the blow.  "HeeEEYY!  Cripes!  What wuz that for?!  I did everything you told me to, boss!  Sheesh!  Some people..."~ */
  IF ~!GlobalsEqual("#GFAMLVL","#GPLALVL")~ THEN REPLY @19 GOTO 51
  IF ~!InventoryFull(%famsummoner%)Global("WTPFAMLE","GLOBAL",2)!GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #59470 /* ~Come here, then.  Get in my pack.~ */ GOTO 2
  IF ~!InventoryFull(%famsummoner%)Global("WTPFAMNE","GLOBAL",2)!GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #59471 /* ~Come here, then.  Get in my pack.~ */ GOTO 25
  IF ~!InventoryFull(%famsummoner%)Global("WTPFAMCE","GLOBAL",2)!GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #59472 /* ~Come here, then.  Get in my pack.~ */ GOTO 26
  IF ~!InventoryFull(%famsummoner%)GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #59469 /* ~Come here, then.  Get in my pack.~ */ GOTO 48
  IF ~~ THEN REPLY #58299 /* ~(pet and play with it)~ */ GOTO 29
  IF ~RandomNum(3,1)~ THEN REPLY #58391 /* ~(slap it again)~ */ GOTO 22
  IF ~RandomNum(3,2)~ THEN REPLY #58392 /* ~(slap it again)~ */ GOTO 23
  IF ~RandomNum(3,3)~ THEN REPLY #58393 /* ~(slap it again)~ */ GOTO 24
  IF ~%IsInBG1%~ THEN REPLY #58353 /* ~Do have any advice for me, my familiar?~ */ GOTO 34
  IF ~%IsInSoA%~ THEN REPLY #58353 /* ~Do have any advice for me, my familiar?~ */ GOTO 4
  IF ~%IsInToB%~ THEN REPLY #58353 /* ~Do have any advice for me, my familiar?~ */ GOTO 30
  IF ~~ THEN REPLY #58354 /* ~Are you alright, familiar?  All is well?~ */ GOTO 13
  IF ~Global("#GAFTER","GLOBAL",0)~ THEN REPLY @15 GOTO 49
  IF ~Global("#GAFTER","GLOBAL",1)~ THEN REPLY @16 GOTO 50
  IF ~~ THEN REPLY #58351 /* ~Alright, let's just keep going.~ */ GOTO 20
END

IF ~~ THEN BEGIN 22 // from:
  SAY #58389 /* ~Another slap sends it to the floor, frantically covering its head.  "Gaaah!  Okay!  You're the boss-<PRO_MANWOMAN>!  YOU boss, ME just little follower!  I get it!"~ */
  IF ~!GlobalsEqual("#GFAMLVL","#GPLALVL")~ THEN REPLY @19 GOTO 51
  IF ~!InventoryFull(%famsummoner%)Global("WTPFAMLE","GLOBAL",2)!GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #59470 /* ~Come here, then.  Get in my pack.~ */ GOTO 2
  IF ~!InventoryFull(%famsummoner%)Global("WTPFAMNE","GLOBAL",2)!GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #59471 /* ~Come here, then.  Get in my pack.~ */ GOTO 25
  IF ~!InventoryFull(%famsummoner%)Global("WTPFAMCE","GLOBAL",2)!GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #59472 /* ~Come here, then.  Get in my pack.~ */ GOTO 26
  IF ~!InventoryFull(%famsummoner%)GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #59469 /* ~Come here, then.  Get in my pack.~ */ GOTO 48
  IF ~~ THEN REPLY #58299 /* ~(pet and play with it)~ */ GOTO 29
  IF ~%IsInBG1%~ THEN REPLY #58353 /* ~Do have any advice for me, my familiar?~ */ GOTO 34
  IF ~%IsInSoA%~ THEN REPLY #58353 /* ~Do have any advice for me, my familiar?~ */ GOTO 4
  IF ~%IsInToB%~ THEN REPLY #58353 /* ~Do have any advice for me, my familiar?~ */ GOTO 30
  IF ~~ THEN REPLY #58403 /* ~So... is all well down there?~ */ GOTO 13
  IF ~Global("#GAFTER","GLOBAL",0)~ THEN REPLY @15 GOTO 49
  IF ~Global("#GAFTER","GLOBAL",1)~ THEN REPLY @16 GOTO 50
  IF ~~ THEN REPLY #58405 /* ~Alright, let's just keep going.~ */ GOTO 20
END

IF ~~ THEN BEGIN 23 // from:
  SAY #58397 /* ~"Ow!  Dammit, stop it!  I'll do whatever you say, just stop slappin'!"  It takes steps away, muttering something about 'abusive co-dependant relationships' or similar.~ */
  IF ~!GlobalsEqual("#GFAMLVL","#GPLALVL")~ THEN REPLY @19 GOTO 51
  IF ~!InventoryFull(%famsummoner%)Global("WTPFAMLE","GLOBAL",2)!GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #59470 /* ~Come here, then.  Get in my pack.~ */ GOTO 2
  IF ~!InventoryFull(%famsummoner%)Global("WTPFAMNE","GLOBAL",2)!GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #59471 /* ~Come here, then.  Get in my pack.~ */ GOTO 25
  IF ~!InventoryFull(%famsummoner%)Global("WTPFAMCE","GLOBAL",2)!GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #59472 /* ~Come here, then.  Get in my pack.~ */ GOTO 26
  IF ~!InventoryFull(%famsummoner%)GlobalTimerNotExpired("#GSTAOUT","GLOBAL")~ THEN REPLY #59469 /* ~Come here, then.  Get in my pack.~ */ GOTO 48
  IF ~~ THEN REPLY #58299 /* ~(pet and play with it)~ */ GOTO 29
  IF ~%IsInBG1%~ THEN REPLY #58353 /* ~Do have any advice for me, my familiar?~ */ GOTO 34
  IF ~%IsInSoA%~ THEN REPLY #58353 /* ~Do have any advice for me, my familiar?~ */ GOTO 4
  IF ~%IsInToB%~ THEN REPLY #58353 /* ~Do have any advice for me, my familiar?~ */ GOTO 30
  IF ~~ THEN REPLY #58403 /* ~So... is all well down there?~ */ GOTO 13
  IF ~Global("#GAFTER","GLOBAL",0)~ THEN REPLY @15 GOTO 49
  IF ~Global("#GAFTER","GLOBAL",1)~ THEN REPLY @16 GOTO 50
  IF ~~ THEN REPLY #58405 /* ~Alright, let's just keep going.~ */ GOTO 20
END

IF ~~ THEN BEGIN 24 // from:
  SAY #58398 /* ~The imp darts away at the last second. "Nyah!  Thhhppppfffttt! You couldn't hit the broad side of a barn! You suck!" It dashes away before a reprisal can come.~ */
  IF ~~ THEN DO ~RunAwayFrom(LastTalkedToBy,30)ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 25 // from:
  SAY #72665 /* ~It rolls its eyes.  "Oh, sure.  Stick me in your smelly pack.  Ever thought of sticking some mint in there?  Baaah..." It reluctantly crawls in.~ */
  IF ~~ THEN DO ~SetGlobal("#GEMPCHA","GLOBAL",1)GivePartyAllEquipment()ReallyForceSpellRES("wtpclear",Myself)Wait(1)GiveItemCreate("wtpfmmep",%famsummoner%,0,0,0)SetGlobalTimer("#GWANOUT","GLOBAL",300)SetGlobalTimer("#GSTAOUT","GLOBAL",1200)DestroySelf()~ EXIT
END

IF ~~ THEN BEGIN 26 // from:
  SAY #72667 /* ~It rolls its eyes.  "Oh, sure.  Stick me in your smelly pack.  Ever thought of sticking some mint in there?  Baaah..." It reluctantly crawls in.~ */
  IF ~~ THEN DO ~SetGlobal("#GEMPCHA","GLOBAL",1)GivePartyAllEquipment()ReallyForceSpellRES("wtpclear",Myself)Wait(1)GiveItemCreate("wtpfmqua",%famsummoner%,0,0,0)SetGlobalTimer("#GWANOUT","GLOBAL",300)SetGlobalTimer("#GSTAOUT","GLOBAL",1200)DestroySelf()~ EXIT
END

IF ~~ THEN BEGIN 27 // from:
  SAY #73438 /* ~You offer the impish being a piece of dried meat.  It sniffs it with disgust and rolls its eyes.  "I don't really need nothin' to eat, boss.  Maybe if I'm wounded."  With that, it unceremoniously tosses the meat over its shoulder.~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 28 // from:
  SAY #73441 /* ~The wounded imp takes a piece of dried meat gingerly from your pack and gulps it down greedily.  As he munches away, he looks at you askance.  "This don't mean I owes you nothin', boss."~ */
  IF ~~ THEN DO ~ApplySpell(Myself,CLERIC_CURE_MEDIUM_WOUNDS)ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 29 // from:
  SAY @11
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 30 // from:
  SAY #72645 /* ~It looks at you incredulously, wondering if you are serious or if this is a prelude to a slap.  "You want *me* to give *you* advice, boss?  That's a first."~ */
  IF ~True()~ THEN EXIT
  IF ~Global("chapter","GLOBAL",%bg2_chapter_8%)~ THEN GOTO 31
  IF ~Global("chapter","GLOBAL",%bg2_chapter_9%)~ THEN GOTO 32
  IF ~Global("chapter","GLOBAL",%bg2_chapter_10%)~ THEN GOTO 33
END

IF ~~ THEN BEGIN 31 // from:
  SAY #72697 /* ~It scratches its head for a moment before replying. "There's big trouble, boss. The time has come for all you Bhaalspawns. The jig's up. Time to pay the piper, you know. Just don't get cracked is all I can say about it."~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 32 // from:
  SAY #72698 /* ~The impish creature grins from ear to ear.  "Well...kill them before they kills you.  That's what my grandpappy always said.  Until he was, um, killed..."~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 33 // from:
  SAY #72699 /* ~It shrugs.  "Seems simple to me, boss.  Kill the bitch."~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 34 // from:
SAY #58334 /* ~It looks at you incredulously, wondering if you are serious or if this is a prelude to a slap.  "You want *me* to give *you* advice, boss?  That's a first."~ */
  IF ~Global("chapter","GLOBAL",%bg1_chapter_0%)~ THEN GOTO 35
  IF ~Global("chapter","GLOBAL",%bg1_chapter_1%)~ THEN GOTO 36
  IF ~Global("chapter","GLOBAL",%bg1_chapter_2%)~ THEN GOTO 37
  IF ~Global("chapter","GLOBAL",%bg1_chapter_3%)~ THEN GOTO 38
  IF ~Global("chapter","GLOBAL",%bg1_chapter_4%)~ THEN GOTO 39
  IF ~Global("chapter","GLOBAL",%bg1_chapter_5%)%InBGAreaCheck%~ THEN GOTO 40
  IF ~Global("chapter","GLOBAL",%bg1_chapter_5%)%NotInBGAreaCheck%~ THEN GOTO 41
  IF ~Global("chapter","GLOBAL",%bg1_chapter_6%)!Global("Teth","Global",1)~ THEN GOTO 42
  IF ~Global("chapter","GLOBAL",%bg1_chapter_6%)Global("Teth","Global",1)~ THEN GOTO 43
  IF ~Global("chapter","GLOBAL",%bg1_chapter_7%)~ THEN GOTO 44
END

IF ~~ THEN BEGIN 35 // from:
  SAY @0 /* ~~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 36 // from:
  SAY @1 /* ~~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 37 // from:
  SAY @2 /* ~~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 38 // from:
  SAY @3 /* ~~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 39 // from:
  SAY @4 /* ~~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 40 // from:
  SAY @5 /* ~~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 41 // from:
  SAY @6 /* ~~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 42 // from:
  SAY @7 /* ~~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 43 // from:
  SAY @8 /* ~~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 44 // from:
  SAY @9 /* ~~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 48 // from:
  SAY @10 /* ~~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 49 // from:
  SAY @17 /* ~~ */
  IF ~~ THEN DO ~SetGlobal("#GAFTER","GLOBAL",1)ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 50 // from:
  SAY @18 /* ~~ */
  IF ~~ THEN DO ~SetGlobal("#GAFTER","GLOBAL",0)RunAwayFrom(%famsummoner%,45)ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 51 // from:
  SAY @20 /* ~~ */
  IF ~~ THEN DO ~SetGlobal("#GAFTER","GLOBAL",0)SetGlobal("#GFLVUP","GLOBAL",1)ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 55 // from:
  SAY @24 /* ~~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 56 // from:
  SAY @26 /* ~~ */
  IF ~~ THEN DO ~GivePartyAllEquipment()ReallyForceSpellRES("wtpclear",Myself)Wait(1)GiveItemCreate("wtpfmimp",%famsummoner%,0,0,0)SetGlobalTimer("#GWANOUT","GLOBAL",300)SetGlobalTimer("#GSTAOUT","GLOBAL",1200)DestroySelf()~ EXIT
END

IF ~~ THEN BEGIN 57 // from:
  SAY @26 /* ~~ */
  IF ~~ THEN DO ~SetGlobal("#GEMPCHA","GLOBAL",1)GivePartyAllEquipment()ReallyForceSpellRES("wtpclear",Myself)Wait(1)GiveItemCreate("wtpfmmep",%famsummoner%,0,0,0)SetGlobalTimer("#GWANOUT","GLOBAL",300)SetGlobalTimer("#GSTAOUT","GLOBAL",1200)DestroySelf()~ EXIT
END

IF ~~ THEN BEGIN 58 // from:
  SAY @26 /* ~~ */
  IF ~~ THEN DO ~SetGlobal("#GEMPCHA","GLOBAL",1)GivePartyAllEquipment()ReallyForceSpellRES("wtpclear",Myself)Wait(1)GiveItemCreate("wtpfmqua",%famsummoner%,0,0,0)SetGlobalTimer("#GWANOUT","GLOBAL",300)SetGlobalTimer("#GSTAOUT","GLOBAL",1200)DestroySelf()~ EXIT
END

IF ~~ THEN BEGIN 59 // from:
  SAY @27 /* ~~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 60 // from:
  SAY @29 /* ~~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END

IF ~~ THEN BEGIN 61 // from:
  SAY @30 /* ~~ */
  IF ~~ THEN DO ~ClearActions(Myself)~ EXIT
END
