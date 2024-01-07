-----------------------------------------------------------------------------------------------
-- Dry Plants - thatch 0.0.5
-----------------------------------------------------------------------------------------------
-- by Mossmanikin 
-- Edited by Neuromancer
-- Looked at code from:		darkage, default, stairs
-- Dependencies:			default
-----------------------------------------------------------------------------------------------
-- support for i18n
local S = minetest.get_translator("coconut_tree")

minetest.register_alias("stairs:stair_wetthatch",				"coconut_tree:wetthatch_roof")
minetest.register_alias("stairs:slab_wetthatch",				"coconut_tree:wetthatch_slab")
minetest.register_alias("stairs:stair_thatch",				"coconut_tree:thatch_roof")
minetest.register_alias("stairs:slab_thatch",					"coconut_tree:thatch_slab")


-----------------------------------------------------------------------------------------------
-- Wet thatch
-----------------------------------------------------------------------------------------------
minetest.register_node("coconut_tree:wetthatch", {
	description = S("Wet thatch"),
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_thatch_wet.png"},
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- Wet thatch Slab
-----------------------------------------------------------------------------------------------
minetest.register_node("coconut_tree:wetthatch_slab", {
	description = S("Wet thatch Slab"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_thatch_wet.png"},
	node_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, 0, 1/2},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, 0, 1/2},
	},
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- Wet thatch Roof
-----------------------------------------------------------------------------------------------
minetest.register_node("coconut_tree:wetthatch_roof", {
	description = S("Wet thatch Roof"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_thatch_wet.png"},
	node_box = {
		type = "fixed",
--				{ left	, bottom , front  ,  right ,  top   ,  back  }
		fixed = {
			{-1/2, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, -1/2, -1/2, 1/2, 0, 0},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/2, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, -1/2, -1/2, 1/2, 0, 0},
		}
	},
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

local CoRNeR = {
--		  MaTeRiaL
	{"wetthatch"},
	{"thatch"}
}

for i in pairs(CoRNeR) do

	local MaTeRiaL = CoRNeR[i][1]
	local roof = "coconut_tree:"..MaTeRiaL.."_roof"
	local corner = "coconut_tree:"..MaTeRiaL.."_roof_corner"
	local corner_2 = "coconut_tree:"..MaTeRiaL.."_roof_corner_2"

	minetest.register_abm({
		nodenames = {roof},
		interval = 1,
		chance = 1,
		action = function(pos)

			local node_east =			minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z  })
			local node_west =			minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z  })
			local node_north =			minetest.get_node({x=pos.x,   y=pos.y, z=pos.z+1})
			local node_south =			minetest.get_node({x=pos.x,   y=pos.y, z=pos.z-1})
	-- corner 1
			if ((node_west.name == roof and node_west.param2 == 0)
			or (node_west.name == corner and node_west.param2 == 1))
			and ((node_north.name == roof and node_north.param2 == 3)
			or (node_north.name == corner and node_north.param2 == 3))
			then
				minetest.swap_node(pos, {name=corner, param2=0})
			end

			if ((node_north.name == roof and node_north.param2 == 1)
			or (node_north.name == corner and node_north.param2 == 2))
			and ((node_east.name == roof and node_east.param2 == 0)
			or (node_east.name == corner and node_east.param2 == 0))
			then
				minetest.swap_node(pos, {name=corner, param2=1})
			end

			if ((node_east.name == roof and node_east.param2 == 2)
			or (node_east.name == corner and node_east.param2 == 3))
			and ((node_south.name == roof and node_south.param2 == 1)
			or (node_south.name == corner and node_south.param2 == 1))
			then
				minetest.swap_node(pos, {name=corner, param2=2})
			end

			if ((node_south.name == roof and node_south.param2 == 3)
			or (node_south.name == corner and node_south.param2 == 0))
			and ((node_west.name == roof and node_west.param2 == 2)
			or (node_west.name == corner and node_west.param2 == 2))
			then
				minetest.swap_node(pos, {name=corner, param2=3})
			end
	-- corner 2
			if ((node_west.name == roof and node_west.param2 == 2)
			or (node_west.name == corner_2 and node_west.param2 == 1))
			and ((node_north.name == roof and node_north.param2 == 1)
			or (node_north.name == corner_2 and node_north.param2 == 3))
			then
				minetest.swap_node(pos, {name=corner_2, param2=0})
			end

			if ((node_north.name == roof and node_north.param2 == 3)
			or (node_north.name == corner_2 and node_north.param2 == 2))
			and ((node_east.name == roof and node_east.param2 == 2)
			or (node_east.name == corner_2 and node_east.param2 == 0))
			then
				minetest.swap_node(pos, {name=corner_2, param2=1})
			end

			if ((node_east.name == roof and node_east.param2 == 0)
			or (node_east.name == corner_2 and node_east.param2 == 3))
			and ((node_south.name == roof and node_south.param2 == 3)
			or (node_south.name == corner_2 and node_south.param2 == 1))
			then
				minetest.swap_node(pos, {name=corner_2, param2=2})
			end

			if ((node_south.name == roof and node_south.param2 == 1)
			or (node_south.name == corner_2 and node_south.param2 == 0))
			and ((node_west.name == roof and node_west.param2 == 0)
			or (node_west.name == corner_2 and node_west.param2 == 2))
			then
				minetest.swap_node(pos, {name=corner_2, param2=3})
			end

		end,
	})
end

-----------------------------------------------------------------------------------------------
-- Wet thatch Roof Corner 1
-----------------------------------------------------------------------------------------------
minetest.register_node("coconut_tree:wetthatch_roof_corner", {
	description = S("Wet thatch Roof Corner 1"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_thatch_wet.png"},
	node_box = {
		type = "fixed",
--				{ left	, bottom , front  ,  right ,  top   ,  back  }
		fixed = {
			{-1/2, 0, 0, 0, 1/2, 1/2},
			{0, -1/2, 0, 1/2, 0, 1/2},
			{-1/2, -1/2, -1/2, 0, 0, 0},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/2, 0, 0, 0, 1/2, 1/2},
			{0, -1/2, 0, 1/2, 0, 1/2},
			{-1/2, -1/2, -1/2, 0, 0, 0},
		}
	},
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- Wet thatch Roof Corner 2
-----------------------------------------------------------------------------------------------
minetest.register_node("coconut_tree:wetthatch_roof_corner_2", {
	description = S("Wet thatch Roof Corner 2"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_thatch_wet.png"},
	node_box = {
		type = "fixed",
--				{ left	, bottom , front  ,  right ,  top   ,  back  }
		fixed = {
			{-1/2, -1/2, 0, 0, 0, 1/2},
			{0, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, 0, -1/2, 0, 1/2, 0},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/2, -1/2, 0, 0, 0, 1/2},
			{0, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, 0, -1/2, 0, 1/2, 0},
		}
	},
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- Wet thatch becomes (dry) thatch over time
-----------------------------------------------------------------------------------------------
local DRyiNG = {
--		  WeT									 DRy
	{"coconut_tree:wetthatch",					"coconut_tree:thatch"},
	{"coconut_tree:wetthatch_slab",				"coconut_tree:thatch_slab"},
	{"coconut_tree:wetthatch_roof",				"coconut_tree:thatch_roof"},
	{"coconut_tree:wetthatch_roof_corner",		"coconut_tree:thatch_roof_corner"},
	{"coconut_tree:wetthatch_roof_corner_2",		"coconut_tree:thatch_roof_corner_2"}
}
for i in pairs(DRyiNG) do

	local WeT = DRyiNG[i][1]
	local DRy = DRyiNG[i][2]

	minetest.register_abm({
		nodenames = {WeT},
		interval = 3600, --1200, -- 20 minutes: a minetest-day/night-cycle
		chance = 1,
		action = function(pos)
			local direction = minetest.get_node(pos).param2
			minetest.swap_node(pos, {name=DRy, param2=direction})
		end,
	})
end

-----------------------------------------------------------------------------------------------
-- thatch
-----------------------------------------------------------------------------------------------
minetest.register_node("coconut_tree:thatch", {
	description = S("thatch"),
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_thatch.png"},
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- thatch Slab
-----------------------------------------------------------------------------------------------
minetest.register_node("coconut_tree:thatch_slab", {
	description = S("thatch Slab"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_thatch.png"},
	node_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, 0, 1/2},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, 0, 1/2},
	},
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- thatch Roof
-----------------------------------------------------------------------------------------------
minetest.register_node("coconut_tree:thatch_roof", {
	description = S("thatch Roof"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_thatch.png"},
	node_box = {
		type = "fixed",
--				{ left	, bottom , front  ,  right ,  top   ,  back  }
		fixed = {
			{-1/2, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, -1/2, -1/2, 1/2, 0, 0},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/2, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, -1/2, -1/2, 1/2, 0, 0},
		}
	},
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- thatch Roof Corner 1
-----------------------------------------------------------------------------------------------
minetest.register_node("coconut_tree:thatch_roof_corner", {
	description = S("thatch Roof Corner 1"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_thatch.png"},
	node_box = {
		type = "fixed",
--				{ left	, bottom , front  ,  right ,  top   ,  back  }
		fixed = {
			{-1/2, 0, 0, 0, 1/2, 1/2},
			{0, -1/2, 0, 1/2, 0, 1/2},
			{-1/2, -1/2, -1/2, 0, 0, 0},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/2, 0, 0, 0, 1/2, 1/2},
			{0, -1/2, 0, 1/2, 0, 1/2},
			{-1/2, -1/2, -1/2, 0, 0, 0},
		}
	},
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- thatch Roof Corner 2
-----------------------------------------------------------------------------------------------
minetest.register_node("coconut_tree:thatch_roof_corner_2", {
	description = S("thatch Roof Corner 2"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_thatch.png"},
	node_box = {
		type = "fixed",
--				{ left	, bottom , front  ,  right ,  top   ,  back  }
		fixed = {
			{-1/2, -1/2, 0, 0, 0, 1/2},
			{0, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, 0, -1/2, 0, 1/2, 0},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/2, -1/2, 0, 0, 0, 1/2},
			{0, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, 0, -1/2, 0, 1/2, 0},
		}
	},
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})
