--[[
Corbeille ver 0.1 par Jat
Licence GPLv2 or later for code
Licence CC-BY-SA for image
--]]

--Function
local function mort(list,player)
	local taille=player:get_inventory():get_size(list)	
	player:get_inventory():set_size(list, 0)
	player:get_inventory():set_size(list, taille)
end

--Sign
minetest.register_node("corbeille:socle", {
	description = "Socle pour l interface corbeille",
	drawtype = "signlike",
	tiles = {"corbeille_socle.png"},
	inventory_image = "corbeille_socle.png",
	wield_image = "corbeille_socle.png",
	stack_max = 1,
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {dig_immediate=2},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
	on_construct = function(pos)
		print(minetest.serialize(pos))
		--Collone 1
		minetest.env:add_entity({x=pos.x-0.33,y=pos.y+0.33,z=pos.z+0.33},"corbeille:bag1")
		minetest.env:add_entity({x=pos.x-0.33,y=pos.y,z=pos.z+0.33},"corbeille:bag3")
		minetest.env:add_entity({x=pos.x-0.33,y=pos.y-0.33,z=pos.z+0.33},"corbeille:wieldhand")
		--Collone 2
		minetest.env:add_entity({x=pos.x,y=pos.y+0.33,z=pos.z},"corbeille:bag2")
		minetest.env:add_entity({x=pos.x,y=pos.y,z=pos.z},"corbeille:bag4")
		--minetest.env:add_entity({x=pos.x,y=pos.y-0.33,z=pos.z},)
		--Collone 3
		minetest.env:add_entity({x=pos.x+0.33,y=pos.y+0.33,z=pos.z-0.33},"corbeille:main")
		minetest.env:add_entity({x=pos.x+0.33,y=pos.y,z=pos.z-0.33},"corbeille:craft")
		minetest.env:add_entity({x=pos.x+0.33,y=pos.y-0.33,z=pos.z-0.33},"corbeille:all")
	end,
	on_destruct = function(pos)
		print(minetest.serialize(pos))
		local listeobj=minetest.env:get_objects_inside_radius(pos, 0.60)
		for c=1,table.getn(listeobj) do
			if not(listeobj[c]:is_player()) then
				listeobj[c]:remove()
			end
		end
	end,
})

--Craft

minetest.register_craft ({
	output = "corbeille:socle",
	recipe = {
		{"default:wood","","default:wood"},
		{"default:wood","","default:wood"},
		{"default:wood","default:wood","default:wood"},
	}
})

--Les icones

minetest.register_entity("corbeille:bag1", {
	initial_properties = {
		hp_max = 1,
		physical = false,
		collisionbox = {-0.15,-0.15,-0.15, 0.15,0.15,0.15},
		visual = "sprite",
		textures = {"corbeille_bag1.png"},
		visual_size = {x=0.30, y=0.30},
		is_visible = true,
	},
	on_activate = function(self, staticdata)
		self.object:set_armor_groups({immortal=1})
	end,
	on_punch = function(self, hitter)
		self.object:remove()
	end,
	on_rightclick = function(self, clicker)
		mort("bag1contents", clicker)
	end,
})

minetest.register_entity("corbeille:bag2", {
	initial_properties = {
		hp_max = 1,
		physical = false,
		collisionbox = {-0.15,-0.15,-0.15, 0.15,0.15,0.15},
		visual = "sprite",
		textures = {"corbeille_bag2.png"},
		visual_size = {x=0.30, y=0.30},
		is_visible = true,
	},
	on_activate = function(self, staticdata)
		self.object:set_armor_groups({immortal=1})
	end,
	on_punch = function(self, hitter)
		self.object:remove()
	end,
	on_rightclick = function(self, clicker)
		mort("bag2contents", clicker)
	end,
})

minetest.register_entity("corbeille:bag3", {
	initial_properties = {
		hp_max = 1,
		physical = false,
		collisionbox = {-0.15,-0.15,-0.15, 0.15,0.15,0.15},
		visual = "sprite",
		textures = {"corbeille_bag3.png"},
		visual_size = {x=0.30, y=0.30},
		is_visible = true,
	},
	on_activate = function(self, staticdata)
		self.object:set_armor_groups({immortal=1})
	end,
	on_punch = function(self, hitter)
		self.object:remove()
	end,
	on_rightclick = function(self, clicker)
		mort("bag3contents", clicker)
	end,
})

minetest.register_entity("corbeille:bag4", {
	initial_properties = {
		hp_max = 1,
		physical = false,
		collisionbox = {-0.15,-0.15,-0.15, 0.15,0.15,0.15},
		visual = "sprite",
		textures = {"corbeille_bag4.png"},
		visual_size = {x=0.30, y=0.30},
		is_visible = true,
	},
	on_activate = function(self, staticdata)
		self.object:set_armor_groups({immortal=1})
	end,
	on_punch = function(self, hitter)
		self.object:remove()
	end,
	on_rightclick = function(self, clicker)
		mort("bag4contents", clicker)
	end,
})

minetest.register_entity("corbeille:main", {
	initial_properties = {
		hp_max = 1,
		physical = false,
		collisionbox = {-0.15,-0.15,-0.15, 0.15,0.15,0.15},
		visual = "sprite",
		textures = {"corbeille_main.png"},
		visual_size = {x=0.30, y=0.30},
		is_visible = true,
	},
	on_activate = function(self, staticdata)
		self.object:set_armor_groups({immortal=1})
	end,
	on_punch = function(self, hitter)
		self.object:remove()
	end,
	on_rightclick = function(self, clicker)
		mort("main", clicker)
	end,
})

minetest.register_entity("corbeille:craft", {
	initial_properties = {
		hp_max = 1,
		physical = false,
		collisionbox = {-0.15,-0.15,-0.15, 0.15,0.15,0.15},
		visual = "sprite",
		textures = {"corbeille_craft.png"},
		visual_size = {x=0.30, y=0.30},
		is_visible = true,
	},
	on_activate = function(self, staticdata)
		self.object:set_armor_groups({immortal=1})
	end,
	on_punch = function(self, hitter)
		self.object:remove()
	end,
	on_rightclick = function(self, clicker)
		mort("craft", clicker)
	end,
})

minetest.register_entity("corbeille:wieldhand", {
	initial_properties = {
		hp_max = 1,
		physical = false,
		collisionbox = {-0.15,-0.15,-0.15, 0.15,0.15,0.15},
		visual = "sprite",
		textures = {"wieldhand.png"},
		visual_size = {x=0.30, y=0.30},
		is_visible = true,
	},
	on_activate = function(self, staticdata)
		self.object:set_armor_groups({immortal=1})
	end,
	on_punch = function(self, hitter)
		self.object:remove()
	end,
	on_rightclick = function(self, clicker)
		clicker:set_wielded_item(nil)
	end,
})

minetest.register_entity("corbeille:all", {
	initial_properties = {
		hp_max = 1,
		physical = false,
		collisionbox = {-0.15,-0.15,-0.15, 0.15,0.15,0.15},
		visual = "sprite",
		textures = {"corbeille_all.png"},
		visual_size = {x=0.30, y=0.30},
		is_visible = true,
	},
	on_activate = function(self, staticdata)
		self.object:set_armor_groups({immortal=1})
	end,
	on_punch = function(self, hitter)
		self.object:remove()
	end,
	on_rightclick = function(self, clicker)
		mort("craft", clicker)
		mort("main", clicker)
		for i=1,4 do
			if not(clicker:get_inventory():is_empty('bag'..i..'')) then
				mort("bag"..i.."contents", clicker)
			end
		end
	end,
})