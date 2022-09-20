Config = {}

Config.Distance = 5.0

Config.Translation = {
	--| Blips
	Blip = {
		clothingShop = 'Clothing Shop',
		barberShop = 'Barber Shop',
		tattooShop = 'Tattoo Shop'
	},

	--| Menus
	Menu = {
		clothingMenu = '[E] - Change Clothing',
		barberMenu = '[E] - Change Hair/Face',
		tattooMenu = '[E] - Change Tattoos'
	},

	--| ClothingShop
	Shop = {
		masterTitle = 'Shop Menu',

		clothingMenuTitle = 'Change Clothing',
		clothingMenuDesc = 'Browse available clothing',

		pickNewOutfitTitle = 'Browse Outfits',
		pickNewOutfitDesc = 'Browse saved outfits',

		saveOutfitTitle = 'Save Outfit',
		saveOutfitDesc = 'Save current outfit',

		deleteOutfitMenuTitle = 'Delete Outfits',
		deleteOutfitMenuDesc = 'Browse saved outfits'
	},

	--| Wardrobe
	Wardrobe = {
		masterTitle = 'Wardrobe Menu',

		menuTitle = 'No Saved Outfits!',
		menuDesc = 'Go to the clothing Shop'
	},

	--| New Outfit
	NewOutfit = {
		masterTitle = 'Saved Outfits',

		title = '< Go Back',
		desc = 'No Saved Outfits!'
	},

	--| Delete Outfit
	DeleteOutfit = {
		masterTitle = 'Delete Outfits',

		title = '< Go Back',
		desc = 'No Saved Outfits!'
	},
}

Config.ClothingShops = {
	{
        blip = true, -- Blip enabled?
        coords = vector3(72.3, -1399.1, 28.4), -- Coords of shop
        distance = 7 -- Distance to show text ui prompt
    },

	{
		blip = true, 
        coords = vector3(-708.7, -152.1, 36.4),
		distance = 7
	},

	{
		blip = true,
		coords = vector3(-165.1, -302.4, 38.6),
		distance = 7
	},

	{
		blip = true,
		coords = vector3(428.7, -800.1, 28.5),
		distance = 7
	},

	{
		blip = true,
		coords = vector3(-829.4, -1073.7, 10.3),
		distance = 7
	},

	{
		blip = true,
		coords = vector3(-1449.1, -238.3, 48.8),
		distance = 7
	},

	{
		blip = true,
		coords = vector3(11.6, 6514.2, 30.9),
		distance = 7
	},

	{
		blip = true,
		coords = vector3(122.9, -222.2, 53.5),
		distance = 7
	},

	{
		blip = true,
		coords = vector3(1696.3, 4829.3, 41.1),
		distance = 7
	},

	{
		blip = true,
		coords = vector3(618.1, 2759.6, 41.1),
		distance = 7
	},

    {
		blip = true,
		coords = vector3(1190.6, 2713.4, 37.2),
		distance = 7
	},

    {
		blip = true,
		coords = vector3(-1193.4, -772.3, 16.3),
		distance = 7
	},

    {
		blip = true,
		coords = vector3(-3172.5, 1048.1, 19.9),
		distance = 7
	},

	{
		blip = true,
		coords = vector3(-1108.4, 2708.9, 18.1),
		distance = 7
	},

	{
		blip = false,
		coords = vector3(300.6, -597.7, 42.1), -- Pillbox Hospital
		distance = 3.5
	},

	{
		blip = false,
		coords = vector3(461.4, -998.0, 30.2), -- MRPD Cloakroom
		distance = 3.5
	},

	{
		blip = false,
		coords = vector3(-1622.6, -1034.0, 13.1), -- Beach
		distance = 2.5
	},

	{
		blip = false,
		coords = vector3(1861.1, 3689.2, 34.2), -- Sandy PD
		distance = 2.5
	},

	{
		blip = false,
		coords = vector3(1834.5, 3690.5, 34.2), -- Sandy PD #2
		distance = 2.5
	},

	{
		blip = false,
		coords = vector3(1742.1, 2481.5, 45.7), -- Prison
		distance = 2.5
	},

	{
		blip = false,
		coords = vector3(516.8, 4823.5, -66.1), -- Submarine interior
		distance = 2.5
	},
}

Config.BarberShops = {
    {
        blip = true,
	    coords = vector3(-814.3, -183.8, 36.6),
        distance = 7
    },

    {
        blip = true,
	    coords = vector3(136.8, -1708.4, 28.3),
        distance = 7
    },

    {
        blip = true,
        coords = vector3(-1282.6, -1116.8, 6.0),
        distance = 7
    },

    {
        blip = true,
        coords = vector3(-1282.6, -1116.8, 6.0),
		distance = 7
    },

    {
        blip = true,
        coords = vector3(1931.5, 3729.7, 31.8),
        distance = 7
    },

    {
        blip = true,
        coords = vector3(1212.8, -472.9, 65.2),
        distance = 7
    },

    {
        blip = true,
        coords = vector3(-34.31, -154.99, 55.8),
        distance = 7		
    },

    {
        blip = true,
        coords = vector3(-278.1, 6228.5, 30.7),
        distance = 7
    },
}

Config.TattooShops = {
    {
        blip = true,
        coords = vector3(1322.6, -1651.9, 51.2),
        distance = 7
    },

    {
        blip = true,
        coords = vector3(-1153.6, -1425.6, 4.9),
        distance = 7
    },

    {
        blip = true,
        coords = vector3(322.1, 180.4, 103.5),
        distance = 7
    },

    {
        blip = true,
        coords = vector3(-3170.0, 1075.0, 20.8),
        distance = 7
    },

    {
        blip = true,
        coords = vector3(1864.6, 3747.7, 33.0),
        distance = 7
    },

    {
        blip = true,
        coords = vector3(-293.7, 6200.0, 31.4),
        distance = 7
    },
}