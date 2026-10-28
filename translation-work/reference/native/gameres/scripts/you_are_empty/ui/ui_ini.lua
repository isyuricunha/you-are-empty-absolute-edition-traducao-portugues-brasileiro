window_width = ##WINDOW_WIDTH; window_height = ##WINDOW_HEIGHT;
aspect_ratio = window_width / window_height;
aspect_ratio_correction = math.min(1.33333333 / aspect_ratio, 1.0)

aspect_ratio_correction_ui_tab_control = aspect_ratio_correction
if (aspect_ratio_correction < 0.6) then
	aspect_ratio_correction_ui_tab_control = aspect_ratio_correction_ui_tab_control * 0.9835
end

ui_windows_ini = 
{
	class_name = "Desktop", 
	name = "desktop", 
	fonts = 
	{
		FNT_NAME_DEFAULT = "rodchenko", 
		FNT_NAME_FIXED = "courier", 
		FNT_NAME_DISABLED = "rodchenko_disabled", 
		FNT_NAME_BUTTON = "rodchenko_button",
	}, 
	{
		-----------------------------------------------------------------------------		
		class_name = "Window", 
		name = "game_app", 
		{
			--------------------------------------------------------------------------
			alignment = "ALIGNMENT_CENTER", 
			bottom_margin = 0, 
			can_drag = false, 
			can_resize = true, 
			class_name = "MainMenu", 
			fade_in = 0, 
			fade_out = 0, 
			is_modal = false, 
			left_margin = 0, 
			name = "main_menu", 
			right_margin = 0, 
			top_margin = 0, 
			visual_delta_bottom = 0, 
			visual_delta_left = 0, 
			visual_delta_right = 0, 
			visual_delta_top = 0, 
			fonts = 
			{
			}, 
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					material_preset = "ui_mainmenu", 
				}, 
			}, 
			events_sounds = 
			{
				EVENT_SHOW = 
				{
					volume = 0, 
					looping = true,
					simultaneously = true,
					file_names = 
					{
						"Menu_full_time1",
						"Menu_full_time2",
						"Menu_koleso1",
					}, 
				}, 
			}, 
			pos = 
			{
				0, 
				0, 
			}, 
			size = 
			{
				1024 * aspect_ratio_correction, 
				768, 
			}, 
			{
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "WindowVisual", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "menu_border_left", 
				right_margin = 0, 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
						diffuse_texture = "menu_border_left", 
						material_template = "ui_image", 
					}, 
				}, 
				pos = 
				{
					-510 * aspect_ratio_correction, 
					0, 
				}, 
				size = 
				{
					512 * aspect_ratio_correction, 
					1024, 
				}, 
			}, 
			{
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "WindowVisual", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "menu_border_right", 
				right_margin = 0, 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
						diffuse_texture = "menu_border_right", 
						material_template = "ui_image", 
					}, 
				}, 
				pos = 
				{
					1022 * aspect_ratio_correction, 
					0, 
				}, 
				size = 
				{
					512 * aspect_ratio_correction, 
					1024, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "New Game", 
				right_margin = 0, 
				text = "STR_MAIN_MENU_NEW_GAME", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7", 
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5",  
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_button_01_h", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_button_01_t", 
					}, 
				}, 
				pos = 
				{
					83 * aspect_ratio_correction, 
					413, 
				}, 
				size = 
				{
					246 * aspect_ratio_correction, 
					31, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Load Game", 
				right_margin = 0, 
				text = "STR_MAIN_MENU_LOAD_GAME", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",  
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5",   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_button_02_h", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_button_02_t", 
					}, 
				}, 
				pos = 
				{
					83 * aspect_ratio_correction, 
					465, 
				}, 
				size = 
				{
					246 * aspect_ratio_correction, 
					31, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 0, 
				fade_out = 0, 
				is_modal = false, 
				left_margin = 0, 
				name = "Options", 
				right_margin = 0, 
				text = "STR_MAIN_MENU_OPTIONS", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",  
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5",    
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_button_03_h", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_button_03_t", 
					}, 
				}, 
				pos = 
				{
					83 * aspect_ratio_correction, 
					516, 
				}, 
				size = 
				{
					246 * aspect_ratio_correction, 
					31, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Credits", 
				right_margin = 0, 
				text = "STR_MAIN_MENU_CREDITS", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",  
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5",    
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_button_04_h", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_button_04_t", 
					}, 
				}, 
				pos = 
				{
					83 * aspect_ratio_correction, 
					567, 
				}, 
				size = 
				{
					246 * aspect_ratio_correction, 
					31, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Exit", 
				right_margin = 0, 
				text = "STR_MAIN_MENU_EXIT", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",  
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5",    
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_button_05_h", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_button_05_t", 
					}, 
				}, 
				pos = 
				{
					83 * aspect_ratio_correction, 
					618, 
				}, 
				size = 
				{
					246 * aspect_ratio_correction, 
					31, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "WindowVisual", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "avi_menu_butterfly", 
				right_margin = 0, 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
						material_template = "avi_menu_butterfly", 
						color = 
						{
							a = 255, 
							b = 127, 
							g = 127, 
							r = 127, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							-1, 
						}, 
					}, 
				}, 
				pos = 
				{
					764 * aspect_ratio_correction, 
					35, 
				}, 
				size = 
				{
					256 * aspect_ratio_correction, 
					254, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "WindowVisual", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "avi_menu_fog", 
				right_margin = 0, 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
						material_template = "avi_menu_fog", 
						color = 
						{
							a = 255, 
							b = 127, 
							g = 127, 
							r = 127, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							-1, 
						}, 
					}, 
				}, 
				pos = 
				{
					510 * aspect_ratio_correction, 
					510, 
				}, 
				size = 
				{
					512 * aspect_ratio_correction, 
					256, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "WindowVisual", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "avi_menu_wheel", 
				right_margin = 0, 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
						material_template = "avi_menu_wheel", 
						color = 
						{
							a = 255, 
							b = 127, 
							g = 127, 
							r = 127, 
						}, 
						pos = 
						{
							0, 
							-0.09, 
						}, 
						size = 
						{
							1, 
							-0.98, 
						}, 
					}, 
				}, 
				pos = 
				{
					72 * aspect_ratio_correction, 
					649, 
				}, 
				size = 
				{
					256 * aspect_ratio_correction, 
					128, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "WindowVisual", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "avi_menu_arrow", 
				right_margin = 0, 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
						material_template = "avi_menu_arrow", 
						color = 
						{
							a = 255, 
							b = 127, 
							g = 127, 
							r = 127, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							-1, 
						}, 
					}, 
				}, 
				pos = 
				{
					335 * aspect_ratio_correction, 
					436, 
				}, 
				size = 
				{
					64 * aspect_ratio_correction, 
					64, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "WindowVisual", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "avi_menu_drops", 
				right_margin = 0, 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
						material_template = "avi_menu_drops", 
						color = 
						{
							a = 255, 
							b = 127, 
							g = 127, 
							r = 127, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							-1, 
						}, 
					}, 
				}, 
				pos = 
				{
					468 * aspect_ratio_correction, 
					71, 
				}, 
				size = 
				{
					32 * aspect_ratio_correction, 
					512, 
				}, 
			}, 
		}, 
		{
			--------------------------------------------------------------------------
			alignment = "ALIGNMENT_NONE", 
			bottom_margin = 0, 
			button_h = 32, 
			button_w = 128 * aspect_ratio_correction, 
			buttons_horizontal = true, 
			buttons_interval = 8, 
			can_drag = false, 
			can_resize = false, 
			caption = "", 
			caption_alignment = "ALIGNMENT_LEFT", 
			caption_h = 24, 
			class_name = "DifficultyMenu", 
			fade_in = 100, 
			fade_out = 100, 
			is_modal = false, 
			left_margin = 0, 
			name = "difficulty_menu", 
			right_margin = 0, 
			top_margin = 0, 
			visual_delta_bottom = 0, 
			visual_delta_left = 0, 
			visual_delta_right = 0, 
			visual_delta_top = 0, 
			fonts = 
			{
			}, 
			events_sounds = 
			{
				EVENT_SHOW = 
				{
					volume = 0, 
					file_names = 
					{
						"Big_window_show2",  
					}, 
				}, 
			},
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					material_preset = "ui_message_box", 
				}, 
			}, 
			pos = 
			{
				450 * aspect_ratio_correction, 
				250, 
			}, 
			size = 
			{
				432 * aspect_ratio_correction, 
				230, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border left", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_LEFT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					8, 
					210, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border right", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_RIGHT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					424, 
					0, 
				}, 
				size = 
				{
					8, 
					210, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border top", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_TOP", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					306, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border bottom", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_BOTTOM", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					223, 
				}, 
				size = 
				{
					306, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "WindowVisual", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "difficulty buttons", 
				right_margin = 0, 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_difficulty_buttons", 
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					432 * aspect_ratio_correction, 
					230, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Easy", 
				right_margin = 0, 
				text = "STR_DIFFICULTY_MENU_EASY", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",  
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_button_01_h", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_button_01_t", 
					}, 
				}, 
				pos = 
				{
					95 * aspect_ratio_correction, 
					52, 
				}, 
				size = 
				{
					246 * aspect_ratio_correction, 
					31, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Normal", 
				right_margin = 0, 
				text = "STR_DIFFICULTY_MENU_NORMAL", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",  
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5",    
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_button_02_h", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_button_02_t", 
					}, 
				}, 
				pos = 
				{
					95 * aspect_ratio_correction, 
					104, 
				}, 
				size = 
				{
					246 * aspect_ratio_correction, 
					31, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Hard", 
				right_margin = 0, 
				text = "STR_DIFFICULTY_MENU_HARD", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",  
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5",    
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_button_03_h", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_button_03_t", 
					}, 
				}, 
				pos = 
				{
					95 * aspect_ratio_correction, 
					155, 
				}, 
				size = 
				{
					246 * aspect_ratio_correction, 
					31, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Back", 
				right_margin = 0, 
				text = "STR_DIFFICULTY_MENU_BACK", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",  
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5",    
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					123 * aspect_ratio_correction, 
					200, 
				}, 
				size = 
				{
					186 * aspect_ratio_correction, 
					59, 
				}, 
			}, 
		}, 
		{
			--------------------------------------------------------------------------
			alignment = "ALIGNMENT_CENTER", 
			bottom_margin = 0, 
			button_h = 32, 
			button_w = 128 * aspect_ratio_correction, 
			buttons_horizontal = true, 
			buttons_interval = 8, 
			can_drag = false, 
			can_resize = false, 
			caption = "", 
			caption_alignment = "ALIGNMENT_LEFT", 
			caption_h = 24, 
			class_name = "SaveMenu", 
			fade_in = 100, 
			fade_out = 100, 
			is_modal = true, 
			left_margin = 0, 
			name = "save_menu", 
			right_margin = 0, 
			top_margin = 0, 
			visual_delta_bottom = 0, 
			visual_delta_left = 0, 
			visual_delta_right = 0, 
			visual_delta_top = 0, 
			fonts = 
			{
			}, 
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					material_preset = "ui_options_menu", 
				}, 
			}, 
			events_sounds = 
			{
				EVENT_SHOW = 
				{
					volume = 0, 
					file_names = 
					{
						"Big_window_show2", 
					}, 
				}, 
			}, 
			pos = 
			{
				202, 
				109, 
			}, 
			size = 
			{
				620 * aspect_ratio_correction, 
				550, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "StaticText", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Caption", 
				right_margin = 0, 
				text = "STR_SAVE_MENU_CAPTION", 
				top_margin = 3, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					70, 
					37, 
				}, 
				size = 
				{
					300 * aspect_ratio_correction, 
					20, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border left", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_LEFT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					8, 
					550, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border right", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_RIGHT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					612, 
					0, 
				}, 
				size = 
				{
					8, 
					550, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border top", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_TOP", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					590, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border bottom", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_BOTTOM", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					542, 
				}, 
				size = 
				{
					590, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 4, 
				can_drag = false, 
				can_resize = true, 
				class_name = "ListBox", 
				columns_dw = 15 * aspect_ratio_correction, 
				columns_h = 21, 
				custom_item_height = 18, 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				item_icon_size = 16, 
				left_margin = 10 * aspect_ratio_correction, 
				right_margin = 0, 
				name = "Game Saves", 
				show_columns = true, 
				top_margin = 6, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				fonts = 
				{
				}, 
				items = 
				{
					item_0 = 
					{
						column_0 = "Oanoiaue o?iaaiu", 
						column_1 = "aitest1", 
						column_2 = "13.04.2006", 
						column_3 = "17:26:59", 
					}, 
					item_1 = 
					{
						column_0 = "Oanoiaue o?iaaiu", 
						column_1 = "aitest1", 
						column_2 = "13.04.2006", 
						column_3 = "14:56:37", 
					}, 
				}, 
				materials = 
				{
					MAT_NAME_CHECKED = 
					{
						material_preset = "ui_listbox_checked", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_listbox", 
					}, 
					MAT_NAME_SELECTION = 
					{
						material_preset = "ui_listbox_highlighted", 
					}, 
				}, 
				events_sounds = 
				{
					EVENT_HIGHLIGHTED = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_saves_highlighted", 
						}, 
					}, 
					EVENT_CHECKED = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_saves_checked", 
						}, 
					}, 
				}, 
				pos = 
				{
					90 * aspect_ratio_correction, 
					120, 
				}, 
				size = 
				{
					470 * aspect_ratio_correction, 
					148, 
				}, 
				{
					-----------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "ScrollBar", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "scroll bar vert", 
					right_margin = 0, 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
							material_preset = "ui_scroll_back", 
						}, 
					}, 
					pos = 
					{
						182 * aspect_ratio_correction, 
						0, 
					}, 
					size = 
					{
						18 * aspect_ratio_correction, 
						100, 
					}, 
					{
						--------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "Button", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "button min", 
						right_margin = 0, 
						text = "", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_HIGHLIGHTED = 
							{
								material_preset = "ui_scroll_button_t_h", 
							}, 
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_scroll_button_t_e", 
							}, 
							MAT_NAME_PUSHED = 
							{
								material_preset = "ui_scroll_button_t_t", 
							}, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							18 * aspect_ratio_correction, 
							24, 
						}, 
					}, 
					{
						--------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "Button", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "button max", 
						right_margin = 0, 
						text = "", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_HIGHLIGHTED = 
							{
								material_preset = "ui_scroll_button_b_h", 
							}, 
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_scroll_button_b_e", 
							}, 
							MAT_NAME_PUSHED = 
							{
								material_preset = "ui_scroll_button_b_t", 
							}, 
						}, 
						pos = 
						{
							0, 
							72, 
						}, 
						size = 
						{
							18 * aspect_ratio_correction, 
							24, 
						}, 
					}, 
					{
						--------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = true, 
						can_resize = true, 
						class_name = "Button", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "button scroller", 
						right_margin = 0, 
						text = "", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_HIGHLIGHTED = 
							{
								material_preset = "ui_scroll_button_h", 
							}, 
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_scroll_button_e", 
							}, 
							MAT_NAME_PUSHED = 
							{
								material_preset = "ui_scroll_button_t", 
							}, 
						}, 
						pos = 
						{
							0, 
							28, 
						}, 
						size = 
						{
							18 * aspect_ratio_correction, 
							24, 
						}, 
					}, 
				},
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "StaticText", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "Save name", 
				right_margin = 0, 
				text = "STR_SAVE_MENU_SAVE_NAME", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					100 * aspect_ratio_correction, 
					95, 
				}, 
				size = 
				{
					85 * aspect_ratio_correction, 
					15, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 3, 
				can_drag = false, 
				can_resize = true, 
				class_name = "EditBox", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 7, 
				name = "Save name", 
				right_margin = 7, 
				top_margin = 3, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_editbox",
					},
				}, 
				pos = 
				{
					190 * aspect_ratio_correction, 
					93, 
				}, 
				size = 
				{
					180 * aspect_ratio_correction, 
					25, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "Caret", 
					fade_in = 150, 
					fade_out = 150, 
					is_modal = false, 
					left_margin = 0, 
					name = "caret", 
					right_margin = 0, 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					materials = 
					{
						MAT_NAME_CHECKED = 
						{
							material_template = "ui_color", 
							color = 
							{
								a = 150, 
								b = 120, 
								g = 120, 
								r = 120, 
							}, 
							pos = 
							{
								0, 
								0, 
							}, 
							size = 
							{
								1, 
								1, 
							}, 
						}, 
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						5, 
						0, 
					}, 
					size = 
					{
						3 * aspect_ratio_correction, 
						14, 
					}, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Save", 
				right_margin = 0, 
				text = "STR_SAVE_MENU_OK", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",  
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5",    
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					215 * aspect_ratio_correction, 
					520, 
				}, 
				size = 
				{
					186 * aspect_ratio_correction, 
					59, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Cancel", 
				right_margin = 0, 
				text = "STR_LOAD_MENU_CANCEL", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",  
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5",    
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					395 * aspect_ratio_correction, 
					520, 
				}, 
				size = 
				{
					186 * aspect_ratio_correction, 
					59, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "Delete", 
				right_margin = 0, 
				text = "STR_LOAD_MENU_DELETE", 
				top_margin = 0, 
				visual_delta_bottom = 3, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",  
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5",    
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_advanced_button_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_advanced_button_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_advanced_button_t", 
					}, 
				}, 
				pos = 
				{
					400 * aspect_ratio_correction, 
					280, 
				}, 
				size = 
				{
					150 * aspect_ratio_correction, 
					32, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "WindowVisual", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "screenshot", 
				right_margin = 0, 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				pos = 
				{
					222 * aspect_ratio_correction, 
					340, 
				}, 
				size = 
				{
					206 * aspect_ratio_correction, 
					153, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "WindowVisual", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "screenshot background", 
				right_margin = 0, 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_screenshot_background", 
					}, 
				}, 
				pos = 
				{
					73 * aspect_ratio_correction, 
					315, 
				}, 
				size = 
				{
					503 * aspect_ratio_correction, 
					202, 
				}, 
			}, 
		}, 
		{
			--------------------------------------------------------------------------
			alignment = "ALIGNMENT_NONE", 
			bottom_margin = 0, 
			button_h = 32, 
			button_w = 128 * aspect_ratio_correction, 
			buttons_horizontal = true, 
			buttons_interval = 8, 
			can_drag = false, 
			can_resize = false, 
			caption = "", 
			caption_alignment = "ALIGNMENT_LEFT", 
			caption_h = 24, 
			class_name = "LoadMenu", 
			fade_in = 100, 
			fade_out = 100, 
			is_modal = true, 
			left_margin = 0, 
			name = "load_menu", 
			right_margin = 0, 
			top_margin = 0, 
			visual_delta_bottom = 0, 
			visual_delta_left = 0, 
			visual_delta_right = 0, 
			visual_delta_top = 0, 
			fonts = 
			{
			}, 
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					material_preset = "ui_options_menu", 
				}, 
			}, 
			events_sounds = 
			{
				EVENT_SHOW = 
				{
					volume = 0, 
					file_names = 
					{
						"Big_window_show2",  
					}, 
				}, 
			}, 
			pos = 
			{
				390 * aspect_ratio_correction, 
				110, 
			}, 
			size = 
			{
				620 * aspect_ratio_correction, 
				550, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "StaticText", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Caption", 
				right_margin = 0, 
				text = "STR_LOAD_MENU_CAPTION", 
				top_margin = 3, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					70 * aspect_ratio_correction, 
					37, 
				}, 
				size = 
				{
					300 * aspect_ratio_correction, 
					20, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border left", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_LEFT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					8, 
					550, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border right", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_RIGHT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					612, 
					0, 
				}, 
				size = 
				{
					8, 
					550, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border top", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_TOP", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					590, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border bottom", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_BOTTOM", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					542, 
				}, 
				size = 
				{
					590, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 4, 
				can_drag = false, 
				can_resize = true, 
				class_name = "ListBox", 
				columns_dw = 15 * aspect_ratio_correction, 
				columns_h = 21, 
				custom_item_height = 18, 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				item_icon_size = 16, 
				left_margin = 10 * aspect_ratio_correction, 
				right_margin = 0, 
				name = "Game Saves", 
				show_columns = true, 
				top_margin = 6, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				fonts = 
				{
				}, 
				items = 
				{
					item_0 = 
					{
						column_0 = "Autosave", 
						column_1 = "vitia", 
						column_2 = "24.04.2006", 
						column_3 = "12:55:48", 
					}, 
					item_1 = 
					{
						column_0 = "qwerty 1", 
						column_1 = "aitest1", 
						column_2 = "21.04.2006", 
						column_3 = "20:13:01", 
					}, 
					item_2 = 
					{
						column_0 = "sadcasdc", 
						column_1 = "aitest1", 
						column_2 = "21.04.2006", 
						column_3 = "16:27:25", 
					}, 
					item_3 = 
					{
						column_0 = "zzzz", 
						column_1 = "aitest1", 
						column_2 = "20.04.2006", 
						column_3 = "14:06:04", 
					}, 
				}, 
				materials = 
				{
					MAT_NAME_CHECKED = 
					{
						material_preset = "ui_listbox_checked", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_listbox", 
					},  
					MAT_NAME_SELECTION = 
					{
						material_preset = "ui_listbox_highlighted", 
					}, 
				}, 
				events_sounds = 
				{
					EVENT_HIGHLIGHTED = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_saves_highlighted", 
						}, 
					}, 
					EVENT_CHECKED = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_saves_checked", 
						}, 
					}, 
				}, 
				pos = 
				{
					90 * aspect_ratio_correction, 
					120, 
				}, 
				size = 
				{
					470 * aspect_ratio_correction, 
					148, 
				}, 
				{
					-----------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "ScrollBar", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "scroll bar vert", 
					right_margin = 0, 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
							material_preset = "ui_scroll_back", 
						}, 
					}, 
					pos = 
					{
						182 * aspect_ratio_correction, 
						0, 
					}, 
					size = 
					{
						18 * aspect_ratio_correction, 
						100, 
					}, 
					{
						--------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "Button", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "button min", 
						right_margin = 0, 
						text = "", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_HIGHLIGHTED = 
							{
								material_preset = "ui_scroll_button_t_h", 
							}, 
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_scroll_button_t_e", 
							}, 
							MAT_NAME_PUSHED = 
							{
								material_preset = "ui_scroll_button_t_t", 
							}, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							18 * aspect_ratio_correction, 
							24, 
						}, 
					}, 
					{
						--------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "Button", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "button max", 
						right_margin = 0, 
						text = "", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_HIGHLIGHTED = 
							{
								material_preset = "ui_scroll_button_b_h", 
							}, 
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_scroll_button_b_e", 
							}, 
							MAT_NAME_PUSHED = 
							{
								material_preset = "ui_scroll_button_b_t", 
							}, 
						}, 
						pos = 
						{
							0, 
							72, 
						}, 
						size = 
						{
							18 * aspect_ratio_correction, 
							24, 
						}, 
					}, 
					{
						--------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = true, 
						can_resize = true, 
						class_name = "Button", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "button scroller", 
						right_margin = 0, 
						text = "", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_HIGHLIGHTED = 
							{
								material_preset = "ui_scroll_button_h", 
							}, 
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_scroll_button_e", 
							}, 
							MAT_NAME_PUSHED = 
							{
								material_preset = "ui_scroll_button_t", 
							}, 
						}, 
						pos = 
						{
							0, 
							28, 
						}, 
						size = 
						{
							18 * aspect_ratio_correction, 
							24, 
						}, 
					}, 
				},
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Load", 
				right_margin = 0, 
				text = "STR_LOAD_MENU_OK", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",  
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					215 * aspect_ratio_correction, 
					520, 
				}, 
				size = 
				{
					186 * aspect_ratio_correction, 
					59, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Cancel", 
				right_margin = 0, 
				text = "STR_LOAD_MENU_CANCEL", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",  
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					395 * aspect_ratio_correction, 
					520, 
				}, 
				size = 
				{
					186 * aspect_ratio_correction, 
					59, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "Delete", 
				right_margin = 0, 
				text = "STR_LOAD_MENU_DELETE", 
				top_margin = 0, 
				visual_delta_bottom = 3, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",  
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_advanced_button_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_advanced_button_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_advanced_button_t", 
					}, 
				}, 
				pos = 
				{
					400 * aspect_ratio_correction, 
					280, 
				}, 
				size = 
				{
					150 * aspect_ratio_correction, 
					32, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "WindowVisual", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "screenshot", 
				right_margin = 0, 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				pos = 
				{
					222 * aspect_ratio_correction, 
					340, 
				}, 
				size = 
				{
					206 * aspect_ratio_correction, 
					153, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "WindowVisual", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "screenshot background", 
				right_margin = 0, 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_screenshot_background", 
					}, 
				}, 
				pos = 
				{
					73 * aspect_ratio_correction, 
					315, 
				}, 
				size = 
				{
					503 * aspect_ratio_correction, 
					202, 
				}, 
			}, 
		}, 
		{
			--------------------------------------------------------------------------
			alignment = "ALIGNMENT_NONE", 
			bottom_margin = 0, 
			button_h = 32, 
			button_w = 128 * aspect_ratio_correction, 
			buttons_horizontal = true, 
			buttons_interval = 8, 
			can_drag = false, 
			can_resize = false, 
			caption = "", 
			caption_alignment = "ALIGNMENT_LEFT", 
			caption_h = 24, 
			class_name = "OptionsMenu", 
			fade_in = 100, 
			fade_out = 100, 
			is_modal = true, 
			left_margin = 0, 
			name = "options_menu", 
			right_margin = 0, 
			top_margin = 0, 
			visual_delta_bottom = 0, 
			visual_delta_left = 0, 
			visual_delta_right = 0, 
			visual_delta_top = 0, 
			fonts = 
			{
			}, 
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					material_preset = "ui_options_menu", 
				}, 
			}, 
			events_sounds = 
			{
				EVENT_SHOW = 
				{
					volume = 0, 
					file_names = 
					{
						"Big_window_show", 
					}, 
				}, 
			}, 
			pos = 
			{
				390 * aspect_ratio_correction, 
				110, 
			}, 
			size = 
			{
				620 * aspect_ratio_correction, 
				550, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border left", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_LEFT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					8, 
					550, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border right", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_RIGHT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					612, 
					0, 
				}, 
				size = 
				{
					8, 
					550, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border top", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_TOP", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					590 * aspect_ratio_correction, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border bottom", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_BOTTOM", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					542, 
				}, 
				size = 
				{
					590 * aspect_ratio_correction, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "StaticText", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Caption", 
				right_margin = 0, 
				text = "STR_OPTIONS_CAPTION", 
				top_margin = 3, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					70 * aspect_ratio_correction, 
					37, 
				}, 
				size = 
				{
					300 * aspect_ratio_correction, 
					20, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Ok", 
				right_margin = 0, 
				text = "STR_OPTIONS_OK", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",  
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					220 * aspect_ratio_correction, 
					519, 
				}, 
				size = 
				{
					186 * aspect_ratio_correction, 
					59, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Cancel", 
				right_margin = 0, 
				text = "STR_LOAD_MENU_CANCEL", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",  
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					400 * aspect_ratio_correction, 
					519, 
				}, 
				size = 
				{
					186 * aspect_ratio_correction, 
					59, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "WindowVisual", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "page control background", 
				right_margin = 0, 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_page_control_background", 
					}, 
				}, 
				pos = 
				{
					65 * aspect_ratio_correction, 
					81, 
				}, 
				size = 
				{
					519 * aspect_ratio_correction, 
					42, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "PageControl", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "page control", 
				right_margin = 0, 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				fonts = 
				{
				}, 
				pos = 
				{
					76 * aspect_ratio_correction, 
					81, 
				}, 
				size = 
				{
					485 * aspect_ratio_correction, 
					440, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "WindowVisual", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Game", 
					right_margin = 0, 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						0, 
						40, 
					}, 
					size = 
					{
						485 * aspect_ratio_correction, 
						400, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Auto Switch Weapon", 
						right_margin = 0, 
						text = "STR_OPTIONS_GAME_AUTOSWITCH", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							30, 
						}, 
						size = 
						{
							200 * aspect_ratio_correction, 
							25, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						checker_h = 26, 
						checker_w = 30 * aspect_ratio_correction, 
						class_name = "CheckBox", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Auto Switch Weapon", 
						right_margin = 0, 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_CHECKER_OFF = 
							{
								material_preset = "ui_checker_off_e", 
							}, 
							MAT_NAME_CHECKER_ON = 
							{
								material_preset = "ui_checker_on_e", 
							}, 
							MAT_NAME_CHECKER_OFF_DISABLED = 
							{
								material_preset = "ui_checker_off_d", 
							}, 
							MAT_NAME_CHECKER_ON_DISABLED = 
							{
								material_preset = "ui_checker_on_d", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_CHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_checkbox_checked", 
								}, 
							}, 
							EVENT_UNCHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_checkbox_unchecked", 
								}, 
							}, 
						}, 
						pos = 
						{
							225 * aspect_ratio_correction, 
							25, 
						}, 
						size = 
						{
							30 * aspect_ratio_correction, 
							26, 
						}, 
					},
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Auto Hide HUD", 
						right_margin = 0, 
						text = "STR_OPTIONS_GAME_AUTOHIDE_HUD", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							70, 
						}, 
						size = 
						{
							200 * aspect_ratio_correction, 
							25, 
						},
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						checker_h = 26, 
						checker_w = 30 * aspect_ratio_correction, 
						class_name = "CheckBox", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Auto Hide HUD", 
						right_margin = 0, 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_CHECKER_OFF = 
							{
								material_preset = "ui_checker_off_e", 
							}, 
							MAT_NAME_CHECKER_ON = 
							{
								material_preset = "ui_checker_on_e", 
							}, 
							MAT_NAME_CHECKER_OFF_DISABLED = 
							{
								material_preset = "ui_checker_off_d", 
							}, 
							MAT_NAME_CHECKER_ON_DISABLED = 
							{
								material_preset = "ui_checker_on_d", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_CHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_checkbox_checked", 
								}, 
							}, 
							EVENT_UNCHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_checkbox_unchecked", 
								}, 
							}, 
						}, 
						pos = 
						{
							225 * aspect_ratio_correction, 
							63, 
						}, 
						size = 
						{
							30 * aspect_ratio_correction, 
							26, 
						}, 
					}, 					
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Enable Sprinting", 
						right_margin = 0, 
						text = "STR_OPTIONS_GAME_ENABLE_SPRINTING", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							110, 
						}, 
						size = 
						{
							200 * aspect_ratio_correction, 
							25, 
						},
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						checker_h = 26, 
						checker_w = 30 * aspect_ratio_correction, 
						class_name = "CheckBox", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Enable Sprinting", 
						right_margin = 0, 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_CHECKER_OFF = 
							{
								material_preset = "ui_checker_off_e", 
							}, 
							MAT_NAME_CHECKER_ON = 
							{
								material_preset = "ui_checker_on_e", 
							}, 
							MAT_NAME_CHECKER_OFF_DISABLED = 
							{
								material_preset = "ui_checker_off_d", 
							}, 
							MAT_NAME_CHECKER_ON_DISABLED = 
							{
								material_preset = "ui_checker_on_d", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_CHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_checkbox_checked", 
								}, 
							}, 
							EVENT_UNCHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_checkbox_unchecked", 
								}, 
							}, 
						}, 
						pos = 
						{
							225 * aspect_ratio_correction, 
							101, 
						}, 
						size = 
						{
							30 * aspect_ratio_correction, 
							26, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "FOV", 
						right_margin = 0, 
						text = "STR_OPTIONS_GAME_FOV", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							153, 
						}, 
						size = 
						{
							200 * aspect_ratio_correction, 
							25, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "ScrollBar", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "FOV", 
						right_margin = 0, 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_slider_back_e", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_CHANGED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_scroller1", 
									"Menu_scroller2", 
									"Menu_scroller3", 
									"Menu_scroller4", 
									"Menu_scroller5", 
									"Menu_scroller6", 
									"Menu_scroller7", 
									"Menu_scroller8", 
								}, 
							}, 
						}, 
						pos = 
						{
							225 * aspect_ratio_correction, 
							145, 
						}, 
						size = 
						{
							230 * aspect_ratio_correction, 
							32, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = false, 
							can_resize = true, 
							class_name = "Button", 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							left_margin = 0, 
							name = "button min", 
							right_margin = 0, 
							text = "", 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_HIGHLIGHTED = 
								{
									material_preset = "ui_slider_left", 
								}, 
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_slider_left", 
								}, 
								MAT_NAME_PUSHED = 
								{
									material_preset = "ui_slider_left", 
								}, 
							}, 
							pos = 
							{
								0, 
								0, 
							}, 
							size = 
							{
								15 * aspect_ratio_correction, 
								32, 
							}, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = false, 
							can_resize = true, 
							class_name = "Button", 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							left_margin = 0, 
							name = "button max", 
							right_margin = 0, 
							text = "", 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_HIGHLIGHTED = 
								{
									material_preset = "ui_slider_right", 
								}, 
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_slider_right", 
								}, 
								MAT_NAME_PUSHED = 
								{
									material_preset = "ui_slider_right", 
								}, 
							}, 
							pos = 
							{
								215 * aspect_ratio_correction, 
								0, 
							}, 
							size = 
							{
								15 * aspect_ratio_correction, 
								32, 
							}, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = true, 
							can_resize = true, 
							class_name = "Button", 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							left_margin = 0, 
							name = "button scroller", 
							right_margin = 0, 
							text = "", 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_HIGHLIGHTED = 
								{
									material_preset = "ui_slider_button_h", 
								}, 
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_slider_button_e", 
								}, 
								MAT_NAME_PUSHED = 
								{
									material_preset = "ui_slider_button_t", 
								}, 
							}, 
							pos = 
							{
								15 * aspect_ratio_correction, 
								0, 
							}, 
							size = 
							{
								32 * aspect_ratio_correction, 
								32, 
							}, 
						}, 
					},
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Camera Bob", 
						right_margin = 0, 
						text = "STR_OPTIONS_GAME_REDUCED_CAMERA_BOB", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							196, 
						}, 
						size = 
						{
							200 * aspect_ratio_correction, 
							25, 
						}, 
					},
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						checker_h = 26, 
						checker_w = 30 * aspect_ratio_correction, 
						class_name = "CheckBox", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Camera Bob", 
						right_margin = 0, 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_CHECKER_OFF = 
							{
								material_preset = "ui_checker_off_e", 
							}, 
							MAT_NAME_CHECKER_ON = 
							{
								material_preset = "ui_checker_on_e", 
							}, 
							MAT_NAME_CHECKER_OFF_DISABLED = 
							{
								material_preset = "ui_checker_off_d", 
							}, 
							MAT_NAME_CHECKER_ON_DISABLED = 
							{
								material_preset = "ui_checker_on_d", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_CHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_checkbox_checked", 
								}, 
							}, 
							EVENT_UNCHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_checkbox_unchecked", 
								}, 
							}, 
						}, 
						pos = 
						{
							225 * aspect_ratio_correction, 
							189, 
						}, 
						size = 
						{
							30 * aspect_ratio_correction, 
							26, 
						}, 
					},
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Increased Molotov Distance 1", 
						right_margin = 0, 
						text = "STR_OPTIONS_GAME_INCREASED_MINIMUM", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							239, 
						}, 
						size = 
						{
							200 * aspect_ratio_correction, 
							25, 
						}, 
					},
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Increased Molotov Distance 2", 
						right_margin = 0, 
						text = "STR_OPTIONS_GAME_MOLOTOV_THROW_DISTANCE", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							255, 
						}, 
						size = 
						{
							200 * aspect_ratio_correction, 
							25, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						checker_h = 26, 
						checker_w = 30 * aspect_ratio_correction, 
						class_name = "CheckBox", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Increased Molotov Distance", 
						right_margin = 0, 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_CHECKER_OFF = 
							{
								material_preset = "ui_checker_off_e", 
							}, 
							MAT_NAME_CHECKER_ON = 
							{
								material_preset = "ui_checker_on_e", 
							}, 
							MAT_NAME_CHECKER_OFF_DISABLED = 
							{
								material_preset = "ui_checker_off_d", 
							}, 
							MAT_NAME_CHECKER_ON_DISABLED = 
							{
								material_preset = "ui_checker_on_d", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_CHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_checkbox_checked", 
								}, 
							}, 
							EVENT_UNCHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_checkbox_unchecked", 
								}, 
							}, 
						}, 
						pos = 
						{
							225 * aspect_ratio_correction, 
							242, 
						}, 
						size = 
						{
							30 * aspect_ratio_correction, 
							26, 
						}, 
					}, 			
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 4, 
					can_drag = false, 
					can_resize = true, 
					class_name = "Button", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Game", 
					right_margin = 0, 
					text = "STR_OPTIONS_PAGE_GAME", 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					events_sounds = 
					{
						EVENT_CLICK = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_button_click_random1", 
								"Menu_button_click_random2", 
								"Menu_button_click_random3", 
								"Menu_button_click_random4", 
								"Menu_button_click_random5", 
								"Menu_button_click_random6", 
								"Menu_button_click_random7",  
							}, 
						}, 
						EVENT_POINTER_ENTER = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_button_highlighted_random1", 
								"Menu_button_highlighted_random2", 
								"Menu_button_highlighted_random3", 
								"Menu_button_highlighted_random4", 
								"Menu_button_highlighted_random5", 
								   
							}, 
						}, 
					}, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_CHECKED = 
						{
							material_preset = "ui_tab_button_p", 
						}, 
						MAT_NAME_HIGHLIGHTED = 
						{
							material_preset = "ui_tab_button_h", 
						}, 
						MAT_NAME_NORMAL = 
						{
							material_template = "ui_color", 
							color = 
							{
								a = 0, 
								b = 52, 
								g = 52, 
								r = 52, 
							}, 
							pos = 
							{
								0, 
								0, 
							}, 
							size = 
							{
								1, 
								1, 
							}, 
						}, 
						MAT_NAME_PUSHED = 
						{
							material_preset = "ui_tab_button_p", 
						}, 
					}, 
					pos = 
					{
						0, 
						0, 
					}, 
					size = 
					{
						121 * aspect_ratio_correction_ui_tab_control, 
						42, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "WindowVisual", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Video", 
					right_margin = 0, 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						0, 
						40, 
					}, 
					size = 
					{
						485 * aspect_ratio_correction, 
						400, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Quality", 
						right_margin = 0, 
						text = "STR_OPTIONS_VIDEO_QUALITY", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							30, 
						}, 
						size = 
						{
							200 * aspect_ratio_correction, 
							25, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "DropDownList", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_border_offset = 45 * aspect_ratio_correction, 
						left_margin = 55 * aspect_ratio_correction, 
						max_list_box_height = 0, 
						name = "Quality", 
						offset = 0, 
						right_border_offset = 0, 
						right_margin = 0, 
						text = "STR_OPTIONS_ADVANCED_TEX_QUALITY_LOW", 
						top_margin = 8, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_DISABLED = 
							{
								material_preset = "ui_droplist_d", 
							}, 
							MAT_NAME_HIGHLIGHTED = 
							{
								material_preset = "ui_droplist_h", 
							}, 
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_droplist_e", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_CLICK = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_dropdown_click", 
								}, 
							}, 
							EVENT_POINTER_ENTER = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_dropdown_highlighted1", 
								}, 
							}, 
						}, 
						pos = 
						{
							220 * aspect_ratio_correction, 
							20, 
						}, 
						size = 
						{
							245 * aspect_ratio_correction, 
							34, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 4, 
							can_drag = false, 
							can_resize = true, 
							class_name = "ListBox", 
							columns_dw = 4, 
							columns_h = 20, 
							custom_item_height = -1, 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							item_icon_size = 16, 
							left_margin = 10, 
							name = "list_box", 
							right_margin = 8, 
							show_columns = false, 
							top_margin = 4, 
							visual_delta_bottom = 5, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 3, 
							fonts = 
							{
							}, 
							items = 
							{
								item_0 = 
								{
									column_0 = "STR_OPTIONS_ADVANCED_TEX_QUALITY_LOW", 
								}, 
								item_1 = 
								{
									column_0 = "STR_OPTIONS_ADVANCED_TEX_QUALITY_MEDIUM", 
								}, 
								item_2 = 
								{
									column_0 = "STR_OPTIONS_ADVANCED_TEX_QUALITY_HIGH", 
								}, 
							}, 
							materials = 
							{
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_droplist_listbox", 
								}, 
								MAT_NAME_SELECTION = 
								{
									material_preset = "ui_droplist_listbox_highlighted", 
								}, 
							}, 
							events_sounds = 
							{
								EVENT_HIGHLIGHTED = 
								{
									volume = 0, 
									file_names = 
									{
										"Menu_listbox_highlighted", 
									}, 
								}, 
								EVENT_CHECKED = 
								{
									volume = 0, 
									file_names = 
									{
										"Menu_listbox1", 
									}, 
								}, 
							}, 
							pos = 
							{
								45 * aspect_ratio_correction, 
								34, 
							}, 
							size = 
							{
								200 * aspect_ratio_correction, 
								56, 
							}, 
							{
								-----------------------------------------------------------
								alignment = "ALIGNMENT_NONE", 
								bottom_margin = 0, 
								can_drag = false, 
								can_resize = true, 
								class_name = "ScrollBar", 
								fade_in = 150, 
								fade_out = 150, 
								is_modal = false, 
								left_margin = 0, 
								name = "scroll bar vert", 
								right_margin = 0, 
								top_margin = 0, 
								visual_delta_bottom = 0, 
								visual_delta_left = 0, 
								visual_delta_right = 0, 
								visual_delta_top = 0, 
								fonts = 
								{
								}, 
								materials = 
								{
									MAT_NAME_NORMAL = 
									{
										material_template = "ui_color", 
										color = 
										{
											a = 50, 
											b = 52, 
											g = 52, 
											r = 52, 
										}, 
										pos = 
										{
											0, 
											0, 
										}, 
										size = 
										{
											1, 
											1, 
										}, 
									}, 
								}, 
								pos = 
								{
									184 * aspect_ratio_correction, 
									0, 
								}, 
								size = 
								{
									16 * aspect_ratio_correction, 
									56, 
								}, 
								{
									--------------------------------------------------------
									alignment = "ALIGNMENT_NONE", 
									bottom_margin = 0, 
									can_drag = false, 
									can_resize = true, 
									class_name = "Button", 
									fade_in = 150, 
									fade_out = 150, 
									is_modal = false, 
									left_margin = 0, 
									name = "button min", 
									right_margin = 0, 
									text = "", 
									top_margin = 0, 
									visual_delta_bottom = 0, 
									visual_delta_left = 0, 
									visual_delta_right = 0, 
									visual_delta_top = 0, 
									fonts = 
									{
									}, 
									materials = 
									{
										MAT_NAME_HIGHLIGHTED = 
										{
											material_preset = "ui_sys_scroll_button_up_h", 
										}, 
										MAT_NAME_NORMAL = 
										{
											material_preset = "ui_sys_scroll_button_up_e", 
										}, 
										MAT_NAME_PUSHED = 
										{
											material_preset = "ui_sys_scroll_button_up_p", 
										}, 
									}, 
									pos = 
									{
										0, 
										0, 
									}, 
									size = 
									{
										16 * aspect_ratio_correction, 
										16, 
									}, 
								}, 
								{
									--------------------------------------------------------
									alignment = "ALIGNMENT_NONE", 
									bottom_margin = 0, 
									can_drag = false, 
									can_resize = true, 
									class_name = "Button", 
									fade_in = 150, 
									fade_out = 150, 
									is_modal = false, 
									left_margin = 0, 
									name = "button max", 
									right_margin = 0, 
									text = "", 
									top_margin = 0, 
									visual_delta_bottom = 0, 
									visual_delta_left = 0, 
									visual_delta_right = 0, 
									visual_delta_top = 0, 
									fonts = 
									{
									}, 
									materials = 
									{
										MAT_NAME_HIGHLIGHTED = 
										{
											material_preset = "ui_sys_scroll_button_down_h", 
										}, 
										MAT_NAME_NORMAL = 
										{
											material_preset = "ui_sys_scroll_button_down_e", 
										}, 
										MAT_NAME_PUSHED = 
										{
											material_preset = "ui_sys_scroll_button_down_p", 
										}, 
									}, 
									pos = 
									{
										0, 
										40, 
									}, 
									size = 
									{
										16 * aspect_ratio_correction, 
										16, 
									}, 
								}, 
								{
									--------------------------------------------------------
									alignment = "ALIGNMENT_NONE", 
									bottom_margin = 0, 
									can_drag = true, 
									can_resize = true, 
									class_name = "Button", 
									fade_in = 150, 
									fade_out = 150, 
									is_modal = false, 
									left_margin = 0, 
									name = "button scroller", 
									right_margin = 0, 
									text = "", 
									top_margin = 0, 
									visual_delta_bottom = 0, 
									visual_delta_left = 0, 
									visual_delta_right = 0, 
									visual_delta_top = 0, 
									fonts = 
									{
									}, 
									materials = 
									{
										MAT_NAME_HIGHLIGHTED = 
										{
											material_preset = "ui_sys_button_scroller_h", 
										}, 
										MAT_NAME_NORMAL = 
										{
											material_preset = "ui_sys_button_scroller_e", 
										}, 
										MAT_NAME_PUSHED = 
										{
											material_preset = "ui_sys_button_scroller_p", 
										}, 
									}, 
									pos = 
									{
										0, 
										16, 
									}, 
									size = 
									{
										16 * aspect_ratio_correction, 
										16, 
									}, 
								}, 
							}, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Resolution", 
						right_margin = 0, 
						text = "STR_OPTIONS_VIDEO_RESOLUTION", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							70, 
						}, 
						size = 
						{
							200 * aspect_ratio_correction, 
							25, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "DropDownList", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_border_offset = 45 * aspect_ratio_correction, 
						left_margin = 55 * aspect_ratio_correction, 
						max_list_box_height = 100, 
						name = "Resolution", 
						offset = 0, 
						right_border_offset = 0, 
						right_margin = 0, 
						text = "", 
						top_margin = 8, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_DISABLED = 
							{
								material_preset = "ui_droplist_d", 
							}, 
							MAT_NAME_HIGHLIGHTED = 
							{
								material_preset = "ui_droplist_h", 
							}, 
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_droplist_e", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_CLICK = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_dropdown_click", 
								}, 
							}, 
							EVENT_POINTER_ENTER = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_dropdown_highlighted1", 
								}, 
							}, 
						}, 
						pos = 
						{
							220 * aspect_ratio_correction, 
							60, 
						}, 
						size = 
						{
							245 * aspect_ratio_correction, 
							34, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 4, 
							can_drag = false, 
							can_resize = true, 
							class_name = "ListBox", 
							columns_dw = 4, 
							columns_h = 20, 
							custom_item_height = -1, 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							item_icon_size = 16, 
							left_margin = 10, 
							name = "list_box", 
							right_margin = 8, 
							show_columns = false, 
							top_margin = 4, 
							visual_delta_bottom = 5, 
							visual_delta_left = 0, 
							visual_delta_right = 2, 
							visual_delta_top = 3, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_droplist_listbox", 
								}, 
								MAT_NAME_SELECTION = 
								{
									material_preset = "ui_droplist_listbox_highlighted", 
								}, 
							}, 
							events_sounds = 
							{
								EVENT_HIGHLIGHTED = 
								{
									volume = 0, 
									file_names = 
									{
										"Menu_listbox_highlighted", 
									}, 
								}, 
								EVENT_CHECKED = 
								{
									volume = 0, 
									file_names = 
									{
										"Menu_listbox1", 
									}, 
								}, 
							}, 
							pos = 
							{
								45 * aspect_ratio_correction, 
								34, 
							}, 
							size = 
							{
								200 * aspect_ratio_correction, 
								100, 
							}, 
							{
								-----------------------------------------------------------
								alignment = "ALIGNMENT_NONE", 
								bottom_margin = 0, 
								can_drag = false, 
								can_resize = true, 
								class_name = "ScrollBar", 
								fade_in = 100, 
								fade_out = 100, 
								is_modal = false, 
								left_margin = 0, 
								name = "scroll bar vert", 
								right_margin = 0, 
								top_margin = 0, 
								visual_delta_bottom = 0, 
								visual_delta_left = 0, 
								visual_delta_right = 0, 
								visual_delta_top = 0, 
								fonts = 
								{
								}, 
								materials = 
								{
									MAT_NAME_NORMAL = 
									{
										material_preset = "ui_scroll_back", 
									}, 
								}, 
								pos = 
								{
									182 * aspect_ratio_correction, 
									0, 
								}, 
								size = 
								{
									18 * aspect_ratio_correction, 
									100, 
								}, 
								{
									--------------------------------------------------------
									alignment = "ALIGNMENT_NONE", 
									bottom_margin = 0, 
									can_drag = false, 
									can_resize = true, 
									class_name = "Button", 
									fade_in = 100, 
									fade_out = 100, 
									is_modal = false, 
									left_margin = 0, 
									name = "button min", 
									right_margin = 0, 
									text = "", 
									top_margin = 0, 
									visual_delta_bottom = 0, 
									visual_delta_left = 0, 
									visual_delta_right = 0, 
									visual_delta_top = 0, 
									fonts = 
									{
									}, 
									materials = 
									{
										MAT_NAME_HIGHLIGHTED = 
										{
											material_preset = "ui_scroll_button_t_h", 
										}, 
										MAT_NAME_NORMAL = 
										{
											material_preset = "ui_scroll_button_t_e", 
										}, 
										MAT_NAME_PUSHED = 
										{
											material_preset = "ui_scroll_button_t_t", 
										}, 
									}, 
									pos = 
									{
										0, 
										0, 
									}, 
									size = 
									{
										18 * aspect_ratio_correction, 
										24, 
									}, 
								}, 
								{
									--------------------------------------------------------
									alignment = "ALIGNMENT_NONE", 
									bottom_margin = 0, 
									can_drag = false, 
									can_resize = true, 
									class_name = "Button", 
									fade_in = 100, 
									fade_out = 100, 
									is_modal = false, 
									left_margin = 0, 
									name = "button max", 
									right_margin = 0, 
									text = "", 
									top_margin = 0, 
									visual_delta_bottom = 0, 
									visual_delta_left = 0, 
									visual_delta_right = 0, 
									visual_delta_top = 0, 
									fonts = 
									{
									}, 
									materials = 
									{
										MAT_NAME_HIGHLIGHTED = 
										{
											material_preset = "ui_scroll_button_b_h", 
										}, 
										MAT_NAME_NORMAL = 
										{
											material_preset = "ui_scroll_button_b_e", 
										}, 
										MAT_NAME_PUSHED = 
										{
											material_preset = "ui_scroll_button_b_t", 
										}, 
									}, 
									pos = 
									{
										0, 
										72, 
									}, 
									size = 
									{
										18 * aspect_ratio_correction, 
										24, 
									}, 
								}, 
								{
									--------------------------------------------------------
									alignment = "ALIGNMENT_NONE", 
									bottom_margin = 0, 
									can_drag = true, 
									can_resize = true, 
									class_name = "Button", 
									fade_in = 100, 
									fade_out = 100, 
									is_modal = false, 
									left_margin = 0, 
									name = "button scroller", 
									right_margin = 0, 
									text = "", 
									top_margin = 0, 
									visual_delta_bottom = 0, 
									visual_delta_left = 0, 
									visual_delta_right = 0, 
									visual_delta_top = 0, 
									fonts = 
									{
									}, 
									materials = 
									{
										MAT_NAME_HIGHLIGHTED = 
										{
											material_preset = "ui_scroll_button_h", 
										}, 
										MAT_NAME_NORMAL = 
										{
											material_preset = "ui_scroll_button_e", 
										}, 
										MAT_NAME_PUSHED = 
										{
											material_preset = "ui_scroll_button_t", 
										}, 
									}, 
									pos = 
									{
										0, 
										28, 
									}, 
									size = 
									{
										18 * aspect_ratio_correction, 
										24, 
									}, 
								}, 
							}, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Refresh Rate", 
						right_margin = 0, 
						text = "STR_OPTIONS_VIDEO_REFRESHRATE", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							110, 
						}, 
						size = 
						{
							200 * aspect_ratio_correction, 
							25, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "DropDownList", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_border_offset = 45 * aspect_ratio_correction, 
						left_margin = 55 * aspect_ratio_correction, 
						max_list_box_height = 0, 
						name = "Refresh Rate", 
						offset = 0, 
						right_border_offset = 0, 
						right_margin = 0, 
						text = "", 
						top_margin = 8, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_DISABLED = 
							{
								material_preset = "ui_droplist_d", 
							}, 
							MAT_NAME_HIGHLIGHTED = 
							{
								material_preset = "ui_droplist_h", 
							}, 
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_droplist_e", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_CLICK = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_dropdown_click", 
								}, 
							}, 
							EVENT_POINTER_ENTER = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_dropdown_highlighted1", 
								}, 
							}, 
						}, 
						pos = 
						{
							220 * aspect_ratio_correction, 
							100, 
						}, 
						size = 
						{
							245 * aspect_ratio_correction, 
							34, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 4, 
							can_drag = false, 
							can_resize = true, 
							class_name = "ListBox", 
							columns_dw = 4, 
							columns_h = 20, 
							custom_item_height = -1, 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							item_icon_size = 16, 
							left_margin = 10, 
							name = "list_box", 
							right_margin = 8, 
							show_columns = false, 
							top_margin = 4, 
							visual_delta_bottom = 5, 
							visual_delta_left = 0, 
							visual_delta_right = 2, 
							visual_delta_top = 3, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_droplist_listbox", 
								}, 
								MAT_NAME_SELECTION = 
								{
									material_preset = "ui_droplist_listbox_highlighted", 
								}, 
							}, 
							events_sounds = 
							{
								EVENT_HIGHLIGHTED = 
								{
									volume = 0, 
									file_names = 
									{
										"Menu_listbox_highlighted", 
									}, 
								}, 
								EVENT_CHECKED = 
								{
									volume = 0, 
									file_names = 
									{
										"Menu_listbox1", 
									}, 
								}, 
							}, 
							pos = 
							{
								45 * aspect_ratio_correction, 
								34, 
							}, 
							size = 
							{
								200 * aspect_ratio_correction, 
								104, 
							}, 
							{
								-----------------------------------------------------------
								alignment = "ALIGNMENT_NONE", 
								bottom_margin = 0, 
								can_drag = false, 
								can_resize = true, 
								class_name = "ScrollBar", 
								fade_in = 100, 
								fade_out = 100, 
								is_modal = false, 
								left_margin = 0, 
								name = "scroll bar vert", 
								right_margin = 0, 
								top_margin = 0, 
								visual_delta_bottom = 0, 
								visual_delta_left = 0, 
								visual_delta_right = 0, 
								visual_delta_top = 0, 
								fonts = 
								{
								}, 
								materials = 
								{
									MAT_NAME_NORMAL = 
									{
										material_preset = "ui_scroll_back", 
									}, 
								}, 
								pos = 
								{
									182 * aspect_ratio_correction, 
									0, 
								}, 
								size = 
								{
									18 * aspect_ratio_correction, 
									104, 
								}, 
								{
									--------------------------------------------------------
									alignment = "ALIGNMENT_NONE", 
									bottom_margin = 0, 
									can_drag = false, 
									can_resize = true, 
									class_name = "Button", 
									fade_in = 100, 
									fade_out = 100, 
									is_modal = false, 
									left_margin = 0, 
									name = "button min", 
									right_margin = 0, 
									text = "", 
									top_margin = 0, 
									visual_delta_bottom = 0, 
									visual_delta_left = 0, 
									visual_delta_right = 0, 
									visual_delta_top = 0, 
									fonts = 
									{
									}, 
									materials = 
									{
										MAT_NAME_HIGHLIGHTED = 
										{
											material_preset = "ui_scroll_button_t_h", 
										}, 
										MAT_NAME_NORMAL = 
										{
											material_preset = "ui_scroll_button_t_e", 
										}, 
										MAT_NAME_PUSHED = 
										{
											material_preset = "ui_scroll_button_t_t", 
										}, 
									}, 
									pos = 
									{
										0, 
										0, 
									}, 
									size = 
									{
										18 * aspect_ratio_correction, 
										24, 
									}, 
								}, 
								{
									--------------------------------------------------------
									alignment = "ALIGNMENT_NONE", 
									bottom_margin = 0, 
									can_drag = false, 
									can_resize = true, 
									class_name = "Button", 
									fade_in = 100, 
									fade_out = 100, 
									is_modal = false, 
									left_margin = 0, 
									name = "button max", 
									right_margin = 0, 
									text = "", 
									top_margin = 0, 
									visual_delta_bottom = 0, 
									visual_delta_left = 0, 
									visual_delta_right = 0, 
									visual_delta_top = 0, 
									fonts = 
									{
									}, 
									materials = 
									{
										MAT_NAME_HIGHLIGHTED = 
										{
											material_preset = "ui_scroll_button_b_h", 
										}, 
										MAT_NAME_NORMAL = 
										{
											material_preset = "ui_scroll_button_b_e", 
										}, 
										MAT_NAME_PUSHED = 
										{
											material_preset = "ui_scroll_button_b_t", 
										}, 
									}, 
									pos = 
									{
										0, 
										76, 
									}, 
									size = 
									{
										18 * aspect_ratio_correction, 
										24, 
									}, 
								}, 
								{
									--------------------------------------------------------
									alignment = "ALIGNMENT_NONE", 
									bottom_margin = 0, 
									can_drag = true, 
									can_resize = true, 
									class_name = "Button", 
									fade_in = 100, 
									fade_out = 100, 
									is_modal = false, 
									left_margin = 0, 
									name = "button scroller", 
									right_margin = 0, 
									text = "", 
									top_margin = 0, 
									visual_delta_bottom = 0, 
									visual_delta_left = 0, 
									visual_delta_right = 0, 
									visual_delta_top = 0, 
									fonts = 
									{
									}, 
									materials = 
									{
										MAT_NAME_HIGHLIGHTED = 
										{
											material_preset = "ui_scroll_button_h", 
										}, 
										MAT_NAME_NORMAL = 
										{
											material_preset = "ui_scroll_button_e", 
										}, 
										MAT_NAME_PUSHED = 
										{
											material_preset = "ui_scroll_button_t", 
										}, 
									}, 
									pos = 
									{
										0, 
										28, 
									}, 
									size = 
									{
										18 * aspect_ratio_correction, 
										24, 
									}, 
								}, 
							}, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Full Screen", 
						right_margin = 0, 
						text = "STR_OPTIONS_VIDEO_FULLSCREEN", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							150, 
						}, 
						size = 
						{
							2 * aspect_ratio_correction, 
							2, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						checker_h = 26, 
						checker_w = 30 * aspect_ratio_correction, 
						class_name = "CheckBox", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Full Screen", 
						right_margin = 0, 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_CHECKER_OFF = 
							{
								material_preset = "ui_checker_off_e", 
							}, 
							MAT_NAME_CHECKER_ON = 
							{
								material_preset = "ui_checker_on_e", 
							}, 
							MAT_NAME_CHECKER_OFF_DISABLED = 
							{
								material_preset = "ui_checker_off_d", 
							}, 
							MAT_NAME_CHECKER_ON_DISABLED = 
							{
								material_preset = "ui_checker_on_d", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_CHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_checkbox_checked", 
								}, 
							}, 
							EVENT_UNCHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_checkbox_unchecked", 
								}, 
							}, 
						}, 
						pos = 
						{
							225 * aspect_ratio_correction, 
							145, 
						}, 
						size = 
						{
							30 * aspect_ratio_correction, 
							30, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Vertical Sync.", 
						right_margin = 0, 
						text = "STR_OPTIONS_VIDEO_VSYNC", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							185, 
						}, 
						size = 
						{
							200 * aspect_ratio_correction, 
							26, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						checker_h = 26, 
						checker_w = 30 * aspect_ratio_correction, 
						class_name = "CheckBox", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Vertical Sync.", 
						right_margin = 0, 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_CHECKER_OFF = 
							{
								material_preset = "ui_checker_off_e", 
							}, 
							MAT_NAME_CHECKER_ON = 
							{
								material_preset = "ui_checker_on_e", 
							}, 
							MAT_NAME_CHECKER_OFF_DISABLED = 
							{
								material_preset = "ui_checker_off_d", 
							}, 
							MAT_NAME_CHECKER_ON_DISABLED = 
							{
								material_preset = "ui_checker_on_d", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_CHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_checkbox_checked", 
								}, 
							}, 
							EVENT_UNCHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_checkbox_unchecked", 
								}, 
							}, 
						}, 
						pos = 
						{
							225 * aspect_ratio_correction, 
							180, 
						}, 
						size = 
						{
							30 * aspect_ratio_correction, 
							26, 
						}, 
					}, {
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Max FPS", 
						right_margin = 0, 
						text = "STR_OPTIONS_VIDEO_MAX_FPS", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							220, 
						}, 
						size = 
						{
							200 * aspect_ratio_correction, 
							25, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "DropDownList", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_border_offset = 45 * aspect_ratio_correction, 
						left_margin = 55 * aspect_ratio_correction, 
						max_list_box_height = 0, 
						name = "Max FPS", 
						offset = 0, 
						right_border_offset = 0, 
						right_margin = 0, 
						text = "", 
						top_margin = 8, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_DISABLED = 
							{
								material_preset = "ui_droplist_d", 
							}, 
							MAT_NAME_HIGHLIGHTED = 
							{
								material_preset = "ui_droplist_h", 
							}, 
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_droplist_e", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_CLICK = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_dropdown_click", 
								}, 
							}, 
							EVENT_POINTER_ENTER = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_dropdown_highlighted1", 
								}, 
							}, 
						}, 
						pos = 
						{
							220 * aspect_ratio_correction, 
							210, 
						}, 
						size = 
						{
							245 * aspect_ratio_correction, 
							34, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 4, 
							can_drag = false, 
							can_resize = true, 
							class_name = "ListBox", 
							columns_dw = 4, 
							columns_h = 20, 
							custom_item_height = -1, 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							item_icon_size = 16, 
							left_margin = 10, 
							name = "list_box", 
							right_margin = 8, 
							show_columns = false, 
							top_margin = 4, 
							visual_delta_bottom = 5, 
							visual_delta_left = 0, 
							visual_delta_right = 2, 
							visual_delta_top = 3, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_droplist_listbox", 
								}, 
								MAT_NAME_SELECTION = 
								{
									material_preset = "ui_droplist_listbox_highlighted", 
								}, 
							}, 
							events_sounds = 
							{
								EVENT_HIGHLIGHTED = 
								{
									volume = 0, 
									file_names = 
									{
										"Menu_listbox_highlighted", 
									}, 
								}, 
								EVENT_CHECKED = 
								{
									volume = 0, 
									file_names = 
									{
										"Menu_listbox1", 
									}, 
								}, 
							}, 
							pos = 
							{
								45 * aspect_ratio_correction, 
								34, 
							}, 
							size = 
							{
								200 * aspect_ratio_correction, 
								104, 
							}, 
							{
								-----------------------------------------------------------
								alignment = "ALIGNMENT_NONE", 
								bottom_margin = 0, 
								can_drag = false, 
								can_resize = true, 
								class_name = "ScrollBar", 
								fade_in = 100, 
								fade_out = 100, 
								is_modal = false, 
								left_margin = 0, 
								name = "scroll bar vert", 
								right_margin = 0, 
								top_margin = 0, 
								visual_delta_bottom = 0, 
								visual_delta_left = 0, 
								visual_delta_right = 0, 
								visual_delta_top = 0, 
								fonts = 
								{
								}, 
								materials = 
								{
									MAT_NAME_NORMAL = 
									{
										material_preset = "ui_scroll_back", 
									}, 
								}, 
								pos = 
								{
									182 * aspect_ratio_correction, 
									0, 
								}, 
								size = 
								{
									18 * aspect_ratio_correction, 
									104, 
								}, 
								{
									--------------------------------------------------------
									alignment = "ALIGNMENT_NONE", 
									bottom_margin = 0, 
									can_drag = false, 
									can_resize = true, 
									class_name = "Button", 
									fade_in = 100, 
									fade_out = 100, 
									is_modal = false, 
									left_margin = 0, 
									name = "button min", 
									right_margin = 0, 
									text = "", 
									top_margin = 0, 
									visual_delta_bottom = 0, 
									visual_delta_left = 0, 
									visual_delta_right = 0, 
									visual_delta_top = 0, 
									fonts = 
									{
									}, 
									materials = 
									{
										MAT_NAME_HIGHLIGHTED = 
										{
											material_preset = "ui_scroll_button_t_h", 
										}, 
										MAT_NAME_NORMAL = 
										{
											material_preset = "ui_scroll_button_t_e", 
										}, 
										MAT_NAME_PUSHED = 
										{
											material_preset = "ui_scroll_button_t_t", 
										}, 
									}, 
									pos = 
									{
										0, 
										0, 
									}, 
									size = 
									{
										18 * aspect_ratio_correction, 
										24, 
									}, 
								}, 
								{
									--------------------------------------------------------
									alignment = "ALIGNMENT_NONE", 
									bottom_margin = 0, 
									can_drag = false, 
									can_resize = true, 
									class_name = "Button", 
									fade_in = 100, 
									fade_out = 100, 
									is_modal = false, 
									left_margin = 0, 
									name = "button max", 
									right_margin = 0, 
									text = "", 
									top_margin = 0, 
									visual_delta_bottom = 0, 
									visual_delta_left = 0, 
									visual_delta_right = 0, 
									visual_delta_top = 0, 
									fonts = 
									{
									}, 
									materials = 
									{
										MAT_NAME_HIGHLIGHTED = 
										{
											material_preset = "ui_scroll_button_b_h", 
										}, 
										MAT_NAME_NORMAL = 
										{
											material_preset = "ui_scroll_button_b_e", 
										}, 
										MAT_NAME_PUSHED = 
										{
											material_preset = "ui_scroll_button_b_t", 
										}, 
									}, 
									pos = 
									{
										0, 
										76, 
									}, 
									size = 
									{
										18 * aspect_ratio_correction, 
										24, 
									}, 
								}, 
								{
									--------------------------------------------------------
									alignment = "ALIGNMENT_NONE", 
									bottom_margin = 0, 
									can_drag = true, 
									can_resize = true, 
									class_name = "Button", 
									fade_in = 100, 
									fade_out = 100, 
									is_modal = false, 
									left_margin = 0, 
									name = "button scroller", 
									right_margin = 0, 
									text = "", 
									top_margin = 0, 
									visual_delta_bottom = 0, 
									visual_delta_left = 0, 
									visual_delta_right = 0, 
									visual_delta_top = 0, 
									fonts = 
									{
									}, 
									materials = 
									{
										MAT_NAME_HIGHLIGHTED = 
										{
											material_preset = "ui_scroll_button_h", 
										}, 
										MAT_NAME_NORMAL = 
										{
											material_preset = "ui_scroll_button_e", 
										}, 
										MAT_NAME_PUSHED = 
										{
											material_preset = "ui_scroll_button_t", 
										}, 
									}, 
									pos = 
									{
										0, 
										28, 
									}, 
									size = 
									{
										18 * aspect_ratio_correction, 
										24, 
									}, 
								}, 
							}, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Gamma", 
						right_margin = 0, 
						text = "STR_OPTIONS_VIDEO_GAMMA", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							260, 
						}, 
						size = 
						{
							200 * aspect_ratio_correction, 
							25, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "ScrollBar", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Gamma", 
						right_margin = 0, 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						events_sounds = 
						{
							EVENT_CHANGED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_scroller1", 
									"Menu_scroller2", 
									"Menu_scroller3", 
									"Menu_scroller4", 
									"Menu_scroller5", 
									"Menu_scroller6", 
									"Menu_scroller7", 
									"Menu_scroller8", 
								}, 
							}, 
						}, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_slider_back_e", 
							}, 
						}, 
						pos = 
						{
							225 * aspect_ratio_correction, 
							253, 
						}, 
						size = 
						{
							235 * aspect_ratio_correction, 
							32, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = false, 
							can_resize = true, 
							class_name = "Button", 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							left_margin = 0, 
							name = "button min", 
							right_margin = 0, 
							text = "", 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_HIGHLIGHTED = 
								{
									material_preset = "ui_sys_scroll_button_up_h", 
								}, 
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_slider_left", 
								}, 
								MAT_NAME_PUSHED = 
								{
									material_preset = "ui_sys_scroll_button_up_p", 
								}, 
							}, 
							pos = 
							{
								0, 
								0, 
							}, 
							size = 
							{
								15 * aspect_ratio_correction, 
								32, 
							}, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = false, 
							can_resize = true, 
							class_name = "Button", 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							left_margin = 0, 
							name = "button max", 
							right_margin = 0, 
							text = "", 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_HIGHLIGHTED = 
								{
									material_preset = "ui_sys_scroll_button_down_h", 
								}, 
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_slider_right", 
								}, 
								MAT_NAME_PUSHED = 
								{
									material_preset = "ui_sys_scroll_button_down_p", 
								}, 
							}, 
							pos = 
							{
								220 * aspect_ratio_correction, 
								0, 
							}, 
							size = 
							{
								15 * aspect_ratio_correction, 
								32, 
							}, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = true, 
							can_resize = true, 
							class_name = "Button", 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							left_margin = 0, 
							name = "button scroller", 
							right_margin = 0, 
							text = "", 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_HIGHLIGHTED = 
								{
									material_preset = "ui_slider_button_h", 
								}, 
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_slider_button_e", 
								}, 
								MAT_NAME_PUSHED = 
								{
									material_preset = "ui_slider_button_t", 
								}, 
							}, 
							pos = 
							{
								53 * aspect_ratio_correction, 
								0, 
							}, 
							size = 
							{
								32 * aspect_ratio_correction, 
								32, 
							}, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "View Dist.", 
						right_margin = 0, 
						text = "STR_OPTIONS_VIDEO_VIEWDIST", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							295, 
						}, 
						size = 
						{
							200 * aspect_ratio_correction, 
							25, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "ScrollBar", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "View Dist.", 
						right_margin = 0, 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_slider_back_e", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_CHANGED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_scroller1", 
									"Menu_scroller2", 
									"Menu_scroller3", 
									"Menu_scroller4", 
									"Menu_scroller5", 
									"Menu_scroller6", 
									"Menu_scroller7", 
									"Menu_scroller8", 
								}, 
							}, 
						}, 
						pos = 
						{
							225 * aspect_ratio_correction, 
							288, 
						}, 
						size = 
						{
							235 * aspect_ratio_correction, 
							32, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = false, 
							can_resize = true, 
							class_name = "Button", 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							left_margin = 0, 
							name = "button min", 
							right_margin = 0, 
							text = "", 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_HIGHLIGHTED = 
								{
									material_preset = "ui_sys_scroll_button_up_h", 
								}, 
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_slider_left", 
								}, 
								MAT_NAME_PUSHED = 
								{
									material_preset = "ui_sys_scroll_button_up_p", 
								}, 
							}, 
							pos = 
							{
								0, 
								0, 
							}, 
							size = 
							{
								15 * aspect_ratio_correction, 
								32, 
							}, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = false, 
							can_resize = true, 
							class_name = "Button", 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							left_margin = 0, 
							name = "button max", 
							right_margin = 0, 
							text = "", 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_HIGHLIGHTED = 
								{
									material_preset = "ui_sys_scroll_button_down_h", 
								}, 
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_slider_right", 
								}, 
								MAT_NAME_PUSHED = 
								{
									material_preset = "ui_sys_scroll_button_down_p", 
								}, 
							}, 
							pos = 
							{
								220 * aspect_ratio_correction, 
								0, 
							}, 
							size = 
							{
								15 * aspect_ratio_correction, 
								32, 
							}, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = true, 
							can_resize = true, 
							class_name = "Button", 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							left_margin = 0, 
							name = "button scroller", 
							right_margin = 0, 
							text = "", 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_HIGHLIGHTED = 
								{
									material_preset = "ui_slider_button_h", 
								}, 
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_slider_button_e", 
								}, 
								MAT_NAME_PUSHED = 
								{
									material_preset = "ui_slider_button_t", 
								}, 
							}, 
							pos = 
							{
								188 * aspect_ratio_correction, 
								0, 
							}, 
							size = 
							{
								32 * aspect_ratio_correction, 
								32, 
							}, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "Button", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Advanced", 
						right_margin = 0, 
						text = "STR_OPTIONS_VIDEO_ADVANCED", 
						top_margin = 0, 
						visual_delta_bottom = 3, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						events_sounds = 
						{
							EVENT_CLICK = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_button_click_random1", 
									"Menu_button_click_random2", 
									"Menu_button_click_random3", 
									"Menu_button_click_random4", 
									"Menu_button_click_random5", 
									"Menu_button_click_random6", 
									"Menu_button_click_random7",   
								}, 
							}, 
							EVENT_POINTER_ENTER = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_button_highlighted_random1", 
									"Menu_button_highlighted_random2", 
									"Menu_button_highlighted_random3", 
									"Menu_button_highlighted_random4", 
									"Menu_button_highlighted_random5", 
									   
								}, 
							}, 
						}, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_HIGHLIGHTED = 
							{
								material_preset = "ui_advanced_button_h", 
							}, 
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_advanced_button_e", 
							}, 
							MAT_NAME_PUSHED = 
							{
								material_preset = "ui_advanced_button_t", 
							}, 
						}, 
						pos = 
						{
							335 * aspect_ratio_correction, 
							327, 
						}, 
						size = 
						{
							128 * aspect_ratio_correction, 
							32, 
						}, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 4, 
					can_drag = false, 
					can_resize = true, 
					class_name = "Button", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Video", 
					right_margin = 0, 
					text = "STR_OPTIONS_PAGE_VIDEO", 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					events_sounds = 
					{
						EVENT_CLICK = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_button_click_random1", 
								"Menu_button_click_random2", 
								"Menu_button_click_random3", 
								"Menu_button_click_random4", 
								"Menu_button_click_random5", 
								"Menu_button_click_random6", 
								"Menu_button_click_random7",    
							}, 
						}, 
						EVENT_POINTER_ENTER = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_button_highlighted_random1", 
								"Menu_button_highlighted_random2", 
								"Menu_button_highlighted_random3", 
								"Menu_button_highlighted_random4", 
								"Menu_button_highlighted_random5", 
								   
							}, 
						}, 
					}, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_CHECKED = 
						{
							material_preset = "ui_tab_button_p", 
						}, 
						MAT_NAME_HIGHLIGHTED = 
						{
							material_preset = "ui_tab_button_h", 
						}, 
						MAT_NAME_NORMAL = 
						{
							material_template = "ui_color", 
							color = 
							{
								a = 0, 
								b = 52, 
								g = 52, 
								r = 52, 
							}, 
							pos = 
							{
								0, 
								0, 
							}, 
							size = 
							{
								1, 
								1, 
							}, 
						}, 
						MAT_NAME_PUSHED = 
						{
							material_preset = "ui_tab_button_p", 
						}, 
					}, 
					pos = 
					{
						125 * aspect_ratio_correction, 
						0, 
					}, 
					size = 
					{
						121 * aspect_ratio_correction_ui_tab_control, 
						42, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "WindowVisual", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Audio", 
					right_margin = 0, 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						0, 
						40, 
					}, 
					size = 
					{
						485 * aspect_ratio_correction, 
						400, 
					},  
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Volume", 
						right_margin = 0, 
						text = "STR_OPTIONS_AUDIO_VOLUME", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							30, 
						}, 
						size = 
						{
							200 * aspect_ratio_correction, 
							25, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "ScrollBar", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Volume", 
						right_margin = 0, 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_slider_back_e", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_CHANGED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_scroller1", 
									"Menu_scroller2", 
									"Menu_scroller3", 
									"Menu_scroller4", 
									"Menu_scroller5", 
									"Menu_scroller6", 
									"Menu_scroller7", 
									"Menu_scroller8", 
								}, 
							}, 
						}, 
						pos = 
						{
							225 * aspect_ratio_correction, 
							20, 
						}, 
						size = 
						{
							230 * aspect_ratio_correction, 
							32, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = false, 
							can_resize = true, 
							class_name = "Button", 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							left_margin = 0, 
							name = "button min", 
							right_margin = 0, 
							text = "", 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_HIGHLIGHTED = 
								{
									material_preset = "ui_sys_scroll_button_up_h", 
								}, 
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_slider_left", 
								}, 
								MAT_NAME_PUSHED = 
								{
									material_preset = "ui_sys_scroll_button_up_p", 
								}, 
							}, 
							pos = 
							{
								0, 
								0, 
							}, 
							size = 
							{
								15 * aspect_ratio_correction, 
								32, 
							}, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = false, 
							can_resize = true, 
							class_name = "Button", 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							left_margin = 0, 
							name = "button max", 
							right_margin = 0, 
							text = "", 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_HIGHLIGHTED = 
								{
									material_preset = "ui_sys_scroll_button_down_h", 
								}, 
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_slider_right", 
								}, 
								MAT_NAME_PUSHED = 
								{
									material_preset = "ui_sys_scroll_button_down_p", 
								}, 
							}, 
							pos = 
							{
								215 * aspect_ratio_correction, 
								0, 
							}, 
							size = 
							{
								15 * aspect_ratio_correction, 
								32, 
							}, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = true, 
							can_resize = true, 
							class_name = "Button", 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							left_margin = 0, 
							name = "button scroller", 
							right_margin = 0, 
							text = "", 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_HIGHLIGHTED = 
								{
									material_preset = "ui_slider_button_h", 
								}, 
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_slider_button_e", 
								}, 
								MAT_NAME_PUSHED = 
								{
									material_preset = "ui_slider_button_t", 
								}, 
							}, 
							pos = 
							{
								183 * aspect_ratio_correction, 
								0, 
							}, 
							size = 
							{
								32 * aspect_ratio_correction, 
								32, 
							}, 
						}, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 4, 
					can_drag = false, 
					can_resize = true, 
					class_name = "Button", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Audio", 
					right_margin = 0, 
					text = "STR_OPTIONS_PAGE_AUDIO", 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					events_sounds = 
					{
						EVENT_CLICK = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_button_click_random1", 
									"Menu_button_click_random2", 
									"Menu_button_click_random3", 
									"Menu_button_click_random4", 
									"Menu_button_click_random5", 
									"Menu_button_click_random6", 
									"Menu_button_click_random7",    
							}, 
						}, 
						EVENT_POINTER_ENTER = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_button_highlighted_random1", 
								"Menu_button_highlighted_random2", 
								"Menu_button_highlighted_random3", 
								"Menu_button_highlighted_random4", 
								"Menu_button_highlighted_random5", 
								   
							}, 
						}, 
					}, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_CHECKED = 
						{
							material_preset = "ui_tab_button_p", 
						}, 
						MAT_NAME_HIGHLIGHTED = 
						{
							material_preset = "ui_tab_button_h", 
						}, 
						MAT_NAME_NORMAL = 
						{
							material_template = "ui_color", 
							color = 
							{
								a = 0, 
								b = 52, 
								g = 52, 
								r = 52, 
							}, 
							pos = 
							{
								0, 
								0, 
							}, 
							size = 
							{
								1, 
								1, 
							}, 
						}, 
						MAT_NAME_PUSHED = 
						{
							material_preset = "ui_tab_button_p", 
						}, 
					}, 
					pos = 
					{
						250 * aspect_ratio_correction, 
						0, 
					}, 
					size = 
					{
						121 * aspect_ratio_correction_ui_tab_control, 
						42, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "WindowVisual", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Input", 
					right_margin = 0, 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						0, 
						40, 
					}, 
					size = 
					{
						485 * aspect_ratio_correction, 
						400, 
					},
					{
						name = "controller_icon",
						class_name = "HudImages", 
						fade_in = 100, 
						fade_out = 100, 
						curr_image = 2,
						dimension_x = 1,
						dimension_y = 4,
						materials = 
						{
							MAT_NAME_TILED = 
							{
								diffuse_texture = "controller_icon", 
								material_template = "ui_image", 
							}, 	
						}, 
						pos =
						{
							-413 * aspect_ratio_correction, 
							-210, 
						},
						size = 
						{
							360 * aspect_ratio_correction,
							359, 
						}, 
					},
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Invert Mouse", 
						right_margin = 0, 
						text = "STR_OPTIONS_INPUT_INVERT_MOUSE", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							30, 
						}, 
						size = 
						{
							200 * aspect_ratio_correction, 
							25, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						checker_h = 26, 
						checker_w = 30 * aspect_ratio_correction, 
						class_name = "CheckBox", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Invert Mouse", 
						right_margin = 0, 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_CHECKER_OFF = 
							{
								material_preset = "ui_checker_off_e", 
							}, 
							MAT_NAME_CHECKER_ON = 
							{
								material_preset = "ui_checker_on_e", 
							}, 
							MAT_NAME_CHECKER_OFF_DISABLED = 
							{
								material_preset = "ui_checker_off_d", 
							}, 
							MAT_NAME_CHECKER_ON_DISABLED = 
							{
								material_preset = "ui_checker_on_d", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_CHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_checkbox_checked", 
								}, 
							}, 
							EVENT_UNCHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_checkbox_unchecked", 
								}, 
							}, 
						}, 
						pos = 
						{
							225 * aspect_ratio_correction, 
							25, 
						}, 
						size = 
						{
							30 * aspect_ratio_correction, 
							26, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Mouse Sensitivity", 
						right_margin = 0, 
						text = "STR_OPTIONS_INPUT_MOUSE_SENS", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							70, 
						}, 
						size = 
						{
							200 * aspect_ratio_correction, 
							25, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "ScrollBar", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Mouse Sensitivity", 
						right_margin = 0, 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_slider_back_e", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_CHANGED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_scroller1", 
									"Menu_scroller2", 
									"Menu_scroller3", 
									"Menu_scroller4", 
									"Menu_scroller5", 
									"Menu_scroller6", 
									"Menu_scroller7", 
									"Menu_scroller8", 
								}, 
							}, 
						}, 
						pos = 
						{
							225 * aspect_ratio_correction, 
							60, 
						}, 
						size = 
						{
							230 * aspect_ratio_correction, 
							32, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = false, 
							can_resize = true, 
							class_name = "Button", 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							left_margin = 0, 
							name = "button min", 
							right_margin = 0, 
							text = "", 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_HIGHLIGHTED = 
								{
									material_preset = "ui_sys_scroll_button_up_h", 
								}, 
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_slider_left", 
								}, 
								MAT_NAME_PUSHED = 
								{
									material_preset = "ui_sys_scroll_button_up_p", 
								}, 
							}, 
							pos = 
							{
								0, 
								0, 
							}, 
							size = 
							{
								15 * aspect_ratio_correction, 
								32, 
							}, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = false, 
							can_resize = true, 
							class_name = "Button", 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							left_margin = 0, 
							name = "button max", 
							right_margin = 0, 
							text = "", 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_HIGHLIGHTED = 
								{
									material_preset = "ui_sys_scroll_button_down_h", 
								}, 
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_slider_right", 
								}, 
								MAT_NAME_PUSHED = 
								{
									material_preset = "ui_sys_scroll_button_down_p", 
								}, 
							}, 
							pos = 
							{
								215 * aspect_ratio_correction, 
								0, 
							}, 
							size = 
							{
								15 * aspect_ratio_correction, 
								32, 
							}, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = true, 
							can_resize = true, 
							class_name = "Button", 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							left_margin = 0, 
							name = "button scroller", 
							right_margin = 0, 
							text = "", 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_HIGHLIGHTED = 
								{
									material_preset = "ui_slider_button_h", 
								}, 
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_slider_button_e", 
								}, 
								MAT_NAME_PUSHED = 
								{
									material_preset = "ui_slider_button_t", 
								}, 
							}, 
							pos = 
							{
								15 * aspect_ratio_correction, 
								0, 
							}, 
							size = 
							{
								32 * aspect_ratio_correction, 
								32, 
							}, 
						}, 
					}, 
					{
						--------------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 4, 
						can_drag = false, 
						can_resize = true, 
						class_name = "ListBox", 
						columns_dw = 5 * aspect_ratio_correction, 
						columns_h = 20, 
						custom_item_height = -1, 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						item_icon_size = 16, 
						left_margin = 10, 
						name = "Input Layout List", 
						right_margin = 4, 
						show_columns = true, 
						top_margin = 4, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 9 * aspect_ratio_correction, 
						visual_delta_top = 5, 
						fonts = 
						{
						}, 
						items = 
						{
						}, 
						materials = 
						{
							MAT_NAME_CHECKED = 
							{
								material_preset = "ui_listbox_checked", 
							}, 
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_listbox", 
							}, 
							MAT_NAME_SELECTION = 
							{
								material_preset = "ui_listbox_highlighted", 
							}, 
							MAT_NAME_LISTBOX_HEADER = 
							{
								material_preset = "ui_listbox_checked", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_HIGHLIGHTED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_listbox_highlighted", 
								}, 
							}, 
							EVENT_CHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_listbox1", 
								}, 
							}, 
						}, 
						pos = 
						{
							18 * aspect_ratio_correction, 
							145, 
						}, 
						size = 
						{
							440 * aspect_ratio_correction, 
							185, 
						}, 
						{
							-----------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = false, 
							can_resize = true, 
							class_name = "ScrollBar", 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							left_margin = 0, 
							name = "scroll bar vert", 
							right_margin = 0, 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_scroll_back", 
								}, 
							}, 
							pos = 
							{
								182 * aspect_ratio_correction, 
								0, 
							}, 
							size = 
							{
								18 * aspect_ratio_correction, 
								100, 
							}, 
							{
								--------------------------------------------------------
								alignment = "ALIGNMENT_NONE", 
								bottom_margin = 0, 
								can_drag = false, 
								can_resize = true, 
								class_name = "Button", 
								fade_in = 100, 
								fade_out = 100, 
								is_modal = false, 
								left_margin = 0, 
								name = "button min", 
								right_margin = 0, 
								text = "", 
								top_margin = 0, 
								visual_delta_bottom = 0, 
								visual_delta_left = 0, 
								visual_delta_right = 0, 
								visual_delta_top = 0, 
								fonts = 
								{
								}, 
								materials = 
								{
									MAT_NAME_HIGHLIGHTED = 
									{
										material_preset = "ui_scroll_button_t_h", 
									}, 
									MAT_NAME_NORMAL = 
									{
										material_preset = "ui_scroll_button_t_e", 
									}, 
									MAT_NAME_PUSHED = 
									{
										material_preset = "ui_scroll_button_t_t", 
									}, 
								}, 
								pos = 
								{
									0, 
									0, 
								}, 
								size = 
								{
									18 * aspect_ratio_correction, 
									24, 
								}, 
							}, 
							{
								--------------------------------------------------------
								alignment = "ALIGNMENT_NONE", 
								bottom_margin = 0, 
								can_drag = false, 
								can_resize = true, 
								class_name = "Button", 
								fade_in = 100, 
								fade_out = 100, 
								is_modal = false, 
								left_margin = 0, 
								name = "button max", 
								right_margin = 0, 
								text = "", 
								top_margin = 0, 
								visual_delta_bottom = 0, 
								visual_delta_left = 0, 
								visual_delta_right = 0, 
								visual_delta_top = 0, 
								fonts = 
								{
								}, 
								materials = 
								{
									MAT_NAME_HIGHLIGHTED = 
									{
										material_preset = "ui_scroll_button_b_h", 
									}, 
									MAT_NAME_NORMAL = 
									{
										material_preset = "ui_scroll_button_b_e", 
									}, 
									MAT_NAME_PUSHED = 
									{
										material_preset = "ui_scroll_button_b_t", 
									}, 
								}, 
								pos = 
								{
									0, 
									72, 
								}, 
								size = 
								{
									18 * aspect_ratio_correction, 
									24, 
								}, 
							}, 
							{
								--------------------------------------------------------
								alignment = "ALIGNMENT_NONE", 
								bottom_margin = 0, 
								can_drag = true, 
								can_resize = true, 
								class_name = "Button", 
								fade_in = 100, 
								fade_out = 100, 
								is_modal = false, 
								left_margin = 0, 
								name = "button scroller", 
								right_margin = 0, 
								text = "", 
								top_margin = 0, 
								visual_delta_bottom = 0, 
								visual_delta_left = 0, 
								visual_delta_right = 0, 
								visual_delta_top = 0, 
								fonts = 
								{
								}, 
								materials = 
								{
									MAT_NAME_HIGHLIGHTED = 
									{
										material_preset = "ui_scroll_button_h", 
									}, 
									MAT_NAME_NORMAL = 
									{
										material_preset = "ui_scroll_button_e", 
									}, 
									MAT_NAME_PUSHED = 
									{
										material_preset = "ui_scroll_button_t", 
									}, 
								}, 
								pos = 
								{
									0, 
									28, 
								}, 
								size = 
								{
									18 * aspect_ratio_correction, 
									24, 
								}, 
							}, 
						}, 
					},{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "StaticText", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Controller Preset", 
						right_margin = 0, 
						text = "STR_OPTIONS_INPUT_CONTROLLER_PRESET", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
							}, 
						}, 
						pos = 
						{
							20 * aspect_ratio_correction, 
							110, 
						}, 
						size = 
						{
							200 * aspect_ratio_correction, 
							25, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "DropDownList", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_border_offset = 45 * aspect_ratio_correction, 
						left_margin = 55 * aspect_ratio_correction, 
						max_list_box_height = 0, 
						name = "Controller Preset", 
						offset = 0, 
						right_border_offset = 0, 
						right_margin = 0, 
						text = "", 
						top_margin = 8, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_DISABLED = 
							{
								material_preset = "ui_droplist_d", 
							}, 
							MAT_NAME_HIGHLIGHTED = 
							{
								material_preset = "ui_droplist_h", 
							}, 
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_droplist_e", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_CLICK = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_dropdown_click", 
								}, 
							}, 
							EVENT_POINTER_ENTER = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_dropdown_highlighted1", 
								}, 
							}, 
						}, 
						pos = 
						{
							220 * aspect_ratio_correction, 
							100, 
						}, 
						size = 
						{
							245 * aspect_ratio_correction, 
							34, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 4, 
							can_drag = false, 
							can_resize = true, 
							class_name = "ListBox", 
							columns_dw = 4, 
							columns_h = 20, 
							custom_item_height = -1, 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							item_icon_size = 16, 
							left_margin = 10, 
							name = "list_box", 
							right_margin = 8, 
							show_columns = false, 
							top_margin = 4, 
							visual_delta_bottom = 5, 
							visual_delta_left = 0, 
							visual_delta_right = 2, 
							visual_delta_top = 3, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_NORMAL = 
								{
									material_preset = "ui_droplist_listbox", 
								}, 
								MAT_NAME_SELECTION = 
								{
									material_preset = "ui_droplist_listbox_highlighted", 
								}, 
							}, 
							events_sounds = 
							{
								EVENT_HIGHLIGHTED = 
								{
									volume = 0, 
									file_names = 
									{
										"Menu_listbox_highlighted", 
									}, 
								}, 
								EVENT_CHECKED = 
								{
									volume = 0, 
									file_names = 
									{
										"Menu_listbox1", 
									}, 
								}, 
							}, 
							pos = 
							{
								45 * aspect_ratio_correction, 
								34, 
							}, 
							size = 
							{
								200 * aspect_ratio_correction, 
								104, 
							}, 
							{
								-----------------------------------------------------------
								alignment = "ALIGNMENT_NONE", 
								bottom_margin = 0, 
								can_drag = false, 
								can_resize = true, 
								class_name = "ScrollBar", 
								fade_in = 100, 
								fade_out = 100, 
								is_modal = false, 
								left_margin = 0, 
								name = "scroll bar vert", 
								right_margin = 0, 
								top_margin = 0, 
								visual_delta_bottom = 0, 
								visual_delta_left = 0, 
								visual_delta_right = 0, 
								visual_delta_top = 0, 
								fonts = 
								{
								}, 
								materials = 
								{
									MAT_NAME_NORMAL = 
									{
										material_preset = "ui_scroll_back", 
									}, 
								}, 
								pos = 
								{
									182 * aspect_ratio_correction, 
									0, 
								}, 
								size = 
								{
									18 * aspect_ratio_correction, 
									104, 
								}, 
								{
									--------------------------------------------------------
									alignment = "ALIGNMENT_NONE", 
									bottom_margin = 0, 
									can_drag = false, 
									can_resize = true, 
									class_name = "Button", 
									fade_in = 100, 
									fade_out = 100, 
									is_modal = false, 
									left_margin = 0, 
									name = "button min", 
									right_margin = 0, 
									text = "", 
									top_margin = 0, 
									visual_delta_bottom = 0, 
									visual_delta_left = 0, 
									visual_delta_right = 0, 
									visual_delta_top = 0, 
									fonts = 
									{
									}, 
									materials = 
									{
										MAT_NAME_HIGHLIGHTED = 
										{
											material_preset = "ui_scroll_button_t_h", 
										}, 
										MAT_NAME_NORMAL = 
										{
											material_preset = "ui_scroll_button_t_e", 
										}, 
										MAT_NAME_PUSHED = 
										{
											material_preset = "ui_scroll_button_t_t", 
										}, 
									}, 
									pos = 
									{
										0, 
										0, 
									}, 
									size = 
									{
										18 * aspect_ratio_correction, 
										24, 
									}, 
								}, 
								{
									--------------------------------------------------------
									alignment = "ALIGNMENT_NONE", 
									bottom_margin = 0, 
									can_drag = false, 
									can_resize = true, 
									class_name = "Button", 
									fade_in = 100, 
									fade_out = 100, 
									is_modal = false, 
									left_margin = 0, 
									name = "button max", 
									right_margin = 0, 
									text = "", 
									top_margin = 0, 
									visual_delta_bottom = 0, 
									visual_delta_left = 0, 
									visual_delta_right = 0, 
									visual_delta_top = 0, 
									fonts = 
									{
									}, 
									materials = 
									{
										MAT_NAME_HIGHLIGHTED = 
										{
											material_preset = "ui_scroll_button_b_h", 
										}, 
										MAT_NAME_NORMAL = 
										{
											material_preset = "ui_scroll_button_b_e", 
										}, 
										MAT_NAME_PUSHED = 
										{
											material_preset = "ui_scroll_button_b_t", 
										}, 
									}, 
									pos = 
									{
										0, 
										76, 
									}, 
									size = 
									{
										18 * aspect_ratio_correction, 
										24, 
									}, 
								}, 
								{
									--------------------------------------------------------
									alignment = "ALIGNMENT_NONE", 
									bottom_margin = 0, 
									can_drag = true, 
									can_resize = true, 
									class_name = "Button", 
									fade_in = 100, 
									fade_out = 100, 
									is_modal = false, 
									left_margin = 0, 
									name = "button scroller", 
									right_margin = 0, 
									text = "", 
									top_margin = 0, 
									visual_delta_bottom = 0, 
									visual_delta_left = 0, 
									visual_delta_right = 0, 
									visual_delta_top = 0, 
									fonts = 
									{
									}, 
									materials = 
									{
										MAT_NAME_HIGHLIGHTED = 
										{
											material_preset = "ui_scroll_button_h", 
										}, 
										MAT_NAME_NORMAL = 
										{
											material_preset = "ui_scroll_button_e", 
										}, 
										MAT_NAME_PUSHED = 
										{
											material_preset = "ui_scroll_button_t", 
										}, 
									}, 
									pos = 
									{
										0, 
										28, 
									}, 
									size = 
									{
										18 * aspect_ratio_correction, 
										24, 
									}, 
								}, 
							}, 
						}, 
					}, 
					{
						--------------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "Button", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "Input Layout Defaults", 
						right_margin = 0, 
						text = "STR_OPTIONS_KEYBOARD_DEFAULTS", 
						top_margin = 0, 
						visual_delta_bottom = 3, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						events_sounds = 
						{
							EVENT_CLICK = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_button_click_random1", 
									"Menu_button_click_random2", 
									"Menu_button_click_random3", 
									"Menu_button_click_random4", 
									"Menu_button_click_random5", 
									"Menu_button_click_random6", 
									"Menu_button_click_random7",    
								}, 
							}, 
							EVENT_POINTER_ENTER = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_button_highlighted_random1", 
									"Menu_button_highlighted_random2", 
									"Menu_button_highlighted_random3", 
									"Menu_button_highlighted_random4", 
									"Menu_button_highlighted_random5", 
										
								}, 
							}, 
						}, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_HIGHLIGHTED = 
							{
								material_preset = "ui_advanced_button_h", 
							}, 
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_advanced_button_e", 
							}, 
							MAT_NAME_PUSHED = 
							{
								material_preset = "ui_advanced_button_t", 
							}, 
						},  
						pos = 
						{
							330 * aspect_ratio_correction, 
							337, 
						}, 
						size = 
						{
							128 * aspect_ratio_correction, 
							32, 
						}, 
					},
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 4, 
					can_drag = false, 
					can_resize = true, 
					class_name = "Button", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Input", 
					right_margin = 0, 
					text = "STR_OPTIONS_PAGE_INPUT", 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					events_sounds = 
					{
						EVENT_CLICK = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_button_click_random1", 
								"Menu_button_click_random2", 
								"Menu_button_click_random3", 
								"Menu_button_click_random4", 
								"Menu_button_click_random5", 
								"Menu_button_click_random6", 
								"Menu_button_click_random7",    
							}, 
						}, 
						EVENT_POINTER_ENTER = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_button_highlighted_random1", 
								"Menu_button_highlighted_random2", 
								"Menu_button_highlighted_random3", 
								"Menu_button_highlighted_random4", 
								"Menu_button_highlighted_random5", 
								   
							}, 
						}, 
					}, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_CHECKED = 
						{
							material_preset = "ui_tab_button_p", 
						}, 
						MAT_NAME_HIGHLIGHTED = 
						{
							material_preset = "ui_tab_button_h", 
						}, 
						MAT_NAME_NORMAL = 
						{
							material_template = "ui_color", 
							color = 
							{
								a = 0, 
								b = 52, 
								g = 52, 
								r = 52, 
							}, 
							pos = 
							{
								0, 
								0, 
							}, 
							size = 
							{
								1, 
								1, 
							}, 
						}, 
						MAT_NAME_PUSHED = 
						{
							material_preset = "ui_tab_button_p", 
						}, 
					}, 
					pos = 
					{
						375 * aspect_ratio_correction, 
						0, 
					}, 
					size = 
					{
						121 * aspect_ratio_correction_ui_tab_control, 
						42, 
					}, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				button_h = 32, 
				button_w = 128 * aspect_ratio_correction, 
				buttons_horizontal = true, 
				buttons_interval = 8, 
				can_drag = false, 
				can_resize = false, 
				caption = "", 
				caption_alignment = "ALIGNMENT_LEFT", 
				caption_h = 24, 
				class_name = "AdvancedOptionsWindow", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = true, 
				left_margin = 0, 
				name = "Advanced Options", 
				right_margin = 0, 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_options_menu", 
					}, 
				},
				pos = 
				{
					-50 * aspect_ratio_correction, 
					40, 
				}, 
				size = 
				{
					620 * aspect_ratio_correction, 
					550, 
				}, 
				{
					-----------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "StaticText", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Caption", 
					right_margin = 0, 
					text = "STR_OPTIONS_ADVANCED_CAPTION", 
					top_margin = 3, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						70 * aspect_ratio_correction, 
						37, 
					}, 
					size = 
					{
						300 * aspect_ratio_correction, 
						20, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					border_size = 8, 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = false, 
					class_name = "Border", 
					fade_in = 150, 
					fade_out = 150, 
					is_modal = false, 
					left_margin = 0, 
					name = "border left", 
					right_margin = 0, 
					top_margin = 0, 
					type = "BORDER_LEFT", 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						0, 
						0, 
					}, 
					size = 
					{
						8, 
						500, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					border_size = 8, 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = false, 
					class_name = "Border", 
					fade_in = 150, 
					fade_out = 150, 
					is_modal = false, 
					left_margin = 0, 
					name = "border right", 
					right_margin = 0, 
					top_margin = 0, 
					type = "BORDER_RIGHT", 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						442, 
						0, 
					}, 
					size = 
					{
						8, 
						500, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					border_size = 8, 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = false, 
					class_name = "Border", 
					fade_in = 150, 
					fade_out = 150, 
					is_modal = false, 
					left_margin = 0, 
					name = "border top", 
					right_margin = 0, 
					top_margin = 0, 
					type = "BORDER_TOP", 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						0, 
						0, 
					}, 
					size = 
					{
						450, 
						8, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					border_size = 8, 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = false, 
					class_name = "Border", 
					fade_in = 150, 
					fade_out = 150, 
					is_modal = false, 
					left_margin = 0, 
					name = "border bottom", 
					right_margin = 0, 
					top_margin = 0, 
					type = "BORDER_BOTTOM", 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						0, 
						492, 
					}, 
					size = 
					{
						450 * aspect_ratio_correction, 
						8, 
					}, 
				}, 
				{
					-----------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "Button", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Ok", 
					right_margin = 0, 
					text = "STR_OPTIONS_ADVANCED_OK", 
					top_margin = 5, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					events_sounds = 
					{
						EVENT_CLICK = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_button_click_random1", 
								"Menu_button_click_random2", 
								"Menu_button_click_random3", 
								"Menu_button_click_random4", 
								"Menu_button_click_random5", 
								"Menu_button_click_random6", 
								"Menu_button_click_random7",  
							}, 
						}, 
						EVENT_POINTER_ENTER = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_button_highlighted_random1", 
								"Menu_button_highlighted_random2", 
								"Menu_button_highlighted_random3", 
								"Menu_button_highlighted_random4", 
								"Menu_button_highlighted_random5",    
							}, 
						}, 
					}, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_HIGHLIGHTED = 
						{
							material_preset = "ui_menu_button_01_h", 
						}, 
						MAT_NAME_NORMAL = 
						{
							material_preset = "ui_menu_button_01_e", 
						}, 
						MAT_NAME_PUSHED = 
						{
							material_preset = "ui_menu_button_01_t", 
						}, 
					}, 
					pos = 
					{
						215 * aspect_ratio_correction, 
						520, 
					}, 
					size = 
					{
						186 * aspect_ratio_correction, 
						59, 
					}, 
				}, 
				{
					-----------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "Button", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Cancel", 
					right_margin = 0, 
					text = "STR_OPTIONS_ADVANCED_CANCEL", 
					top_margin = 5, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					events_sounds = 
					{
						EVENT_CLICK = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_button_click_random1", 
								"Menu_button_click_random2", 
								"Menu_button_click_random3", 
								"Menu_button_click_random4", 
								"Menu_button_click_random5", 
								"Menu_button_click_random6", 
								"Menu_button_click_random7",  
							}, 
						}, 
						EVENT_POINTER_ENTER = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_button_highlighted_random1", 
								"Menu_button_highlighted_random2", 
								"Menu_button_highlighted_random3", 
								"Menu_button_highlighted_random4", 
								"Menu_button_highlighted_random5",    
							}, 
						}, 
					}, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_HIGHLIGHTED = 
						{
							material_preset = "ui_menu_button_01_h", 
						}, 
						MAT_NAME_NORMAL = 
						{
							material_preset = "ui_menu_button_01_e", 
						}, 
						MAT_NAME_PUSHED = 
						{
							material_preset = "ui_menu_button_01_t", 
						}, 
					}, 
					pos = 
					{
						395 * aspect_ratio_correction, 
						520, 
					}, 
					size = 
					{
						186 * aspect_ratio_correction, 
						59, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "StaticText", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Tex Quality", 
					right_margin = 0, 
					text = "STR_OPTIONS_ADVANCED_TEX_QUALITY", 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						100 * aspect_ratio_correction, 
						105, 
					}, 
					size = 
					{
						200 * aspect_ratio_correction, 
						25, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "DropDownList", 
					fade_in = 150, 
					fade_out = 150, 
					is_modal = false, 
					left_border_offset = 45 * aspect_ratio_correction, 
					left_margin = 55 * aspect_ratio_correction, 
					max_list_box_height = 0, 
					name = "Tex Quality", 
					offset = 0, 
					right_border_offset = 0, 
					right_margin = 0, 
					text = "", 
					top_margin = 8, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_DISABLED = 
						{
							material_preset = "ui_droplist_d", 
						}, 
						MAT_NAME_HIGHLIGHTED = 
						{
							material_preset = "ui_droplist_h", 
						}, 
						MAT_NAME_NORMAL = 
						{
							material_preset = "ui_droplist_e", 
						}, 
					}, 
					events_sounds = 
					{
						EVENT_CLICK = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_dropdown_click", 
							}, 
						}, 
						EVENT_POINTER_ENTER = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_dropdown_highlighted1", 
							}, 
						}, 
					}, 
					pos = 
					{
						300 * aspect_ratio_correction, 
						95, 
					}, 
					size = 
					{
						190 * aspect_ratio_correction, 
						34, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 4, 
						can_drag = false, 
						can_resize = true, 
						class_name = "ListBox", 
						columns_dw = 4, 
						columns_h = 20, 
						custom_item_height = -1, 
						fade_in = 150, 
						fade_out = 150, 
						is_modal = false, 
						item_icon_size = 16, 
						left_margin = 10, 
						name = "list_box", 
						right_margin = 8, 
						show_columns = false, 
						top_margin = 4, 
						visual_delta_bottom = 5, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 3, 
						fonts = 
						{
						}, 
						items = 
						{
							item_0 = 
							{
								column_0 = "STR_OPTIONS_ADVANCED_TEX_QUALITY_HIGH", 	
							}, 
							item_1 = 
							{	
								column_0 = "STR_OPTIONS_ADVANCED_TEX_QUALITY_MEDIUM", 
							}, 
							item_2 = 
							{
								column_0 = "STR_OPTIONS_ADVANCED_TEX_QUALITY_LOW", 	
							}, 
							item_3 = 
							{	
								column_0 = "STR_OPTIONS_ADVANCED_TEX_QUALITY_VERY_LOW", 
							}, 
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_droplist_listbox", 
							}, 
							MAT_NAME_SELECTION = 
							{
								material_preset = "ui_droplist_listbox_highlighted", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_HIGHLIGHTED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_listbox_highlighted", 
								}, 
							}, 
							EVENT_CHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_listbox1", 
								}, 
							}, 
						}, 
						pos = 
						{
							45 * aspect_ratio_correction, 
							34, 
						}, 
						size = 
						{
							145 * aspect_ratio_correction, 
							72, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = false, 
							can_resize = true, 
							class_name = "ScrollBar", 
							fade_in = 150, 
							fade_out = 150, 
							is_modal = false, 
							left_margin = 0, 
							name = "scroll bar vert", 
							right_margin = 0, 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_NORMAL = 
								{
									material_template = "ui_color", 
									color = 
									{
										a = 50, 
										b = 52, 
										g = 52, 
										r = 52, 
									}, 
									pos = 
									{
										0, 
										0, 
									}, 
									size = 
									{
										1, 
										1, 
									}, 
								}, 
							}, 
							pos = 
							{
								129 * aspect_ratio_correction, 
								0, 
							}, 
							size = 
							{
								16 * aspect_ratio_correction, 
								72, 
							}, 
							{
								-----------------------------------------------------------
								alignment = "ALIGNMENT_NONE", 
								bottom_margin = 0, 
								can_drag = false, 
								can_resize = true, 
								class_name = "Button", 
								fade_in = 150, 
								fade_out = 150, 
								is_modal = false, 
								left_margin = 0, 
								name = "button min", 
								right_margin = 0, 
								text = "", 
								top_margin = 0, 
								visual_delta_bottom = 0, 
								visual_delta_left = 0, 
								visual_delta_right = 0, 
								visual_delta_top = 0, 
								fonts = 
								{
								}, 
								materials = 
								{
									MAT_NAME_HIGHLIGHTED = 
									{
										material_preset = "ui_sys_scroll_button_up_h", 
									}, 
									MAT_NAME_NORMAL = 
									{
										material_preset = "ui_sys_scroll_button_up_e", 
									}, 
									MAT_NAME_PUSHED = 
									{
										material_preset = "ui_sys_scroll_button_up_p", 
									}, 
								}, 
								pos = 
								{
									0, 
									0, 
								}, 
								size = 
								{
									16 * aspect_ratio_correction, 
									16, 
								}, 
							}, 
							{
								-----------------------------------------------------------
								alignment = "ALIGNMENT_NONE", 
								bottom_margin = 0, 
								can_drag = false, 
								can_resize = true, 
								class_name = "Button", 
								fade_in = 150, 
								fade_out = 150, 
								is_modal = false, 
								left_margin = 0, 
								name = "button max", 
								right_margin = 0, 
								text = "", 
								top_margin = 0, 
								visual_delta_bottom = 0, 
								visual_delta_left = 0, 
								visual_delta_right = 0, 
								visual_delta_top = 0, 
								fonts = 
								{
								}, 
								materials = 
								{
									MAT_NAME_HIGHLIGHTED = 
									{
										material_preset = "ui_sys_scroll_button_down_h", 
									}, 
									MAT_NAME_NORMAL = 
									{
										material_preset = "ui_sys_scroll_button_down_e", 
									}, 
									MAT_NAME_PUSHED = 
									{
										material_preset = "ui_sys_scroll_button_down_p", 
									}, 
								}, 
								pos = 
								{
									0, 
									56, 
								}, 
								size = 
								{
									16 * aspect_ratio_correction, 
									16, 
								}, 
							}, 
							{
								-----------------------------------------------------------
								alignment = "ALIGNMENT_NONE", 
								bottom_margin = 0, 
								can_drag = true, 
								can_resize = true, 
								class_name = "Button", 
								fade_in = 150, 
								fade_out = 150, 
								is_modal = false, 
								left_margin = 0, 
								name = "button scroller", 
								right_margin = 0, 
								text = "", 
								top_margin = 0, 
								visual_delta_bottom = 0, 
								visual_delta_left = 0, 
								visual_delta_right = 0, 
								visual_delta_top = 0, 
								fonts = 
								{
								}, 
								materials = 
								{
									MAT_NAME_HIGHLIGHTED = 
									{
										material_preset = "ui_sys_button_scroller_h", 
									}, 
									MAT_NAME_NORMAL = 
									{
										material_preset = "ui_sys_button_scroller_e", 
									}, 
									MAT_NAME_PUSHED = 
									{
										material_preset = "ui_sys_button_scroller_p", 
									}, 
								}, 
								pos = 
								{
									0, 
									16, 
								}, 
								size = 
								{
									16 * aspect_ratio_correction, 
									16, 
								}, 
							}, 
						}, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "StaticText", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Tex Anisotropy", 
					right_margin = 0, 
					text = "STR_OPTIONS_ADVANCED_TEX_ANISOTROPY", 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						100 * aspect_ratio_correction, 
						141, 
					}, 
					size = 
					{
						200 * aspect_ratio_correction, 
						25, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					checker_h = 26, 
					checker_w = 30 * aspect_ratio_correction, 
					class_name = "CheckBox", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Tex Anisotropy", 
					right_margin = 0, 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_CHECKER_OFF = 
						{
							material_preset = "ui_checker_off_e", 
						}, 
						MAT_NAME_CHECKER_ON = 
						{
							material_preset = "ui_checker_on_e", 
						}, 
						MAT_NAME_CHECKER_OFF_DISABLED = 
						{
							material_preset = "ui_checker_off_d", 
						}, 
						MAT_NAME_CHECKER_ON_DISABLED = 
						{
							material_preset = "ui_checker_on_d", 
						}, 
					}, 
					events_sounds = 
					{
						EVENT_CHECKED = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_checkbox_checked", 
							}, 
						}, 
						EVENT_UNCHECKED = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_checkbox_unchecked", 
							}, 
						}, 
					}, 
					pos = 
					{
						305 * aspect_ratio_correction, 
						136, 
					}, 
					size = 
					{
						30 * aspect_ratio_correction, 
						26, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "StaticText", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "MSAA", 
					right_margin = 0, 
					text = "STR_OPTIONS_ADVANCED_MSAA", 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						100 * aspect_ratio_correction, 
						177, 
					}, 
					size = 
					{
						200 * aspect_ratio_correction, 
						25, 
					}, 
				},
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "DropDownList", 
					fade_in = 150, 
					fade_out = 150, 
					is_modal = false, 
					left_border_offset = 45 * aspect_ratio_correction, 
					left_margin = 55 * aspect_ratio_correction, 
					max_list_box_height = 0, 
					name = "MSAA", 
					offset = 0, 
					right_border_offset = 0, 
					right_margin = 0, 
					text = "", 
					top_margin = 8, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_DISABLED = 
						{
							material_preset = "ui_droplist_d", 
						}, 
						MAT_NAME_HIGHLIGHTED = 
						{
							material_preset = "ui_droplist_h", 
						}, 
						MAT_NAME_NORMAL = 
						{
							material_preset = "ui_droplist_e", 
						}, 
					}, 
					events_sounds = 
					{
						EVENT_CLICK = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_dropdown_click", 
							}, 
						}, 
						EVENT_POINTER_ENTER = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_dropdown_highlighted1", 
							}, 
						}, 
					}, 
					pos = 
					{
						300 * aspect_ratio_correction, 
						167, 
					}, 
					size = 
					{
						190 * aspect_ratio_correction, 
						34, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 4, 
						can_drag = false, 
						can_resize = true, 
						class_name = "ListBox", 
						columns_dw = 4, 
						columns_h = 20, 
						custom_item_height = -1, 
						fade_in = 150, 
						fade_out = 150, 
						is_modal = false, 
						item_icon_size = 16, 
						left_margin = 10, 
						name = "list_box", 
						right_margin = 8, 
						show_columns = false, 
						top_margin = 4, 
						visual_delta_bottom = 5, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 3, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_droplist_listbox", 
							}, 
							MAT_NAME_SELECTION = 
							{
								material_preset = "ui_droplist_listbox_highlighted", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_HIGHLIGHTED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_listbox_highlighted", 
								}, 
							}, 
							EVENT_CHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_listbox1", 
								}, 
							}, 
						}, 
						pos = 
						{
							45 * aspect_ratio_correction, 
							34, 
						}, 
						size = 
						{
							145 * aspect_ratio_correction, 
							40, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = false, 
							can_resize = true, 
							class_name = "ScrollBar", 
							fade_in = 150, 
							fade_out = 150, 
							is_modal = false, 
							left_margin = 0, 
							name = "scroll bar vert", 
							right_margin = 0, 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_NORMAL = 
								{
									material_template = "ui_color", 
									color = 
									{
										a = 50, 
										b = 52, 
										g = 52, 
										r = 52, 
									}, 
									pos = 
									{
										0, 
										0, 
									}, 
									size = 
									{
										1, 
										1, 
									}, 
								}, 
							}, 
							pos = 
							{
								129 * aspect_ratio_correction, 
								0, 
							}, 
							size = 
							{
								16 * aspect_ratio_correction, 
								40, 
							}, 
							{
								-----------------------------------------------------------
								alignment = "ALIGNMENT_NONE", 
								bottom_margin = 0, 
								can_drag = false, 
								can_resize = true, 
								class_name = "Button", 
								fade_in = 150, 
								fade_out = 150, 
								is_modal = false, 
								left_margin = 0, 
								name = "button min", 
								right_margin = 0, 
								text = "", 
								top_margin = 0, 
								visual_delta_bottom = 0, 
								visual_delta_left = 0, 
								visual_delta_right = 0, 
								visual_delta_top = 0, 
								fonts = 
								{
								}, 
								materials = 
								{
									MAT_NAME_HIGHLIGHTED = 
									{
										material_preset = "ui_sys_scroll_button_up_h", 
									}, 
									MAT_NAME_NORMAL = 
									{
										material_preset = "ui_sys_scroll_button_up_e", 
									}, 
									MAT_NAME_PUSHED = 
									{
										material_preset = "ui_sys_scroll_button_up_p", 
									}, 
								}, 
								pos = 
								{
									0, 
									0, 
								}, 
								size = 
								{
									16 * aspect_ratio_correction, 
									16, 
								}, 
							}, 
							{
								-----------------------------------------------------------
								alignment = "ALIGNMENT_NONE", 
								bottom_margin = 0, 
								can_drag = false, 
								can_resize = true, 
								class_name = "Button", 
								fade_in = 150, 
								fade_out = 150, 
								is_modal = false, 
								left_margin = 0, 
								name = "button max", 
								right_margin = 0, 
								text = "", 
								top_margin = 0, 
								visual_delta_bottom = 0, 
								visual_delta_left = 0, 
								visual_delta_right = 0, 
								visual_delta_top = 0, 
								fonts = 
								{
								}, 
								materials = 
								{
									MAT_NAME_HIGHLIGHTED = 
									{
										material_preset = "ui_sys_scroll_button_down_h", 
									}, 
									MAT_NAME_NORMAL = 
									{
										material_preset = "ui_sys_scroll_button_down_e", 
									}, 
									MAT_NAME_PUSHED = 
									{
										material_preset = "ui_sys_scroll_button_down_p", 
									}, 
								}, 
								pos = 
								{
									0, 
									24, 
								}, 
								size = 
								{
									16 * aspect_ratio_correction, 
									16, 
								}, 
							}, 
							{
								-----------------------------------------------------------
								alignment = "ALIGNMENT_NONE", 
								bottom_margin = 0, 
								can_drag = true, 
								can_resize = true, 
								class_name = "Button", 
								fade_in = 150, 
								fade_out = 150, 
								is_modal = false, 
								left_margin = 0, 
								name = "button scroller", 
								right_margin = 0, 
								text = "", 
								top_margin = 0, 
								visual_delta_bottom = 0, 
								visual_delta_left = 0, 
								visual_delta_right = 0, 
								visual_delta_top = 0, 
								fonts = 
								{
								}, 
								materials = 
								{
									MAT_NAME_HIGHLIGHTED = 
									{
										material_preset = "ui_sys_button_scroller_h", 
									}, 
									MAT_NAME_NORMAL = 
									{
										material_preset = "ui_sys_button_scroller_e", 
									}, 
									MAT_NAME_PUSHED = 
									{
										material_preset = "ui_sys_button_scroller_p", 
									}, 
								}, 
								pos = 
								{
									0, 
									16, 
								}, 
								size = 
								{
									16 * aspect_ratio_correction, 
									16, 
								}, 
							}, 
						}, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "DropDownList", 
					fade_in = 150, 
					fade_out = 150, 
					is_modal = false, 
					left_border_offset = 45 * aspect_ratio_correction, 
					left_margin = 55 * aspect_ratio_correction, 
					max_list_box_height = 0, 
					name = "Tex Filtering", 
					offset = 0, 
					right_border_offset = 0, 
					right_margin = 0, 
					text = "", 
					top_margin = 8, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_DISABLED = 
						{
							material_preset = "ui_droplist_d", 
						}, 
						MAT_NAME_HIGHLIGHTED = 
						{
							material_preset = "ui_droplist_h", 
						}, 
						MAT_NAME_NORMAL = 
						{
							material_preset = "ui_droplist_e", 
						}, 
					}, 
					events_sounds = 
					{
						EVENT_CLICK = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_dropdown_click", 
							}, 
						}, 
						EVENT_POINTER_ENTER = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_dropdown_highlighted1", 
							}, 
						}, 
					}, 
					pos = 
					{
						300 * aspect_ratio_correction, 
						800, 
					}, 
					size = 
					{
						0, 
						0, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 4, 
						can_drag = false, 
						can_resize = true, 
						class_name = "ListBox", 
						columns_dw = 4, 
						columns_h = 20, 
						custom_item_height = -1, 
						fade_in = 150, 
						fade_out = 150, 
						is_modal = false, 
						item_icon_size = 16, 
						left_margin = 10, 
						name = "list_box", 
						right_margin = 8, 
						show_columns = false, 
						top_margin = 4, 
						visual_delta_bottom = 5, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 3, 
						fonts = 
						{
						}, 
						items = 
						{
							item_0 = 
							{
								column_0 = "STR_OPTIONS_ADVANCED_TEX_FILTERING_BI", 
							}, 
							item_1 = 
							{
								column_0 = "STR_OPTIONS_ADVANCED_TEX_FILTERING_TRI", 
							}, 
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_droplist_listbox", 
							}, 
							MAT_NAME_SELECTION = 
							{
								material_preset = "ui_droplist_listbox_highlighted", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_HIGHLIGHTED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_listbox_highlighted", 
								}, 
							}, 
							EVENT_CHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_listbox1", 
								}, 
							}, 
						}, 
						pos = 
						{
							45 * aspect_ratio_correction, 
							34, 
						}, 
						size = 
						{
							145 * aspect_ratio_correction, 
							40, 
						}, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "StaticText", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Detail Textures", 
					right_margin = 0, 
					text = "STR_OPTIONS_ADVANCED_DETAIL_TEXTURES", 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						100 * aspect_ratio_correction, 
						213, 
					}, 
					size = 
					{
						200 * aspect_ratio_correction, 
						25, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					checker_h = 26, 
					checker_w = 30 * aspect_ratio_correction, 
					class_name = "CheckBox", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Detail Textures", 
					right_margin = 0, 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_CHECKER_OFF = 
						{
							material_preset = "ui_checker_off_e", 
						}, 
						MAT_NAME_CHECKER_ON = 
						{
							material_preset = "ui_checker_on_e", 
						}, 
						MAT_NAME_CHECKER_OFF_DISABLED = 
						{
							material_preset = "ui_checker_off_d", 
						}, 
						MAT_NAME_CHECKER_ON_DISABLED = 
						{
							material_preset = "ui_checker_on_d", 
						}, 
					}, 
					events_sounds = 
					{
						EVENT_CHECKED = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_checkbox_checked", 
							}, 
						}, 
						EVENT_UNCHECKED = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_checkbox_unchecked", 
							}, 
						}, 
					}, 
					pos = 
					{
						305 * aspect_ratio_correction, 
						208, 
					}, 
					size = 
					{
						30 * aspect_ratio_correction, 
						26, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "StaticText", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Dynamic Shadows", 
					right_margin = 0, 
					text = "STR_OPTIONS_ADVANCED_DYNAMIC_SHADOWS", 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						100 * aspect_ratio_correction, 
						249, 
					}, 
					size = 
					{
						200 * aspect_ratio_correction, 
						25, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					checker_h = 26, 
					checker_w = 30 * aspect_ratio_correction, 
					class_name = "CheckBox", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Dynamic Shadows", 
					right_margin = 0, 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_CHECKER_OFF = 
						{
							material_preset = "ui_checker_off_e", 
						}, 
						MAT_NAME_CHECKER_ON = 
						{
							material_preset = "ui_checker_on_e", 
						}, 
						MAT_NAME_CHECKER_OFF_DISABLED = 
						{
							material_preset = "ui_checker_off_d", 
						}, 
						MAT_NAME_CHECKER_ON_DISABLED = 
						{
							material_preset = "ui_checker_on_d", 
						}, 
					}, 
					events_sounds = 
					{
						EVENT_CHECKED = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_checkbox_checked", 
							}, 
						}, 
						EVENT_UNCHECKED = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_checkbox_unchecked", 
							}, 
						}, 
					}, 
					pos = 
					{
						305 * aspect_ratio_correction, 
						244, 
					}, 
					size = 
					{
						30 * aspect_ratio_correction, 
						26, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "StaticText", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Dynamic Shadows Quality", 
					right_margin = 0, 
					text = "STR_OPTIONS_ADVANCED_SHADOWS_QUALITY", 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						100 * aspect_ratio_correction, 
						285, 
					}, 
					size = 
					{
						200 * aspect_ratio_correction, 
						25, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "DropDownList", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_border_offset = 45 * aspect_ratio_correction, 
					left_margin = 55 * aspect_ratio_correction, 
					max_list_box_height = 0, 
					name = "Dynamic Shadows Quality", 
					offset = 0, 
					right_border_offset = 0, 
					right_margin = 0, 
					text = "", 
					top_margin = 8, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_DISABLED = 
						{
							material_preset = "ui_droplist_d", 
						}, 
						MAT_NAME_HIGHLIGHTED = 
						{
							material_preset = "ui_droplist_h", 
						}, 
						MAT_NAME_NORMAL = 
						{
							material_preset = "ui_droplist_e", 
						}, 
					}, 
					events_sounds = 
					{
						EVENT_CLICK = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_dropdown_click", 
							}, 
						}, 
						EVENT_POINTER_ENTER = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_dropdown_highlighted1", 
							}, 
						}, 
					}, 
					pos = 
					{
						300 * aspect_ratio_correction, 
						275, 
					}, 
					size = 
					{
						190 * aspect_ratio_correction, 
						34, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 4, 
						can_drag = false, 
						can_resize = true, 
						class_name = "ListBox", 
						columns_dw = 4, 
						columns_h = 20, 
						custom_item_height = -1, 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						item_icon_size = 16, 
						left_margin = 10, 
						name = "list_box", 
						right_margin = 8, 
						show_columns = false, 
						top_margin = 4, 
						visual_delta_bottom = 5, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 3, 
						fonts = 
						{
						}, 
						items = 
						{
							item_0 = 
							{
								column_0 = "STR_OPTIONS_ADVANCED_SHADOWS_QUALITY_VERY_LOW",
							}, 
							item_1 = 
							{	
								column_0 = "STR_OPTIONS_ADVANCED_SHADOWS_QUALITY_LOW",
							}, 
							item_2 = 
							{
								column_0 = "STR_OPTIONS_ADVANCED_SHADOWS_QUALITY_MEDIUM",  	
							}, 
							item_3 = 
							{	
								column_0 = "STR_OPTIONS_ADVANCED_SHADOWS_QUALITY_HIGH", 
							}, 
						}, 
						materials = 
						{
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_droplist_listbox", 
							}, 
							MAT_NAME_SELECTION = 
							{
								material_preset = "ui_droplist_listbox_highlighted", 
							}, 
						}, 
						events_sounds = 
						{
							EVENT_HIGHLIGHTED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_listbox_highlighted", 
								}, 
							}, 
							EVENT_CHECKED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_listbox1", 
								}, 
							}, 
						}, 
						pos = 
						{
							45 * aspect_ratio_correction, 
							34, 
						}, 
						size = 
						{
							145 * aspect_ratio_correction, 
							8, 
						}, 
						{
							--------------------------------------------------------------
							alignment = "ALIGNMENT_NONE", 
							bottom_margin = 0, 
							can_drag = false, 
							can_resize = true, 
							class_name = "ScrollBar", 
							fade_in = 100, 
							fade_out = 100, 
							is_modal = false, 
							left_margin = 0, 
							name = "scroll bar vert", 
							right_margin = 0, 
							top_margin = 0, 
							visual_delta_bottom = 0, 
							visual_delta_left = 0, 
							visual_delta_right = 0, 
							visual_delta_top = 0, 
							fonts = 
							{
							}, 
							materials = 
							{
								MAT_NAME_NORMAL = 
								{
									material_template = "ui_color", 
									color = 
									{
										a = 50, 
										b = 52, 
										g = 52, 
										r = 52, 
									}, 
									pos = 
									{
										0, 
										0, 
									}, 
									size = 
									{
										1, 
										1, 
									}, 
								}, 
								MAT_NAME_SELECTION = 
								{
									material_template = "ui_color", 
									color = 
									{
										a = 100, 
										b = 100, 
										g = 100, 
										r = 100, 
									}, 
									pos = 
									{
										0, 
										0, 
									}, 
									size = 
									{
										1, 
										1, 
									}, 
								}, 
							}, 
							pos = 
							{
								129 * aspect_ratio_correction, 
								0, 
							}, 
							size = 
							{
								16 * aspect_ratio_correction, 
								8, 
							}, 
							{
								-----------------------------------------------------------
								alignment = "ALIGNMENT_NONE", 
								bottom_margin = 0, 
								can_drag = false, 
								can_resize = true, 
								class_name = "Button", 
								fade_in = 100, 
								fade_out = 100, 
								is_modal = false, 
								left_margin = 0, 
								name = "button min", 
								right_margin = 0, 
								text = "", 
								top_margin = 0, 
								visual_delta_bottom = 0, 
								visual_delta_left = 0, 
								visual_delta_right = 0, 
								visual_delta_top = 0, 
								fonts = 
								{
								}, 
								materials = 
								{
									MAT_NAME_HIGHLIGHTED = 
									{
										material_preset = "ui_sys_scroll_button_up_h", 
									}, 
									MAT_NAME_NORMAL = 
									{
										material_preset = "ui_sys_scroll_button_up_e", 
									}, 
									MAT_NAME_PUSHED = 
									{
										material_preset = "ui_sys_scroll_button_up_p", 
									}, 
								}, 
								pos = 
								{
									0, 
									0, 
								}, 
								size = 
								{
									16 * aspect_ratio_correction, 
									16, 
								}, 
							}, 
							{
								-----------------------------------------------------------
								alignment = "ALIGNMENT_NONE", 
								bottom_margin = 0, 
								can_drag = false, 
								can_resize = true, 
								class_name = "Button", 
								fade_in = 100, 
								fade_out = 100, 
								is_modal = false, 
								left_margin = 0, 
								name = "button max", 
								right_margin = 0, 
								text = "", 
								top_margin = 0, 
								visual_delta_bottom = 0, 
								visual_delta_left = 0, 
								visual_delta_right = 0, 
								visual_delta_top = 0, 
								fonts = 
								{
								}, 
								materials = 
								{
									MAT_NAME_HIGHLIGHTED = 
									{
										material_preset = "ui_sys_scroll_button_down_h", 
									}, 
									MAT_NAME_NORMAL = 
									{
										material_preset = "ui_sys_scroll_button_down_e", 
									}, 
									MAT_NAME_PUSHED = 
									{
										material_preset = "ui_sys_scroll_button_down_p", 
									}, 
								}, 
								pos = 
								{
									0, 
									-8, 
								}, 
								size = 
								{
									16 * aspect_ratio_correction, 
									16, 
								}, 
							}, 
							{
								-----------------------------------------------------------
								alignment = "ALIGNMENT_NONE", 
								bottom_margin = 0, 
								can_drag = true, 
								can_resize = true, 
								class_name = "Button", 
								fade_in = 100, 
								fade_out = 100, 
								is_modal = false, 
								left_margin = 0, 
								name = "button scroller", 
								right_margin = 0, 
								text = "", 
								top_margin = 0, 
								visual_delta_bottom = 0, 
								visual_delta_left = 0, 
								visual_delta_right = 0, 
								visual_delta_top = 0, 
								fonts = 
								{
								}, 
								materials = 
								{
									MAT_NAME_HIGHLIGHTED = 
									{
										material_preset = "ui_sys_button_scroller_h", 
									}, 
									MAT_NAME_NORMAL = 
									{
										material_preset = "ui_sys_button_scroller_e", 
									}, 
									MAT_NAME_PUSHED = 
									{
										material_preset = "ui_sys_button_scroller_p", 
									}, 
								}, 
								pos = 
								{
									0, 
									16, 
								}, 
								size = 
								{
									16 * aspect_ratio_correction, 
									16, 
								}, 
							}, 
						}, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "StaticText", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Dynamic Shadows Blur", 
					right_margin = 0, 
					text = "STR_OPTIONS_ADVANCED_SHADOWS_BLUR", 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						100 * aspect_ratio_correction, 
						321, 
					}, 
					size = 
					{
						200 * aspect_ratio_correction, 
						25, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					checker_h = 26, 
					checker_w = 30 * aspect_ratio_correction, 
					class_name = "CheckBox", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Dynamic Shadows Blur", 
					right_margin = 0, 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_CHECKER_OFF = 
						{
							material_preset = "ui_checker_off_e", 
						}, 
						MAT_NAME_CHECKER_ON = 
						{
							material_preset = "ui_checker_on_e", 
						}, 
						MAT_NAME_CHECKER_OFF_DISABLED = 
						{
							material_preset = "ui_checker_off_d", 
						}, 
						MAT_NAME_CHECKER_ON_DISABLED = 
						{
							material_preset = "ui_checker_on_d", 
						}, 
					}, 
					events_sounds = 
					{
						EVENT_CHECKED = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_checkbox_checked", 
							}, 
						}, 
						EVENT_UNCHECKED = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_checkbox_unchecked", 
							}, 
						}, 
					}, 
					pos = 
					{
						305 * aspect_ratio_correction, 
						316, 
					}, 
					size = 
					{
						30 * aspect_ratio_correction, 
						26, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "StaticText", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Decals On Static", 
					right_margin = 0, 
					text = "STR_OPTIONS_ADVANCED_DECALS_ON_STATIC", 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						100 * aspect_ratio_correction, 
						357, 
					}, 
					size = 
					{
						200 * aspect_ratio_correction, 
						25, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					checker_h = 26, 
					checker_w = 30 * aspect_ratio_correction, 
					class_name = "CheckBox", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Decals On Static", 
					right_margin = 0, 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_CHECKER_OFF = 
						{
							material_preset = "ui_checker_off_e", 
						}, 
						MAT_NAME_CHECKER_ON = 
						{
							material_preset = "ui_checker_on_e", 
						}, 
						MAT_NAME_CHECKER_OFF_DISABLED = 
						{
							material_preset = "ui_checker_off_d", 
						}, 
						MAT_NAME_CHECKER_ON_DISABLED = 
						{
							material_preset = "ui_checker_on_d", 
						}, 
					}, 
					events_sounds = 
					{
						EVENT_CHECKED = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_checkbox_checked", 
							}, 
						}, 
						EVENT_UNCHECKED = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_checkbox_unchecked", 
							}, 
						}, 
					}, 
					pos = 
					{
						305 * aspect_ratio_correction, 
						352, 
					}, 
					size = 
					{
						30 * aspect_ratio_correction, 
						26, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "StaticText", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Decals On Dynamic", 
					right_margin = 0, 
					text = "STR_OPTIONS_ADVANCED_DECALS_ON_DYNAMIC", 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						100 * aspect_ratio_correction, 
						393, 
					}, 
					size = 
					{
						200 * aspect_ratio_correction, 
						25, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					checker_h = 26, 
					checker_w = 30 * aspect_ratio_correction, 
					class_name = "CheckBox", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Decals On Dynamic", 
					right_margin = 0, 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_CHECKER_OFF = 
						{
							material_preset = "ui_checker_off_e", 
						}, 
						MAT_NAME_CHECKER_ON = 
						{
							material_preset = "ui_checker_on_e", 
						}, 
						MAT_NAME_CHECKER_OFF_DISABLED = 
						{
							material_preset = "ui_checker_off_d", 
						}, 
						MAT_NAME_CHECKER_ON_DISABLED = 
						{
							material_preset = "ui_checker_on_d", 
						}, 
					}, 
					events_sounds = 
					{
						EVENT_CHECKED = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_checkbox_checked", 
							}, 
						}, 
						EVENT_UNCHECKED = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_checkbox_unchecked", 
							}, 
						}, 
					}, 
					pos = 
					{
						305 * aspect_ratio_correction, 
						388, 
					}, 
					size = 
					{
						30 * aspect_ratio_correction, 
						26, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "StaticText", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Decals Lifetime", 
					right_margin = 0, 
					text = "STR_OPTIONS_ADVANCED_DECALS_LIFETIME", 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						100 * aspect_ratio_correction, 
						429, 
					}, 
					size = 
					{
						200 * aspect_ratio_correction, 
						25, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "ScrollBar", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Decals Lifetime", 
					right_margin = 0, 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
							material_preset = "ui_slider_back_e", 
						}, 
					}, 
					events_sounds = 
						{
							EVENT_CHANGED = 
							{
								volume = 0, 
								file_names = 
								{
									"Menu_scroller1", 
									"Menu_scroller2", 
									"Menu_scroller3", 
									"Menu_scroller4", 
									"Menu_scroller5", 
									"Menu_scroller6", 
									"Menu_scroller7", 
									"Menu_scroller8", 
								}, 
							}, 
						}, 
					pos = 
					{
						305 * aspect_ratio_correction, 
						419, 
					}, 
					size = 
					{
						180 * aspect_ratio_correction, 
						32, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "Button", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "button min", 
						right_margin = 0, 
						text = "", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_HIGHLIGHTED = 
							{
								material_preset = "ui_sys_scroll_button_up_h", 
							}, 
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_slider_left", 
							}, 
							MAT_NAME_PUSHED = 
							{
								material_preset = "ui_sys_scroll_button_up_p", 
							}, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							15 * aspect_ratio_correction, 
							32, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = false, 
						can_resize = true, 
						class_name = "Button", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "button max", 
						right_margin = 0, 
						text = "", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_HIGHLIGHTED = 
							{
								material_preset = "ui_sys_scroll_button_down_h", 
							}, 
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_slider_right", 
							}, 
							MAT_NAME_PUSHED = 
							{
								material_preset = "ui_sys_scroll_button_down_p", 
							}, 
						}, 
						pos = 
						{
							165 * aspect_ratio_correction, 
							0, 
						}, 
						size = 
						{
							15 * aspect_ratio_correction, 
							32, 
						}, 
					}, 
					{
						-----------------------------------------------------------------
						alignment = "ALIGNMENT_NONE", 
						bottom_margin = 0, 
						can_drag = true, 
						can_resize = true, 
						class_name = "Button", 
						fade_in = 100, 
						fade_out = 100, 
						is_modal = false, 
						left_margin = 0, 
						name = "button scroller", 
						right_margin = 0, 
						text = "", 
						top_margin = 0, 
						visual_delta_bottom = 0, 
						visual_delta_left = 0, 
						visual_delta_right = 0, 
						visual_delta_top = 0, 
						fonts = 
						{
						}, 
						materials = 
						{
							MAT_NAME_HIGHLIGHTED = 
							{
								material_preset = "ui_slider_button_h", 
							}, 
							MAT_NAME_NORMAL = 
							{
								material_preset = "ui_slider_button_e", 
							}, 
							MAT_NAME_PUSHED = 
							{
								material_preset = "ui_slider_button_t", 
							}, 
						}, 
						pos = 
						{
							38 * aspect_ratio_correction, 
							0, 
						}, 
						size = 
						{
							32 * aspect_ratio_correction, 
							32, 
						}, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					class_name = "StaticText", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Render Detail Objects", 
					right_margin = 0, 
					text = "STR_OPTIONS_ADVANCED_RENDER_DETAIL_OBJECTS", 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						100 * aspect_ratio_correction, 
						465, 
					}, 
					size = 
					{
						200 * aspect_ratio_correction, 
						25, 
					}, 
				}, 
				{
					--------------------------------------------------------------------
					alignment = "ALIGNMENT_NONE", 
					bottom_margin = 0, 
					can_drag = false, 
					can_resize = true, 
					checker_h = 26, 
					checker_w = 30 * aspect_ratio_correction, 
					class_name = "CheckBox", 
					fade_in = 100, 
					fade_out = 100, 
					is_modal = false, 
					left_margin = 0, 
					name = "Render Detail Objects", 
					right_margin = 0, 
					top_margin = 0, 
					visual_delta_bottom = 0, 
					visual_delta_left = 0, 
					visual_delta_right = 0, 
					visual_delta_top = 0, 
					fonts = 
					{
					}, 
					materials = 
					{
						MAT_NAME_CHECKER_OFF = 
						{
							material_preset = "ui_checker_off_e", 
						}, 
						MAT_NAME_CHECKER_ON = 
						{
							material_preset = "ui_checker_on_e", 
						}, 
						MAT_NAME_CHECKER_OFF_DISABLED = 
						{
							material_preset = "ui_checker_off_d", 
						}, 
						MAT_NAME_CHECKER_ON_DISABLED = 
						{
							material_preset = "ui_checker_on_d", 
						}, 
					}, 
					events_sounds = 
					{
						EVENT_CHECKED = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_checkbox_checked", 
							}, 
						}, 
						EVENT_UNCHECKED = 
						{
							volume = 0, 
							file_names = 
							{
								"Menu_checkbox_unchecked", 
							}, 
						}, 
					}, 
					pos = 
					{
						305 * aspect_ratio_correction, 
						460, 
					}, 
					size = 
					{
						30 * aspect_ratio_correction, 
						26, 
					}, 
				}, 
			}, 
		}, 
		{
			--------------------------------------------------------------------------
			alignment = "ALIGNMENT_CLIENT", 
			bottom_margin = 0, 
			button_h = 32, 
			button_w = 128 * aspect_ratio_correction, 
			buttons_horizontal = true, 
			buttons_interval = 8, 
			can_drag = false, 
			can_resize = true, 
			caption = "", 
			caption_alignment = "ALIGNMENT_LEFT", 
			caption_h = 24, 
			class_name = "CreditsWindow", 
			fade_in = 150, 
			fade_out = 150, 
			is_modal = false, 
			left_margin = 0, 
			name = "credits", 
			right_margin = 0, 
			top_margin = 0, 
			visual_delta_bottom = 0, 
			visual_delta_left = 0, 
			visual_delta_right = 0, 
			visual_delta_top = 0, 
			fonts = 
			{
			}, 
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					material_template = "ui_color", 
					color = 
					{
						a = 255, 
						b = 0, 
						g = 0, 
						r = 0, 
					}, 				
				}, 
			},  
			pos = 
			{
				0, 
				0, 
			}, 
			size = 
			{
				0, 
				0, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border left", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_LEFT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					8, 
					0, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border right", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_RIGHT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					-8, 
					0, 
				}, 
				size = 
				{
					8, 
					0, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border top", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_TOP", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					0, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border bottom", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_BOTTOM", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					-8, 
				}, 
				size = 
				{
					0, 
					8, 
				}, 
			}, 
		},
		{
			--------------------------------------------------------------------------
			alignment = "ALIGNMENT_NONE", 
			bottom_margin = 16, 
			button_h = 32, 
			button_w = 128 * aspect_ratio_correction, 
			buttons_horizontal = false, 
			buttons_interval = 8, 
			can_drag = false, 
			can_resize = false, 
			caption = "", 
			caption_alignment = "ALIGNMENT_CENTER", 
			caption_h = 600, 
			class_name = "Loading", 
			fade_in = 0, 
			fade_out = 0, 
			is_modal = false, 
			left_margin = 8, 
			name = "game_loading", 
			right_margin = 8, 
			top_margin = 8, 
			visual_delta_bottom = 0, 
			visual_delta_left = 0, 
			visual_delta_right = 0, 
			visual_delta_top = 0, 
			fonts = 
			{
				FNT_NAME_DEFAULT = "rodchenko", 
			}, 
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					diffuse_texture = "FrodoFabrika", 
					material_template = "ui_image", 
					color = 
					{
						a = 255, 
						b = 255, 
						g = 255, 
						r = 255, 
					}, 
					pos = 
					{
						768 / (math.min(aspect_ratio_correction, 1.0) - 768) / 2, 
						0, 
					}, 
					size = 
					{
						1, 
						1, 
					}, 
				}, 
			}, 
			pos = 
			{
				0, 
				0, 
			}, 
			size = 
			{
				1024, 
				768 / math.min(aspect_ratio_correction, 1.0), 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "border left", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_LEFT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					8, 
					768, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "border top", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_TOP", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					1024, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "ProgressBar", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "loading progress bar", 
				right_margin = 0, 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
						material_template = "ui_color", 
						color = 
						{
							a = 50, 
							b = 52, 
							g = 52, 
							r = 52, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							1, 
						}, 
					}, 
					MAT_NAME_PROGRESS = 
					{
						material_template = "ui_color", 
						color = 
						{
							a = 200, 
							b = 252, 
							g = 252, 
							r = 252, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							1, 
						}, 
					}, 
				}, 
				pos = 
				{
					16, 
					718, 
				}, 
				size = 
				{
					992, 
					16, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "StaticText", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "loading percents", 
				right_margin = 0, 
				text = "100%", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					955, 
					698, 
				}, 
				size = 
				{
					100, 
					16, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "border right", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_RIGHT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					1016, 
					0, 
				}, 
				size = 
				{
					8, 
					768, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "border bottom", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_BOTTOM", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					760, 
				}, 
				size = 
				{
					1024, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "StaticText", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "loading description", 
				right_margin = 0, 
				text = "", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					16, 
					698, 
				}, 
				size = 
				{
					992, 
					16, 
				}, 
			}, 
		}, 
		{
			--------------------------------------------------------------------------
			alignment = "ALIGNMENT_CENTER", 
			bottom_margin = 0, 
			can_drag = false, 
			can_resize = true, 
			class_name = "GameMenu", 
			fade_in = 100, 
			fade_out = 100, 
			is_modal = true, 
			left_margin = 0, 
			name = "game_menu", 
			right_margin = 0, 
			top_margin = 0, 
			visual_delta_bottom = 0, 
			visual_delta_left = 0, 
			visual_delta_right = 0, 
			visual_delta_top = 0, 
			fonts = 
			{
			}, 
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					material_preset = "ui_game_menu", 
				}, 
			}, 
			pos = 
			{
				313, 
				211, 
			}, 
			size = 
			{
				399 * aspect_ratio_correction, 
				345, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Quit To OS", 
				right_margin = 0, 
				text = "STR_GAME_MENU_QUIT_TO_OS", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_button_06_h", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_button_06_t", 
					}, 
				}, 
				pos = 
				{
					77 * aspect_ratio_correction, 
					245, 
				}, 
				size = 
				{
					246 * aspect_ratio_correction, 
					31, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Save Game", 
				right_margin = 0, 
				text = "STR_GAME_MENU_SAVE_GAME", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_button_01_h", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_button_01_t", 
					}, 
				}, 
				pos = 
				{
					77 * aspect_ratio_correction, 
					21, 
				}, 
				size = 
				{
					246 * aspect_ratio_correction, 
					31, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Load Game", 
				right_margin = 0, 
				text = "STR_DEATH_MENU_LOAD_GAME", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_button_02_h", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_button_02_t", 
					}, 
				}, 
				pos = 
				{
					77 * aspect_ratio_correction, 
					67, 
				}, 
				size = 
				{
					246 * aspect_ratio_correction, 
					31, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Options", 
				right_margin = 0, 
				text = "STR_GAME_MENU_OPTIONS", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_button_03_h", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_button_03_t", 
					}, 
				}, 
				pos = 
				{
					77 * aspect_ratio_correction, 
					111, 
				}, 
				size = 
				{
					246 * aspect_ratio_correction, 
					31, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Return To Game", 
				right_margin = 0, 
				text = "STR_GAME_MENU_RETURN_TO_GAME", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_button_04_h", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_button_04_t", 
					}, 
				}, 
				pos = 
				{
					77 * aspect_ratio_correction, 
					155, 
				}, 
				size = 
				{
					246 * aspect_ratio_correction, 
					31, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 100, 
				fade_out = 100, 
				is_modal = false, 
				left_margin = 0, 
				name = "Quit Game", 
				right_margin = 0, 
				text = "STR_DEATH_MENU_QUIT_GAME", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_button_05_h", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_button_05_t", 
					}, 
				}, 
				pos = 
				{
					77 * aspect_ratio_correction, 
					200, 
				}, 
				size = 
				{
					246 * aspect_ratio_correction, 
					31, 
				}, 
			}, 
		}, 
		{
			--------------------------------------------------------------------------
			alignment = "ALIGNMENT_CENTER", 
			bottom_margin = 0, 
			can_drag = false, 
			can_resize = true, 
			class_name = "DeathMenu", 
			fade_in = 150, 
			fade_out = 150, 
			is_modal = true, 
			left_margin = 0, 
			name = "death_menu", 
			right_margin = 0, 
			top_margin = 0, 
			visual_delta_bottom = 0, 
			visual_delta_left = 0, 
			visual_delta_right = 0, 
			visual_delta_top = 0, 
			fonts = 
			{
			}, 
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					material_preset = "ui_game_menu", 
				}, 
			}, 
			pos = 
			{
				313, 
				211, 
			}, 
			size = 
			{
				399 * aspect_ratio_correction, 
				345, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "Load Last Game", 
				right_margin = 0, 
				text = "STR_DEATH_MENU_LOAD_LAST_GAME", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_button_02_h", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_button_02_t", 
					}, 
				}, 
				pos = 
				{
					77 * aspect_ratio_correction, 
					67, 
				}, 
				size = 
				{
					246 * aspect_ratio_correction, 
					31, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "Load Game", 
				right_margin = 0, 
				text = "STR_DEATH_MENU_LOAD_GAME", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_button_03_h", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_button_03_t", 
					}, 
				}, 
				pos = 
				{
					77 * aspect_ratio_correction, 
					111, 
				}, 
				size = 
				{
					246 * aspect_ratio_correction, 
					31, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "Quit Game", 
				right_margin = 0, 
				text = "STR_DEATH_MENU_QUIT_GAME", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_button_04_h", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_button_04_t", 
					}, 
				}, 
				pos = 
				{
					77 * aspect_ratio_correction, 
					155, 
				}, 
				size = 
				{
					246 * aspect_ratio_correction, 
					31, 
				}, 
			}, 
		}, 
		{
			--------------------------------------------------------------------------
			alignment = "ALIGNMENT_CENTER", 
			bottom_margin = -30, 
			button_h = 59, 
			button_w = 186 * aspect_ratio_correction, 
			buttons_horizontal = true, 
			buttons_interval = -5, 
			can_drag = false, 
			can_resize = false, 
			caption = "", 
			caption_alignment = "ALIGNMENT_LEFT", 
			caption_h = 24, 
			class_name = "MessageBox", 
			fade_in = 150, 
			fade_out = 150, 
			is_modal = true, 
			left_margin = 0, 
			message_text = "STR_MSGBOX_QUIT_TO_OS_TEXT", 
			name = "QuitToOS MessageBox", 
			right_margin = 0, 
			top_margin = 0, 
			visual_delta_bottom = 0, 
			visual_delta_left = 0, 
			visual_delta_right = 0, 
			visual_delta_top = 0, 
			fonts = 
			{
			}, 
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					material_preset = "ui_message_box", 
				}, 
			}, 
			events_sounds = 
			{
				EVENT_SHOW = 
				{
					volume = 0, 
					file_names = 
					{
						"Menu_Warning1", 
					}, 
				}, 
			}, 
			pos = 
			{
				296, 
				269, 
			}, 
			size = 
			{
				432 * aspect_ratio_correction, 
				230, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border left", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_LEFT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					8, 
					231, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border top", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_TOP", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					432, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "dialog button 0", 
				right_margin = 0, 
				text = "STR_MSGBOX_DELETE_SAVE_YES", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7", 
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_CHECKED = 
					{
						material_template = "ui_color", 
						color = 
						{
							a = 120, 
							b = 125, 
							g = 125, 
							r = 125, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							1, 
						}, 
					}, 
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					33 * aspect_ratio_correction, 
					202, 
				}, 
				size = 
				{
					186 * aspect_ratio_correction, 
					59, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border right", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_RIGHT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					424, 
					0, 
				}, 
				size = 
				{
					8, 
					231, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border bottom", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_BOTTOM", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					223, 
				}, 
				size = 
				{
					432 * aspect_ratio_correction, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "dialog button 1", 
				right_margin = 0, 
				text = "STR_MSGBOX_DELETE_SAVE_NO", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_CHECKED = 
					{
						material_template = "ui_color", 
						color = 
						{
							a = 120, 
							b = 125, 
							g = 125, 
							r = 125, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							1, 
						}, 
					}, 
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					214, 
					202, 
				}, 
				size = 
				{
					186 * aspect_ratio_correction, 
					59, 
				}, 
			}, 
		}, 
		{
			--------------------------------------------------------------------------
			alignment = "ALIGNMENT_CENTER", 
			bottom_margin = -30, 
			button_h = 59, 
			button_w = 186 * aspect_ratio_correction, 
			buttons_horizontal = true, 
			buttons_interval = -5, 
			can_drag = false, 
			can_resize = false, 
			caption = "", 
			caption_alignment = "ALIGNMENT_LEFT", 
			caption_h = 24, 
			class_name = "MessageBox", 
			fade_in = 150, 
			fade_out = 150, 
			is_modal = true, 
			left_margin = 0, 
			message_text = "STR_MSGBOX_QUIT_GAME_TEXT", 
			name = "QuitGame MessageBox", 
			right_margin = 0, 
			top_margin = 0, 
			visual_delta_bottom = 0, 
			visual_delta_left = 0, 
			visual_delta_right = 0, 
			visual_delta_top = 0, 
			fonts = 
			{
			}, 
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					material_preset = "ui_message_box", 
				}, 
			}, 
			events_sounds = 
			{
				EVENT_SHOW = 
				{
					volume = 0, 
					file_names = 
					{
						"Menu_Warning1", 
					}, 
				}, 
			}, 
			pos = 
			{
				296, 
				269, 
			}, 
			size = 
			{
				432 * aspect_ratio_correction, 
				230, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border left", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_LEFT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					8, 
					231, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border top", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_TOP", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					432, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "dialog button 0", 
				right_margin = 0, 
				text = "STR_MSGBOX_DELETE_SAVE_YES", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_CHECKED = 
					{
						material_template = "ui_color", 
						color = 
						{
							a = 120, 
							b = 125, 
							g = 125, 
							r = 125, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							1, 
						}, 
					}, 
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					33 * aspect_ratio_correction, 
					202, 
				}, 
				size = 
				{
					186  * aspect_ratio_correction, 
					59, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border right", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_RIGHT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					424, 
					0, 
				}, 
				size = 
				{
					8, 
					231, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border bottom", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_BOTTOM", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					223, 
				}, 
				size = 
				{
					432, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "dialog button 1", 
				right_margin = 0, 
				text = "STR_MSGBOX_DELETE_SAVE_NO", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_CHECKED = 
					{
						material_template = "ui_color", 
						color = 
						{
							a = 120, 
							b = 125, 
							g = 125, 
							r = 125, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							1, 
						}, 
					}, 
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					214, 
					202, 
				}, 
				size = 
				{
					186  * aspect_ratio_correction, 
					59, 
				}, 
			}, 
		}, 
		{
			--------------------------------------------------------------------------
			alignment = "ALIGNMENT_CENTER", 
			bottom_margin = -30, 
			button_h = 59, 
			button_w = 186 * aspect_ratio_correction, 
			buttons_horizontal = true, 
			buttons_interval = -5, 
			can_drag = false, 
			can_resize = false, 
			caption = "", 
			caption_alignment = "ALIGNMENT_LEFT", 
			caption_h = 24, 
			class_name = "MessageBox", 
			fade_in = 150, 
			fade_out = 150, 
			is_modal = true, 
			left_margin = 0, 
			message_text = "STR_MSGBOX_DELETE_SAVE_TEXT", 
			name = "DeleteSave MessageBox", 
			right_margin = 0, 
			top_margin = 0, 
			visual_delta_bottom = 0, 
			visual_delta_left = 0, 
			visual_delta_right = 0, 
			visual_delta_top = 0, 
			fonts = 
			{
			}, 
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					material_preset = "ui_message_box", 
				}, 
			}, 
			events_sounds = 
			{
				EVENT_SHOW = 
				{
					volume = 0, 
					file_names = 
					{
						"Menu_Warning1", 
					}, 
				}, 
			}, 
			pos = 
			{
				296, 
				269, 
			}, 
			size = 
			{
				432 * aspect_ratio_correction, 
				230, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border left", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_LEFT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					8, 
					231, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border top", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_TOP", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					432, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "dialog button 0", 
				right_margin = 0, 
				text = "STR_MSGBOX_DELETE_SAVE_YES", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_CHECKED = 
					{
						material_template = "ui_color", 
						color = 
						{
							a = 120, 
							b = 125, 
							g = 125, 
							r = 125, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							1, 
						}, 
					}, 
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					33 * aspect_ratio_correction, 
					202, 
				}, 
				size = 
				{
					186 * aspect_ratio_correction, 
					59, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border right", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_RIGHT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					424, 
					0, 
				}, 
				size = 
				{
					8, 
					231, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border bottom", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_BOTTOM", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					223, 
				}, 
				size = 
				{
					432, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "dialog button 1", 
				right_margin = 0, 
				text = "STR_MSGBOX_DELETE_SAVE_NO", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_CHECKED = 
					{
						material_template = "ui_color", 
						color = 
						{
							a = 120, 
							b = 125, 
							g = 125, 
							r = 125, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							1, 
						}, 
					}, 
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					214, 
					202, 
				}, 
				size = 
				{
					186, 
					59, 
				}, 
			}, 
		}, 
		{
			--------------------------------------------------------------------------
			alignment = "ALIGNMENT_CENTER", 
			bottom_margin = -30, 
			button_h = 59, 
			button_w = 186 * aspect_ratio_correction, 
			buttons_horizontal = true, 
			buttons_interval = -5, 
			can_drag = false, 
			can_resize = false, 
			caption = "", 
			caption_alignment = "ALIGNMENT_LEFT", 
			caption_h = 24, 
			class_name = "MessageBox", 
			fade_in = 150, 
			fade_out = 150, 
			is_modal = true, 
			left_margin = 0, 
			message_text = "STR_MSGBOX_REPLACE_SAVE_TEXT", 
			name = "ReplaceSave MessageBox", 
			right_margin = 0, 
			top_margin = 0, 
			visual_delta_bottom = 0, 
			visual_delta_left = 0, 
			visual_delta_right = 0, 
			visual_delta_top = 0, 
			fonts = 
			{
			}, 
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					material_preset = "ui_message_box", 
				}, 
			}, 
			events_sounds = 
			{
				EVENT_SHOW = 
				{
					volume = 0, 
					file_names = 
					{
						"Menu_Warning1", 
					}, 
				}, 
			}, 
			pos = 
			{
				296, 
				269, 
			}, 
			size = 
			{
				432 * aspect_ratio_correction, 
				230, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border left", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_LEFT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					8, 
					150, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border top", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_TOP", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					300, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "dialog button 0", 
				right_margin = 0, 
				text = "STR_MSGBOX_DELETE_SAVE_YES", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_CHECKED = 
					{
						material_template = "ui_color", 
						color = 
						{
							a = 120, 
							b = 125, 
							g = 125, 
							r = 125, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							1, 
						}, 
					}, 
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					33 * aspect_ratio_correction, 
					202, 
				}, 
				size = 
				{
					186 * aspect_ratio_correction, 
					59, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border right", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_RIGHT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					424, 
					0, 
				}, 
				size = 
				{
					8, 
					150, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border bottom", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_BOTTOM", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					223, 
				}, 
				size = 
				{
					300, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "dialog button 1", 
				right_margin = 0, 
				text = "STR_MSGBOX_DELETE_SAVE_NO", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_CHECKED = 
					{
						material_template = "ui_color", 
						color = 
						{
							a = 120, 
							b = 125, 
							g = 125, 
							r = 125, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							1, 
						}, 
					}, 
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					214, 
					202, 
				}, 
				size = 
				{
					186, 
					59, 
				}, 
			}, 
		}, 
		{
			--------------------------------------------------------------------------
			alignment = "ALIGNMENT_CENTER", 
			bottom_margin = -30, 
			button_h = 59, 
			button_w = 186 * aspect_ratio_correction, 
			buttons_horizontal = true, 
			buttons_interval = -5, 
			can_drag = false, 
			can_resize = false, 
			caption = "", 
			caption_alignment = "ALIGNMENT_LEFT", 
			caption_h = 24, 
			class_name = "MessageBox", 
			fade_in = 150, 
			fade_out = 150, 
			is_modal = true, 
			left_margin = 0, 
			message_text = "", 
			name = "RestartRequred MessageBox", 
			right_margin = 0, 
			top_margin = 0, 
			visual_delta_bottom = 0, 
			visual_delta_left = 0, 
			visual_delta_right = 0, 
			visual_delta_top = 0, 
			fonts = 
			{
			}, 
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					material_preset = "ui_message_box", 
				}, 
			}, 
			events_sounds = 
			{
				EVENT_SHOW = 
				{
					volume = 0, 
					file_names = 
					{
						"Menu_Warning1", 
					}, 
				}, 
			}, 
			pos = 
			{
				296, 
				269, 
			}, 
			size = 
			{
				432 * aspect_ratio_correction, 
				230, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border left", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_LEFT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					8, 
					150, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border top", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_TOP", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					300, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "dialog button 0", 
				right_margin = 0, 
				text = "Ok", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_CHECKED = 
					{
						material_template = "ui_color", 
						color = 
						{
							a = 120, 
							b = 125, 
							g = 125, 
							r = 125, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							1, 
						}, 
					}, 
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					123, 
					202, 
				}, 
				size = 
				{
					186, 
					59, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border right", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_RIGHT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					424, 
					0, 
				}, 
				size = 
				{
					8, 
					150, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border bottom", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_BOTTOM", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					223, 
				}, 
				size = 
				{
					300, 
					8, 
				}, 
			}, 
		}, 
		{
			-----------------------------------------------------------------------
			alignment = "ALIGNMENT_CLIENT", 
			can_drag = false, 
			can_resize = true, 
			class_name = "WindowVisual", 
			fade_in = 150, 
			fade_out = 150, 
			is_modal = true, 
			name = "Assign Window", 
			pos = 
			{
				0, 
				0, 
			}, 
			size = 
			{
				1024, 
				768, 
			},
			{
				--------------------------------------------------------------------------
				alignment = "ALIGNMENT_CENTER",
				is_passive = true,
				button_h = 32, 
				button_w = 128 * aspect_ratio_correction, 
				buttons_horizontal = true, 
				buttons_interval = 8, 
				can_drag = false, 
				can_resize = false, 
				caption_h = 24, 
				class_name = "MessageBox", 
				fade_in = 150, 
				fade_out = 150, 
				message_text = "STR_MSGBOX_ASSIGN_TEXT", 
				name = "Assign MB", 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_message_box", 
					}, 
				}, 
				pos = 
				{
					296, 
					269, 
				}, 
				size = 
				{
					332 * aspect_ratio_correction, 
					190, 
				}, 
			}, 
		}, 
		{
			--------------------------------------------------------------------------
			alignment = "ALIGNMENT_CENTER", 
			bottom_margin = -30, 
			button_h = 59, 
			button_w = 186 * aspect_ratio_correction, 
			buttons_horizontal = true, 
			buttons_interval = 8, 
			can_drag = false, 
			can_resize = true, 
			caption = "", 
			caption_alignment = "ALIGNMENT_LEFT", 
			caption_h = 24, 
			class_name = "MessageBox", 
			fade_in = 150, 
			fade_out = 150, 
			is_modal = true, 
			left_margin = 0, 
			message_text = "", 
			name = "MissionFailed MessageBox", 
			right_margin = 0, 
			top_margin = 0, 
			visual_delta_bottom = 0, 
			visual_delta_left = 0, 
			visual_delta_right = 0, 
			visual_delta_top = 0, 
			fonts = 
			{
			}, 
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					material_preset = "ui_message_box", 
				}, 
			}, 
			events_sounds = 
			{
				EVENT_SHOW = 
				{
					volume = 0, 
					file_names = 
					{
						"Menu_Warning1", 
					}, 
				}, 
			}, 
			pos = 
			{
				296, 
				269, 
			}, 
			size = 
			{
				432 * aspect_ratio_correction, 
				230, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border left", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_LEFT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					8, 
					231, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border top", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_TOP", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					432, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "dialog button 0", 
				right_margin = 0, 
				text = "Ok", 
				top_margin = 0, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_CHECKED = 
					{
						material_template = "ui_color", 
						color = 
						{
							a = 120, 
							b = 125, 
							g = 125, 
							r = 125, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							1, 
						}, 
					}, 
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					123, 
					202, 
				}, 
				size = 
				{
					186, 
					59, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border right", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_RIGHT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					424, 
					0, 
				}, 
				size = 
				{
					8, 
					231, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border bottom", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_BOTTOM", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					223, 
				}, 
				size = 
				{
					432, 
					8, 
				}, 
			}, 
		},
		{
			--------------------------------------------------------------------------
			alignment = "ALIGNMENT_CENTER", 
			bottom_margin = -30, 
			button_h = 59, 
			button_w = 186 * aspect_ratio_correction, 
			buttons_horizontal = true, 
			buttons_interval = -5, 
			can_drag = false, 
			can_resize = false, 
			caption = "", 
			caption_alignment = "ALIGNMENT_LEFT", 
			caption_h = 24, 
			class_name = "MessageBox", 
			fade_in = 150, 
			fade_out = 150, 
			is_modal = true, 
			left_margin = 0, 
			message_text = "STR_MSGBOX_ENTER_SAVE_NAME_TEXT", 
			name = "EnterSaveName MessageBox", 
			right_margin = 0, 
			top_margin = 0, 
			visual_delta_bottom = 0, 
			visual_delta_left = 0, 
			visual_delta_right = 0, 
			visual_delta_top = 0, 
			fonts = 
			{
			}, 
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					material_preset = "ui_message_box", 
				}, 
			}, 
			events_sounds = 
			{
				EVENT_SHOW = 
				{
					volume = 0, 
					file_names = 
					{
						"Menu_Warning1", 
					}, 
				}, 
			}, 
			pos = 
			{
				296, 
				269, 
			}, 
			size = 
			{
				432 * aspect_ratio_correction, 
				230, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border left", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_LEFT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					8, 
					150, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border top", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_TOP", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					300, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "dialog button 0", 
				right_margin = 0, 
				text = "Ok", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_CHECKED = 
					{
						material_template = "ui_color", 
						color = 
						{
							a = 120, 
							b = 125, 
							g = 125, 
							r = 125, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							1, 
						}, 
					}, 
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					123, 
					202, 
				}, 
				size = 
				{
					186, 
					59, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border right", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_RIGHT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					424, 
					0, 
				}, 
				size = 
				{
					8, 
					150, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = false, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border bottom", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_BOTTOM", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					223, 
				}, 
				size = 
				{
					300, 
					8, 
				}, 
			}, 
		}, 
		{
			--------------------------------------------------------------------------
			alignment = "ALIGNMENT_CENTER", 
			bottom_margin = -30, 
			button_h = 59, 
			button_w = 186 * aspect_ratio_correction, 
			buttons_horizontal = true, 
			buttons_interval = -5, 
			can_drag = false, 
			can_resize = false, 
			caption = "", 
			caption_alignment = "ALIGNMENT_LEFT", 
			caption_h = 24, 
			class_name = "MessageBox", 
			fade_in = 150, 
			fade_out = 150, 
			is_modal = true, 
			left_margin = 0, 
			message_text = "STR_MSGBOX_SAVE_OPTIONS_TEXT", 
			name = "SaveOptions MessageBox", 
			right_margin = 0, 
			top_margin = 0, 
			visual_delta_bottom = 0, 
			visual_delta_left = 0, 
			visual_delta_right = 0, 
			visual_delta_top = 0, 
			fonts = 
			{
			}, 
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					material_preset = "ui_message_box", 
				}, 
			}, 
			events_sounds = 
			{
				EVENT_SHOW = 
				{
					volume = 0, 
					file_names = 
					{
						"Menu_Warning1", 
					}, 
				}, 
			}, 
			pos = 
			{
				296, 
				269, 
			}, 
			size = 
			{
				432 * aspect_ratio_correction, 
				230, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border left", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_LEFT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					8, 
					231, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border top", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_TOP", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					0, 
				}, 
				size = 
				{
					432, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "dialog button 0", 
				right_margin = 0, 
				text = "STR_MSGBOX_DELETE_SAVE_YES", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7", 
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_CHECKED = 
					{
						material_template = "ui_color", 
						color = 
						{
							a = 120, 
							b = 125, 
							g = 125, 
							r = 125, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							1, 
						}, 
					}, 
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					33 * aspect_ratio_correction, 
					202, 
				}, 
				size = 
				{
					186 * aspect_ratio_correction, 
					59, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border right", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_RIGHT", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					424, 
					0, 
				}, 
				size = 
				{
					8, 
					231, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				border_size = 8, 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Border", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "border bottom", 
				right_margin = 0, 
				top_margin = 0, 
				type = "BORDER_BOTTOM", 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				materials = 
				{
					MAT_NAME_NORMAL = 
					{
					}, 
				}, 
				pos = 
				{
					0, 
					223, 
				}, 
				size = 
				{
					432, 
					8, 
				}, 
			}, 
			{
				-----------------------------------------------------------------------
				alignment = "ALIGNMENT_NONE", 
				bottom_margin = 0, 
				can_drag = false, 
				can_resize = true, 
				class_name = "Button", 
				fade_in = 150, 
				fade_out = 150, 
				is_modal = false, 
				left_margin = 0, 
				name = "dialog button 1", 
				right_margin = 0, 
				text = "STR_MSGBOX_DELETE_SAVE_NO", 
				top_margin = 5, 
				visual_delta_bottom = 0, 
				visual_delta_left = 0, 
				visual_delta_right = 0, 
				visual_delta_top = 0, 
				events_sounds = 
				{
					EVENT_CLICK = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_click_random1", 
							"Menu_button_click_random2", 
							"Menu_button_click_random3", 
							"Menu_button_click_random4", 
							"Menu_button_click_random5", 
							"Menu_button_click_random6", 
							"Menu_button_click_random7",   
						}, 
					}, 
					EVENT_POINTER_ENTER = 
					{
						volume = 0, 
						file_names = 
						{
							"Menu_button_highlighted_random1", 
							"Menu_button_highlighted_random2", 
							"Menu_button_highlighted_random3", 
							"Menu_button_highlighted_random4", 
							"Menu_button_highlighted_random5", 
							   
						}, 
					}, 
				}, 
				fonts = 
				{
				}, 
				materials = 
				{
					MAT_NAME_CHECKED = 
					{
						material_template = "ui_color", 
						color = 
						{
							a = 120, 
							b = 125, 
							g = 125, 
							r = 125, 
						}, 
						pos = 
						{
							0, 
							0, 
						}, 
						size = 
						{
							1, 
							1, 
						}, 
					}, 
					MAT_NAME_HIGHLIGHTED = 
					{
						material_preset = "ui_menu_button_01_h", 
					}, 
					MAT_NAME_NORMAL = 
					{
						material_preset = "ui_menu_button_01_e", 
					}, 
					MAT_NAME_PUSHED = 
					{
						material_preset = "ui_menu_button_01_t", 
					}, 
				}, 
				pos = 
				{
					214, 
					202, 
				}, 
				size = 
				{
					186, 
					59, 
				}, 
			}, 
		},
	}, 
}