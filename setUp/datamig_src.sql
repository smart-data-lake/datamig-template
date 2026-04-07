--
-- PostgreSQL database dump
--

\restrict f0Mfbmtk9EzxfxaWKrEgxyir0cZ5XUkPZ6BIJitwfIghn3elKF1175XEvZ4bc1D

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: datamig_src; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA datamig_src;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cities; Type: TABLE; Schema: datamig_src; Owner: -
--

CREATE TABLE datamig_src.cities (
    city character varying(1024),
    city_ascii character varying(1024),
    latitude real,
    longitude real,
    country_name character varying(1024),
    iso2 character varying(1024),
    region_name character varying(1024),
    population integer,
    id integer CONSTRAINT worldcities_id_not_null NOT NULL
);


--
-- Name: country_region; Type: TABLE; Schema: datamig_src; Owner: -
--

CREATE TABLE datamig_src.country_region (
    iso_3166_1 character(2) NOT NULL,
    country_name character varying(1024),
    iso_3166_2 character varying(4) NOT NULL,
    region_name character varying(1024)
);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: datamig_src; Owner: -
--

COPY datamig_src.cities (city, city_ascii, latitude, longitude, country_name, iso2, region_name, population, id) FROM stdin;
Tokyo	Tokyo	35.687	139.7495	Japan	JP	Tōkyō	37785000	1392685764
Jakarta	Jakarta	-6.175	106.8275	Indonesia	ID	Jakarta	33756000	1360771077
Delhi	Delhi	28.61	77.23	India	IN	Delhi	32226000	1356872604
Guangzhou	Guangzhou	23.13	113.26	China	CN	Guangdong	26940000	1156237133
Mumbai	Mumbai	19.0761	72.8775	India	IN	Mahārāshtra	24973000	1356226629
Manila	Manila	14.5958	120.9772	Philippines	PH	Manila	24922000	1608618140
São Paulo	Sao Paulo	-23.5504	-46.6339	Brazil	BR	São Paulo	23086000	1076532519
Seoul	Seoul	37.5667	126.9833	Korea, South	KR	Seoul	23016000	1410836482
Mexico City	Mexico City	19.4333	-99.1333	Mexico	MX	Ciudad de México	21804000	1484247881
Kolkāta	Kolkata	22.5675	88.37	India	IN	West Bengal	21747000	1356060520
Cairo	Cairo	30.0444	31.2358	Egypt	EG	Al Qāhirah	20296000	1818253931
Karachi	Karachi	24.86	67.01	Pakistan	PK	Sindh	20249000	1586129469
Dhaka	Dhaka	23.7289	90.3944	Bangladesh	BD	Dhaka	19134000	1050529279
New York	New York	40.6943	-73.9249	United States	US	New York	18832416	1840034016
Bangkok	Bangkok	13.7525	100.4942	Thailand	TH	Krung Thep Maha Nakhon	18007000	1764068610
Moscow	Moscow	55.7506	37.6175	Russia	RU	Moskva	17332000	1643318494
Buenos Aires	Buenos Aires	-34.6036	-58.3814	Argentina	AR	Buenos Aires, Ciudad Autónoma de	16710000	1032717330
Lagos	Lagos	6.455	3.3841	Nigeria	NG	Lagos	16637000	1566593751
Bangalore	Bangalore	12.9789	77.5917	India	IN	Karnātaka	15386000	1356410365
Ho Chi Minh City	Ho Chi Minh City	10.7756	106.7019	Vietnam	VN	Hồ Chí Minh	15136000	1704774326
Ōsaka	Osaka	34.6939	135.5022	Japan	JP	Ōsaka	15126000	1392419823
Istanbul	Istanbul	41.0136	28.955	Turkey	TR	İstanbul	14441000	1792756324
Tehran	Tehran	35.6889	51.3897	Iran	IR	Tehrān	14148000	1364305026
Kinshasa	Kinshasa	-4.3219	15.3119	Congo (Kinshasa)	CD	Kinshasa	12836000	1180000363
Rio de Janeiro	Rio de Janeiro	-22.9111	-43.2056	Brazil	BR	Rio de Janeiro	12592000	1076887657
Lahore	Lahore	31.5497	74.3436	Pakistan	PK	Punjab	12306000	1586801463
Los Angeles	Los Angeles	34.1141	-118.4068	United States	US	California	11885717	1840020491
London	London	51.5072	-0.1275	United Kingdom	GB	London, City of	11262000	1826645935
Paris	Paris	48.8567	2.3522	France	FR	Île-de-France	11060000	1250015082
Lima	Lima	-12.06	-77.0375	Peru	PE	Lima	10320000	1604728603
Luanda	Luanda	-8.8383	13.2344	Angola	AO	Luanda	9051000	1024949724
Kuala Lumpur	Kuala Lumpur	3.1686	101.698	Malaysia	MY	Kuala Lumpur	8911000	1458988644
Hanoi	Hanoi	21	105.85	Vietnam	VN	Hà Nội	8587100	1704413791
Chicago	Chicago	41.8375	-87.6866	United States	US	Illinois	8489066	1840000494
Bogotá	Bogota	4.7111	-74.0722	Colombia	CO	Bogotá	8034649	1170483426
Dar es Salaam	Dar es Salaam	-6.8161	39.2803	Tanzania	TZ	Dar es Salaam	7962000	1834843853
Khartoum	Khartoum	15.6031	32.5265	Sudan	SD	Khartoum	7869000	1729268475
Johannesburg	Johannesburg	-26.2044	28.0456	South Africa	ZA	Gauteng	7860781	1710550792
Hong Kong	Hong Kong	22.3	114.2	Hong Kong	HK		7450000	1344982653
Riyadh	Riyadh	24.65	46.71	Saudi Arabia	SA	Ar Riyāḑ	7237000	1682999334
Santiago	Santiago	-33.4372	-70.6506	Chile	CL	Región Metropolitana	7171000	1152554349
Rangoon	Rangoon	16.795	96.16	Burma	MM	Yangon	6874000	1104616656
Surabaya	Surabaya	-7.2458	112.7378	Indonesia	ID	Jawa Timur	6556000	1360484663
Madrid	Madrid	40.4169	-3.7033	Spain	ES	Madrid	6211000	1724616994
Baghdad	Baghdad	33.3153	44.3661	Iraq	IQ	Baghdād	6183000	1368596238
Singapore	Singapore	1.3	103.8	Singapore	SG		5983000	1702341327
Ankara	Ankara	39.93	32.85	Turkey	TR	Ankara	5864049	1792572891
Douala	Douala	4.05	9.7	Cameroon	CM	Littoral	5768400	1120494607
Addis Ababa	Addis Ababa	9.03	38.74	Ethiopia	ET	Ādīs Ābeba	5704000	1231824991
Toronto	Toronto	43.7417	-79.3733	Canada	CA	Ontario	5647656	1124279679
Giza	Giza	29.987	31.2118	Egypt	EG	Al Jīzah	5598402	1818925479
Saint Petersburg	Saint Petersburg	59.9375	30.3086	Russia	RU	Sankt-Peterburg	5597763	1643616350
Nairobi	Nairobi	-1.2864	36.8172	Kenya	KE	Nairobi City	5545000	1404000661
Guadalajara	Guadalajara	20.6767	-103.3475	Mexico	MX	Jalisco	5525000	1484950208
Monterrey	Monterrey	25.6844	-100.3181	Mexico	MX	Nuevo León	5324281	1484559591
Melbourne	Melbourne	-37.8142	144.9631	Australia	AU	Victoria	5031195	1036533631
Abidjan	Abidjan	5.3364	-4.0267	Côte d’Ivoire	CI	Abidjan	4980000	1384207980
Alexandria	Alexandria	31.1975	29.8925	Egypt	EG	Al Iskandarīyah	4870000	1818695837
Sydney	Sydney	-33.8667	151.2	Australia	AU	New South Wales	4840600	1036074917
Barcelona	Barcelona	41.3833	2.1833	Spain	ES	Catalonia	4800000	1724594040
Cape Town	Cape Town	-33.9253	18.4239	South Africa	ZA	Western Cape	4770313	1710680650
Jeddah	Jeddah	21.5428	39.1728	Saudi Arabia	SA	Makkah al Mukarramah	4697000	1682926944
Berlin	Berlin	52.52	13.405	Germany	DE	Berlin	4679500	1276451290
Kabul	Kabul	34.5253	69.1783	Afghanistan	AF	Kābul	4273156	1004993580
Bamako	Bamako	12.6458	-7.9922	Mali	ML	Bamako	4227569	1466965925
Kano	Kano	12	8.5167	Nigeria	NG	Kano	4224966	1566422868
Amman	Amman	31.9497	35.9328	Jordan	JO	Al ‘Āşimah	4007526	1400522593
Kumasi	Kumasi	6.7	-1.625	Ghana	GH	Ashanti	3903480	1288181103
Abuja	Abuja	9.0667	7.4833	Nigeria	NG	Federal Capital Territory	3770000	1566342270
Mashhad	Mashhad	36.3264	59.5433	Iran	IR	Khorāsān-e Raẕavī	3700000	1364123206
Montréal	Montreal	45.5089	-73.5617	Canada	CA	Quebec	3675219	1124586170
Ibadan	Ibadan	7.3964	3.9167	Nigeria	NG	Oyo	3552000	1566366407
Busan	Busan	35.18	129.075	Korea, South	KR	Busan	3453198	1410601465
Boankra	Boankra	6.6919	-1.4051	Ghana	GH	Ashanti	3348000	1288164978
Dubai	Dubai	25.2631	55.2972	United Arab Emirates	AE	Dubayy	3331420	1784736618
Caracas	Caracas	10.4806	-66.9036	Venezuela	VE	Distrito Capital	3242000	1862748204
Kotla Qasim Khan	Kotla Qasim Khan	32.5833	73.75	Pakistan	PK	Punjab	3219375	1586216308
Casablanca	Casablanca	33.5333	-7.5833	Morocco	MA	Casablanca-Settat	3215935	1504175315
Faisalabad	Faisalabad	31.4167	73.0911	Pakistan	PK	Punjab	3203846	1586323916
Santa Cruz de la Sierra	Santa Cruz de la Sierra	-17.7892	-63.1975	Bolivia	BO	Santa Cruz	3151676	1068005036
Tashkent	Tashkent	41.3111	69.2797	Uzbekistan	UZ	Toshkent	3095498	1860331871
Guayaquil	Guayaquil	-2.19	-79.8875	Ecuador	EC	Guayas	3094420	1218802178
Ouagadougou	Ouagadougou	12.3686	-1.5275	Burkina Faso	BF	Centre	3063271	1854029208
Athens	Athens	37.9842	23.7281	Greece	GR	Attikí	3059764	1300715560
Guatemala City	Guatemala City	14.6417	-90.5133	Guatemala	GT	Guatemala	3014000	1320197916
Kuwait City	Kuwait City	29.3697	47.9783	Kuwait	KW	Al ‘Āşimah	2989000	1414102075
Kyiv	Kyiv	50.45	30.5233	Ukraine	UA	Kyiv, Misto	2952301	1804382913
Incheon	Incheon	37.4833	126.6333	Korea, South	KR	Incheon	2936117	1410160313
Mbuji-Mayi	Mbuji-Mayi	-6.15	23.6	Congo (Kinshasa)	CD	Kasaï Oriental	2892000	1180399586
Pyongyang	Pyongyang	39.0167	125.7475	Korea, North	KP	P’yŏngyang	2863000	1408738594
Taichung	Taichung	24.1439	120.6794	Taiwan	TW	Taichung	2850285	1158689622
Cali	Cali	3.4206	-76.5222	Colombia	CO	Valle del Cauca	2838333	1170417589
Pretoria	Pretoria	-25.7461	28.1881	South Africa	ZA	Gauteng	2818100	1710176249
Stuttgart	Stuttgart	48.7775	9.18	Germany	DE	Baden-Württemberg	2787724	1276171358
Rome	Rome	41.8931	12.4828	Italy	IT	Lazio	2748109	1380382862
Kaohsiung	Kaohsiung	22.615	120.2975	Taiwan	TW	Kaohsiung	2737660	1158331334
Maracaibo	Maracaibo	10.6333	-71.6333	Venezuela	VE	Zulia	2658355	1862072711
Munich	Munich	48.1375	11.575	Germany	DE	Bavaria	2606021	1276692352
Birmingham	Birmingham	52.48	-1.9025	United Kingdom	GB	Birmingham	2590363	1826423213
Valencia	Valencia	10.1833	-68	Venezuela	VE	Carabobo	2585202	1862309871
Damascus	Damascus	33.502	36.2981	Syria	SY	Dimashq	2584771	1760685964
Brazzaville	Brazzaville	-4.2667	15.2667	Congo (Brazzaville)	CG	Brazzaville	2557100	1178340306
Sanaa	Sanaa	15.3483	44.2064	Yemen	YE	Amānat al ‘Āşimah	2545000	1887750814
Medellín	Medellin	6.2308	-75.5906	Colombia	CO	Antioquia	2529403	1170680389
Hamburg	Hamburg	53.55	10	Germany	DE	Hamburg	2496600	1276041799
Taipei	Taipei	25.0375	121.5625	Taiwan	TW	Taipei	2494813	1158881289
Yaoundé	Yaounde	3.8667	11.5167	Cameroon	CM	Centre	2440462	1120298240
Mecca	Mecca	21.4225	39.8261	Saudi Arabia	SA	Makkah al Mukarramah	2427924	1682169241
Vancouver	Vancouver	49.25	-123.1	Canada	CA	British Columbia	2426160	1124825478
Beirut	Beirut	33.8981	35.5058	Lebanon	LB	Beyrouth	2421354	1422847713
Bucharest	Bucharest	44.4325	26.1039	Romania	RO	Bucureşti	2412530	1642414442
Algiers	Algiers	36.7325	3.0872	Algeria	DZ	Alger	2364230	1012973369
Baku	Baku	40.3667	49.8352	Azerbaijan	AZ	Bakı	2300500	1031946365
Almaty	Almaty	43.24	76.915	Kazakhstan	KZ	Almaty	2228675	1398351701
Vienna	Vienna	48.2083	16.3725	Austria	AT	Wien	2223236	1040261752
Eşfahān	Esfahan	32.6653	51.6703	Iran	IR	Eşfahān	2219343	1364023865
Awka	Awka	6.2069	7.0678	Nigeria	NG	Anambra	2171900	1566560581
Phnom Penh	Phnom Penh	11.5696	104.921	Cambodia	KH	Phnom Penh	2129371	1116260534
Mogadishu	Mogadishu	2.0392	45.3419	Somalia	SO	Banaadir	2120000	1706893395
Córdoba	Cordoba	-31.4167	-64.1833	Argentina	AR	Córdoba	2106734	1032803249
Havana	Havana	23.1367	-82.3589	Cuba	CU	La Habana	2089532	1192752771
Warsaw	Warsaw	52.23	21.0111	Poland	PL	Mazowieckie	2028000	1616024847
Aleppo	Aleppo	36.2319	37.1681	Syria	SY	Ḩalab	2003671	1760366651
Minsk	Minsk	53.9006	27.5586	Belarus	BY	Minsk	1992862	1112348503
Karaj	Karaj	35.8292	50.9675	Iran	IR	Alborz	1973470	1364258511
Tilburg	Tilburg	51.5572	5.0911	Netherlands	NL	Noord-Brabant	1944588	1528817379
San Juan	San Juan	18.3985	-66.061	Puerto Rico	PR	Puerto Rico	1809800	1630035577
Mosul	Mosul	36.3667	43.1167	Iraq	IQ	Nīnawá	1792000	1368194914
Quito	Quito	-0.22	-78.5125	Ecuador	EC	Pichincha	1763275	1218441993
Lusaka	Lusaka	-15.4167	28.2833	Zambia	ZM	Lusaka	1747152	1894157390
Maracay	Maracay	10.2469	-67.5961	Venezuela	VE	Aragua	1723236	1862284350
Masqaţ	Masqat	23.614	58.5911	Oman	OM	Masqaţ	1720000	1512001294
Montevideo	Montevideo	-34.9056	-56.1842	Uruguay	UY	Montevideo	1719453	1858107000
Budapest	Budapest	47.4983	19.0408	Hungary	HU	Budapest	1686222	1348611435
Kampala	Kampala	0.3136	32.5811	Uganda	UG	Kampala	1680600	1800406299
Conakry	Conakry	9.5092	-13.7122	Guinea	GN	Conakry	1667864	1324568159
Valencia	Valencia	39.47	-0.3764	Spain	ES	Valencia	1595000	1724981666
Yopougon	Yopougon	5.3748	-4.0867	Côte d’Ivoire	CI	Abidjan	1571065	1384759584
Shīrāz	Shiraz	29.61	52.5425	Iran	IR	Fārs	1565572	1364432238
Dushanbe	Dushanbe	38.5367	68.78	Tajikistan	TJ	Dushanbe	1564700	1762930616
Harare	Harare	-17.8292	31.0522	Zimbabwe	ZW	Harare	1558823	1716196799
Tabrīz	Tabriz	38.0817	46.2992	Iran	IR	Āz̄arbāyjān-e Sharqī	1558693	1364141756
San José	San Jose	9.9325	-84.08	Costa Rica	CR	San José	1543000	1188749877
San Salvador	San Salvador	13.6989	-89.1914	El Salvador	SV	San Salvador	1538525	1222647454
Lomé	Lome	6.1308	1.2153	Togo	TG	Maritime	1500000	1768409132
Niamey	Niamey	13.515	2.1175	Niger	NE	Niamey	1496260	1562932886
Amsterdam	Amsterdam	52.3728	4.8936	Netherlands	NL	Noord-Holland	1477213	1528355309
Auckland	Auckland	-36.8492	174.7653	New Zealand	NZ	Auckland	1470100	1554435911
Dakar	Dakar	14.6726	-17.432	Senegal	SN	Dakar	1438725	1686604760
Muscat	Muscat	23.6139	58.5922	Oman	OM	Masqaţ	1421409	1512035506
Kharkiv	Kharkiv	49.9925	36.2311	Ukraine	UA	Kharkivska Oblast	1421125	1804588111
Sofia	Sofia	42.6979	23.3217	Bulgaria	BG	Sofia-Grad	1404116	1100762037
Ulaanbaatar	Ulaanbaatar	47.9214	106.9055	Mongolia	MN	Ulaanbaatar	1396288	1496024767
Prague	Prague	50.0875	14.4214	Czechia	CZ	Praha	1384732	1203744823
Copenhagen	Copenhagen	55.6805	12.5615	Denmark	DK	Hovedstaden	1366301	1208763942
Helsinki	Helsinki	60.1708	24.9375	Finland	FI	Uusimaa	1360075	1246177997
Milan	Milan	45.4669	9.19	Italy	IT	Lombardy	1354196	1380724377
Santiago	Santiago	19.4572	-70.6889	Dominican Republic	DO	Cibao Norte	1343423	1214985348
Al Başrah	Al Basrah	30.515	47.81	Iraq	IQ	Al Başrah	1326564	1368714645
Calgary	Calgary	51.05	-114.0667	Canada	CA	Alberta	1306784	1124690423
Cacuaco	Cacuaco	-8.8053	13.2444	Angola	AO	Luanda	1279488	1024559448
Tangier	Tangier	35.7767	-5.8039	Morocco	MA	Tanger-Tétouan-Al Hoceïma	1275428	1504861504
Antananarivo	Antananarivo	-18.91	47.525	Madagascar	MG	Antananarivo	1275207	1450978461
Comayagüela	Comayaguela	14.098	-87.21	Honduras	HN	Francisco Morazán	1250000	1340762485
Brussels	Brussels	50.8467	4.3525	Belgium	BE	Brussels-Capital Region	1249597	1056469830
Barquisimeto	Barquisimeto	10.0636	-69.3347	Venezuela	VE	Lara	1240714	1862860739
Hargeysa	Hargeysa	9.56	44.065	Somalia	SO	Woqooyi Galbeed	1200000	1706832021
Baidoa	Baidoa	3.1167	43.65	Somalia	SO	Bay	1200000	1706563100
Belgrade	Belgrade	44.8178	20.4569	Serbia	RS	Beograd	1197714	1688374696
Doha	Doha	25.2867	51.5333	Qatar	QA	Ad Dawḩah	1186023	1634459660
Shymkent	Shymkent	42.3167	69.5958	Kazakhstan	KZ	Shymkent	1184113	1398791401
Tripoli	Tripoli	32.8872	13.1914	Libya	LY	Ţarābulus	1183000	1434201852
Tegucigalpa	Tegucigalpa	14.1057	-87.204	Honduras	HN	Francisco Morazán	1157509	1340344059
Kigali	Kigali	-1.9536	30.0606	Rwanda	RW	Kigali	1156663	1646923541
Edmonton	Edmonton	53.5344	-113.4903	Canada	CA	Alberta	1151635	1124290735
Bishkek	Bishkek	42.8667	74.5667	Kyrgyzstan	KG	Bishkek	1145044	1417191971
Bujumbura	Bujumbura	-3.3833	29.3667	Burundi	BI	Bujumbura Mairie	1143202	1108101689
Maputo	Maputo	-25.9153	32.5764	Mozambique	MZ	Maputo	1133200	1508074843
Santo Domingo	Santo Domingo	18.4764	-69.8933	Dominican Republic	DO	Ozama	1128678	1214636202
Tbilisi	Tbilisi	41.7225	44.7925	Georgia	GE	Tbilisi	1118035	1268203191
Fès	Fes	34.0433	-5.0033	Morocco	MA	Fès-Meknès	1112072	1504861997
Yerevan	Yerevan	40.1814	44.5144	Armenia	AM	Yerevan	1106300	1051074169
Sevilla	Sevilla	37.39	-5.99	Spain	ES	Andalusia	1100000	1724991838
Cologne	Cologne	50.9364	6.9528	Germany	DE	North Rhine-Westphalia	1087353	1276015998
Astana	Astana	51.1472	71.4222	Kazakhstan	KZ	Nur-Sultan	1078362	1398516045
Nouakchott	Nouakchott	18.0858	-15.9785	Mauritania	MR	Nouakchott Ouest	1077169	1478414984
Managua	Managua	12.1364	-86.2514	Nicaragua	NI	Managua	1051236	1558296252
Matola	Matola	-25.9667	32.4667	Mozambique	MZ	Maputo	1032197	1508768577
Ashgabat	Ashgabat	37.9375	58.38	Turkmenistan	TM	Aşgabat	1030063	1795049992
Monrovia	Monrovia	6.3133	-10.8014	Liberia	LR	Montserrado	1021762	1430477826
Odesa	Odesa	46.492	30.7081	Ukraine	UA	Odeska Oblast	1010537	1804178102
Namangan	Namangan	41.0011	71.6683	Uzbekistan	UZ	Namangan	1010000	1860894033
Stockholm	Stockholm	59.3275	18.0547	Sweden	SE	Stockholm	995574	1752425602
Lilongwe	Lilongwe	-13.9669	33.7873	Malawi	MW	Lilongwe	989318	1454688499
Port-au-Prince	Port-au-Prince	18.5425	-72.3386	Haiti	HT	Ouest	987310	1332401940
Dnipro	Dnipro	48.4675	35.04	Ukraine	UA	Dnipropetrovska Oblast	968502	1804152933
Marrakech	Marrakech	31.63	-8.0089	Morocco	MA	Marrakech-Safi	966987	1504172585
Asmara	Asmara	15.3358	38.9411	Eritrea	ER	Ma’ĭkel	963000	1232791236
Freetown	Freetown	8.4833	-13.2331	Sierra Leone	SL	Western Area	951000	1694085071
Santo Domingo Este	Santo Domingo Este	18.4855	-69.8734	Dominican Republic	DO	Ozama	948855	1214664832
Vientiane	Vientiane	17.98	102.63	Laos	LA	Viangchan	948487	1418732714
Sale	Sale	34.0333	-6.8	Morocco	MA	Rabat-Salé-Kénitra	945101	1504989034
Jerusalem	Jerusalem	31.7789	35.2256	Israel	IL	Jerusalem	936425	1376261644
Naples	Naples	40.8358	14.2486	Italy	IT	Campania	913462	1380646673
Donetsk	Donetsk	48.0028	37.8053	Ukraine	UA	Donetska Oblast	901645	1804963805
Bangui	Bangui	4.3733	18.5628	Central African Republic	CF	Bangui	889231	1140080881
Panama City	Panama City	8.9711	-79.5347	Panama	PA	Panamá	880691	1591672475
Kathmandu	Kathmandu	27.71	85.32	Nepal	NP		845767	1524589448
Turin	Turin	45.0792	7.6761	Italy	IT	Piedmont	841600	1380244627
N’Djamena	N'Djamena	12.1053	15.0447	Chad	TD	N’Djamena	807000	1148708596
Kraków	Krakow	50.0614	19.9372	Poland	PL	Małopolskie	804237	1616172264
Oran	Oran	35.6969	-0.6331	Algeria	DZ	Oran	803329	1012126319
Libreville	Libreville	0.3901	9.4544	Gabon	GA	Estuaire	797003	1266952885
Frankfurt	Frankfurt	50.1106	8.6822	Germany	DE	Hesse	775790	1276054552
Zagreb	Zagreb	45.8131	15.9772	Croatia	HR	Zagreb, Grad	767131	1191233290
Pikine	Pikine	14.744	-17.4021	Senegal	SN	Dakar	764597	1686165071
Baardheere	Baardheere	2.3447	42.2764	Somalia	SO	Gedo	755500	1706822684
Colombo	Colombo	6.9167	79.8333	Sri Lanka	LK	Western	752993	1144251314
Gdańsk	Gdansk	54.3475	18.6453	Poland	PL	Pomorskie	749786	1616406372
Manama	Manama	26.2233	50.5875	Bahrain	BH	Al ‘Āşimah	727000	1048989486
Lviv	Lviv	49.8425	24.0322	Ukraine	UA	Lvivska Oblast	717273	1804939658
Zaporizhzhia	Zaporizhzhia	47.85	35.1175	Ukraine	UA	Zaporizka Oblast	710052	1804644752
Oslo	Oslo	59.9133	10.7389	Norway	NO	Oslo	709037	1578324706
Cotonou	Cotonou	6.3667	2.4333	Benin	BJ	Littoral	679012	1204955174
Gothenburg	Gothenburg	57.7075	11.9675	Sweden	SE	Västra Götaland	674529	1752059374
Wrocław	Wroclaw	51.11	17.0325	Poland	PL	Dolnośląskie	672929	1616108520
Łódź	Lodz	51.7769	19.4547	Poland	PL	Łódzkie	670642	1616832750
Rotterdam	Rotterdam	51.92	4.48	Netherlands	NL	Zuid-Holland	664311	1528892850
Abomey-Calavi	Abomey-Calavi	6.4486	2.3556	Benin	BJ	Atlantique	655965	1204016569
Chisinau	Chisinau	47.0228	28.8353	Moldova	MD	Chişinău	639000	1498011437
Tallinn	Tallinn	59.4372	24.7453	Estonia	EE	Tallinn	638076	1233260021
Benghazi	Benghazi	32.1167	20.0667	Libya	LY	Banghāzī	631555	1434915572
Palermo	Palermo	38.1157	13.3613	Italy	IT	Sicilia	630167	1380428434
Riga	Riga	56.9475	24.1069	Latvia	LV	Rīga	605273	1428586192
Djibouti	Djibouti	11.5944	43.1481	Djibouti	DJ	Djibouti	603900	1262028958
Haifa	Haifa	32.8192	34.9992	Israel	IL	Haifa	600000	1376133727
Tunis	Tunis	36.8064	10.1817	Tunisia	TN	Tunis	599368	1788742103
Dublin	Dublin	53.3497	-6.2603	Ireland	IE	Dublin	592713	1372595407
Gaza	Gaza	31.5069	34.456	Gaza Strip	XG		590481	1916116052
Vilnius	Vilnius	54.6872	25.28	Lithuania	LT	Vilniaus Miestas	581475	1440887149
Kingston	Kingston	17.9714	-76.7931	Jamaica	JM	Kingston	580000	1388709177
Macau	Macau	22.2006	113.5461	Macau	MO		568700	1446227359
Antwerp	Antwerp	51.2178	4.4003	Belgium	BE	Flanders	565039	1056168623
Genoa	Genoa	44.4072	8.934	Italy	IT	Liguria	558745	1380716540
Lisbon	Lisbon	38.7122	-9.134	Portugal	PT	Lisboa	548703	1620619017
The Hague	The Hague	52.08	4.31	Netherlands	NL	Zuid-Holland	548320	1528799905
Poznań	Poznan	52.4083	16.9336	Poland	PL	Wielkopolskie	546859	1616725607
Carrefour	Carrefour	18.5333	-72.4	Haiti	HT	Ouest	511345	1332000098
Bissau	Bissau	11.85	-15.5667	Guinea-Bissau	GW	Bissau	492004	1624168850
Valletta	Valletta	35.8983	14.5125	Malta	MT	Valletta	480134	1470574399
Asunción	Asuncion	-25.2945	-57.6435	Paraguay	PY	Asunción	477346	1600057911
Bratislava	Bratislava	48.1447	17.1128	Slovakia	SK	Bratislava	475503	1703195001
Tel Aviv-Yafo	Tel Aviv-Yafo	32.08	34.78	Israel	IL	Tel Aviv	467875	1376401542
Juba	Juba	4.83	31.58	South Sudan	SS	Central Equatoria	459342	1728444337
Zürich	Zurich	47.3744	8.5411	Switzerland	CH	Zürich	448664	1756539143
Constantine	Constantine	36.35	6.6	Algeria	DZ	Constantine	448374	1012275076
Santiago de Cuba	Santiago de Cuba	20.0217	-75.8294	Cuba	CU	Santiago de Cuba	444851	1192766111
Windhoek	Windhoek	-22.57	17.0836	Namibia	NA	Khomas	431000	1516802003
Aves	Aves	41.3703	-8.4101	Portugal	PT	Porto	425411	1620507201
Skopje	Skopje	41.9961	21.4317	North Macedonia	MK	Skopje	422540	1807600615
Tirana	Tirana	41.3272	19.8186	Albania	AL	Tiranë	418495	1008162156
Banjul	Banjul	13.4581	-16.5786	Gambia, The	GM	Banjul	413397	1270723713
Sintra	Sintra	38.7974	-9.3904	Portugal	PT	Lisboa	385606	1620848791
Bharatpur	Bharatpur	27.6833	84.4333	Nepal	NP		369377	1524780273
Pétion-Ville	Petion-Ville	18.5098	-72.2856	Haiti	HT	Ouest	359615	1332051873
Gonaïves	Gonaives	19.4456	-72.6883	Haiti	HT	Artibonite	356324	1332384588
Pokhara	Pokhara	28.2097	83.9853	Nepal	NP	Gaṇḍakī	353841	1524416084
Maseru	Maseru	-29.31	27.48	Lesotho	LS	Maseru	343541	1426977668
Sfax	Sfax	34.74	10.76	Tunisia	TN	Sfax	341999	1788741658
Nicosia	Nicosia	35.1725	33.365	Cyprus	CY	Lefkosía	330000	1196944155
Saint-Denis	Saint-Denis	-20.8789	55.4481	Reunion	RE		319141	1638024662
Port Moresby	Port Moresby	-9.4789	147.1494	Papua New Guinea	PG	National Capital	317374	1598685395
Bor	Bor	6.2072	31.5591	South Sudan	SS	Jonglei	315351	1728186782
Sousse	Sousse	35.8333	10.6333	Tunisia	TN	Sousse	314071	1788927583
Ciudad del Este	Ciudad del Este	-25.5167	-54.6161	Paraguay	PY	Alto Paraná	308983	1600265252
Vila Nova de Gaia	Vila Nova de Gaia	41.1333	-8.6167	Portugal	PT	Porto	303824	1620040225
Malabo	Malabo	3.7456	8.7744	Equatorial Guinea	GQ	Bioko Norte	297000	1226861333
Batna	Batna	35.55	6.1667	Algeria	DZ	Batna	290645	1012093229
Sétif	Setif	36.19	5.41	Algeria	DZ	Sétif	288461	1012981116
San Lorenzo	San Lorenzo	-25.34	-57.52	Paraguay	PY	Central	287977	1600667303
Ljubljana	Ljubljana	46.0514	14.5061	Slovenia	SI	Ljubljana	284293	1705917455
Nassau	Nassau	25.0442	-77.3503	Bahamas, The	BS		274400	1044318561
Fort-de-France	Fort-de-France	14.6	-61.0667	Martinique	MQ		253995	1474969110
Godomè	Godome	6.3667	2.35	Benin	BJ	Atlantique	253262	1204027999
Pointe-à-Pitre	Pointe-a-Pitre	16.2411	-61.5331	Guadeloupe	GP		250952	1312460524
Banikoara	Banikoara	11.3	2.4333	Benin	BJ	Alibori	248621	1204495680
Sarajevo	Sarajevo	43.8564	18.4131	Bosnia and Herzegovina	BA	Bosnia and Herzegovina, Federation of	244000	1070966777
Paramaribo	Paramaribo	5.8522	-55.2039	Suriname	SR	Paramaribo	240924	1740518660
Gaborone	Gaborone	-24.6569	25.9086	Botswana	BW	Gaborone	235884	1072756768
Georgetown	Georgetown	6.8011	-58.155	Guyana	GY	Demerara-Mahaica	235017	1328160906
Porto	Porto	41.1495	-8.6108	Portugal	PT	Porto	231800	1620356810
Dili	Dili	-8.5594	125.5795	Timor-Leste	TL	Díli	222323	1626308942
Prizren	Prizren	42.2139	20.7397	Kosovo	XK	Prizren	220128	1901360309
Hebron	Hebron	31.5293	35.0938	West Bank	XW		201063	1934166495
Pristina	Pristina	42.6666	21.1724	Kosovo	XK	Prishtinë	198897	1901760068
Banja Luka	Banja Luka	44.7725	17.1925	Bosnia and Herzegovina	BA	Srpska, Republika	185042	1070859064
Nouméa	Noumea	-22.2625	166.4443	New Caledonia	NC	Province Sud	182341	1540958092
Podgorica	Podgorica	42.4414	19.2628	Montenegro	ME	Podgorica	172139	1499454516
Willemstad	Willemstad	12.108	-68.935	Curaçao	CW		150000	1531000000
Port Louis	Port Louis	-20.1644	57.5042	Mauritius	MU	Port Louis	149194	1480131261
Reykjavík	Reykjavik	64.1458	-21.9425	Iceland	IS	Reykjavík	139875	1352327190
Male	Male	4.1753	73.5089	Maldives	MV	Maale	133019	1462441685
Luxembourg	Luxembourg	49.6117	6.1319	Luxembourg	LU	Luxembourg	132780	1442262731
Papeete	Papeete	-17.5334	-149.5667	French Polynesia	PF	Îles du Vent	131695	1258907380
Maina	Maina	13.4692	144.7332	Guam	GU		122411	1316874021
Thimphu	Thimphu	27.4722	89.6361	Bhutan	BT	Thimphu	114551	1064010361
Manzini	Manzini	-26.495	31.388	Eswatini	SZ	Manzini	110508	1748177431
Bridgetown	Bridgetown	13.0969	-59.6131	Barbados	BB	Saint Michael	110000	1052274244
Chaguanas	Chaguanas	10.5167	-61.4	Trinidad and Tobago	TT	Chaguanas	101297	1780795054
Suva	Suva	-18.1333	178.4333	Fiji	FJ	Rewa	88271	1242615095
Honiara	Honiara	-9.4333	159.95	Solomon Islands	SB	Honiara	84520	1090737486
São Tomé	Sao Tome	0.3361	6.7306	Sao Tome and Principe	ST	Água Grande	71868	1678301324
Mamoudzou	Mamoudzou	-12.7806	45.2278	Mayotte	YT		71437	1175099654
Mindelo	Mindelo	16.886	-24.988	Cabo Verde	CV	São Vicente	70468	1132180389
Castries	Castries	14.0108	-60.9894	Saint Lucia	LC	Castries	70000	1662922505
Cayenne	Cayenne	4.933	-52.33	French Guiana	GF		61550	1254304969
Bandar Seri Begawan	Bandar Seri Begawan	4.8903	114.9422	Brunei	BN	Brunei dan Muara	50000	1096465895
Sharan	Sharan	33.1757	68.7304	Afghanistan	AF	Paktīkā	\N	1004273142
Nīlī	Nili	33.7218	66.1302	Afghanistan	AF	Dāykundī	\N	1004642532
Dəvəçi	Davaci	41.2012	48.9871	Azerbaijan	AZ	Şabran	\N	1031053363
Şərur	Sarur	39.5544	44.9826	Azerbaijan	AZ	Şərur	\N	1031386825
Qəbələ	Qabala	40.9825	47.8491	Azerbaijan	AZ	Qəbələ	\N	1031787201
Saidpur	Saidpur	25.8004	89	Bangladesh	BD	Rangpur	\N	1050512022
Isale	Isale	-3.3444	29.4833	Burundi	BI	Bujumbura Rural	\N	1108407022
Dogbo	Dogbo	6.8167	1.7833	Benin	BJ	Couffo	\N	1204497206
San Rafael	San Rafael	-16.7795	-60.6799	Bolivia	BO	Santa Cruz	\N	1068007535
Natal	Natal	-6.9838	-60.2699	Brazil	BR	Amazonas	\N	1076336975
Jaboatão	Jaboatao	-8.1803	-35.0014	Brazil	BR	Pernambuco	\N	1076000699
Crato	Crato	-7.4639	-63.04	Brazil	BR	Amazonas	\N	1076425706
Iguaçu	Iguacu	-22.74	-43.47	Brazil	BR	Rio de Janeiro	\N	1076339714
Sarpang	Sarpang	26.8639	90.2674	Bhutan	BT	Sarpang	\N	1064362339
Pemagatshel	Pemagatshel	27.0375	91.4039	Bhutan	BT	Pemagatshel	\N	1064215849
Tsimasham	Tsimasham	27.0989	89.536	Bhutan	BT	Chhukha	\N	1064167489
Gasa	Gasa	27.9167	89.6833	Bhutan	BT	Gasa	\N	1064761583
Haa	Haa	27.3825	89.285	Bhutan	BT	Haa	\N	1064717667
Lhuentse	Lhuentse	27.65	91.15	Bhutan	BT	Lhuentse	\N	1064227529
Tsirang	Tsirang	27.0219	90.1229	Bhutan	BT	Tsirang	\N	1064617460
Loango	Loango	-4.6561	11.8114	Congo (Brazzaville)	CG	Kouilou	\N	1178836764
Beidao	Beidao	34.602	105.918	China	CN	Gansu	\N	1156137209
Xiangshui	Xiangshui	26.5964	104.8314	China	CN	Guizhou	\N	1156328867
Nanyangcun	Nanyangcun	36.0819	114.3481	China	CN	Hebei	\N	1156660821
Igreja	Igreja	15.0339	-24.325	Cabo Verde	CV	Mosteiros	\N	1132174768
Nova Sintra	Nova Sintra	14.871	-24.696	Cabo Verde	CV	Brava	\N	1132634480
Cova Figueira	Cova Figueira	14.89	-24.294	Cabo Verde	CV	Santa Catarina do Fogo	\N	1132510430
Ribeira Brava	Ribeira Brava	16.615	-24.299	Cabo Verde	CV	Ribeira Brava	\N	1132498214
Erfurt	Erfurt	50.9781	11.0289	Germany	DE	Thuringia	\N	1276924655
Fuglafjørður	Fuglafjordhur	62.2448	-6.815	Faroe Islands	FO	Fuglafjarður	\N	1234308038
Sumba	Sumba	61.4055	-6.709	Faroe Islands	FO	Sumba	\N	1234926212
Viðareiði	Vidhareidhi	62.36	-6.5313	Faroe Islands	FO	Viðareiði	\N	1234512915
Eiði	Eidhi	62.2995	-7.0924	Faroe Islands	FO	Eiði	\N	1234150922
Vestmanna	Vestmanna	62.1548	-7.169	Faroe Islands	FO	Vestmanna	\N	1234694837
Strendur	Strendur	62.1096	-6.7617	Faroe Islands	FO	Sjóvar	\N	1234814533
Húsavík	Husavik	61.8099	-6.6813	Faroe Islands	FO	Húsavík	\N	1234224518
Goaso	Goaso	6.8036	-2.5172	Ghana	GH	Ahafo	\N	1288616024
Sekondi	Sekondi	4.9433	-1.704	Ghana	GH	Western	\N	1288186231
Dambai	Dambai	8.0662	0.1795	Ghana	GH	Oti	\N	1288521614
Sefwi Wiawso	Sefwi Wiawso	6.2058	-2.4894	Ghana	GH	Western North	\N	1288994228
King Edward Point	King Edward Point	-54.2833	-36.5	South Georgia And South Sandwich Islands	GS		\N	1239048838
Pinrang	Pinrang	-3.7857	119.6522	Indonesia	ID	Sulawesi Selatan	\N	1360941841
Trim	Trim	53.555	-6.7917	Ireland	IE	Meath	\N	1372676556
Jaitpura	Jaitpura	26.9231	75.808	India	IN	Rājasthān	\N	1356971126
Rājapālaiyam	Rajapalaiyam	9.4204	77.58	India	IN	Tamil Nādu	\N	1356110350
Navsāri	Navsari	20.8504	72.92	India	IN	Gujarāt	\N	1356120513
Tonk	Tonk	26.1505	75.79	India	IN	Rājasthān	\N	1356991408
Hubli	Hubli	15.355	75.1362	India	IN	Karnātaka	\N	1356102365
Al Kūt	Al Kut	32.4907	45.8304	Iraq	IQ	Wāsiţ	\N	1368569694
Sārī	Sari	36.5633	53.0601	Iran	IR	Māzandarān	\N	1364501878
Īlām	Ilam	33.6374	46.4227	Iran	IR	Īlām	\N	1364655025
Nyamira	Nyamira	-0.5633	34.9358	Kenya	KE	Nyamira	\N	1404000104
Siaya	Siaya	0.0607	34.2881	Kenya	KE	Siaya	\N	1404162576
Murang’a	Murang'a	-0.721	37.1526	Kenya	KE	Murang’a	\N	1404066738
Ol Kalou	Ol Kalou	-0.2643	36.3788	Kenya	KE	Nyandarua	\N	1404930645
Sotik Post	Sotik Post	-0.7813	35.3416	Kenya	KE	Bomet	\N	1404087664
Kapenguria	Kapenguria	1.2389	35.1119	Kenya	KE	West Pokot	\N	1404228137
Kabarnet	Kabarnet	0.4919	35.743	Kenya	KE	Baringo	\N	1404620707
Migori	Migori	-1.0634	34.4731	Kenya	KE	Migori	\N	1404478510
Pailin	Pailin	12.8489	102.6093	Cambodia	KH	Pailin	\N	1116050327
Ta Khmau	Ta Khmau	11.4833	104.95	Cambodia	KH	Kandal	\N	1116571704
Munha-dong	Munha-dong	39.3813	127.2517	Korea, North	KP	Kangwŏn	\N	1408979215
Sil-li	Sil-li	39.488	125.464	Korea, North	KP	P’yŏngnam	\N	1408767958
Muan	Muan	34.9897	126.4714	Korea, South	KR	Jeonnam	\N	1410001061
Hongseong	Hongseong	36.6009	126.665	Korea, South	KR	Chungnam	\N	1410822139
Anouvông	Anouvong	18.8989	103.0919	Laos	LA	Xaisômboun	\N	1418294155
Xékong	Xekong	15.3503	106.7286	Laos	LA	Xékong	\N	1418000082
Phôn-Hông	Phon-Hong	18.4953	102.4153	Laos	LA	Viangchan	\N	1418592644
Qacha’s Nek	Qacha's Nek	-30.1167	28.6833	Lesotho	LS	Qacha’s Nek	\N	1426361264
Mersch	Mersch	49.75	6.1	Luxembourg	LU	Mersch	\N	1442283324
Redange-sur-Attert	Redange-sur-Attert	49.7652	5.8894	Luxembourg	LU	Redange	\N	1442099691
Idrī	Idri	27.4471	13.0517	Libya	LY	Wādī ash Shāţi’	\N	1434443323
Cocieri	Cocieri	47.3	29.1167	Moldova	MD	Dubăsari	\N	1498580757
Lipkovo	Lipkovo	42.1553	21.5875	North Macedonia	MK	Lipkovo	\N	1807754347
Ilinden	Ilinden	41.9945	21.58	North Macedonia	MK	Ilinden	\N	1807767601
Resen	Resen	41.0893	21.0109	North Macedonia	MK	Resen	\N	1807384915
Makedonska Kamenica	Makedonska Kamenica	42.0208	22.5876	North Macedonia	MK	Makedonska Kamenica	\N	1807768534
Pakokku	Pakokku	21.332	95.0866	Burma	MM	Magway	\N	1104161315
Dalandzadgad	Dalandzadgad	43.5708	104.425	Mongolia	MN	Ömnögovĭ	\N	1496141284
Tevragh Zeina	Tevragh Zeina	18.0989	-15.9885	Mauritania	MR	Nouakchott Ouest	\N	1478902195
Plymouth	Plymouth	16.7064	-62.2158	Montserrat	MS	Saint Anthony	\N	1500711935
Santa Luċija	Santa Lucija	36.0431	14.2172	Malta	MT	Santa Luċija	\N	1470880833
Rasdhoo	Rasdhoo	4.2631	72.9919	Maldives	MV	Ariatholhu Uthuruburi	\N	1462000003
Dhihdhoo	Dhihdhoo	6.8874	73.114	Maldives	MV	Thiladhunmathee Uthuruburi	\N	1462109783
Muli	Muli	2.9217	73.5811	Maldives	MV	Mulakatholhu	\N	1462436531
Fonadhoo	Fonadhoo	1.8342	73.5031	Maldives	MV	Hahdhunmathi	\N	1462000001
Nilandhoo	Nilandhoo	3.0567	72.89	Maldives	MV	Nilandheatholhu Uthuruburi	\N	1462000005
Thulusdhoo	Thulusdhoo	4.3742	73.6517	Maldives	MV	Maaleatholhu	\N	1462000004
Balaka	Balaka	-14.9889	34.9591	Malawi	MW	Balaka	\N	1454732693
Neno	Neno	-15.3981	34.6534	Malawi	MW	Neno	\N	1454089137
Chikwawa	Chikwawa	-16.035	34.801	Malawi	MW	Chikwawa	\N	1454343925
Las Delicias	Las Delicias	28.2	-105.5	Mexico	MX	Chihuahua	\N	1484513329
Wé	We	-20.9	167.2667	New Caledonia	NC	Province Îles	\N	1540672599
Abakaliki	Abakaliki	6.3249	8.1137	Nigeria	NG	Ebonyi	\N	1566879878
Yenagoa	Yenagoa	4.9267	6.2676	Nigeria	NG	Bayelsa	\N	1566468984
Gombe	Gombe	10.2904	11.17	Nigeria	NG	Gombe	\N	1566855445
Isemi-Ile	Isemi-Ile	7.97	3.59	Nigeria	NG	Oyo	\N	1566369938
Jitpur	Jitpur	27.6666	85.3333	Nepal	NP		\N	1524593184
Manukau City	Manukau City	-37	174.885	New Zealand	NZ	Auckland	\N	1554797148
Şūr	Sur	22.5667	59.5289	Oman	OM	Janūb ash Sharqīyah	\N	1512350600
Haymā’	Hayma'	19.9333	56.3167	Oman	OM	Al Wusţá	\N	1512927824
Şuḩār	Suhar	24.342	56.7299	Oman	OM	Shamāl al Bāţinah	\N	1512602960
‘Ibrī	`Ibri	23.2325	56.4973	Oman	OM	Az̧ Z̧āhirah	\N	1512077267
Aş Şuwayḩirah as Sāḩil	As Suwayhirah as Sahil	24.362	56.7344	Oman	OM	Shamāl al Bāţinah	\N	1512145575
Unión Chocó	Union Choco	8.0778	-77.5583	Panama	PA	Emberá-Wounaan	\N	1591671914
Sieyik	Sieyik	9.3833	-82.6522	Panama	PA	Naso Tjër Di	\N	1591986999
Kurumul	Kurumul	-5.855	144.6311	Papua New Guinea	PG	Jiwaka	\N	1598000045
Buka	Buka	-5.4219	154.6728	Papua New Guinea	PG	Bougainville	\N	1598000066
Pili	Pili	13.7177	123.7448	Philippines	PH	Camarines Sur	\N	1608825988
Tabuk	Tabuk	17.4084	121.2785	Philippines	PH	Kalinga	\N	1608980358
San Jose	San Jose	10.18	125.5683	Philippines	PH	Dinagat Islands	\N	1608435522
Santa Cruz	Santa Cruz	14.1167	121.2833	Philippines	PH	Laguna	\N	1608131481
Koronadal	Koronadal	6.2541	124.9922	Philippines	PH	South Cotabato	\N	1608108139
Az̧ Z̧a‘āyin	Az Za`ayin	25.5669	51.4847	Qatar	QA	Az̧ Z̧a‘āyin	\N	1634890537
Umm Şalāl ‘Alī	Umm Salal `Ali	25.4697	51.3975	Qatar	QA	Umm Şalāl	\N	1634646507
Madīnat ash Shamāl	Madinat ash Shamal	26.1167	51.2167	Qatar	QA	Ash Shamāl	\N	1634762661
Žagubica	Zagubica	44.1979	21.7902	Serbia	RS	Žagubica	\N	1688849472
Boljevac	Boljevac	43.8247	21.9519	Serbia	RS	Boljevac	\N	1688076013
Babušnica	Babusnica	43.068	22.4115	Serbia	RS	Babušnica	\N	1688685780
Bojnik	Bojnik	43.0142	21.718	Serbia	RS	Bojnik	\N	1688559807
Pechora	Pechora	65.1587	57.2087	Russia	RU	Komi	\N	1643976718
Mikhalkino	Mikhalkino	69.4353	161.5508	Russia	RU	Sakha (Yakutiya)	\N	1643001530
Noginsk	Noginsk	64.4833	91.2333	Russia	RU	Krasnoyarskiy Kray	\N	1643129651
Ambarchik	Ambarchik	69.6261	162.3039	Russia	RU	Sakha (Yakutiya)	\N	1643739159
Al Ḩillah	Al Hillah	23.4895	46.7564	Saudi Arabia	SA	Ar Riyāḑ	\N	1682494753
Taro	Taro	-6.7111	156.3972	Solomon Islands	SB	Choiseul	\N	1090931394
Rabak	Rabak	13.188	32.7437	Sudan	SD	White Nile	\N	1729452233
Al Mijlad	Al Mijlad	11.0337	27.7333	Sudan	SD	West Kordofan	\N	1729768355
El Fula	El Fula	11.712	28.3462	Sudan	SD	West Kordofan	\N	1729946051
Edinburgh of the Seven Seas	Edinburgh of the Seven Seas	-37.0675	-12.3105	Saint Helena, Ascension, and Tristan da Cunha	SH	Tristan da Cunha	\N	1654661876
Georgetown	Georgetown	-7.9286	-14.4119	Saint Helena, Ascension, and Tristan da Cunha	SH	Ascension	\N	1654363572
Žetale	Zetale	46.275	15.7939	Slovenia	SI	Žetale	\N	1705941695
Šentilj	Sentilj	46.6817	15.6481	Slovenia	SI	Šentilj	\N	1705840723
Žužemberk	Zuzemberk	45.8339	14.9292	Slovenia	SI	Žužemberk	\N	1705027920
Zavrč	Zavrc	46.3917	16.0497	Slovenia	SI	Zavrč	\N	1705477555
Sédhiou	Sedhiou	12.7081	-15.5569	Senegal	SN	Sédhiou	\N	1686107428
Ceerigaabo	Ceerigaabo	10.6162	47.3679	Somalia	SO	Sanaag	\N	1706173875
Laascaanood	Laascaanood	8.4774	47.3597	Somalia	SO	Sool	\N	1706106404
Boorama	Boorama	9.9361	43.1828	Somalia	SO	Awdal	\N	1706767209
Dar‘ā	Dar`a	32.6189	36.1021	Syria	SY	Dar‘ā	\N	1760427038
Nhlangano	Nhlangano	-27.1122	31.1983	Eswatini	SZ	Shiselweni	\N	1748301792
Pala	Pala	9.3646	14.9073	Chad	TD	Mayo-Kebbi-Ouest	\N	1148687410
Bardaï	Bardai	21.3533	17.0003	Chad	TD	Tibesti	\N	1148071351
Kara	Kara	9.5511	1.1861	Togo	TG	Kara	\N	1768768827
Ban Huai Hin	Ban Huai Hin	12.5697	99.9443	Thailand	TH	Phetchaburi	\N	1764975513
Lospalos	Lospalos	-8.5217	126.9983	Timor-Leste	TL	Lautém	\N	1626878399
Aileu	Aileu	-8.7281	125.5664	Timor-Leste	TL	Aileu	\N	1626766880
Pante Macassar	Pante Macassar	-9.2	124.3833	Timor-Leste	TL	Oé-Cusse Ambeno	\N	1626175417
Suai	Suai	-9.3129	125.2565	Timor-Leste	TL	Kovalima	\N	1626458227
Aranguez	Aranguez	10.6472	-61.4461	Trinidad and Tobago	TT	San Juan/Laventille	\N	1780000001
Pingzhen	Pingzhen	24.9439	121.2161	Taiwan	TW	Taoyuan	\N	1158047789
Yilan	Yilan	24.75	121.75	Taiwan	TW	Yilan	\N	1158534780
Zhongli	Zhongli	24.965	121.2168	Taiwan	TW	Taoyuan	\N	1158025380
Yangmei	Yangmei	24.9167	121.15	Taiwan	TW	Taoyuan	\N	1158247880
Banqiao	Banqiao	25.0143	121.4672	Taiwan	TW	New Taipei	\N	1158987347
Bade	Bade	24.9575	121.2989	Taiwan	TW	Taoyuan	\N	1158126203
Mahonda	Mahonda	-5.9897	39.2519	Tanzania	TZ	Zanzibar North	\N	1834907448
Vwawa	Vwawa	-9.1081	32.9347	Tanzania	TZ	Songwe	\N	1834695780
Koani	Koani	-6.1333	39.2833	Tanzania	TZ	Zanzibar Central/South	\N	1834376215
Kinoni	Kinoni	-0.6583	30.4581	Uganda	UG	Rwampara	\N	1800009674
Agago	Agago	2.9847	33.3306	Uganda	UG	Agago	\N	1800321499
Kapelebyong	Kapelebyong	2.2933	33.8308	Uganda	UG	Kapelebyong	\N	1800815486
Kibingo	Kibingo	-0.57	30.415	Uganda	UG	Sheema	\N	1800484853
Tŭytepa	Tuytepa	41.0428	69.3572	Uzbekistan	UZ	Toshkent	\N	1860436043
Thành Phố Bà Rịa	Thanh Pho Ba Ria	10.4963	107.1685	Vietnam	VN	Bà Rịa-Vũng Tàu	\N	1704000020
Kon Tum	Kon Tum	14.3545	108.0076	Vietnam	VN	Kon Tum	\N	1704988146
Đà Nẵng	Da Nang	16.0748	108.224	Vietnam	VN	Đà Nẵng	\N	1704949870
Sola	Sola	-13.875	167.55	Vanuatu	VU	Torba	\N	1548600754
Saratamata	Saratamata	-15.2875	167.9903	Vanuatu	VU	Penama	\N	1548907051
Safotulafai	Safotulafai	-13.6817	-172.185	Samoa	WS	Fa‘asaleleaga	\N	1882524892
Mulifanua	Mulifanua	-13.8333	-171.9833	Samoa	WS	Aiga-i-le-Tai	\N	1882029963
Satupa‘itea	Satupa`itea	-13.7659	-172.3269	Samoa	WS	Satupa‘itea	\N	1882940042
‘Amrān	`Amran	15.6594	43.9439	Yemen	YE	‘Amrān	\N	1887433410
Al Jabīn	Al Jabin	14.704	43.599	Yemen	YE	Raymah	\N	1887910100
Nelspruit	Nelspruit	-25.4745	30.9703	South Africa	ZA	Mpumalanga	\N	1710114438
Gqeberha	Gqeberha	-33.9681	25.5981	South Africa	ZA	Eastern Cape	\N	1710000082
Lupane	Lupane	-18.9315	27.807	Zimbabwe	ZW	Matabeleland North	\N	1716206606
Charlotte Amalie	Charlotte Amalie	18.342	-64.9331	U.S. Virgin Islands	VI	Virgin Islands	\N	1850037473
\.


--
-- Data for Name: country_region; Type: TABLE DATA; Schema: datamig_src; Owner: -
--

COPY datamig_src.country_region (iso_3166_1, country_name, iso_3166_2, region_name) FROM stdin;
BR	Brazil	AL	Alagoas
ES	Spain	SA	Salamanca
BR	Brazil	AM	Amazonas
BR	Brazil	AP	Amapá
BR	Brazil	BA	Bahia
BR	Brazil	CE	Ceará
BR	Brazil	DF	Distrito Federal do Brasil
BR	Brazil	ES	Espírito Santo
BR	Brazil	GO	Goiás
BR	Brazil	MA	Maranhão
BR	Brazil	MG	Minas Gerais
BR	Brazil	MS	Mato Grosso do Sul
BR	Brazil	MT	Mato Grosso
BR	Brazil	PA	Pará
BR	Brazil	PB	Paraíba
BR	Brazil	PE	Pernambuco
BR	Brazil	PI	Piauí
BR	Brazil	PR	Paraná
BR	Brazil	RJ	Rio de Janeiro
BR	Brazil	RN	Rio Grande do Norte
BR	Brazil	RO	Rondônia
BR	Brazil	RR	Roraima
BR	Brazil	RS	Rio Grande do Sul
BR	Brazil	SC	Santa Catarina
BR	Brazil	SE	Sergipe
BR	Brazil	SP	São Paulo
BR	Brazil	TO	Tocantins
CH	Switzerland	AG	Aargau
CH	Switzerland	AI	Appenzell Innerrhoden
CH	Switzerland	AR	Appenzell Ausserrhoden
CH	Switzerland	BE	Bern
CH	Switzerland	BL	Basel-Landschaft
CH	Switzerland	BS	Basel-Stadt
CH	Switzerland	FR	Freiburg
CH	Switzerland	GE	Genf
CH	Switzerland	GL	Glarus
CH	Switzerland	GR	Graubünden
CH	Switzerland	JU	Jura
CH	Switzerland	LU	Luzern
CH	Switzerland	NE	Neuenburg
CH	Switzerland	NW	Nidwalden
CH	Switzerland	OW	Obwalden
CH	Switzerland	SG	Sankt Gallen
CH	Switzerland	SH	Schaffhausen
CH	Switzerland	SO	Solothurn
CH	Switzerland	SZ	Schwyz
CH	Switzerland	TG	Thurgau
CH	Switzerland	TI	Tessin
CH	Switzerland	UR	Uri
CH	Switzerland	VD	Waadt
CH	Switzerland	VS	Wallis
CH	Switzerland	ZG	Zug
CH	Switzerland	ZH	Zürich
CO	Colombia	AMA	Amazonas
CO	Colombia	ANT	Antioquia
CO	Colombia	ARA	Arauca
CO	Colombia	ATL	Atlántico
CO	Colombia	BOL	Bolívar
CO	Colombia	BOY	Boyacá
CO	Colombia	CAL	Caldas
CO	Colombia	CAQ	Caquetá
CO	Colombia	CAS	Casanare
CO	Colombia	CAU	Cauca
CO	Colombia	CES	Cesar
CO	Colombia	CHO	Chocó
CO	Colombia	COR	Córdoba
CO	Colombia	CUN	Cundinamarca
CO	Colombia	DC	Bogotá DC
CO	Colombia	GUA	Guainía
CO	Colombia	GUV	Guaviare
CO	Colombia	HUI	Huila
CO	Colombia	LAG	La Guajira
CO	Colombia	MAG	Magdalena
CO	Colombia	MET	Meta
CO	Colombia	NAR	Nariño
CO	Colombia	NSA	Norte de Santander
CO	Colombia	PUT	Putumayo
CO	Colombia	QUI	Quindío
CO	Colombia	RIS	Risaralda
CO	Colombia	SAN	Santander
CO	Colombia	SAP	San Andrés und Providencia
CO	Colombia	SUC	Sucre
CO	Colombia	TOL	Tolima
CO	Colombia	VAC	Valle del Cauca
CO	Colombia	VAU	Vaupés
CO	Colombia	VID	Vichada
DE	Germany	BB	Brandenburg
DE	Germany	BE	Berlin
DE	Germany	BW	Baden-Württemberg
DE	Germany	BY	Bayern
DE	Germany	HB	Bremen
DE	Germany	HE	Hessen
DE	Germany	HH	Hamburg
DE	Germany	MV	Mecklenburg-Vorpommern
DE	Germany	NI	Niedersachsen
DE	Germany	NW	Nordrhein-Westfalen
DE	Germany	RP	Rheinland-Pfalz
BR	Brazil	AC	Acre
DE	Germany	SH	Schleswig-Holstein
DE	Germany	SL	Saarland
DE	Germany	SN	Sachsen
DE	Germany	ST	Sachsen-Anhalt
DE	Germany	TH	Thüringen
DK	Denmark	81	Nordjylland
DK	Denmark	82	Midtjylland
DK	Denmark	83	Syddanmark
DK	Denmark	84	Hovedstaden
DK	Denmark	85	Sjælland
ES	Spain	A	Alacant
ES	Spain	AB	Albacete
ES	Spain	AL	Almería
ES	Spain	AV	Ávila
ES	Spain	B	Barcelona
ES	Spain	BA	Badajoz
ES	Spain	BI	Bizkaia
ES	Spain	BU	Burgos
ES	Spain	C	A Coruña
ES	Spain	CA	Cádiz
ES	Spain	CC	Cáceres
ES	Spain	CO	Córdoba
ES	Spain	CR	Ciudad Real
ES	Spain	CS	Castelló
ES	Spain	CU	Cuenca
ES	Spain	GC	Las Palmas
ES	Spain	GI	Girona
ES	Spain	GR	Granada
ES	Spain	GU	Guadalajara
ES	Spain	H	Huelva
ES	Spain	HU	Osca
ES	Spain	J	Jaén
ES	Spain	L	Lhèida
ES	Spain	LE	Llion
ES	Spain	LO	La Rioja
ES	Spain	LU	Lugo
ES	Spain	M	Madrid
ES	Spain	MA	Málaga
ES	Spain	MU	Murcia
ES	Spain	NA	Nafarroa
ES	Spain	O	Asturies
ES	Spain	OR	Ourense
ES	Spain	P	Palencia
ES	Spain	PM	Illes Balears
ES	Spain	PO	Pontevedra
ES	Spain	S	Kantabrien
ES	Spain	SE	Sevilla
ES	Spain	SG	Segovia
ES	Spain	SO	Soria
ES	Spain	SS	Guipúzcoa
ES	Spain	T	Tarragona
ES	Spain	TE	Zaragoza
ES	Spain	TF	Santa Cruz de Tenerife
ES	Spain	TO	Toledo
ES	Spain	V	València
ES	Spain	VA	Valladolid
ES	Spain	VI	Araba
ES	Spain	Z	Zaragoza
ES	Spain	ZA	Zamora
FR	France	01	Ain
FR	France	02	Aisne
FR	France	03	Allier
FR	France	04	Alpes-de-Haute-Provence
FR	France	05	Hautes-Alpes
FR	France	06	Alpes-Maritimes
FR	France	07	Ardèche
FR	France	08	Ardennes
FR	France	09	Ariège
FR	France	10	Aube
FR	France	11	Aude
FR	France	12	Aveyron
FR	France	13	Bouches-du-Rhône
FR	France	14	Calvados
FR	France	15	Cantal
FR	France	16	Charente
FR	France	17	Charente-Maritime
FR	France	18	Cher
FR	France	19	Corrèze
FR	France	21	Côte-d’Or
FR	France	22	Côtes-d’Armor
FR	France	23	Creuse
FR	France	24	Dordogne
FR	France	25	Doubs
FR	France	26	Drôme
FR	France	27	Eure
FR	France	28	Eure-et-Loir
FR	France	29	Finistère
FR	France	2A	Corse-du-Sud
FR	France	2B	Haute-Corse
FR	France	30	Gard
FR	France	31	Haute-Garonne
FR	France	32	Gers
FR	France	33	Gironde
FR	France	34	Hérault
FR	France	35	Ille-et-Vilaine
FR	France	36	Indre
FR	France	37	Indre-et-Loire
FR	France	38	Isère
FR	France	39	Jura
FR	France	40	Landes
FR	France	41	Loir-et-Cher
FR	France	42	Loire
FR	France	43	Haute-Loire
FR	France	44	Loire-Atlantique
FR	France	45	Loiret
FR	France	46	Lot
FR	France	47	Lot-et-Garonne
FR	France	48	Lozère
FR	France	49	Maine-et-Loire
FR	France	50	Manche
FR	France	51	Marne
FR	France	52	Haute-Marne
FR	France	53	Mayenne
FR	France	54	Meurthe-et-Moselle
FR	France	55	Meuse
FR	France	56	Morbihan
FR	France	57	Moselle
FR	France	58	Nièvre
FR	France	59	Nord
FR	France	60	Oise
FR	France	61	Orne
FR	France	62	Pas-de-Calais
FR	France	63	Puy-de-Dôme
FR	France	64	Pyrénées-Atlantiques
FR	France	65	Hautes-Pyrénées
FR	France	66	Pyrénées-Orientales
FR	France	67	Bas-Rhin
FR	France	68	Haut-Rhin
FR	France	69	Rhône
FR	France	69M	Métropole de Lyon
FR	France	70	Haute-Saône
FR	France	71	Saône-et-Loire
FR	France	72	Sarthe
FR	France	73	Savoie
FR	France	74	Haute-Savoie
FR	France	75	Paris
FR	France	76	Seine-Maritime
FR	France	77	Seine-et-Marne
FR	France	78	Yvelines
FR	France	79	Deux-Sèvres
FR	France	80	Somme
FR	France	81	Tarn
FR	France	82	Tarn-et-Garonne
FR	France	83	Var
FR	France	84	Vaucluse
FR	France	85	Vendée
FR	France	86	Vienne
FR	France	87	Haute-Vienne
FR	France	88	Vosges
FR	France	89	Yonne
FR	France	90	Territoire de Belfort
FR	France	91	Essonne
FR	France	92	Hauts-de-Seine
FR	France	93	Seine-Saint-Denis
FR	France	94	Val-de-Marne
FR	France	95	Val-d’Oise
GB	United Kingdom	BRY	Bromley
GB	United Kingdom	TAM	Tameside
GB	United Kingdom	WYK	West-Yorkshire
GR	Greece	69	Athos
GR	Greece	A	Ostmakedonien und Thrakien
GR	Greece	B	Zentralmakedonien
GR	Greece	C	Westmakedonien
GR	Greece	D	Epirus
GR	Greece	E	Thessalien
GR	Greece	F	Ionische Inseln
GR	Greece	G	Westgriechenland
GR	Greece	H	Mittelgriechenland
GR	Greece	I	Attika
GR	Greece	J	Peloponnes
GR	Greece	K	Nördliche Ägäis
GR	Greece	L	Südliche Ägäis
GR	Greece	M	Kreta
GT	Guatemala	01	Guatemala
GT	Guatemala	02	El Progreso
GT	Guatemala	03	Sacatepéquez
GT	Guatemala	04	Chimaltenango
GT	Guatemala	05	Escuintla
GT	Guatemala	06	Santa Rosa
GT	Guatemala	07	Sololá
GT	Guatemala	08	Totonicapán
GT	Guatemala	09	Quetzaltenango
GT	Guatemala	10	Suchitepéquez
GT	Guatemala	11	Retalhuleu
GT	Guatemala	12	San Marcos
GT	Guatemala	13	Huehuetenango
GT	Guatemala	14	Quiché
GT	Guatemala	15	Baja Verapaz
GT	Guatemala	16	Alta Verapaz
GT	Guatemala	17	Petén
GT	Guatemala	18	Izabal
GT	Guatemala	19	Zacapa
GT	Guatemala	20	Chiquimula
GT	Guatemala	21	Jalapa
GT	Guatemala	22	Jutiapa
HR	Kroatien	17	Split-Dalmatien
IT	Italy	21	Piemont
IT	Italy	23	Aostatal
IT	Italy	25	Lombardei
IT	Italy	32	Trentino-Südtirol
IT	Italy	34	Venetien
IT	Italy	36	Friaul-Julisch Venetien
IT	Italy	42	Ligurien
IT	Italy	45	Emilia-Romagna
IT	Italy	52	Toskana
IT	Italy	55	Umbrien
IT	Italy	57	Marken
IT	Italy	62	Latium
IT	Italy	65	Abruzzen
IT	Italy	67	Molise
IT	Italy	72	Kampanien
IT	Italy	75	Apulien
IT	Italy	77	Basilikata
IT	Italy	78	Kalabrien
IT	Italy	82	Sizilien
IT	Italy	88	Sardinien
ME	Montenegro	01	Andrijevica
ME	Montenegro	02	Bar
ME	Montenegro	03	Berane
ME	Montenegro	04	Bijelo Polje
ME	Montenegro	05	Budva
ME	Montenegro	06	Cetinje
ME	Montenegro	07	Danilovgrad
ME	Montenegro	08	Herceg Novi
ME	Montenegro	09	Kolašin
ME	Montenegro	10	Kotor
ME	Montenegro	11	Mojkovac
ME	Montenegro	12	Nikšić
ME	Montenegro	13	Plav
ME	Montenegro	14	Pljevlja
ME	Montenegro	15	Plužine
ME	Montenegro	16	Podgorica
ME	Montenegro	17	Rožaje
ME	Montenegro	18	Šavnik
ME	Montenegro	19	Tivat
ME	Montenegro	20	Ulcinj
ME	Montenegro	21	Žabljak
ME	Montenegro	22	Gusinje
ME	Montenegro	23	Petnjica
ME	Montenegro	24	Tuzi
MK	North Macedonia	85	Skopje
NL	Netherlands	NH	Nordholland
PT	Portugal	01	Aveiro
PT	Portugal	02	Beja
PT	Portugal	03	Braga
PT	Portugal	04	Bragança
PT	Portugal	05	Castelo Branco
PT	Portugal	06	Coimbra
PT	Portugal	07	Évora
PT	Portugal	08	Faro
PT	Portugal	09	Guarda
PT	Portugal	10	Leiria
PT	Portugal	11	Lisboa
PT	Portugal	12	Portalegre
PT	Portugal	13	Porto
PT	Portugal	14	Santarém
PT	Portugal	15	Setúbal
PT	Portugal	16	Viana do Castelo
PT	Portugal	17	Vila Real
PT	Portugal	18	Viseu
PT	Portugal	20	Região Autónoma dos Açores
PT	Portugal	30	Região Autónoma da Madeira
RS	Serbia	00	Beograd
RS	Serbia	01	Severnobački okrug
RS	Serbia	02	Srednjebanatski okrug
RS	Serbia	03	Severnobanatski okrug
RS	Serbia	04	Južnobanatski okrug
RS	Serbia	05	Zapadnobački okrug
RS	Serbia	06	Južnobački okrug
RS	Serbia	07	Sremski okrug
RS	Serbia	08	Mačvanski okrug
RS	Serbia	09	Kolubarski okrug
RS	Serbia	10	Podunavski okrug
RS	Serbia	11	Braničevski okrug
RS	Serbia	12	Šumadijski okrug
RS	Serbia	13	Pomoravski okrug
RS	Serbia	14	Borski okrug
RS	Serbia	15	Zaječarski okrug
RS	Serbia	16	Zlatiborski okrug
RS	Serbia	17	Moravički okrug
RS	Serbia	18	Raški okrug
RS	Serbia	19	Rasinski okrug
RS	Serbia	20	Nišavski okrug
RS	Serbia	21	Toplički okrug
RS	Serbia	22	Pirotski okrug
RS	Serbia	23	Jablanički okrug
RS	Serbia	24	Pčinjski okrug
RS	Serbia	25	Kosovski okrug
RS	Serbia	26	Pećki okrug
RS	Serbia	27	Prizrenski okrug
RS	Serbia	28	Kosovsko-Mitrovački okrug
RS	Serbia	29	Kosovsko-Pomoravski okrug
RS	Serbia	KM	Kosovo-Metohija
RS	Serbia	VO	Vojvodina
RU	Russia	MOW	Moskau Stadt
TH	Thailand	50	Chiang Mai
TN	Tunesien	11	Tunis
US	United States	AK	Alaska
US	United States	AL	Alabama
US	United States	AR	Arkansas
US	United States	AZ	Arizona
US	United States	CA	Kalifornien
US	United States	CO	Colorado
US	United States	CT	Connecticut
US	United States	DC	District of Columbia
US	United States	DE	Delaware
US	United States	FL	Florida
US	United States	GA	Georgia
US	United States	HI	Hawaii
US	United States	IA	Iowa
US	United States	ID	Idaho
US	United States	IL	Illinois
US	United States	IN	Indiana
US	United States	KS	Kansas
US	United States	KY	Kentucky
US	United States	LA	Louisiana
US	United States	MA	Massachusetts
US	United States	MD	Maryland
US	United States	ME	Maine
US	United States	MI	Michigan
US	United States	MN	Minnesota
US	United States	MO	Missouri
US	United States	MS	Mississippi
US	United States	MT	Montana
US	United States	NC	North Carolina
US	United States	ND	North Dakota
US	United States	NE	Nebraska
US	United States	NH	New Hampshire
US	United States	NJ	New Jersey
US	United States	NM	New Mexico
US	United States	NV	Nevada
US	United States	NY	New York
US	United States	OH	Ohio
US	United States	OK	Oklahoma
US	United States	OR	Oregon
US	United States	PA	Pennsylvania
US	United States	RI	Rhode Island
US	United States	SC	South Carolina
US	United States	SD	South Dakota
US	United States	TN	Tennessee
US	United States	TX	Texas
US	United States	UT	Utah
US	United States	VA	Virginia
US	United States	VT	Vermont
US	United States	WA	Washington
US	United States	WI	Wisconsin
US	United States	WV	West Virginia
US	United States	WY	Wyoming
\.


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: datamig_src; Owner: -
--

ALTER TABLE ONLY datamig_src.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: country_region country_region_pkey; Type: CONSTRAINT; Schema: datamig_src; Owner: -
--

ALTER TABLE ONLY datamig_src.country_region
    ADD CONSTRAINT country_region_pkey PRIMARY KEY (iso_3166_1, iso_3166_2);


--
-- PostgreSQL database dump complete
--

\unrestrict f0Mfbmtk9EzxfxaWKrEgxyir0cZ5XUkPZ6BIJitwfIghn3elKF1175XEvZ4bc1D

