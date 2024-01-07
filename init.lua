minetest.register_node("coconut_tree:coconut_tree", {
	description = "Coconut Tree",
	tiles = {"coconut_tree_top.png", "coconut_tree_top.png",
		"coconut_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_craft({
	output = "default:wood 4",
	recipe = {
		{"coconut_tree:coconut_tree"},
	}
})

minetest.register_node("coconut_tree:coconut", {
	description = "Coconut",
	tiles = {"coconut_top.png", "coconut.png"},
	paramtype2 = "wallmounted",
	groups = {coconut = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, attached_node = 1},
	sounds = default.node_sound_wood_defaults(),
	on_use = minetest.item_eat(2),
})

--[[minetest.register_node("coconut_tree:coconut_leaves", {
	description = "Coconut Tree Leaves",
	tiles = {"coconut_leaves_top.png", "coconut_leaves.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})]]

minetest.register_node("coconut_tree:coconut_leaves", {
	description = ("Coconut Tree Leaves"),
--	drawtype = "allfaces_optional",
	drawtype = "nodebox",
	tiles = {
	{name="coconut_leaves_top.png",backface_culling = false},
	{name="nothing.png"},
	{name="coconut_leaves.png",backface_culling = false},
	},
	waving = 2,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"coconut_tree:coconut_sapling"}, rarity = 20},
			{items = {"coconut_tree:coconut_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	--[[
	on_rightclick = function(pos)
		minetest.set_node(pos,{name="islands:palm_leaves2"})
	end,	--]]
})

minetest.register_node("coconut_tree:coconut_sapling", {
	description = "Coconut Tree Sapling",
	drawtype = "plantlike",
	tiles = {"coconut_sapling.png"},
	inventory_image = "coconut_sapling.png",
	wield_image = "coconut_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3, attached_node = 1, sapling = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),

})

minetest.register_abm({
	label = "Coconut Sapling",
	nodenames = {"coconut_tree:coconut"},
	neighbors = {"default:sand", "default:dirt", "default:dirt_with_grass"},
	interval = 20,
	chance = 20,
	catch_up = false,
	action = function(pos, node)
		a = minetest.get_node(pos - vector.new(0, 1, 0)).name
		if (a ~= "default:sand" and a ~= "default:dirt" and a ~= "default:dirt_with_grass") then return end
		minetest.set_node(pos + vector.new(0, 1, 0), {name = "coconut_tree:coconut_sapling"})
	end,
})

minetest.register_abm({
	label = "Coconut Sapling Growing",
	nodenames = {"coconut_tree:coconut_sapling"},
	interval = 20,
	chance = 20,
	catch_up = false,
	action = function(pos, node)
		local path = minetest.get_modpath("coconut_tree") .. "/schematics/coconut_tree.mts"
		minetest.place_schematic(pos - vector.new(0, 2, 0), path, "0", nil, true, "place_center_x, place_center_z")
	end,
})

default.register_leafdecay({
	trunks = {"coconut_tree:coconut_tree"},
	leaves = {"coconut_tree:coconut_leaves"},
	radius = 4,
})

minetest.register_decoration({
	name = "coconut_tree:coconut_tree",
	deco_type = "schematic",
	place_on = {"default:sand"},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"grassland_dunes"},
	y_max = 10,
	y_min = 0,
	schematic = minetest.get_modpath("coconut_tree") .. "/schematics/coconut_tree.mts",
	flags = "place_center_x, place_center_z, force_placement",
	})

local path = minetest.get_modpath("coconut_tree")	
if not (minetest.get_modpath("dryplants")) then
	dofile(path .. "/thatch.lua")
end
	dofile(path .. "/crafting.lua")
	
