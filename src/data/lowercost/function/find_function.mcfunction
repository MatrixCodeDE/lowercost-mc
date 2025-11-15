execute if data entity @e[type=chest_minecart,tag=lowercoststore,limit=1,sort=nearest] Items[{Slot:0b,id:"minecraft:enchanted_book"}] run function lowercost:fix_book

execute unless data entity @e[type=chest_minecart,tag=lowercoststore,limit=1,sort=nearest] Items[{Slot:0b,id:"minecraft:enchanted_book"}] run function lowercost:fix_item