--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_crack_factory/lua/crack/sh/config/config.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

---------------------------------------------------------------------------------
---------------------------Do not edit below here--------------------------------
---------------------------------------------------------------------------------
ccka = {}
---------------------------------------------------------------------------------
--------------------------Config start below here--------------------------------
---------------------------------------------------------------------------------

-- The model of the crack buyer npc.
ccka.BuyerNpcModel = "models/eli.mdl"
-- Header text of the crack buyer npc.
ccka.HeaderText = "Crack"
-- How far away can the npc detect your drugholder.
ccka.SellDistance = 250
-- Crack bucket value?
ccka.CrackBucketValue = 5000
-- How long does it take the barrel to ferment the fluid?
ccka.CrackBarrelFermentTime = 60
-- The sound the heater makes when turned on?
ccka.CrackHeaterSound = "ambient/gas/steam2.wav"
-- Sound level of the crack ferment. (between 1-180)
ccka.CrackHeaterSoundLevel = 60 
-- Mircowave time is in 2 stages, so total run time of the mircowave is 20 seconds.
ccka.CrackMircowaveStage1Time = 60
ccka.CrackMircowaveStage2Time = 60 
-- To make the bowl spawn higher up, increase this number.
ccka.CrackMircowaveBowlSpawnHeight = 25 
-- The sound of the mircowave.
ccka.CrackMircowaveSound = "ambient/machines/electric_machine.wav"
-- Sound level of the crack mircowave. (between 1-180)
ccka.CrackMircowaveSoundLevel = 60

---------------------------------------------------------------------------------
-----------------------------Sell Without NPC------------------------------------
---------------------------------------------------------------------------------

-- Should you be able to sell the crack, by pressing E at it.
ccka.SellWithoutNPC = false

---------------------------------------------------------------------------------
-------------------------------Health Config-------------------------------------
---------------------------------------------------------------------------------

-- Health of all of the entities
ccka.BarrelHealth = 100
ccka.BowlHealth = 100
ccka.BucketHealth = 100
ccka.CompressorHealth = 100
ccka.FermentHealth = 100
ccka.HeaterHealth = 100
ccka.MircowaveHealth = 100
ccka.PipekitHealth = 100

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

