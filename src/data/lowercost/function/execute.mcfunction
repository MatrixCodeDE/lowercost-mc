scoreboard players set @s lowerCost 0

# create temporary storage
summon minecraft:chest_minecart ~ ~ ~ {Tags:["lowercoststore"]}

# insert item from mainhand
item replace entity @e[type=chest_minecart,tag=lowercoststore,limit=1,sort=nearest] container.0 from entity @s weapon.mainhand


# if enchanted book
execute if data entity @e[type=chest_minecart,tag=lowercoststore,limit=1,sort=nearest] Items[{Slot:0b,id:"minecraft:enchanted_book"}] run function lowercost:fix_book

# else
execute unless data entity @e[type=chest_minecart,tag=lowercoststore,limit=1,sort=nearest] Items[{Slot:0b,id:"minecraft:enchanted_book"}] run function lowercost:fix_item

item replace entity @s weapon.mainhand from entity @e[type=chest_minecart,tag=lowercoststore,limit=1,sort=nearest] container.0

kill @e[type=chest_minecart,tag=lowercoststore,limit=1,sort=nearest]



