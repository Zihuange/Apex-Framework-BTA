/*/
File: QS_data_ao.sqf
Author:

	Quiksilver
	
Last modified:

	6/11/2022 A3 2.10 by Quiksilver
	
Description:

	AO Data
	
	[
		AO variable name,
		AO display name,
		AO location,
		custom function name,
		building coef,
		water coef,
		0,
		0,
		defendenabled,
		reinforceInfantry,
		reinforceVehicle
	]
__________________________________________________________________________/*/

_worldName = worldName;
if (_worldName isEqualTo 'Altis') exitWith {
	[
		[
			0,
			[
				['frini','Frini',[14592.6,20862.2,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['rodopoli','Rodopoli',[18841.3,16647.1,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['alikampos','Alikampos',[11131.3,14561.8,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['neochori','Neochori',[12366.6,14522.6,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['agios_dionysios','Agios Dionysios',[9225.12,15832.7,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['orino','Orino',[10435.3,17240.1,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['frini_woodlands','Frini Woodlands',[14160.4,22125.2,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['athira','Athira',[14061.2,18762,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['lakka','Lakka',[12311.6,15726.5,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['anthrakia','Anthrakia',[16678.8,16019.2,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['koroni','Koroni',[11777.2,18313.4,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1]
			]
		],
		[
			1,
			[
				['pyrsos','Pyrsos',[9210.46,19245.6,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['factory','Factory',[6176.12,16244.4,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['syrta','Syrta',[8632.13,18284.7,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['aristi turbines','Aristi Turbines',[7157.33,21537.8,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['dump','Dump',[5857.38,20086.1,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['negades','Negades',[4812.92,15981.8,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['abdera','Abdera',[9519.41,20316,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['kore','Kore',[7215.03,16510.2,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['oreokastro','Oreokastro',[4658.99,21372.8,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['galati_outpost','Galati Outpost',[9958.98,19353.6,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['fotia_turbines','Fotia Turbines',[4059.06,19228.8,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['krya_nera','Krya Nera',[10135.1,21912.4,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['faros_turbines','Faros Turbines',[8444,23073.6,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1]
			]
		],
		[
			2,
			[
				['sofia_radar_station','Sofia Radar Station',[25133,21835.6,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['research_facility','Research Facility',[20948.4,19258.8,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['molos','Molos',[27006.6,23292.7,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['nidasos_woodlands','Nidasos Woodlands',[23926.2,22597.7,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['limni','Limni',[20901.9,14626.3,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['paros','Paros',[20966.4,16968.8,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['gatolia_solar_farm','Gatolia Solar Farm',[27076.5,21451.1,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['sofia_powerplant','Sofia Powerplant',[25425.5,20339,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['delfinaki_outpost','Delfinaki Outpost',[23572.4,21102.6,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1]
			]
		],
		[
			3,
			[
				['feres','Feres',[21688.6,7616.58,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['chalkeia','Chalkeia',[20275.4,11711.9,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['charkia','Charkia',[18152.6,15324.9,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['didymos_turbines','Didymos Turbines',[18731.3,10203.4,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['dorida','Dorida',[19402.1,13250,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['faronaki','Faronaki',[16558.3,10857.8,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['selakano_outpost','Selakano Outpost',[20085.9,6731.95,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['panagia','Panagia',[20517.3,8867.35,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1]
			]
		],
		[
			4,
			[
				['skopos_castle','Skopos Castle',[11207.8,8715.31,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['zaros_power_station','Zaros Power Station',[8259.75,10925.2,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['zaros','Zaros',[9048.96,11961,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['eginio','Eginio',[11565.7,7049.68,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['panochori','Panochori',[5096.04,11247.4,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['the_stadium','The Stadium',[5479.61,14988.7,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['vikos_outpost','Vikos Outpost',[12300.2,8875.71,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['athanos','Athanos',[4238.88,10789.7,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['south_kavala','South Kavala',[3704.8,12198.2,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['north_kavala','North Kavala',[4030.79,14149.2,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['topolia','Topolia',[7361.48,15438.3,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['therisa','Therisa',[10505.5,12264.2,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1]
			]
		]
	]
};
if (_worldName isEqualTo 'Tanoa') exitWith {
	[
		[
			0,
			[
				['regina','Regina',[5222.53,8711.61,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['saintjulien','Saint-Julien',[5675.88,11261.2,0],'QS_fnc_aoCustomize',2,1,0,0,1,1,1],
				['nicolet','Nicolet',[6510.67,12645.5,0],'QS_fnc_aoCustomize',2,1,0,0,1,1,1],
				['saintpaul','Saint-Paul',[8257.41,13379.5,0],'QS_fnc_aoCustomize',2,1,0,0,1,1,1],
				['la_rochelle','La Rochelle',[9623.4,13300.7,0],'QS_fnc_aoCustomize',3,1,0,0,1,1,1],
				['la_rochelle_aerodrome','La Rochelle Aerodrome',[11768.5,12801.6,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['ravita_island','Ravi-ta Island',[12708.6,14145.8,0],'QS_fnc_aoCustomize',1,1,0,0,0,0,0],
				['blue_pearl_industrial_port','Blue Pearl Industrial Port',[13767.8,11696.5,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['mont_tanoa','Mont Tanoa',[10096.7,11792.6,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['red_spring_surface_mine','Red Spring Surface Mine',[12002.3,10364.3,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['vatukoulo','Vatukoulo',[14084.3,9945.03,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['vagalala','Vagalala',[11038.2,9778.26,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['tanouka','Tanouka',[8905.85,10192.9,0],'QS_fnc_aoCustomize',3,0,0,0,1,1,1],
				['kotomo','Kotomo',[10935.4,6286.21,0],'QS_fnc_aoCustomize',2,1,0,0,1,1,1],
				['oumere','Oumere',[12798.9,7453.29,0],'QS_fnc_aoCustomize',2,1,0,0,1,1,1],
				['luganville','Luganville',[13921.9,8394.79,0],'QS_fnc_aoCustomize',2,1,0,0,1,1,1],
				['lumberyard','Lumberyard',[9301.31,7572.97,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['plantation','Plantation',[11042.8,7945.96,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['west_tanouka','West Tanouka',[7805.6,10590.4,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1]
			]
		],
		[
			1,
			[
				['harcourt','Harcourt',[11239,5214.64,0],'QS_fnc_aoCustomize',2,1,0,0,1,1,1],
				['losi','Losi',[10187.5,5012.03,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['moddergat','Moddergat',[9353.84,4039.24,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['blerick','Blerick',[10358.5,2664,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['lijnhaven','Lijnhaven',[11647,2780.15,0],'QS_fnc_aoCustomize',2,1,0,0,1,1,1],
				['doodstil','Doodstil',[12816.4,4769.52,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1]
			]
		],
		[
			2,
			[
				['savaka','Savaka',[6872.22,4248.95,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['katkoula','Katkoula',[5488.15,4071.88,0],'QS_fnc_aoCustomize',2,1,0,0,1,1,1],
				['lailai','Lailai',[3623.34,2167.6,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['yanukka','Yanukka',[3158.66,3441,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['imuri_island','Imuri Island',[1670.42,881.739,0],'QS_fnc_aoCustomize',0,1,0,0,0,0,0],
				['bala_airstrip','Bala Airstrip',[2074.75,3912.15,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['namuvaka','Namuvaka',[2800.72,5813.06,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['balavu','Balavu',[2579.1,7268.67,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['tavu','Tavu',[1040.01,7664.4,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['sosovu_island','Sosovu Island',[2845.26,9193.73,0],'QS_fnc_aoCustomize',0,1,0,0,0,0,0]
			]
		],
		[
			3,
			[
				['belfort','Belfort',[3034.46,11275.3,0],'QS_fnc_aoCustomize',2,1,0,0,1,1,1],
				['tuvanaka','Tuvanaka',[1846.75,11989.1,0],'QS_fnc_aoCustomize',2,1,0,0,1,1,1],
				['ouaoue','Oua-Oue',[5707.42,12421.8,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['tuvanaka_airbase','Tuvanaka Airbase',[2135.22,13181.4,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['camp_remnants','Camp Remnants',[3842.23,13695.4,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['galili','Galili',[8113.42,11957.1,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1]
			]
		]
	]
};
if (_worldName isEqualTo 'Malden') exitWith {
	[
		[
			0,
			[
				['old_military_base','Old military base',[6089.62,10793.2,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['radio_station','Radio Station',[7042.5,10104.2,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['moray','Moray',[933.491,12078.6,0],'QS_fnc_aoCustomize',1,1,0,0,0,0,0],
				['lolisse','Lolisse',[5543.27,11193.7,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['wooded_valley','Wooded Valley',[5530.5,10005.7,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['saint_louis','Saint Louis',[7134.15,8965.27,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['larche','Larche',[6029.41,8630.36,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['mont_chauve','Mont Chauve',[5047.87,9098.88,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['goisse','Goisse',[3611.05,8487.62,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['saint_jean','Saint Jean',[4735.55,8141.12,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['la_trinite','La Trinite',[7242.78,7930.1,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['dourdan','Dourdan',[7042.66,7130.03,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['arudy','Arudy',[5548.68,7019.2,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['la_pessagne','La Pessagne',[3111.23,6371.96,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['feas','Feas',[4371.53,6898.66,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['houdan','Houdan',[7120.14,6069.77,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1]
			]
		],
		[
			1,
			[
				['island_military_base','Island military base',[9754.7,3949.39,0],'QS_fnc_aoCustomize',1,1,0,0,0,0,0],
				['le_port','Le Port',[8251.1,3145.07,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['chapoi','Chapoi',[5867.74,3523.77,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['cancon','Cancon',[5398.12,2790.64,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['crossroads','Crossroads',[7918.63,4091.98,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['la_riviere','La Riviere',[3842.72,3240.45,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['sainte_marie','Sainte Marie',[5379.19,4353.86,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['faro','Faro',[1902.01,2156.16,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['corton_woodland','Corton Woodland',[3173.67,5535.26,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['eperon_valley','Eperon Valley',[4700.29,5674.06,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['plateau','Plateau',[5825.52,6345.95,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['point_lookout','Point Lookout',[11425.1,4368.71,0],'QS_fnc_aoCustomize',1,1,0,0,0,0,0],
				['midi_valley','Midi Valley',[6371.65,5361.49,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['arette_hills','Arette Hills',[2459.02,4346.19,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1]
			]
		]
	]
};
if (_worldName isEqualTo 'Stratis') exitWith {
	[
		[
			0,
			[
				['xiros_coastline','Xiros Coastline',[3900.1,7010.56,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['lz_baldy','LZ Baldy',[4604.43,5296.74,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['kamino_firing_range','Kamino Firing Range',[6449.82,5376.92,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['air_station_mike26','Air Station Mike-26',[4356.56,3819.49,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['camp_tempest','Camp Tempest',[1992.58,3527.58,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['camp_maxwell','Camp Maxwell',[3273.13,2949.82,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['spartan_coastline','Spartan Coastline',[2708.2,964.942,0],'QS_fnc_aoCustomize',0,1,0,0,0,1,1]
			]
		],
		[
			1,
			[
				['camp_rogain','Camp Rogain',[4996.81,5928.56,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['agia_marina','Agia Marina',[3007.73,5994.73,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['kamino_valley','Kamino Valley',[5789.79,4543.88,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['charlie26','Charlie-26',[5205.6,4996.62,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['ranger_valley','Ranger Valley',[3162.09,4135.07,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['girna','Girna',[2046.37,2715.57,0],'QS_fnc_aoCustomize',1,1,0,0,1,1,1],
				['lz_connor','LZ Connor',[2981.73,1870.31,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1]
			]
		]
	]
};
if (_worldName isEqualTo 'Enoch') exitWith {
	[
		[
			0,
			[
				['lukow','Lukow',[3543.5,11956,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['branzow_military_base','Branzow Military Base',[2102.43,11010.3,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['bielawa','Bielawa',[1634.77,9569.02,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['gliniska','Gliniska',[5063.05,9999.29,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['sobotka','Sobotka',[6297.63,10247.6,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['brena','Brena',[6511.11,11293.7,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['kolembrody','Kolembrody',[8431.23,12018,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['nidek','Nidek',[6075.37,8169.23,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['radacz','Radacz',[4038.24,7967.7,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['topolin_farms','Topolin Farms',[1341.16,7904.08,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1]
			]
		],
		[
			1,
			[
				['zalesie','Zalesie',[900.4,5474.43,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['topolin','Topolin',[1859.42,7156.54,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['adamow','Adamow',[3150.43,6819.21,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['muratyn','Muratyn',[4555.1,6487.41,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['lipina','Lipina',[5996.71,6828.78,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['huta','Huta',[5159.8,5511.28,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['nadbor','Nadbor',[6149.1,4130.38,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['swarog','Swarog',[5087.63,2164.47,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1]
			]
		],
		[
			2,
			[
				['grabin','Grabin',[10846.9,11121.7,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['tarnow','Tarnow',[9372.92,10685.6,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['sitnik','Sitnik',[11495.7,9598.7,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['borek','Borek',[9851.51,8498.16,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['zapadlisko','Zapadlisko',[8147.45,8725.8,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['radunin','Radunin',[7341.45,6271.45,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['lembork','Lembork',[8761.65,6640.22,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['karlin','Karlin',[10252.3,6821.98,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['power_plant','Power Plant',[11567.9,7090.72,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['roztoka','Roztoka',[7705.89,5223.32,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['wrzeszcz''Wrzeszcz',[9098.17,4396.06,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['gieraltow','Gieraltow',[11306.3,4377.55,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1],
				['dolnik','Dolnik',[11400.3,593.375,0],'QS_fnc_aoCustomize',1,0,0,0,1,1,1]
			]
		]
	]
};
if (_worldName isEqualTo 'Cam_Lao_Nam') exitWith {
	[
		[
			0,
			[
				['Soc_Trang','朔庄',[14257.2,17931,86.5591],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['Mekong_Delta','湄公河三角洲',[15709.2,2154.23,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['Nhen_Den','然田',[13610.7,3569.67,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['Can_Tho','芹苴',[13293.9,4783.93,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['Comms_Hill','通讯山',[11371.9,5660.53,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['FSB_Quan_Loi','火箭城火力支援基地',[11621.2,6760.2,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['A_Shau_Valley','阿绍谷',[12619.8,9425.19,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				//['FSB_Berchtesgaden','贝希特斯加登火力支援基地',[13731.1,8364.69,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['A_Luoi','阿雷县',[13096.6,8364.69,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['FOB3_Mai_Loc','迈禄第3前进作战基地',[14769.7,9562.53,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Hue_Citadel','顺化京城',[16977,10081.3,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Hue','顺化',[17343.8,8954.73,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['NaLai','纳莱',[18169.7,10041,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Lho_Berro_Ghi','洛贝罗吉',[19087,9376.01,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['FOB1_Phu_Bai','符牌第1前进作战基地',[18634.7,8357.3,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Da_Nang','岘港',[19867.8,7003.5,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['Marble_Mtn','五行山',[20070.2,5878.76,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['Pat_Mep','帕梅',[19235.4,4200.24,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['Ba_Ria','巴地',[18087.1,4756.77,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Saigon','西贡',[16355.3,3660.25,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Cu_Chi','古芝',[14987.2,5460.64,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1]
			]
		],
		[
			1,
			[
				['Lang_Mau','郎茂',[14748.1,11054.5,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['FSB_Khe_Gio','溪贾火力支援基地',[16240.6,11072.7,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Sam_Song','芩山',[16885.9,12033,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['Khe_Gio','溪贾',[15469.4,11871.7,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Hai_Phong','海防',[15327.7,13419.4,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['Ha_Long_Navy_Base','下龙海军基地',[14669.8,15564,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['Dong_Xa','东社',[15817.9,17960.9,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['Xom_Ram','芩兰',[14434.5,18122.4,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Tong_Moe','同莫',[13350.8,18828.3,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Tieng_Tai','前塞',[12393.1,19525.9,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Son_Tay','战俘营',[12061.9,17977.3,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Phao_Noi','炮内',[12270.3,16761.6,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Bach_Dang','百当',[13030.6,15752.8,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Gia_Lam_Airbase','嘉林空军基地',[11276.9,14629,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['West_Hanoi','西河内',[11593.9,13269.2,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Hanoi','河内',[12891,13347.4,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['North_Hanoi','北河内',[13885.6,14037.5,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Camp_Phoang_Thi','峰施营地',[14350.8,12935.5,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Banh_Trung','彭中',[12321.3,11020,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1]
			]
		],
		[
			2,
			[
				['Maxwell_Field','麦克斯韦空军基地',[2242.05,4208.47,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Phu_Quoc_Port','富国港',[6873.81,4347.21,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['Long_Hai','隆海',[8602.25,5646.57,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['Kiem_Tra','建查',[10135.2,7261.3,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Niem_Tin','念静',[10614.8,8390.82,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Nuoc_Bun','诺邦',[9030.75,9127.31,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Che','制',[8637.28,10726.2,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Attapeu','阿速坡省',[7436.15,11791.4,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Bru','布鲁',[8716.58,13690.7,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['MSS_Leghorn','莱戈恩',[5346.74,13646.1,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Ban_Len','本莲',[3255.96,12653.2,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Plain_Of_Jars','石缸平原',[1589.04,12506.2,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Nga_Tu','硪酋',[2812.99,11451.7,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Xo_Xanh','徐晨',[1639.05,10636.2,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Bai_Bien_Dep','叶海滩',[1377.02,9473.87,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['Sihanoukville','西哈努克城',[3194.05,8649.42,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['Thung_Lung_Cao','从隆高',[5082.96,9534.62,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1],
				['Yen_Tinh','安靖',[6489.02,9221.87,0],'QS_fnc_aoCustomize',0,1,0,0,1,1,1]
			],
			3,
			[
				['Dao_Trai','道才',[6101.88,15102.9,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Ket_Thuc','结束',[7625.57,16977.5,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Thud_Ridge','雷电山脊',[9138.41,16422.2,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Lai_Chau','莱州',[3894.1,19586.2,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Nodal_Lho','洛节点',[1679.49,19134.5,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Kenglat','肯勒',[2341.01,17491.5,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Sang_Ha','桑河',[2101.71,15540.8,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Bam_Bon','班蓬',[1240.72,15312.1,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Com_Ngon','兼言',[1294.89,13808.8,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Nong_Khiaw','琅多',[4810.63,15058,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1],
				['Vong_Xo','芒徐',[5521.49,17360,0],'QS_fnc_aoCustomize',0,0,0,0,1,1,1]
			]
		]
	]
};
[]