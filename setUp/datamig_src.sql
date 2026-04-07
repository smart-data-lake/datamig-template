--
-- PostgreSQL database dump
--

\restrict sv8nY3l4H40sZheYeEfM9K36KjU17kpNoqAU1BSgJC72oQmvLGf4J8GLfwbnhhy

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
-- Name: country_region; Type: TABLE; Schema: datamig_src; Owner: -
--

CREATE TABLE datamig_src.country_region (
    iso_3166_1 character(2) NOT NULL,
    country_name character varying(64),
    iso_3166_2 character varying(4) NOT NULL,
    region_name character varying(64)
);


--
-- Data for Name: country_region; Type: TABLE DATA; Schema: datamig_src; Owner: -
--

COPY datamig_src.country_region (iso_3166_1, country_name, iso_3166_2, region_name) FROM stdin;
BR	Brasilien	AC	Acre
BR	Brasilien	AL	Alagoas
BR	Brasilien	AM	Amazonas
BR	Brasilien	AP	Amapá
BR	Brasilien	BA	Bahia
BR	Brasilien	CE	Ceará
BR	Brasilien	DF	Distrito Federal do Brasil
BR	Brasilien	ES	Espírito Santo
BR	Brasilien	GO	Goiás
BR	Brasilien	MA	Maranhão
BR	Brasilien	MG	Minas Gerais
BR	Brasilien	MS	Mato Grosso do Sul
BR	Brasilien	MT	Mato Grosso
BR	Brasilien	PA	Pará
BR	Brasilien	PB	Paraíba
BR	Brasilien	PE	Pernambuco
BR	Brasilien	PI	Piauí
BR	Brasilien	PR	Paraná
BR	Brasilien	RJ	Rio de Janeiro
BR	Brasilien	RN	Rio Grande do Norte
BR	Brasilien	RO	Rondônia
BR	Brasilien	RR	Roraima
BR	Brasilien	RS	Rio Grande do Sul
BR	Brasilien	SC	Santa Catarina
BR	Brasilien	SE	Sergipe
BR	Brasilien	SP	São Paulo
BR	Brasilien	TO	Tocantins
CH	Schweiz	AG	Aargau
CH	Schweiz	AI	Appenzell Innerrhoden
CH	Schweiz	AR	Appenzell Ausserrhoden
CH	Schweiz	BE	Bern
CH	Schweiz	BL	Basel-Landschaft
CH	Schweiz	BS	Basel-Stadt
CH	Schweiz	FR	Freiburg
CH	Schweiz	GE	Genf
CH	Schweiz	GL	Glarus
CH	Schweiz	GR	Graubünden
CH	Schweiz	JU	Jura
CH	Schweiz	LU	Luzern
CH	Schweiz	NE	Neuenburg
CH	Schweiz	NW	Nidwalden
CH	Schweiz	OW	Obwalden
CH	Schweiz	SG	Sankt Gallen
CH	Schweiz	SH	Schaffhausen
CH	Schweiz	SO	Solothurn
CH	Schweiz	SZ	Schwyz
CH	Schweiz	TG	Thurgau
CH	Schweiz	TI	Tessin
CH	Schweiz	UR	Uri
CH	Schweiz	VD	Waadt
CH	Schweiz	VS	Wallis
CH	Schweiz	ZG	Zug
CH	Schweiz	ZH	Zürich
CO	Kolumbien	AMA	Amazonas
CO	Kolumbien	ANT	Antioquia
CO	Kolumbien	ARA	Arauca
CO	Kolumbien	ATL	Atlántico
CO	Kolumbien	BOL	Bolívar
CO	Kolumbien	BOY	Boyacá
CO	Kolumbien	CAL	Caldas
CO	Kolumbien	CAQ	Caquetá
CO	Kolumbien	CAS	Casanare
CO	Kolumbien	CAU	Cauca
CO	Kolumbien	CES	Cesar
CO	Kolumbien	CHO	Chocó
CO	Kolumbien	COR	Córdoba
CO	Kolumbien	CUN	Cundinamarca
CO	Kolumbien	DC	Bogotá DC
CO	Kolumbien	GUA	Guainía
CO	Kolumbien	GUV	Guaviare
CO	Kolumbien	HUI	Huila
CO	Kolumbien	LAG	La Guajira
CO	Kolumbien	MAG	Magdalena
CO	Kolumbien	MET	Meta
CO	Kolumbien	NAR	Nariño
CO	Kolumbien	NSA	Norte de Santander
CO	Kolumbien	PUT	Putumayo
CO	Kolumbien	QUI	Quindío
CO	Kolumbien	RIS	Risaralda
CO	Kolumbien	SAN	Santander
CO	Kolumbien	SAP	San Andrés und Providencia
CO	Kolumbien	SUC	Sucre
CO	Kolumbien	TOL	Tolima
CO	Kolumbien	VAC	Valle del Cauca
CO	Kolumbien	VAU	Vaupés
CO	Kolumbien	VID	Vichada
DE	Deutschland	BB	Brandenburg
DE	Deutschland	BE	Berlin
DE	Deutschland	BW	Baden-Württemberg
DE	Deutschland	BY	Bayern
DE	Deutschland	HB	Bremen
DE	Deutschland	HE	Hessen
DE	Deutschland	HH	Hamburg
DE	Deutschland	MV	Mecklenburg-Vorpommern
DE	Deutschland	NI	Niedersachsen
DE	Deutschland	NW	Nordrhein-Westfalen
DE	Deutschland	RP	Rheinland-Pfalz
DE	Deutschland	SH	Schleswig-Holstein
DE	Deutschland	SL	Saarland
DE	Deutschland	SN	Sachsen
DE	Deutschland	ST	Sachsen-Anhalt
DE	Deutschland	TH	Thüringen
DK	Dänemark	81	Nordjylland
DK	Dänemark	82	Midtjylland
DK	Dänemark	83	Syddanmark
DK	Dänemark	84	Hovedstaden
DK	Dänemark	85	Sjælland
ES	Spanien	A	Alacant
ES	Spanien	AB	Albacete
ES	Spanien	AL	Almería
ES	Spanien	AV	Ávila
ES	Spanien	B	Barcelona
ES	Spanien	BA	Badajoz
ES	Spanien	BI	Bizkaia
ES	Spanien	BU	Burgos
ES	Spanien	C	A Coruña
ES	Spanien	CA	Cádiz
ES	Spanien	CC	Cáceres
ES	Spanien	CO	Córdoba
ES	Spanien	CR	Ciudad Real
ES	Spanien	CS	Castelló
ES	Spanien	CU	Cuenca
ES	Spanien	GC	Las Palmas
ES	Spanien	GI	Girona
ES	Spanien	GR	Granada
ES	Spanien	GU	Guadalajara
ES	Spanien	H	Huelva
ES	Spanien	HU	Osca
ES	Spanien	J	Jaén
ES	Spanien	L	Lhèida
ES	Spanien	LE	Llion
ES	Spanien	LO	La Rioja
ES	Spanien	LU	Lugo
ES	Spanien	M	Madrid
ES	Spanien	MA	Málaga
ES	Spanien	MU	Murcia
ES	Spanien	NA	Nafarroa
ES	Spanien	O	Asturies
ES	Spanien	OR	Ourense
ES	Spanien	P	Palencia
ES	Spanien	PM	Illes Balears
ES	Spanien	PO	Pontevedra
ES	Spanien	S	Kantabrien
ES	Spanien	SA	Salamanca
ES	Spanien	SE	Sevilla
ES	Spanien	SG	Segovia
ES	Spanien	SO	Soria
ES	Spanien	SS	Guipúzcoa
ES	Spanien	T	Tarragona
ES	Spanien	TE	Zaragoza
ES	Spanien	TF	Santa Cruz de Tenerife
ES	Spanien	TO	Toledo
ES	Spanien	V	València
ES	Spanien	VA	Valladolid
ES	Spanien	VI	Araba
ES	Spanien	Z	Zaragoza
ES	Spanien	ZA	Zamora
FR	Frankreich	01	Ain
FR	Frankreich	02	Aisne
FR	Frankreich	03	Allier
FR	Frankreich	04	Alpes-de-Haute-Provence
FR	Frankreich	05	Hautes-Alpes
FR	Frankreich	06	Alpes-Maritimes
FR	Frankreich	07	Ardèche
FR	Frankreich	08	Ardennes
FR	Frankreich	09	Ariège
FR	Frankreich	10	Aube
FR	Frankreich	11	Aude
FR	Frankreich	12	Aveyron
FR	Frankreich	13	Bouches-du-Rhône
FR	Frankreich	14	Calvados
FR	Frankreich	15	Cantal
FR	Frankreich	16	Charente
FR	Frankreich	17	Charente-Maritime
FR	Frankreich	18	Cher
FR	Frankreich	19	Corrèze
FR	Frankreich	21	Côte-d’Or
FR	Frankreich	22	Côtes-d’Armor
FR	Frankreich	23	Creuse
FR	Frankreich	24	Dordogne
FR	Frankreich	25	Doubs
FR	Frankreich	26	Drôme
FR	Frankreich	27	Eure
FR	Frankreich	28	Eure-et-Loir
FR	Frankreich	29	Finistère
FR	Frankreich	2A	Corse-du-Sud
FR	Frankreich	2B	Haute-Corse
FR	Frankreich	30	Gard
FR	Frankreich	31	Haute-Garonne
FR	Frankreich	32	Gers
FR	Frankreich	33	Gironde
FR	Frankreich	34	Hérault
FR	Frankreich	35	Ille-et-Vilaine
FR	Frankreich	36	Indre
FR	Frankreich	37	Indre-et-Loire
FR	Frankreich	38	Isère
FR	Frankreich	39	Jura
FR	Frankreich	40	Landes
FR	Frankreich	41	Loir-et-Cher
FR	Frankreich	42	Loire
FR	Frankreich	43	Haute-Loire
FR	Frankreich	44	Loire-Atlantique
FR	Frankreich	45	Loiret
FR	Frankreich	46	Lot
FR	Frankreich	47	Lot-et-Garonne
FR	Frankreich	48	Lozère
FR	Frankreich	49	Maine-et-Loire
FR	Frankreich	50	Manche
FR	Frankreich	51	Marne
FR	Frankreich	52	Haute-Marne
FR	Frankreich	53	Mayenne
FR	Frankreich	54	Meurthe-et-Moselle
FR	Frankreich	55	Meuse
FR	Frankreich	56	Morbihan
FR	Frankreich	57	Moselle
FR	Frankreich	58	Nièvre
FR	Frankreich	59	Nord
FR	Frankreich	60	Oise
FR	Frankreich	61	Orne
FR	Frankreich	62	Pas-de-Calais
FR	Frankreich	63	Puy-de-Dôme
FR	Frankreich	64	Pyrénées-Atlantiques
FR	Frankreich	65	Hautes-Pyrénées
FR	Frankreich	66	Pyrénées-Orientales
FR	Frankreich	67	Bas-Rhin
FR	Frankreich	68	Haut-Rhin
FR	Frankreich	69	Rhône
FR	Frankreich	69M	Métropole de Lyon
FR	Frankreich	70	Haute-Saône
FR	Frankreich	71	Saône-et-Loire
FR	Frankreich	72	Sarthe
FR	Frankreich	73	Savoie
FR	Frankreich	74	Haute-Savoie
FR	Frankreich	75	Paris
FR	Frankreich	76	Seine-Maritime
FR	Frankreich	77	Seine-et-Marne
FR	Frankreich	78	Yvelines
FR	Frankreich	79	Deux-Sèvres
FR	Frankreich	80	Somme
FR	Frankreich	81	Tarn
FR	Frankreich	82	Tarn-et-Garonne
FR	Frankreich	83	Var
FR	Frankreich	84	Vaucluse
FR	Frankreich	85	Vendée
FR	Frankreich	86	Vienne
FR	Frankreich	87	Haute-Vienne
FR	Frankreich	88	Vosges
FR	Frankreich	89	Yonne
FR	Frankreich	90	Territoire de Belfort
FR	Frankreich	91	Essonne
FR	Frankreich	92	Hauts-de-Seine
FR	Frankreich	93	Seine-Saint-Denis
FR	Frankreich	94	Val-de-Marne
FR	Frankreich	95	Val-d’Oise
GB	Vereinigtes Königreich Großbritannien und Nordirland	BRY	Bromley
GB	Vereinigtes Königreich Großbritannien und Nordirland	TAM	Tameside
GB	Vereinigtes Königreich Großbritannien und Nordirland	WYK	West-Yorkshire
GR	Griechenland	69	Athos
GR	Griechenland	A	Ostmakedonien und Thrakien
GR	Griechenland	B	Zentralmakedonien
GR	Griechenland	C	Westmakedonien
GR	Griechenland	D	Epirus
GR	Griechenland	E	Thessalien
GR	Griechenland	F	Ionische Inseln
GR	Griechenland	G	Westgriechenland
GR	Griechenland	H	Mittelgriechenland
GR	Griechenland	I	Attika
GR	Griechenland	J	Peloponnes
GR	Griechenland	K	Nördliche Ägäis
GR	Griechenland	L	Südliche Ägäis
GR	Griechenland	M	Kreta
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
IT	Italien	21	Piemont
IT	Italien	23	Aostatal
IT	Italien	25	Lombardei
IT	Italien	32	Trentino-Südtirol
IT	Italien	34	Venetien
IT	Italien	36	Friaul-Julisch Venetien
IT	Italien	42	Ligurien
IT	Italien	45	Emilia-Romagna
IT	Italien	52	Toskana
IT	Italien	55	Umbrien
IT	Italien	57	Marken
IT	Italien	62	Latium
IT	Italien	65	Abruzzen
IT	Italien	67	Molise
IT	Italien	72	Kampanien
IT	Italien	75	Apulien
IT	Italien	77	Basilikata
IT	Italien	78	Kalabrien
IT	Italien	82	Sizilien
IT	Italien	88	Sardinien
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
MK	Mazedonien	85	Skopje
NL	Niederlande	NH	Nordholland
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
RS	Serbien	00	Beograd
RS	Serbien	01	Severnobački okrug
RS	Serbien	02	Srednjebanatski okrug
RS	Serbien	03	Severnobanatski okrug
RS	Serbien	04	Južnobanatski okrug
RS	Serbien	05	Zapadnobački okrug
RS	Serbien	06	Južnobački okrug
RS	Serbien	07	Sremski okrug
RS	Serbien	08	Mačvanski okrug
RS	Serbien	09	Kolubarski okrug
RS	Serbien	10	Podunavski okrug
RS	Serbien	11	Braničevski okrug
RS	Serbien	12	Šumadijski okrug
RS	Serbien	13	Pomoravski okrug
RS	Serbien	14	Borski okrug
RS	Serbien	15	Zaječarski okrug
RS	Serbien	16	Zlatiborski okrug
RS	Serbien	17	Moravički okrug
RS	Serbien	18	Raški okrug
RS	Serbien	19	Rasinski okrug
RS	Serbien	20	Nišavski okrug
RS	Serbien	21	Toplički okrug
RS	Serbien	22	Pirotski okrug
RS	Serbien	23	Jablanički okrug
RS	Serbien	24	Pčinjski okrug
RS	Serbien	25	Kosovski okrug
RS	Serbien	26	Pećki okrug
RS	Serbien	27	Prizrenski okrug
RS	Serbien	28	Kosovsko-Mitrovački okrug
RS	Serbien	29	Kosovsko-Pomoravski okrug
RS	Serbien	KM	Kosovo-Metohija
RS	Serbien	VO	Vojvodina
RU	Russische Föderation	MOW	Moskau Stadt
TH	Thailand	50	Chiang Mai
TN	Tunesien	11	Tunis
US	Vereinigte Staaten von Amerika	AK	Alaska
US	Vereinigte Staaten von Amerika	AL	Alabama
US	Vereinigte Staaten von Amerika	AR	Arkansas
US	Vereinigte Staaten von Amerika	AZ	Arizona
US	Vereinigte Staaten von Amerika	CA	Kalifornien
US	Vereinigte Staaten von Amerika	CO	Colorado
US	Vereinigte Staaten von Amerika	CT	Connecticut
US	Vereinigte Staaten von Amerika	DC	District of Columbia
US	Vereinigte Staaten von Amerika	DE	Delaware
US	Vereinigte Staaten von Amerika	FL	Florida
US	Vereinigte Staaten von Amerika	GA	Georgia
US	Vereinigte Staaten von Amerika	HI	Hawaii
US	Vereinigte Staaten von Amerika	IA	Iowa
US	Vereinigte Staaten von Amerika	ID	Idaho
US	Vereinigte Staaten von Amerika	IL	Illinois
US	Vereinigte Staaten von Amerika	IN	Indiana
US	Vereinigte Staaten von Amerika	KS	Kansas
US	Vereinigte Staaten von Amerika	KY	Kentucky
US	Vereinigte Staaten von Amerika	LA	Louisiana
US	Vereinigte Staaten von Amerika	MA	Massachusetts
US	Vereinigte Staaten von Amerika	MD	Maryland
US	Vereinigte Staaten von Amerika	ME	Maine
US	Vereinigte Staaten von Amerika	MI	Michigan
US	Vereinigte Staaten von Amerika	MN	Minnesota
US	Vereinigte Staaten von Amerika	MO	Missouri
US	Vereinigte Staaten von Amerika	MS	Mississippi
US	Vereinigte Staaten von Amerika	MT	Montana
US	Vereinigte Staaten von Amerika	NC	North Carolina
US	Vereinigte Staaten von Amerika	ND	North Dakota
US	Vereinigte Staaten von Amerika	NE	Nebraska
US	Vereinigte Staaten von Amerika	NH	New Hampshire
US	Vereinigte Staaten von Amerika	NJ	New Jersey
US	Vereinigte Staaten von Amerika	NM	New Mexico
US	Vereinigte Staaten von Amerika	NV	Nevada
US	Vereinigte Staaten von Amerika	NY	New York
US	Vereinigte Staaten von Amerika	OH	Ohio
US	Vereinigte Staaten von Amerika	OK	Oklahoma
US	Vereinigte Staaten von Amerika	OR	Oregon
US	Vereinigte Staaten von Amerika	PA	Pennsylvania
US	Vereinigte Staaten von Amerika	RI	Rhode Island
US	Vereinigte Staaten von Amerika	SC	South Carolina
US	Vereinigte Staaten von Amerika	SD	South Dakota
US	Vereinigte Staaten von Amerika	TN	Tennessee
US	Vereinigte Staaten von Amerika	TX	Texas
US	Vereinigte Staaten von Amerika	UT	Utah
US	Vereinigte Staaten von Amerika	VA	Virginia
US	Vereinigte Staaten von Amerika	VT	Vermont
US	Vereinigte Staaten von Amerika	WA	Washington
US	Vereinigte Staaten von Amerika	WI	Wisconsin
US	Vereinigte Staaten von Amerika	WV	West Virginia
US	Vereinigte Staaten von Amerika	WY	Wyoming
\.


--
-- Name: country_region country_region_pkey; Type: CONSTRAINT; Schema: datamig_src; Owner: -
--

ALTER TABLE ONLY datamig_src.country_region
    ADD CONSTRAINT country_region_pkey PRIMARY KEY (iso_3166_1, iso_3166_2);


--
-- PostgreSQL database dump complete
--

\unrestrict sv8nY3l4H40sZheYeEfM9K36KjU17kpNoqAU1BSgJC72oQmvLGf4J8GLfwbnhhy

