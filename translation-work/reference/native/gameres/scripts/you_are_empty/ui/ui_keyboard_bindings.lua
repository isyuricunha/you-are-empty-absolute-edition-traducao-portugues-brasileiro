------------------------------------------------------------------------
-- Copyright (C) 2003-2005 Digital Spray Studios. All Rights Reserved.
------------------------------------------------------------------------
-- Author: Vyacheslav Korotayev
------------------------------------------------------------------------
--    Таблица соответствия команд, которые видит пользователь
-- в окне настройки раскладки клавиатуры командам движка. Команды в окне
-- настройки клавиатуры будут находиться в том порядке, в котором они 
-- перечислены в данной таблице.
--
--    Первый элемент таблицы определяет имя, которое увидит пользователь для 
-- данной команды (определяется в файле ui_strings.txt). Имеет префикс "STR_BIND_"
-- В окне настройки клавиатуры пользователь будет видеть локализованную строку.
--    Второй элемент таблицы - соответствующая команда движка. Если указано 
-- предопределенное значение "-GROUP-", то данная запись определяет заголовок группы
--    Третий элемент таблицы - значение по умолчанию
------------------------------------------------------------------------

ui_keyboard_bindings = 
{
	--  Имя,							команда,					default
	
	{	"STR_BIND_GROUP_MOVE",			"-GROUP-",					"dummy"			},
	{	"STR_BIND_ATTACK1",				"*attack1",					"MLEFT"			},
	{	"STR_BIND_ATTACK2",				"*attack2",					"MRIGHT"		},
	{	"STR_BIND_RELOAD",				"*reload",					"R"				},	
	{	"STR_BIND_USE",					"*use",						"E"				},
	{	"STR_BIND_MOVE_FORWARD",		"*move_forward",			"W"				},
	{	"STR_BIND_MOVE_BACKWARD",		"*move_backward",			"S"				},
	{	"STR_BIND_MOVE_LEFT",			"*move_stepleft",			"A"				},
	{	"STR_BIND_MOVE_RIGHT",			"*move_stepright",			"D"				},
	{	"STR_BIND_SPRINT",				"*move_accelerate",			"SHIFT"			},
	{	"STR_BIND_LOOK_UP",				"look_up",					"UP"			},
	{	"STR_BIND_LOOK_DOWN",			"look_down",				"DOWN"			},
	{	"STR_BIND_LOOK_LEFT",			"look_left",				"LEFT"			},
	{	"STR_BIND_LOOK_RIGHT",			"look_right",				"RIGHT"			},
	{	"STR_BIND_JUMP",				"*move_jump",				"SPACE"			},
	{	"STR_BIND_CROUCH",				"*move_down",				"C"				},
	
	{	"STR_BIND_GROUP_WEAPONS",		"-GROUP-",					"dummy"			},
	{	"STR_BIND_SELECT_SPANNER",		"select Spanner",			"1"				},
	{	"STR_BIND_SELECT_MAUZER",		"select Mauzer",			"2"				},
	{	"STR_BIND_SELECT_OBREZ",		"select obrez",				"3"				},
	{	"STR_BIND_SELECT_NAILGUN",		"select nailgun",			"4"				},	
	{	"STR_BIND_SELECT_RIFLE",		"select rifle",				"5"				},
	{	"STR_BIND_SELECT_PPSH",			"select ppsh",				"6"				},
	{	"STR_BIND_SELECT_GRENADE",		"select grenade",			"7"				},
	{	"STR_BIND_SELECT_RIFLE_SNIPER",	"select rifle_sniper",		"8"				},
	{	"STR_BIND_SELECT_THUNDER",		"select thunder",			"9"				},

	{	"STR_BIND_NEXT_WEAPON",			"select next_weapon",		"MWHEEL_DOWN"	},
	{	"STR_BIND_PREV_WEAPON",			"select prev_weapon",		"MWHEEL_UP"		},

	{	"STR_BIND_GROUP_MISC",			"-GROUP-",					"dummy"			},
	{	"STR_BIND_INV_BROWSE",			"*inventory_browse",		"F1"			},
	{	"STR_BIND_INV_BROWSE_PREV",		"*inventory_browse_prev",	"["				},
	{	"STR_BIND_INV_BROWSE_NEXT",		"*inventory_browse_next",	"]"				},
	{	"STR_BIND_PAUSE",				"game_pause",				"P"				},
	{	"STR_BIND_QUICKSAVE",			"app_quicksave",			"F5"			},
	{	"STR_BIND_QUICKLOAD",			"app_quickload",			"F8"			},
	{	"STR_SCREENSHOT",				"screenshoot",				"F12"			},
	{	"STR_TOGGLE_HUD",				"toggle hud_render",		"F10"			},
}