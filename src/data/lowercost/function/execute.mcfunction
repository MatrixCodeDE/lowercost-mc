scoreboard players set @s lowerCost 0
# set threshold cost to x (current cost should not be lower than the new cost)
scoreboard players set @s lc_thresholdCost 30


# create temporary storage
execute as @s run summon minecraft:chest_minecart ~ ~ ~ {Tags:["lowercoststore"]}

# insert item from mainhand
item replace entity @e[type=chest_minecart,tag=lowercoststore,limit=1,sort=nearest] container.0 from entity @s weapon.mainhand

# copy current cost to 'lc_currentCost'
execute store result score @s lc_currentCost run data get entity @e[type=chest_minecart,limit=1,sort=nearest] Items[{Slot:0b}].components.minecraft:repair_cost

execute if score @s lc_currentCost > @s lc_thresholdCost run function lowercost:find_function
execute unless score @s lc_currentCost > @s lc_thresholdCost unless data entity @e[type=chest_minecart,tag=lowercoststore,limit=1,sort=nearest] Items[{Slot:0b,id:"minecraft:air"}] run tellraw @s {"text":"[","color":"white","extra":[{"text":"LowerCost","color":"light_purple","bold":true},{"text":"] ","color":"white"},{"text":"The selected item has a lower or equal cost than the fixed cost!","color":"red"}]}

item replace entity @s weapon.mainhand from entity @e[type=chest_minecart,tag=lowercoststore,limit=1,sort=nearest] container.0
# destroy item to avoid duplication
item replace entity @e[type=chest_minecart,tag=lowercoststore,limit=1,sort=nearest] container.0 with minecraft:air

kill @e[type=chest_minecart,tag=lowercoststore,limit=1,sort=nearest]



