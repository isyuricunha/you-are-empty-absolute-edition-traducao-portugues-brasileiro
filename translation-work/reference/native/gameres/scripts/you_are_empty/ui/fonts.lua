-----------------------------------------------------------
-- charsets
-----------------------------------------------------------
charsets["arial"] =
{
	file_type				= "nehe",
	file_name				= "arial.size",
}

-----------------------------------------------------------
charsets["rodchenko"] =
{
	file_type				= "nehe",
	file_name				= "RodchenkoCTT.size",
}

-----------------------------------------------------------
charsets["courier"] =
{
	file_type				= "nehe",
	file_name				= "courier.size",
}

-----------------------------------------------------------
charsets["ammo_digits"] =
{
	file_type				= "nehe",
	file_name				= "ammo_digits.size",
}

-----------------------------------------------------------
charsets["health_digits"] =
{
	file_type				= "nehe",
	file_name				= "health_digits.size",
}

-----------------------------------------------------------
-- fonts
-----------------------------------------------------------
fonts["arial_white"] =
{
	charset_name			= "arial",
	material =
	{
		material_template	= "ui_image",
		diffuse_texture		= "arial.tga",
		color = 
		{
			a = 255, 
			b = 255, 
			g = 255, 
			r = 255, 
		}, 
	},
}

-----------------------------------------------------------
fonts["courier"] =
{
	charset_name			= "courier",
	material =
	{
		material_template	= "ui_image",
		diffuse_texture		= "courier.tga",
		color = 
		{
			a = 255, 
			b = 255, 
			g = 255, 
			r = 255, 
		}, 
	},
}

-----------------------------------------------------------
fonts["rodchenko"] =
{
	charset_name			= "rodchenko",
	material =
	{
		material_template	= "ui_image",
		diffuse_texture		= "RodchenkoCTT.tga",
		color = 
		{
			a = 255, 
			b = 220, 
			g = 220, 
			r = 220, 
		}, 
	},
}

-----------------------------------------------------------
fonts["rodchenko_disabled"] =
{
	charset_name			= "rodchenko",
	material =
	{
		material_template	= "ui_image",
		diffuse_texture		= "RodchenkoCTT.tga",
		color = 
		{
			a = 255, 
			b = 100, 
			g = 100, 
			r = 100, 
		}, 
	},
}

-----------------------------------------------------------
fonts["rodchenko_button"] =
{
	charset_name			= "rodchenko",
	material =
	{
		material_template	= "ui_image",
		diffuse_texture		= "RodchenkoCTT.tga",
		color = 
		{
			a = 255, 
			b = 48, 
			g = 39, 
			r = 83, 
		}, 
	},
}

-----------------------------------------------------------
fonts["ammo_digits"] =
{
	charset_name			= "ammo_digits",
	material =
	{
		material_template	= "ui_image",
		diffuse_texture		= "chetcifr.tga",
		color = 
		{
			a = 255, 
			b = 255, 
			g = 255, 
			r = 255, 
		}, 
	},
	size					= 250,
}

-----------------------------------------------------------
fonts["ammo_digits1"] =
{
	charset_name			= "ammo_digits",
	material =
	{
		material_template	= "ui_image",
		diffuse_texture		= "chetcifr.tga",
		color = 
		{
			a = 255, 
			b = 255, 
			g = 255, 
			r = 255, 
		}, 
	},
	size					= 200,
}

-----------------------------------------------------------
fonts["health_digits"] =
{
	charset_name			= "health_digits",
	material =
	{
		material_template	= "ui_image_add",
		diffuse_texture		= "life_num.tga",
		color = 
		{
			a = 255, 
			b = 127, 
			g = 127, 
			r = 127, 
		}, 
	},
	size					= 240,
}
