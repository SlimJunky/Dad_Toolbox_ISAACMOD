local Toolbox = RegisterMod("Dad's Toolbox", 1)
local DAD_TOOLBOX_ID = Isaac.GetItemIdByName("Dad's Toolbox")
--local SOUND_TOOLBOX_HIT = Isaac.GetSoundIdByName("Dad_Toolbox_Hit")
if EID then --EID DESCRIPTOR
    EID:addCollectible(DAD_TOOLBOX_ID,table.concat(
        {
            "{{Collectible}} Drops Pickups or Items near to where the player was hit. The better the Pickup or Item, the lower the chance. Has very low chances for powerful effects.",
            "{{Luck}} Scales with luck to a cap of 30. Increases chances of rarer drops and effects.",
        },
        "#"
    )
    )
end


function Toolbox:TakeDamageDrop() -- if the player takes damage spawn these based on random float rng
    
    local player = Isaac.GetPlayer(0) --getting the player
    local entities = Isaac.GetRoomEntities()
    --local tb_rng = player:GetCollectibleRNG(DAD_TOOLBOX_ID)
    local copyCount = player:GetCollectibleNum(DAD_TOOLBOX_ID) --if the amount of CBT_ITEM is greater than 1
    --local tb_rng_float = tb_rng:RandomFloat() --random float represenitng % chance
    if copyCount >= 1 then
    --SFXManager():Play(471,8,2,false,1,0) --play when hit glass break sound

    local playerLuck = (player.Luck / 100) --this keeps track of player luck and caps at 30. If player has more than 30 luck wont effect drops
    if playerLuck >= 0.30 then
        playerLuck = 0.30 --caps it at 30 luck no matter what so doesnt go over 20% add
    end
    


    --------NORMAL PICKUP CHANCES--------
    local tb_rng_float_1 = math.random()
    local TOOLBOX_CHANCE = 0.7
    local randomSelect = math.random(1,12) --scuffed switch case rng system, if i knew how to make python esque dicitonaries this would look neater but has to happen. (also dont like tables)
        if tb_rng_float_1 <= TOOLBOX_CHANCE then
            if randomSelect == 1 then
                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_BOMB, BombSubType.BOMB_NORMAL, player.Position, player.Velocity, player)-- spawns a bomb if successful
            elseif randomSelect == 2 then
                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART, HeartSubType.HALF_SOUL, player.Position, player.Velocity, player) --half soul heart
            elseif randomSelect == 3 then
                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_KEY, KeySubType.KEY_NORMAL, player.Position, player.Velocity, player) --spawns a key
            elseif randomSelect == 4 then
                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, CoinSubType.COIN_PENNY, player.Position, player.Velocity, player) --spawns a penny
            elseif randomSelect == 5 then
                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_NORMAL,  player.Position, player.Velocity, player) --spawns batteries
            elseif randomSelect == 6 then 
                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART, HeartSubType.HEART_FULL,  player.Position, player.Velocity, player) --full heart
            elseif randomSelect == 7 then
                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, CoinSubType.COIN_DOUBLEPACK,  player.Position, player.Velocity, player)
            elseif randomSelect == 8 then
                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART, HeartSubType.HEART_HALF,  player.Position, player.Velocity, player)
            elseif randomSelect == 9 then
                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_KEY, KeySubType.KEY_DOUBLEPACK,  player.Position, player.Velocity, player)
            elseif randomSelect == 10  then
                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_BOMB, BombSubType.BOMB_DOUBLEPACK,  player.Position, player.Velocity, player)
            elseif randomSelect == 11 then
                player:AddBlueFlies(3,player.Position,player)
            elseif randomSelect == 12 then --spawn 3 spiders
                for i = 1, 3 do
                    player:AddBlueSpider(player.Position)
                end
            end
        
        elseif tb_rng_float_1 > TOOLBOX_CHANCE then


    --------RARE PICKUP CHANCES--------
            local tb_rng_float_2 = math.random()
            TOOLBOX_CHANCE = 0.4 -- was 0.4
            local randomSelect2 = math.random(1,18)
            if tb_rng_float_2 <= TOOLBOX_CHANCE then
                if randomSelect2 == 1 then
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_BOMB, BombSubType.BOMB_TROLL, player.Position, player.Velocity, player)--spawns a troll bomb
                elseif randomSelect2 == 2 then
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_CHEST, ChestSubType.CHEST_CLOSED, player.Position, player.Velocity, player)
                elseif randomSelect2 == 3 then
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_LOCKEDCHEST, ChestSubType.CHEST_CLOSED, player.Position, player.Velocity, player) --golden chest
                elseif randomSelect2 == 4 then
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_REDCHEST, ChestSubType.CHEST_CLOSED, player.Position, player.Velocity, player)
                elseif randomSelect2 == 5 then
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_PILL, PillColor.PILL_REDDOTS_RED, player.Position, player.Velocity, player) --not sure yet since pill has no subtype?
                elseif randomSelect2 == 6 then
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, PickupVariant.CARD_RANDOM, player.Position, player.Velocity, player) --same here
                elseif randomSelect2 == 7 then
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_GRAB_BAG, PickupVariant.PICKUP_GRAB_BAG , player.Position, player.Velocity, player) -- same here :o
                elseif randomSelect2 == 8 then
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, CoinSubType.COIN_NICKEL, player.Position, player.Velocity, player)
                elseif randomSelect2 == 9 then
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, CoinSubType.COIN_STICKYNICKEL, player.Position, player.Velocity, player)
                elseif randomSelect2 == 10 then
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART, HeartSubType.HEART_SOUL, player.Position, player.Velocity, player)
                elseif randomSelect2 == 11 then
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_BOMBCHEST, ChestSubType.CHEST_CLOSED, player.Position, player.Velocity, player)
                elseif randomSelect2 == 12 then
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HAUNTEDCHEST, ChestSubType.CHEST_CLOSED, player.Position, player.Velocity, player)
                elseif randomSelect2 == 13 then
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_WOODENCHEST, ChestSubType.CHEST_CLOSED, player.Position, player.Velocity, player)
                elseif randomSelect2 == 14 then
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_MIMICCHEST, ChestSubType.CHEST_CLOSED, player.Position, player.Velocity, player)
                elseif randomSelect2 == 15 then --charms one in room perma not bosses
                    for _, entity in ipairs(entities) do
                        if entity:IsActiveEnemy() and entity:IsVulnerableEnemy() and not entity:IsBoss() then
                            entity:AddCharmed(EntityRef(player), -1)
                            break --only activates once
                        end
                    end
                elseif randomSelect2 == 16 then
                    for _, entity in ipairs(entities) do
                        if entity:IsActiveEnemy() and entity:IsVulnerableEnemy() then
                            entity:AddBurn(EntityRef(player),63,2) --4 damage tick burn to all enemies
                        end
                    end
                elseif randomSelect2 == 17 then
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_CHEST, ChestSubType.CHEST_CLOSED, player.Position, player.Velocity, player)
                elseif randomSelect2 == 18 then
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_LOCKEDCHEST, ChestSubType.CHEST_CLOSED, player.Position, player.Velocity, player)
                end

            elseif tb_rng_float_2 > TOOLBOX_CHANCE then

            -------ULTRA RARE PICKUP CHANCES AND SOME TRINKETS-------
                local tb_rng_float_3 = math.random()
                TOOLBOX_CHANCE = 0.175 + playerLuck --was 0.15
                local randomSelect3 = math.random(1,25)
                if tb_rng_float_3 <= TOOLBOX_CHANCE then
                    player:AnimateHappy()
                    if randomSelect3 == 1 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_BOMB, BombSubType.BOMB_GOLDEN, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 2 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_KEY, KeySubType.KEY_GOLDEN, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 3 then --2 scared hearts
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART, HeartSubType.HEART_SCARED, player.Position, player.Velocity, player)
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART, HeartSubType.HEART_SCARED, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 4 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_KEY, KeySubType.KEY_CHARGED, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 5 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_MEGA, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 6 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_GOLDEN, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 7 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, CoinSubType.COIN_DIME, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 8 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, CoinSubType.COIN_LUCKYPENNY, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 9 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, CoinSubType.COIN_GOLDEN, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 10 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_MEGACHEST, ChestSubType.CHEST_CLOSED, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 11 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_ETERNALCHEST, ChestSubType.CHEST_CLOSED, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 12  then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART, HeartSubType.HEART_BLACK, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 13 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART, HeartSubType.HEART_GOLDEN, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 14 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART, HeartSubType.HEART_DOUBLEPACK, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 15 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART, HeartSubType.HEART_BONE, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 16 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, TrinketType.TRINKET_MAGGYS_FAITH, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 17 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, TrinketType.TRINKET_FOUND_SOUL, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 18 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, TrinketType.TRINKET_MOMS_LOCK, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 19 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, TrinketType.TRINKET_FADED_POLAROID, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 20 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, TrinketType.TRINKET_BAG_LUNCH, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 21 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, TrinketType.TRINKET_BIBLE_TRACT, player.Position, player.Velocity, player)

                    ----THESE ARE REPEATS TO INCREASE CHANCE OF SELECTION OF THESE SPECIFIC CHOICES FOR BALANCING----
                    elseif randomSelect3 == 22 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_MEGACHEST, ChestSubType.CHEST_CLOSED, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 23 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_ETERNALCHEST, ChestSubType.CHEST_CLOSED, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 24 then
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, CoinSubType.COIN_LUCKYPENNY, player.Position, player.Velocity, player)
                    elseif randomSelect3 == 25 then
                        --Isaac.GridSpawn(GridEntityType.GRID_POOP, 1499, player.Position , false)
                        Isaac.ExecuteCommand("gridspawn 1499") --spawn a massive poop
                    end
                
                elseif tb_rng_float_3 > TOOLBOX_CHANCE then
            
                    --------ITEM DROPS NORMAL CHANCES + UBER MEGA DROPS/TRINKETS------
                    --local normal_item_pity
                    --normal_item_pity = normal_item_pity + 0.01 --add pity since previous item didnt spawn by 1%
                    local tb_rng_float_4 = math.random()
                    TOOLBOX_CHANCE = 0.125 + playerLuck  --normal_item_pity --was 0.075
                    local randomSelect4 = math.random(1,25)
                    if tb_rng_float_4 <= TOOLBOX_CHANCE then
                        player:AnimateHappy()
                        --normal_item_pity = 0 --if it did activate reset pity to 0
                        if randomSelect4 == 1 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_DADS_KEY, player.Position, player.Velocity, player) --spawns dads key?
                        elseif randomSelect4 == 2 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_DADS_LOST_COIN, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 3 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_DADS_RING, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 4 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_DADDY_LONGLEGS, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 5 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_MOMS_RING, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 6 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_MOMS_UNDERWEAR, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 7 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_MOMS_PEARLS, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 8 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_QUARTER, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 9 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_DECK_OF_CARDS, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 10 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_DOLLAR, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 11 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_MOMS_BRA, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 12 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_MOMS_BOTTLE_OF_PILLS, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 13 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_MOMS_LIPSTICK, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 14 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_MOMS_PERFUME, player.Position, player.Velocity, player)
                        elseif randomSelect4 ==  15 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_SKELETON_KEY, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 16 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_PYRO, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 17 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART, HeartSubType.HEART_ETERNAL, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 18 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_BOMB, BombSubType.BOMB_GIGA,  player.Position, player.Velocity, player)
                        elseif randomSelect4 == 19 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, TrinketType.TRINKET_BLESSED_PENNY, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 20 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, TrinketType.TRINKET_BLOODY_PENNY, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 21 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_MOMSCHEST, ChestSubType.CHEST_CLOSED, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 22 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_OLDCHEST, ChestSubType.CHEST_CLOSED, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 23 then
                            player:AddBlueFlies(40,player.Position,player) --spawn 40 blue flies :o
                        elseif randomSelect4 == 24 then
                            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_RED_KEY, player.Position, player.Velocity, player)
                        elseif randomSelect4 == 25 then
                            player:AnimateTeleport(true)
                            Isaac.ExecuteCommand("goto s.shop.5") --goto rare shop not on floor
                        end

                    elseif tb_rng_float_4 > TOOLBOX_CHANCE then

                        --------ULTRA RARE ITEM DROPS-----------

                        --local ultra_rare_item_pity
                        --ultra_rare_item_pity = ultra_rare_item_pity + 0.005 -- add 0.5%
                        local tb_rng_float_5 = math.random() --float between 0,1
                        TOOLBOX_CHANCE = 0.01 + (playerLuck/2) --+ ultra_rare_item_pity
                        local randomSelect5 = math.random(1,16)
                        if tb_rng_float_5 <= TOOLBOX_CHANCE then
                            player:AnimateHappy()
                            --ultra_rare_item_pity = 0
                            if randomSelect5 == 1 then
                                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_MAGIC_MUSHROOM, player.Position, player.Velocity, player)
                            elseif randomSelect5 == 2 then
                                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_HALO, player.Position, player.Velocity, player)
                            elseif randomSelect5 == 3 then
                                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_GOAT_HEAD, player.Position, player.Velocity, player)
                            elseif randomSelect5 == 4 then
                                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_EUCHARIST, player.Position, player.Velocity, player)
                            elseif randomSelect5 == 5 then
                                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_D6, player.Position, player.Velocity, player)
                            elseif randomSelect5 == 6 then
                                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_DEAD_CAT, player.Position, player.Velocity, player)
                            elseif randomSelect5 == 7 then
                                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_WAFER, player.Position, player.Velocity, player)
                            elseif randomSelect5 == 8 then
                                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_CAPRICORN, player.Position, player.Velocity, player)
                            elseif randomSelect5 == 9 then
                                player:AnimateTeleport(true) --play a teleport animation when this happens
                                Isaac.ExecuteCommand("goto s.angel") -- execute the debug command to go to an angel room not on floor
                            elseif randomSelect5 == 10 then
                                player:AnimateTeleport(true)
                                Isaac.ExecuteCommand("goto s.devil") -- go devil not on floor
                            elseif randomSelect5 == 11 then
                                SFXManager():Play(SoundEffect.SOUND_MOM_VOX_EVILLAUGH,2,2,false,1,0) --play mom evil laugh when this spawns
                                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_MOMS_KNIFE, player.Position, player.Velocity, player)
                            elseif randomSelect5 == 12 then
                                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_ROCK_BOTTOM, player.Position, player.Velocity, player)
                            elseif randomSelect5 == 13 then
                                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_SATANIC_BIBLE, player.Position, player.Velocity, player)
                            elseif randomSelect5 == 14 then
                                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_STAIRWAY, player.Position, player.Velocity, player)
                            elseif randomSelect5 == 15 then
                                player:AnimateTeleport(true)
                                Isaac.ExecuteCommand("goto s.planetarium.6") --double planetarium variant go to not on floor
                            elseif randomSelect5 == 16 then
                                player:AnimateTeleport(true)
                                Isaac.ExecuteCommand("goto s.shop.12") --go to really good keeper shop not on floor
                            end

                        elseif tb_rng_float_5 > TOOLBOX_CHANCE then

                            ----------SUPER ULTRA RARE SECRET MEGA CHANCE ITEMS -----------

                            --local wtf_item_pity
                            --wtf_item_pity = wtf_item_pity + 0.0025
                            local tb_rng_float_6 = math.random()
                            TOOLBOX_CHANCE = 0.001 + (playerLuck/4) --+ wtf_item_pity --this is to decrease the player luck buff here. So it is not at as big. balancing
                            local randomSelect6 = math.random(1,22)
                            if tb_rng_float_6 <= TOOLBOX_CHANCE then
                                SFXManager():Play(SoundEffect.SOUND_HOLY,2,2,false,1,0)
                                player:AnimateHappy()
                                --wtf_item_pity = 0
                                if randomSelect6 == 1 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_SACRED_HEART, player.Position, player.Velocity, player)
                                elseif randomSelect6 == 2 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_DEATH_CERTIFICATE, player.Position, player.Velocity, player)
                                elseif randomSelect6 == 3 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_GODHEAD, player.Position, player.Velocity, player)
                                elseif randomSelect6 == 4 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_BRIMSTONE, player.Position, player.Velocity, player)
                                elseif randomSelect6 == 5 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_TWISTED_PAIR, player.Position, player.Velocity, player)
                                elseif randomSelect6 == 6 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_INCUBUS, player.Position, player.Velocity, player)
                                elseif randomSelect6 == 7 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_SPINDOWN_DICE, player.Position, player.Velocity, player)
                                elseif randomSelect6 == 8 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_CRICKETS_HEAD, player.Position, player.Velocity, player)
                                elseif randomSelect6 == 9 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_CROWN_OF_LIGHT, player.Position, player.Velocity, player)
                                elseif randomSelect6 == 10 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_SACRED_ORB, player.Position, player.Velocity, player)
                                elseif randomSelect6 == 11 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_GLITCHED_CROWN, player.Position, player.Velocity, player)
                                elseif randomSelect6 == 12 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_POLYPHEMUS, player.Position, player.Velocity, player)
                                elseif randomSelect6 == 13 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_PYROMANIAC, player.Position, player.Velocity, player)
                                elseif randomSelect6 == 14 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_REVELATION, player.Position, player.Velocity, player)
                                elseif randomSelect6 == 15 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_20_20, player.Position, player.Velocity, player)
                                elseif randomSelect6 == 16 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_TECH_X, player.Position, player.Velocity, player)
                                elseif randomSelect6 == 17 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_R_KEY, player.Position, player.Velocity, player)
                                elseif randomSelect6 == 18 then
                                    player:AnimateTeleport(true)
                                    Isaac.ExecuteCommand("stage 13") --go to home
                                elseif randomSelect6 == 19 then
                                    Isaac.Spawn(EntityType.ENTITY_HENRY, 0, 0, player.Position, player.Velocity, player) --spawn henry magically for like 0.1 seconds and he dissapears into the abyss
                                elseif randomSelect6 == 20 then
                                    player:AnimateTeleport(true)
                                    Isaac.ExecuteCommand("goto s.default.0") --go to default "test room"
                                elseif randomSelect6 == 21 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_C_SECTION, player.Position, player.Velocity, player)
                                elseif randomSelect6 == 22 then
                                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_HOLY_MANTLE, player.Position, player.Velocity, player)
                                end
                            else
                                return  ------ IF NONE OF THE PREVIOUS CONDITIONS WORKED END THE LOOP AND RETURN
                            end
                        end
                    end
                end
            end
        end

    else
        return --- IF COPY COUNT IS NOT 1 OR MORE DONT DO ANYTHING
    end   
end

Toolbox:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, Toolbox.TakeDamageDrop, EntityType.ENTITY_PLAYER) --checks entitytype is the player taking the damage

-- .___  ___.      ___       _______   _______    .______   ____    ____         _______. __       __  .___  ___.        __   __    __  .__   __.  __  ___ ____    ____ 
--|   \/   |     /   \     |       \ |   ____|   |   _  \  \   \  /   /        /       ||  |     |  | |   \/   |       |  | |  |  |  | |  \ |  | |  |/  / \   \  /   / 
--|  \  /  |    /  ^  \    |  .--.  ||  |__      |  |_)  |  \   \/   /        |   (----`|  |     |  | |  \  /  |       |  | |  |  |  | |   \|  | |  '  /   \   \/   /  
--|  |\/|  |   /  /_\  \   |  |  |  ||   __|     |   _  <    \_    _/          \   \    |  |     |  | |  |\/|  | .--.  |  | |  |  |  | |  . `  | |    <     \_    _/   
--|  |  |  |  /  _____  \  |  '--'  ||  |____    |  |_)  |     |  |        .----)   |   |  `----.|  | |  |  |  | |  `--'  | |  `--'  | |  |\   | |  .  \      |  |     
--|__|  |__| /__/     \__\ |_______/ |_______|   |______/      |__|        |_______/    |_______||__| |__|  |__|  \______/   \______/  |__| \__| |__|\__\     |__|--    