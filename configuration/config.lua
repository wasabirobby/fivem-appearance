-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

Config = {}

Config.PaymentAccount = 'bank' -- Payment account you want to pay from(For example; 'money', 'bank', 'black_money')

Config.ClothingShops = {

	{
		blip = {
			enabled = true, -- Blip enabled?
			sprite = 73, -- The Blip type. List: https://docs.fivem.net/docs/game-references/blips/#blips
			color = 47, -- The Blip color. List: https://docs.fivem.net/docs/game-references/blips/#blip-colors
			scale = 0.7, -- Size of blip
			string = 'Clothing Shop'
		},
		coords = vec3(72.3, -1399.1, 28.4), -- Coords of shop
		distance = 7, -- Distance to show text UI pormpt
		price = 120, -- Price to use this shop(False for free)
	},

	{
		blip = {
			enabled = true, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(-708.7, -152.1, 36.4),
		distance = 7, 
		price = 120, 
	},

	{
		blip = {
			enabled = true, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(-165.1, -302.4, 38.6),
		distance = 7, 
		price = 120, 
	},

	{
		blip = {
			enabled = true, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(428.7, -800.1, 28.5),
		distance = 7, 
		price = 120, 
	},

	{
		blip = {
			enabled = true, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(-829.4, -1073.7, 10.3),
		distance = 7, 
		price = 120, 
	},

	{
		blip = {
			enabled = true, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(-1449.1, -238.3, 48.8),
		distance = 7, 
		price = 120, 
	},

	{
		blip = {
			enabled = true, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(11.6, 6514.2, 30.9),
		distance = 7, 
		price = 120, 
	},

	{
		blip = {
			enabled = true, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(122.9, -222.2, 53.5),
		distance = 7, 
		price = 120, 
	},

	{
		blip = {
			enabled = true, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(1696.3, 4829.3, 41.1),
		distance = 7, 
		price = 120, 
	},

	{
		blip = {
			enabled = true, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(618.1, 2759.6, 41.1),
		distance = 7, 
		price = 120, 
	},

	{
		blip = {
			enabled = true, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(1190.6, 2713.4, 37.2),
		distance = 7, 
		price = 120, 
	},

	{
		blip = {
			enabled = true, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(-1193.4, -772.3, 16.3),
		distance = 7, 
		price = 120, 
	},

	{
		blip = {
			enabled = true, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(-3172.5, 1048.1, 19.9),
		distance = 7, 
		price = 120, 
	},

	{
		blip = {
			enabled = true, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(-1108.4, 2708.9, 18.1),
		distance = 7, 
		price = 120, 
	},

	{
		blip = {
			enabled = false, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(300.6, -597.7, 42.1), -- Pillbox Hospital
		distance = 7, 
		price = false, 
	},

	{
		blip = {
			enabled = false, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(461.4, -998.0, 30.2), -- MRPD Cloakroom
		distance = 7, 
		price = false, 
	},

	{
		blip = {
			enabled = false, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(-1622.6, -1034.0, 13.1), -- Beach
		distance = 7, 
		price = 250, 
	},

	{
		blip = {
			enabled = false, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(1861.1, 3689.2, 34.2), -- Sandy PD
		distance = 7, 
		price = false, 
	},

	{
		blip = {
			enabled = false, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(1834.5, 3690.5, 34.2), -- Sandy PD #2
		distance = 7, 
		price = false, 
	},

	{
		blip = {
			enabled = false, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(1742.1, 2481.5, 45.7), -- Prison
		distance = 7, 
		price = false, 
	},

	{
		blip = {
			enabled = false, 
			sprite = 73, 
			color = 47, 
			scale = 0.7, 
			string = 'Clothing Shop'
		},
		coords = vec3(516.8, 4823.5, -66.1), -- Submarine interior
		distance = 7, 
		price = false, 
	},

}

Config.BarberShops = {

	{
		blip = {
			enabled = true, -- Blip enabled?
			sprite = 71, -- The Blip type. List: https://docs.fivem.net/docs/game-references/blips/#blips
			color = 47, -- The Blip color. List: https://docs.fivem.net/docs/game-references/blips/#blip-colors
			scale = 0.7, -- Size of blip
			string = 'Barber Shop'
		},
		coords = vec3(-814.3, -183.8, 36.6), -- Coords of shop
		distance = 7, -- Distance to show text UI pormpt
		price = 50, -- Price to use this shop(False for free)
	},

	{
		blip = {
			enabled = true,
			sprite = 71, 
			color = 47, 
			scale = 0.7,
			string = 'Barber Shop'
		},
		coords = vec3(136.8, -1708.4, 28.3), 
		distance = 7,
		price = 50,
	},

	{
		blip = {
			enabled = true,
			sprite = 71, 
			color = 47, 
			scale = 0.7,
			string = 'Barber Shop'
		},
		coords = vec3(-1282.6, -1116.8, 6.0), 
		distance = 7,
		price = 50,
	},

	{
		blip = {
			enabled = true,
			sprite = 71, 
			color = 47, 
			scale = 0.7,
			string = 'Barber Shop'
		},
		coords = vec3(1931.5, 3729.7, 31.8), 
		distance = 7,
		price = 50,
	},

	{
		blip = {
			enabled = true,
			sprite = 71, 
			color = 47, 
			scale = 0.7,
			string = 'Barber Shop'
		},
		coords = vec3(1212.8, -472.9, 65.2), 
		distance = 7,
		price = 50,
	},

	{
		blip = {
			enabled = true,
			sprite = 71, 
			color = 47, 
			scale = 0.7,
			string = 'Barber Shop'
		},
		coords = vec3(-34.31, -154.99, 55.8), 
		distance = 7,
		price = 50,
	},

	{
		blip = {
			enabled = true,
			sprite = 71, 
			color = 47, 
			scale = 0.7,
			string = 'Barber Shop'
		},
		coords = vec3(-278.1, 6228.5, 30.7), 
		distance = 7,
		price = 50,
	},

}

Config.TattooShops = {

	{
		blip = {
			enabled = true,
			sprite = 75, 
			color = 1, 
			scale = 0.7,
			string = 'Tattoo Shop'
		},
		coords = vec3(1322.6, -1651.9, 51.2), 
		distance = 7,
		price = 350,
	},

	{
		blip = {
			enabled = true,
			sprite = 75, 
			color = 1, 
			scale = 0.7,
			string = 'Tattoo Shop'
		},
		coords = vec3(-1153.6, -1425.6, 4.9), 
		distance = 7,
		price = 350,
	},

	{
		blip = {
			enabled = true,
			sprite = 75, 
			color = 1, 
			scale = 0.7,
			string = 'Tattoo Shop'
		},
		coords = vec3(322.1, 180.4, 103.5), 
		distance = 7,
		price = 350,
	},

	{
		blip = {
			enabled = true,
			sprite = 75, 
			color = 1, 
			scale = 0.7,
			string = 'Tattoo Shop'
		},
		coords = vec3(-3170.0, 1075.0, 20.8), 
		distance = 7,
		price = 350,
	},

	{
		blip = {
			enabled = true,
			sprite = 75, 
			color = 1, 
			scale = 0.7,
			string = 'Tattoo Shop'
		},
		coords = vec3(1864.6, 3747.7, 33.0), 
		distance = 7,
		price = 350,
	},

	{
		blip = {
			enabled = true,
			sprite = 75, 
			color = 1, 
			scale = 0.7,
			string = 'Tattoo Shop'
		},
		coords = vec3(-293.7, 6200.0, 31.4), 
		distance = 7,
		price = 350,
	},

}