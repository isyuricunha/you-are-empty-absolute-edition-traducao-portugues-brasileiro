window_width = ##WINDOW_WIDTH; window_height = ##WINDOW_HEIGHT;
aspect_ratio = window_width / window_height;
aspect_ratio_correction = 1.33333333 / aspect_ratio
health_digits_size = aspect_ratio * 12

if aspect_ratio_correction >= 1 then
	health_digits_size = aspect_ratio * 8
end
-----------------------------------------------------------------------------
-- sight
-----------------------------------------------------------------------------
#define_begin HUD_SIGHT(_NAME, _TEXTURE, _ID)
{
	alignment = "ALIGNMENT_CENTER", 
	class_name = "HudImages", 
	name = _NAME, 
	curr_image = _ID,
	dimension_x = 1,
	dimension_y = 1,
	materials = 
	{
		MAT_NAME_NORMAL = 
		{
			diffuse_texture = _TEXTURE, 
			material_template = "ui_image", 
		}, 
	}, 
	size = 
	{
		40 * aspect_ratio_correction, 
		40, 
	}, 
},
#define_end

-----------------------------------------------------------------------------
-- note
-----------------------------------------------------------------------------
#define_begin HUD_NOTE(_NAME, _TEXTURE, _W, _H, _SOUND)
{
	alignment = "ALIGNMENT_CENTER", 
	class_name = "HudImages", 
	name = _NAME, 
	curr_image = 1,
	dimension_x = 1,
	dimension_y = 1,
	materials = 
	{
		MAT_NAME_TILED = 
		{
			defered_init = true,
			diffuse_texture = _TEXTURE,
			material_template = "ui_image", 
		}, 
	}, 
	events_sounds = 
	{
		EVENT_SHOW = 
		{
			volume = 0, 
			file_names = 
			{
				_SOUND,
			}, 
		}, 	
	},
	size = 
	{
		_W * aspect_ratio_correction,
		_H, 
	}, 
},
#define_end

-----------------------------------------------------------------------------
-- записки, показывающие в углу иконку
-----------------------------------------------------------------------------
#define_begin HUD_LAST_NOTE(_NAME)
{
	class_name = "HudImages", 
	name = _NAME, 
	curr_image = 19,
	dimension_x = 4,
	dimension_y = 8,
	materials = 
	{
		MAT_NAME_TILED = 
		{
			defered_init = true,
			diffuse_texture = "holdable_icons.tga",
			material_template = "ui_image",
		}, 
	}, 
	pos =
	{
		-32, 
		16, 
	},
	size = 
	{
		128 * aspect_ratio_correction,
		64, 
	}, 
},
#define_end

-----------------------------------------------------------------------------
hud = 
{
	-----------------------------------------------------------------------------
	-- hud
	-----------------------------------------------------------------------------
	class_name = "HudGroup",
	name = "hud", 
	materials = 
	{
		MAT_NAME_NORMAL = {}, 
	}, 
	{
		-----------------------------------------------------------------------------
		-- alive
		-----------------------------------------------------------------------------
		class_name = "HudGroup", 
		name = "alive", 
		materials = 
		{
			MAT_NAME_NORMAL = {}, 
		}, 
		{
			-----------------------------------------------------------------------------
			-- health
			-----------------------------------------------------------------------------
			class_name = "WindowVisual", 
			name = "__icon_health", 
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					diffuse_texture = "jizndiagram.tga", 
					material_template = "ui_image_add", 
				}, 
			}, 
			size = 
			{
				32 * aspect_ratio_correction, 
				32, 
			}, 
			pos = 
			{
				4, 
				768-48, 
			}, 
		},
		{
			-----------------------------------------------------------------------------
			class_name = "HudNumberIndicator", 
			name = "health", 
			value = 100,
			max_value = 99,
			digits = 2,
			digits_delta_pos = health_digits_size,
			top_margin = -8,
			fonts = 
			{
				FNT_NAME_DEFAULT = "health_digits", 
			}, 
			materials = 
			{
				MAT_NAME_NORMAL = 
				{
					diffuse_texture = "life.tga", 
					material_template = "ui_image", 
					pos = 
					{
						0, 
						0, 
					}, 
					size = 
					{
						118/128, 
						1, 
					}, 
				},
			}, 
			pos = 
			{
				32, 
				768-126, 
			}, 
			size = 
			{
				128 * aspect_ratio_correction, 
				128, 
			}, 
		},
	},
	{
		-----------------------------------------------------------------------------
		-- inventory hands
		-----------------------------------------------------------------------------
		class_name = "HudGroup", 
		name = "inventory_hands", 
		materials = 
		{
			MAT_NAME_NORMAL = {}, 
		}, 
		{
			-----------------------------------------------------------------------------
			-- weapon basic
			-----------------------------------------------------------------------------
			class_name = "HudGroup", 
			name = "weapon_basic", 
			materials = 
			{
				MAT_NAME_NORMAL = {}, 
			}, 

			-----------------------------------------------------------------------------
			-- sights
			-----------------------------------------------------------------------------
			HUD_SIGHT("sight_weapon_obrez",			"crosshair", 0)
			HUD_SIGHT("sight_weapon_spanner",		"crosshair", 0)
			HUD_SIGHT("sight_weapon_mauzer",		"crosshair", 0)
			HUD_SIGHT("sight_weapon_machinegun",	"crosshair", 0)
			HUD_SIGHT("sight_weapon_bottle",		"crosshair", 0)
			HUD_SIGHT("sight_weapon_maxim",			"crosshair", 0)
			HUD_SIGHT("sight_weapon_nailgun",		"crosshair", 0)
			HUD_SIGHT("sight_weapon_rifle",			"crosshair", 0)
			HUD_SIGHT("sight_weapon_rifle_sniper",	"crosshair", 0)
			HUD_SIGHT("sight_weapon_thunder",		"crosshair", 0)
			HUD_SIGHT("sight_weapon_thunder_fire",	"crosshair", 0)

			{
				-----------------------------------------------------------------------------
				class_name = "HudGroup", 
				name = "sight_weapon_rifle_sniper_zoom", 
				materials = 
				{
					MAT_NAME_NORMAL = {}, 
				}, 
				{
					-----------------------------------------------------------------------------
					alignment = "ALIGNMENT_CENTER", 
					class_name = "HudImages", 
					name = "__sight", 
					curr_image = 0,
					dimension_x = 1,
					dimension_y = 1,
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
							diffuse_texture = "crosshairO", 
							material_template = "ui_image", 
						}, 
					}, 
					size = 
					{
						768, 
						768, 
					}, 
				},
				{
					-----------------------------------------------------------------------------
					class_name = "WindowVisual", 
					name = "__left", 
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
					size = 
					{
						128, 
						768, 
					}, 
					pos = 
					{
						0, 
						0, 
					}, 
				},
				{
					-----------------------------------------------------------------------------
					class_name = "WindowVisual", 
					name = "__right", 
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
					size = 
					{
						128, 
						768, 
					}, 
					pos = 
					{
						1024-128, 
						0, 
					}, 
				},
			},
		},			
		{
			-----------------------------------------------------------------------------
			-- weapon firearm
			-- (огнестрельное) оружие с боеприпасами
			-----------------------------------------------------------------------------
			class_name = "HudGroup", 
			name = "weapon_firearm", 
			materials = 
			{
				MAT_NAME_NORMAL = {}, 
			}, 
			{
				-----------------------------------------------------------------------------
				-- ammo
				-----------------------------------------------------------------------------
				class_name = "HudGroup", 
				name = "ammo", 
				materials = 
				{
					MAT_NAME_NORMAL = {}, 
				}, 
				{
					-----------------------------------------------------------------------------
					class_name = "HudImages", 
					name = "ammo_icons", 
					curr_image = 1,
					dimension_x = 8,
					dimension_y = 1,
					materials = 
					{
						MAT_NAME_TILED = 
						{
							diffuse_texture = "ammo_icons.tga", 
							material_template = "ui_image", 
						}, 
					}, 
					pos =
					{
						1024-70, 
						768-70, 
					},
					size = 
					{
						50 * aspect_ratio_correction, 
						50, 
					}, 
				},
				{
					-----------------------------------------------------------------------------
					class_name = "HudNumberIndicator", 
					name = "loaded", 
					value = 0,
					max_value = 99,
					digits = 2,
					digits_delta_pos = 0,
					fonts = 
					{
						FNT_NAME_DEFAULT = "ammo_digits", 
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						1024-82, 
						768-60-70, 
					}, 
					size = 
					{
						70, 
						50, 
					}, 
				},
				{
					-----------------------------------------------------------------------------
					class_name = "HudNumberIndicator", 
					name = "all", 
					value = 0,
					max_value = 999,
					digits = 3,
					digits_delta_pos = 0,
					fonts = 
					{
						FNT_NAME_DEFAULT = "ammo_digits1", 
					}, 
					materials = 
					{
						MAT_NAME_NORMAL = 
						{
						}, 
					}, 
					pos = 
					{
						1024-170, 
						768-70, 
					}, 
					size = 
					{
						90, 
						50, 
					}, 
				},
			},
		},
	},
	{
		-----------------------------------------------------------------------------
		-- inventory backpack
		-----------------------------------------------------------------------------
		class_name = "HudGroup", 
		name = "inventory_backpack", 
		materials = 
		{
			MAT_NAME_NORMAL = {}, 
		}, 
		{
			-----------------------------------------------------------------------------
			class_name = "HudImages", 
			name = "Key_Iron",
			curr_image = 1,
			dimension_x = 8,
			dimension_y = 1,
			materials = 
			{
				MAT_NAME_TILED = 
				{
					diffuse_texture = "ico_inventory_items.tga", 
					material_template = "ui_image", 
				}, 
			}, 
			pos =
			{
				1024-70, 
				10, 
			},
			size = 
			{
				64 * aspect_ratio_correction, 
				64, 
			}, 
		},
		{
			-----------------------------------------------------------------------------
			class_name = "HudImages", 
			name = "Key_Car",
			curr_image = 4,
			dimension_x = 8,
			dimension_y = 1,
			materials = 
			{
				MAT_NAME_TILED = 
				{
					diffuse_texture = "ico_inventory_items.tga", 
					material_template = "ui_image", 
				}, 
			}, 
			pos =
			{
				1024-70*2, 
				10, 
			},
			size = 
			{
				64 * aspect_ratio_correction, 
				64, 
			}, 
		},
		{
			-----------------------------------------------------------------------------
			class_name = "HudImages", 
			name = "item_Lampa",
			curr_image = 5,
			dimension_x = 8,
			dimension_y = 1,
			materials = 
			{
				MAT_NAME_TILED = 
				{
					diffuse_texture = "ico_inventory_items.tga", 
					material_template = "ui_image", 
				}, 
			}, 
			pos =
			{
				1024-70*3, 
				10, 
			},
			size = 
			{
				64 * aspect_ratio_correction, 
				64, 
			}, 
		},
		{
			-----------------------------------------------------------------------------
			class_name = "HudImages", 
			name = "ItemBABINA",
			curr_image = 6,
			dimension_x = 8,
			dimension_y = 1,
			materials = 
			{
				MAT_NAME_TILED = 
				{
					diffuse_texture = "ico_inventory_items.tga", 
					material_template = "ui_image", 
				}, 
			}, 
			pos =
			{
				1024-70*4, 
				10, 
			},
			size = 
			{
				64 * aspect_ratio_correction, 
				64, 
			}, 
		},
	},
	{
		-----------------------------------------------------------------------------
		-- last hold item
		-----------------------------------------------------------------------------
		class_name = "HudImages", 
		name = "last_hold_item", 
		curr_image = 1,
		dimension_x = 4,
		dimension_y = 8,
		fade_in = 500,
		fade_out = 500,
		materials = 
		{
			MAT_NAME_TILED = 
			{
				diffuse_texture = "holdable_icons.tga", 
				material_template = "ui_image", 
			}, 
		}, 
		pos =
		{
			1024/2-128/2, 
			768-90, 
		},
		size = 
		{
			128 * aspect_ratio_correction, 
			64, 
		}, 
	},
	{
		-----------------------------------------------------------------------------
		-- inventory browser
		-----------------------------------------------------------------------------
		class_name = "HudGroup",
		name = "inventory_browser", 
		materials = 
		{
			MAT_NAME_NORMAL = {}, 
		}, 
		-----------------------------------------------------------------------------
		-- notes
		-----------------------------------------------------------------------------
		HUD_NOTE("kino_opyat",			"opiat",			350, 512,	"Opyat'_ty_Opazdyvaesh")
		HUD_NOTE("kino_podval_key",		"kinoKey",			350, 512,	"Klyu4OtPodvala_U_kinomehanika")
		HUD_NOTE("dvorZakrivaetsia",	"jilci",			350, 512,	"VorotaZakryvayutsya1")
		HUD_NOTE("dvornik",				"dvornik",			350, 512,	"Ushel_na_dvor")
		HUD_NOTE("eskalator",			"Eskalator",		350, 512,	"Rabotnikam_stantcii")
		HUD_NOTE("masha",				"masha",			350, 512,	"MashaKlyu4iVpodvale")
		HUD_NOTE("mashina_key",			"mashina",			350, 512,	"MashinaUglavnogoVhoda")
		HUD_NOTE("yama",				"yama",				350, 512,	"yama")
		HUD_NOTE("medSivorodka",		"sivorodka",		350, 512,	"vakcina")
		HUD_NOTE("gosZakaz",			"gorod",			350, 512,	"Gorod_jdyot_Zerna")
		HUD_NOTE("kuriWarn",			"kuriWarn",			350, 512,	"S_Kuritcami_4to_to_ne_to")
		HUD_NOTE("meatEshelon",			"eshelon",			350, 512,	"zavod_zavoz")
		HUD_NOTE("meatProbi",			"probi",			350, 512,	"zavod_radiacia")
		HUD_NOTE("medVladimir",			"vladimir",			350, 512,	"vladimirZvon")
		HUD_NOTE("liuda",				"liuda",			350, 512,	"liuda")
		HUD_NOTE("SunActiv",			"ActivSun",			350, 512,	"ActivSUN")
		HUD_NOTE("gorOW",				"gorOW",			350, 512,	"ORW")		
		HUD_NOTE("gorvoda",				"gorVoda",			350, 512,	"voda")		
		HUD_NOTE("inst_bezopasnosti",	"gotovnost",		350, 512,	"gotovnost")			
		HUD_NOTE("dliaBabini",			"dliababini",		512, 350,	"dliaBabini")			
		HUD_NOTE("detali",				"detali",			350, 512,	"CreatDetal")				
		HUD_NOTE("podgovSunActiv",		"podgovSunActiv",	350, 512,	"dezinform")				
		HUD_NOTE("tramvai",				"tramvai",			350, 512,	"tramvai")					
		HUD_NOTE("proKino",				"lolita",			350, 512,	"devochka")						
		HUD_NOTE("krisiWarn",			"KrisiWarn",		350, 512,	"krisiWarning")							
		HUD_NOTE("warnVagon",			"WarnVagon",		350, 512,	"tarasenko")							
		HUD_NOTE("revizia",				"revizia",			350, 512,	"revizor")							
		HUD_NOTE("radioHead",			"radioLiubitel",	350, 512,	"radioHead")							
		HUD_NOTE("ilusion",			"eliuzia",	350, 512,	"iliusion")							
	},
	{
		-----------------------------------------------------------------------------
		-- last holdable
		-----------------------------------------------------------------------------
		class_name = "HudGroup",
		name = "last_holdable", 
		materials = 
		{
			MAT_NAME_NORMAL = {}, 
		}, 
		-----------------------------------------------------------------------------
		-- last notes
		-----------------------------------------------------------------------------
		HUD_LAST_NOTE("kino_opyat")
		HUD_LAST_NOTE("kino_podval_key")
		HUD_LAST_NOTE("dvorZakrivaetsia")
		HUD_LAST_NOTE("dvornik")
		HUD_LAST_NOTE("eskalator")
		HUD_LAST_NOTE("masha")
		HUD_LAST_NOTE("mashina_key")
		HUD_LAST_NOTE("yama")
		HUD_LAST_NOTE("medSivorodka")
		HUD_LAST_NOTE("gosZakaz")
		HUD_LAST_NOTE("kuriWarn")
		HUD_LAST_NOTE("meatEshelon")
		HUD_LAST_NOTE("meatProbi")
		HUD_LAST_NOTE("medVladimir")
		HUD_LAST_NOTE("liuda")
		HUD_LAST_NOTE("SunActiv")
		HUD_LAST_NOTE("gorOW")
		HUD_LAST_NOTE("gorvoda")
		HUD_LAST_NOTE("inst_bezopasnosti")
		HUD_LAST_NOTE("dliaBabini")
		HUD_LAST_NOTE("detali")
		HUD_LAST_NOTE("podgovSunActiv")
		HUD_LAST_NOTE("tramvai")
		HUD_LAST_NOTE("proKino")
		HUD_LAST_NOTE("krisiWarn")
		HUD_LAST_NOTE("warnVagon")
		HUD_LAST_NOTE("revizia")
		HUD_LAST_NOTE("radioHead")
		HUD_LAST_NOTE("ilusion")
	},
	{
		-----------------------------------------------------------------------------
		-- msg_string
		-----------------------------------------------------------------------------
		class_name = "HudText", 
		name = "msg_string", 
		text = "STR_TEST_STRING", 
		fade_in = 500,
		fade_out = 500,
		fonts = 
		{
			FNT_NAME_DEFAULT = "courier", 
		}, 
		materials = 
		{
		}, 
		pos =
		{
			32, 
			32, 
		},
		size = 
		{
			1024 * aspect_ratio_correction, 
			64, 
		}, 
	},
	{
		-----------------------------------------------------------------------------
		class_name = "HudGroup", 
		name = "sight_weapon_rifle_sniper_zoom", 
		z_order = 300,
		materials = 
		{
			MAT_NAME_NORMAL = {}, 
		}, 
		{
	
		-----------------------------------------------------------------------------
			alignment = "ALIGNMENT_CENTER", 
			class_name = "HudImages", 
			name = "__sight", 
			curr_image = 0,
			dimension_x = 1,
			dimension_y = 1,
			materials = 

				{
				MAT_NAME_NORMAL = 
				{
					diffuse_texture = "crosshairO.tga", 
					material_template = "ui_image_clampmap", 
					pos = 
					{
						(700/2 - 1024/2)/700, 
						(700/2 - 768/2)/700,
					}, 
					size = 
					{
						1024/700, 
						768/700, 
					}, 
				}, 
			}, 
			size = 
			{
				1024 * aspect_ratio_correction, 
				768, 
			}, 
		},
		{
			-----------------------------------------------------------------------------
			class_name = "WindowVisual", 
			name = "__left", 
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
			size = 
			{
				(1024 * (1 - aspect_ratio_correction)) / 2 + 3 * aspect_ratio_correction, 
				768, 
			}, 
			pos = 
			{
				0, 
				0, 
			}, 
		},
				{
			-----------------------------------------------------------------------------
			class_name = "WindowVisual", 
			name = "__right", 
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
			size = 
			{
				(1024 * (1 - aspect_ratio_correction)) / 2 + 3 * aspect_ratio_correction, 
				768, 
			}, 
			pos = 
			{
				1024 * (aspect_ratio_correction / 2 + 0.5),
				0, 
			}, 
		},
	},
}
