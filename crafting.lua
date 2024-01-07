-----------------------------------------------------------------------------------------------
-- Coconut Tree 
-----------------------------------------------------------------------------------------------
-- From Dryplants by Mossmanikin
-- Modified by Neuromancer
--
-- Looked at code from:		darkage, default, farming, sickle, stairs
-- Dependencies:			default, farming
-- Supports:				flint, stoneage, sumpf
-----------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------
-- Wet thatch
-----------------------------------------------------------------------------------------------
minetest.register_craft({ -- papyrus -> wetthatch
	output = "coconut_tree:wetthatch 4",
	recipe = {
		{"coconut_tree:coconut_leaves","coconut_tree:coconut_leaves"},
		{"coconut_tree:coconut_leaves","coconut_tree:coconut_leaves"},
	}
})

local thatch = {
	{"wetthatch"},
	{"thatch"}
}
for i in pairs(thatch) do
	local thatch = "coconut_tree:"..thatch[i][1]
	local slab = thatch.."_slab"
	local roof = thatch.."_roof"
	local corner = roof.."_corner"
	local corner_2 = corner.."_2"
-----------------------------------------------------------------------------------------------
-- Block
-----------------------------------------------------------------------------------------------
	minetest.register_craft({ -- slab -> block
		output = thatch,
		recipe = {
			{slab},
			{slab},
		}
	})
	minetest.register_craft({ -- roof -> block
		output = thatch,
		recipe = {
			{roof},
			{roof},
		}
	})
	minetest.register_craft({ -- corner -> block
		type = "shapeless",
		output = thatch.." 3",
		recipe = {corner,corner,corner,corner,corner,corner,corner,corner}, -- 8x
	})
	minetest.register_craft({ -- corner_2 -> block
		type = "shapeless",
		output = thatch.." 3",
		recipe = {corner_2,corner_2,corner_2,corner_2,corner_2,corner_2,corner_2,corner_2}, -- 8x
	})
-----------------------------------------------------------------------------------------------
-- Slab
-----------------------------------------------------------------------------------------------
	minetest.register_craft({ -- block -> slab
		output = slab.." 6",
		recipe = {
			{thatch,thatch,thatch},
		}
	})
	minetest.register_craft({ -- roof -> slab
		output = slab,
		recipe = {
			{roof},
		}
	})
	minetest.register_craft({ -- corner -> slab
		output = slab.." 3",
		recipe = {
			{corner,corner},
			{corner,corner},
		}
	})
	minetest.register_craft({ -- corner_2 -> slab
		output = slab.." 3",
		recipe = {
			{corner_2,corner_2},
			{corner_2,corner_2},
		}
	})
-----------------------------------------------------------------------------------------------
-- Roof
-----------------------------------------------------------------------------------------------
	minetest.register_craft({ -- block -> roof
		output = roof.." 4",
		recipe = {
			{thatch,""},
			{"",thatch},
		}
	})
	minetest.register_craft({ -- block -> roof
		output = roof.." 4",
		recipe = {
			{"",thatch},
			{thatch,""},
		}
	})
	minetest.register_craft({ -- slab -> roof
		output = roof,
		recipe = {
			{slab},
		}
	})
-----------------------------------------------------------------------------------------------
-- Roof Corner
-----------------------------------------------------------------------------------------------
	minetest.register_craft({ -- block -> corner
		output = corner.." 8",
		recipe = {
			{"",thatch,""},
			{thatch,"",thatch},
		}
	})
	minetest.register_craft({ -- corner_2 -> corner
		output = corner,
		recipe = {
			{corner_2},
		}
	})
-----------------------------------------------------------------------------------------------
-- Roof Corner 2
-----------------------------------------------------------------------------------------------
	minetest.register_craft({ -- block -> corner_2
		output = corner_2.." 8",
		recipe = {
			{thatch,"",thatch},
			{"",thatch,""},
		}
	})
	minetest.register_craft({ -- corner -> corner_2
		output = corner_2,
		recipe = {
			{corner},
		}
	})
end

-----------------------------------------------------------------------------------------------
-- thatch
-----------------------------------------------------------------------------------------------

--cooking
minetest.register_craft({ -- wetthatch -> thatch
	type = "cooking",
	output = "coconut_tree:thatch",
	recipe = "coconut_tree:wetthatch",
	cooktime = 2,
})
--fuel
minetest.register_craft({
	type = "fuel",
	recipe = "coconut_tree:thatch",
	burntime = 4,
})
-----------------------------------------------------------------------------------------------
-- thatch Slab
-----------------------------------------------------------------------------------------------
--cooking
minetest.register_craft({ -- wetthatch_slab -> thatch_slab
	type = "cooking",
	output = "coconut_tree:thatch_slab",
	recipe = "coconut_tree:wetthatch_slab",
	cooktime = 1,
})
--fuel
minetest.register_craft({
	type = "fuel",
	recipe = "coconut_tree:thatch_slab",
	burntime = 2,
})
-----------------------------------------------------------------------------------------------
-- thatch Roof
-----------------------------------------------------------------------------------------------
--cooking
minetest.register_craft({ -- wetthatch_roof -> thatch_roof
	type = "cooking",
	output = "coconut_tree:thatch_roof",
	recipe = "coconut_tree:wetthatch_roof",
	cooktime = 1,
})
--fuel
minetest.register_craft({
	type = "fuel",
	recipe = "coconut_tree:thatch_roof",
	burntime = 2,
})
-----------------------------------------------------------------------------------------------
-- thatch Roof Corner
-----------------------------------------------------------------------------------------------
--cooking
minetest.register_craft({ -- wetthatch_roof_corner -> thatch_roof_corner
	type = "cooking",
	output = "coconut_tree:thatch_roof_corner",
	recipe = "coconut_tree:wetthatch_roof_corner",
	cooktime = 1,
})
--fuel
minetest.register_craft({
	type = "fuel",
	recipe = "coconut_tree:thatch_roof_corner",
	burntime = 2,
})
-----------------------------------------------------------------------------------------------
-- Wet thatch Roof Corner 2
-----------------------------------------------------------------------------------------------
--cooking
minetest.register_craft({ -- wetthatch_roof_corner -> thatch_roof_corner
	type = "cooking",
	output = "coconut_tree:thatch_roof_corner_2",
	recipe = "coconut_tree:wetthatch_roof_corner_2",
	cooktime = 1,
})
--fuel
minetest.register_craft({
	type = "fuel",
	recipe = "coconut_tree:thatch_roof_corner_2",
	burntime = 2,
})
-----------------------------------------------------------------------------------------------
-- Dandelion Leave
-----------------------------------------------------------------------------------------------
--[[minetest.register_craftitem("coconut_tree:dandelion_leave", {
	description = "Dandelion Leave",
	inventory_image = "coconut_tree_dandelion_leave.png",
	on_use = minetest.item_eat(1),
})
minetest.register_craft({
	type = "shapeless",
	output = "coconut_tree:dandelion_leave 4",
	recipe = {"flowers:dandelion_yellow"},
	replacements = {
		{"flowers:dandelion_yellow", "dye:yellow"}
	},
})]]
