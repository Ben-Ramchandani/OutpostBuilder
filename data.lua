data:extend(
    {
        {
            type = "selection-tool",
            name = "outpost-builder",
            icon = "__OutpostPlanner__/graphics/outpost-builder.png",
            icon_size = 32,
            selection_color = {r = 1.0, g = 0.55, b = 0.0, a = 0.2},
            alt_selection_color = {r = 1.0, g = 0.2, b = 0.0, a = 0.2},
            selection_mode = {"any-entity"},
            alt_selection_mode = {"any-entity"},
            selection_cursor_box_type = "entity",
            alt_selection_cursor_box_type = "entity",
      			entity_type_filters = {"resource"},
      			alt_entity_type_filters = {"resource"},
            flags = {"only-in-cursor", "spawnable"},
            subgroup = "tool",
            order = "c[automated-construction]-d[outpost-builder]",
            stack_size = 1
        },
        {
            type = "sprite",
            name = "miner-blueprint",
            filename = "__OutpostPlanner__/graphics/miner-blueprint.png",
            width = 32,
            height = 32
        },
      	{
      			type = "shortcut",
      			name = "outpost-builder",
      			localised_name = {"item-name.outpost-builder"},
      			order = "b[blueprint]-i[outpost-builder]",
      			associated_control_input = "outpost-builder",
      			action = "spawn-item",
      			item_to_spawn = "outpost-builder",
      			style = "blue",
      			icon =
      			{
        				filename = "__OutpostPlanner__/graphics/outpost-builder-x32-white.png",
        				priority = "extra-high-no-scale",
        				size = 32,
        				scale = 0.5,
        				flags = {"gui-icon"}
      			},
      			small_icon =
      			{
        				filename = "__OutpostPlanner__/graphics/outpost-builder-x24-white.png",
        				priority = "extra-high-no-scale",
        				size = 24,
        				scale = 0.5,
        				flags = {"gui-icon"}
    			  },
    		},
    		{
      			type = "custom-input",
      			name = "outpost-builder",
      			localised_name = {"item-name.outpost-builder"},
      			action = "spawn-item",
      			item_to_spawn = "outpost-builder",
      			key_sequence = "SHIFT + O",
    		},
    }
)
