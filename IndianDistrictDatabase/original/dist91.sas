* name of program: dist91.sas;
* this program reads the 1991 India census district data;
* The data are read from dist91.data file;

options linesize=132 pagesize=55 nocenter;
/*********************************************************************/

title  'districts/1991/all/create91: 1991 Indian district sas file.' ;
title2 '   April 11, 2003: fixed area&housing data 600-602.' ;
title2 '   April 15, 2003: added housing quality data 607-699.' ;

/*********************************************************************/

/* Users will need to create their own libname and filename commands
   as appropriate for their local computer system
*/

libname  sasdata '.';
filename indata91  pipe 'gunzip -c dist91.data.gz';

data sasdata.dist91 (label='Indian 1991 districts: from dist91.dat');

	/* These temporary variables are used only to check 
	   correct order of input data file */
    drop rec140 rec160 rec300 rec340 rec620 rec650 rec670 rec690 ;

    attrib DLABEL length = $ 28;

infile indata91 ;


input

 /*000*/  /* label record */  
   stateid  $ 1-2 
   distid   $ 3-4 
   rec000     5-7  
   year       8-9  
   version     10  
   dlabel &

  /* Total Population */  
/ /*100*/  pop  11-19  rural 20-28  male  29-37  Rmale  38-46

  /* Total main workers */
/ /*111*/  work 11-19  workR 20-28  workM 29-37  workRM 38-46
/ /*112*/  farm 11-19  farmR 20-28  farmM 29-37  farmRM 38-46
/ /*113*/  cult 11-19  cultR 20-28  cultM 29-37  cultRM 38-46
/ /*114*/  alab 11-19  alabR 20-28  alabM 29-37  alabRM 38-46
/ /*115*/  hind 11-19  hindR 20-28  hindM 29-37  hindRM 38-46
/ /*116*/  othr 11-19  othrR 20-28  othrM 29-37  othrRM 38-46
/ /*117*/  live 11-19  liveR 20-28  liveM 29-37  liveRM 38-46
/ /*118*/  mine 11-19  mineR 20-28  mineM 29-37  mineRM 38-46  
/ /*119*/  manf 11-19  manfR 20-28  manfM 29-37  manfRM 38-46
/ /*120*/  cons 11-19  consR 20-28  consM 29-37  consRM 38-46
/ /*121*/  comm 11-19  commR 20-28  commM 29-37  commRM 38-46
/ /*122*/  tran 11-19  tranR 20-28  tranM 29-37  tranRM 38-46
/ /*123*/  serv 11-19  servR 20-28  servM 29-37  servRM 38-46

   /* Marginal Workers */ 
/ /*124*/  marg   11-19  margR  20-28  margM  29-37  margRM  38-46

 /* Non-workers, not even marginal workers */ 
/ /*125*/  nowk   11-19  nowkR  20-28  nowkM  29-37  nowkRM  38-46

 /* Total workers, main + marginal workers */ 
/ /*126*/  twork  11-19  tworkR  20-28  tworkM  29-37  tworkRM  38-46

 /* Not main workers, (but including marginal workers) */ 
/ /*139*/  nmain  11-19  nmainR  20-28  nmainM  29-37  nmainRM  38-46

 /* Literates*/
/ /*140*/   rec140 5-7
    		lit   11-19  litR   20-28  litM   29-37  litRM   38-46
/ /*141*/   lit07 11-19  lit07R 20-28  lit07M 29-37  lit07RM 38-46
/ /*142*/   lit10 11-19  lit10R 20-28  lit10M 29-37  lit10RM 38-46
/ /*143*/   lit15 11-19  lit15R 20-28  lit15M 29-37  lit15RM 38-46
/ /*144*/   lit20 11-19  lit20R 20-28  lit20M 29-37  lit20RM 38-46
/ /*145*/   lit25 11-19  lit25R 20-28  lit25M 29-37  lit25RM 38-46
/ /*146*/   lit30 11-19  lit30R 20-28  lit30M 29-37  lit30RM 38-46
/ /*147*/   lit35 11-19  lit35R 20-28  lit35M 29-37  lit35RM 38-46
/ /*148*/   lit60 11-19  lit60R 20-28  lit60M 29-37  lit60RM 38-46
/ /*148*/   litNA 11-19  litNAR 20-28  litNAM 29-37  litNARM 38-46

/ /*151*/   pri   11-19  priR   20-28  priM   29-37  priRM   38-46
/ /*152*/   mid   11-19  midR   20-28  midM   29-37  midRM   38-46
/ /*153*/   mat   11-19  matR   20-28  matM   29-37  matRM   38-46
/ /*154*/   ntdip 11-19  ntdipR 20-28  ntdipM 29-37  ntdipRM 38-46
/ /*155*/   dip   11-19  dipR   20-28  dipM   29-37  dipRM   38-46
/ /*156*/   grad  11-19  gradR  20-28  gradM  29-37  gradRM  38-46

/ /*160*/   rec160 5-7
    		pop00 11-19  pop00R 20-28  pop00M 29-37  pop00RM 38-46
/ /*161*/   pop05 11-19  pop05R 20-28  pop05M 29-37  pop05RM 38-46
/ /*162*/   pop10 11-19  pop10R 20-28  pop10M 29-37  pop10RM 38-46
/ /*163*/   pop15 11-19  pop15R 20-28  pop15M 29-37  pop15RM 38-46
/ /*164*/   pop20 11-19  pop20R 20-28  pop20M 29-37  pop20RM 38-46 
/ /*165*/   pop25 11-19  pop25R 20-28  pop25M 29-37  pop25RM 38-46 
/ /*166*/   pop30 11-19  pop30R 20-28  pop30M 29-37  pop30RM 38-46
/ /*167*/   pop35 11-19  pop35R 20-28  pop35M 29-37  pop35RM 38-46
/ /*168*/   pop40 11-19  pop40R 20-28  pop40M 29-37  pop40RM 38-46
/ /*169*/   pop45 11-19  pop45R 20-28  pop45M 29-37  pop45RM 38-46
/ /*170*/   pop50 11-19  pop50R 20-28  pop50M 29-37  pop50RM 38-46
/ /*171*/   pop55 11-19  pop55R 20-28  pop55M 29-37  pop55RM 38-46
/ /*172*/   pop60 11-19  pop60R 20-28  pop60M 29-37  pop60RM 38-46
/ /*173*/   pop65 11-19  pop65R 20-28  pop65M 29-37  pop65RM 38-46
/ /*174*/   pop70 11-19  pop70R 20-28  pop70M 29-37  pop70RM 38-46
/ /*175*/   pop75 11-19  pop75R 20-28  pop75M 29-37  pop75RM 38-46
/ /*176*/   pop80 11-19  pop80R 20-28  pop80M 29-37  pop80RM 38-46
/ /*177*/   pop85 11-19  pop85R 20-28  pop85M 29-37  pop85RM 38-46
/ /*178*/   pop90 11-19  pop90R 20-28  pop90M 29-37  pop90RM 38-46
/ /*179*/   pop95 11-19  pop95R 20-28  pop95M 29-37  pop95RM 38-46
/ /*180*/   popNA 11-19  popNAR 20-28  popNAM 29-37  popNARM 38-46


/*** Primary education by age ***/

/ /*181*/   pri07 11-19  pri07R 20-28  pri07M 29-37  pri07RM 38-46
/ /*182*/   pri10 11-19  pri10R 20-28  pri10M 29-37  pri10RM 38-46
/ /*183*/   pri15 11-19  pri15R 20-28  pri15M 29-37  pri15RM 38-46
/ /*184*/   pri20 11-19  pri20R 20-28  pri20M 29-37  pri20RM 38-46
/ /*185*/   pri25 11-19  pri25R 20-28  pri25M 29-37  pri25RM 38-46
/ /*186*/   pri30 11-19  pri30R 20-28  pri30M 29-37  pri30RM 38-46
/ /*187*/   pri35 11-19  pri35R 20-28  pri35M 29-37  pri35RM 38-46
/ /*188*/   pri60 11-19  pri60R 20-28  pri60M 29-37  pri60RM 38-46
/ /*189*/   priNA 11-19  priNAR 20-28  priNAM 29-37  priNARM 38-46

/*  special age category for literacy and education data */
/ /*190*/   pop07 11-19 pop07R 20-28  pop07M 29-37  pop07RM 38-46

/*** Matriculate education by age ***/

/ /*192*/   mat10 11-19  mat10R 20-28  mat10M 29-37  mat10RM 38-46
/ /*193*/   mat15 11-19  mat15R 20-28  mat15M 29-37  mat15RM 38-46
/ /*194*/   mat20 11-19  mat20R 20-28  mat20M 29-37  mat20RM 38-46
/ /*195*/   mat25 11-19  mat25R 20-28  mat25M 29-37  mat25RM 38-46
/ /*196*/   mat30 11-19  mat30R 20-28  mat30M 29-37  mat30RM 38-46
/ /*197*/   mat35 11-19  mat35R 20-28  mat35M 29-37  mat35RM 38-46
/ /*198*/   mat60 11-19  mat60R 20-28  mat60M 29-37  mat60RM 38-46
/ /*199*/   matNA 11-19  matNAR 20-28  matNAM 29-37  matNARM 38-46

  /* Scheduled Caste population */  
/ /*200*/   sc    11-19  scR     20-28  scM     29-37  scRM     38-46

  /* Scheduled Tribe population */  
/ /*250*/   st    11-19  stR    20-28   stM    29-37   stRM    38-46

   /* Migration data */
/ /*300*/   rec300 5-7
    		mig   11-19  migR   20-28   migM   29-37   migRM   38-46
/ /*301*/   migod 11-19  migodR 20-28   migodM 29-37   migodRM 38-46
/ /*302*/   migos 11-19  migosR 20-28   migosM 29-37   migosRM 38-46
/ /*303*/   migfu 11-19  migfuR 20-28   migfuM 29-37   migfuRM 38-46
/ /*304*/   migfr 11-19  migfrR 20-28   migfrM 29-37   migfrRM 38-46
/ /*305*/   migrd 11-19  migrdR 20-28   migrdM 29-37   migrdRM 38-46
/ /*306*/   migrs 11-19  migrsR 20-28   migrsM 29-37   migrsRM 38-46 
/ /*307*/   migas 11-19  migasR 20-28   migasM 29-37   migasRM 38-46
/ /*308*/   migeu 11-19  migeuR 20-28   migeuM 29-37   migeuRM 38-46 
/ /*309*/   migaf 11-19  migafR 20-28   migafM 29-37   migafRM 38-46
/ /*310*/   migam 11-19  migamR 20-28   migamM 29-37   migamRM 38-46
/ /*311*/   migoc 11-19  migocR 20-28   migocM 29-37   migocRM 38-46

  /* Work by age */
/ /*315*/  wk00  11-19  wk00R  20-28   wk00M  29-37  wk00RM  38-46
/ /*316*/  twk00 11-19  twk00R 20-28   twk00M 29-37  twk00RM 38-46

  /* Muslims */
/ /*332*/  musl  11-19  muslr  20-28   muslm  29-37  muslrm  38-46

  /* Marriage data*/
/ /*340*/  rec340 5-7
    	   nvm   11-19  nvmR   20-28   nvmM   29-37  nvmRM   38-46
/ /*341*/  nvm10 11-19  nvm10R 20-28   nvm10M 29-37  nvm10RM 38-46
/ /*342*/  nvm15 11-19  nvm15R 20-28   nvm15M 29-37  nvm15RM 38-46
/ /*343*/  nvm20 11-19  nvm20R 20-28   nvm20M 29-37  nvm20RM 38-46
/ /*344*/  nvm25 11-19  nvm25R 20-28   nvm25M 29-37  nvm25RM 38-46
/ /*345*/  nvm30 11-19  nvm30R 20-28   nvm30M 29-37  nvm30RM 38-46
/ /*346*/  nvm35 11-19  nvm35R 20-28   nvm35M 29-37  nvm35RM 38-46
/ /*347*/  nvm40 11-19  nvm40R 20-28   nvm40M 29-37  nvm40RM 38-46
/ /*348*/  nvm45 11-19  nvm45R 20-28   nvm45M 29-37  nvm45RM 38-46
/ /*349*/  nvm50 11-19  nvm50R 20-28   nvm50M 29-37  nvm50RM 38-46
/ /*350*/  nvm55 11-19  nvm55R 20-28   nvm55M 29-37  nvm55RM 38-46
/ /*351*/  nvm60 11-19  nvm60R 20-28   nvm60M 29-37  nvm60RM 38-46
/ /*352*/  nvm65 11-19  nvm65R 20-28   nvm65M 29-37  nvm65RM 38-46
/ /*353*/  nvm70 11-19  nvm70R 20-28   nvm70M 29-37  nvm70RM 38-46
/ /*354*/  nvm75 11-19  nvm75R 20-28   nvm75M 29-37  nvm75RM 38-46
/ /*355*/  nvm80 11-19  nvm80R 20-28   nvm80M 29-37  nvm80RM 38-46
/ /*359*/  nvmNA 11-19  nvmNAR 20-28   nvmNAM 29-37  nvmNARM 38-46

/ /*360*/  wid   11-19  widR   20-28   widM   29-37  widRM   38-46
/ /*361*/  wid10 11-19  wid10R 20-28   wid10M 29-37  wid10RM 38-46
/ /*362*/  wid15 11-19  wid15R 20-28   wid15M 29-37  wid15RM 38-46
/ /*363*/  wid20 11-19  wid20R 20-28   wid20M 29-37  wid20RM 38-46
/ /*364*/  wid25 11-19  wid25R 20-28   wid25M 29-37  wid25RM 38-46
/ /*365*/  wid30 11-19  wid30R 20-28   wid30M 29-37  wid30RM 38-46
/ /*366*/  wid35 11-19  wid35R 20-28   wid35M 29-37  wid35RM 38-46
/ /*367*/  wid40 11-19  wid40R 20-28   wid40M 29-37  wid40RM 38-46
/ /*368*/  wid45 11-19  wid45R 20-28   wid45M 29-37  wid45RM 38-46
/ /*369*/  wid50 11-19  wid50R 20-28   wid50M 29-37  wid50RM 38-46
/ /*370*/  wid55 11-19  wid55R 20-28   wid55M 29-37  wid55RM 38-46
/ /*371*/  wid60 11-19  wid60R 20-28   wid60M 29-37  wid60RM 38-46
/ /*372*/  wid65 11-19  wid65R 20-28   wid65M 29-37  wid65RM 38-46
/ /*373*/  wid70 11-19  wid70R 20-28   wid70M 29-37  wid70RM 38-46
/ /*374*/  wid75 11-19  wid75R 20-28   wid75M 29-37  wid75RM 38-46
/ /*375*/  wid80 11-19  wid80R 20-28   wid80M 29-37  wid80RM 38-46
/ /*379*/  widNA 11-19  widNAR 20-28   widNAM 29-37  widNARM 38-46

/ /*380*/  div   11-19  divR   20-28   divM   29-37  divRM   38-46
/ /*381*/  div10 11-19  div10R 20-28   div10M 29-37  div10RM 38-46
/ /*382*/  div15 11-19  div15R 20-28   div15M 29-37  div15RM 38-46
/ /*383*/  div20 11-19  div20R 20-28   div20M 29-37  div20RM 38-46
/ /*384*/  div25 11-19  div25R 20-28   div25M 29-37  div25RM 38-46
/ /*385*/  div30 11-19  div30R 20-28   div30M 29-37  div30RM 38-46
/ /*386*/  div35 11-19  div35R 20-28   div35M 29-37  div35RM 38-46
/ /*387*/  div40 11-19  div40R 20-28   div40M 29-37  div40RM 38-46
/ /*388*/  div45 11-19  div45R 20-28   div45M 29-37  div45RM 38-46
/ /*389*/  div50 11-19  div50R 20-28   div50M 29-37  div50RM 38-46
/ /*390*/  div55 11-19  div55R 20-28   div55M 29-37  div55RM 38-46
/ /*391*/  div60 11-19  div60R 20-28   div60M 29-37  div60RM 38-46
/ /*392*/  div65 11-19  div65R 20-28   div65M 29-37  div65RM 38-46
/ /*393*/  div70 11-19  div70R 20-28   div70M 29-37  div70RM 38-46
/ /*394*/  div75 11-19  div75R 20-28   div75M 29-37  div75RM 38-46
/ /*395*/  div80 11-19  div80R 20-28   div80M 29-37  div80RM 38-46
/ /*399*/  divNA 11-19  divNAR 20-28   divNAM 29-37  divNARM 38-46

/* occupational categories */

/ /*415*/ teach 11-19   teachR 20-28   teachM 29-37  teachRM 38-46

   /* Area & Households */
/ /*600*/  area    11-19 .2 areaR 20-28 .2 
/ /*601*/  houses  11-19  housesR  20-28
/ /*602*/  hh      11-19  hhR      20-28
/ /*607*/ vacant   11-19  vacantR  20-28
/ /*608*/ resid    11-19  residR   20-28
/ /*609*/ resshp   11-19  resshpR  20-28
/ /*610*/ reswk    11-19  reswkR   20-28
/ /*611*/ resoth   11-19  resothR  20-28
/ /*612*/ hotel    11-19  hotelR   20-28
/ /*613*/ shop     11-19  shopR    20-28
/ /*614*/ office   11-19  officeR  20-28
/ /*615*/ fact     11-19  factR    20-28
/ /*616*/ eating   11-19  eatingR  20-28
/ /*617*/ commun   11-19  communR  20-28
/ /*618*/ temple   11-19  templeR  20-28
/ /*619*/ helse    11-19  helseR   20-28
/ /*620*/ rec620    5-7
    	  h1tot    11-19  h1totR   20-28
/ /*621*/ rgrass   11-19  rgrassR  20-28
/ /*622*/ rtile    11-19  rtileR   20-28
/ /*623*/ rmetal   11-19  rmetalR  20-28
/ /*624*/ rsheet   11-19  rsheetR  20-28
/ /*625*/ rbrick   11-19  rbrickR  20-28
/ /*626*/ rstone   11-19  rstoneR  20-28
/ /*627*/ rconc    11-19  rconcR   20-28
/ /*628*/ relse    11-19  relseR   20-28
/ /*630*/ fmud     11-19  fmudR    20-28
/ /*631*/ fwood    11-19  fwoodR   20-28
/ /*632*/ fgrass   11-19  fgrassR  20-28
/ /*633*/ fbrick   11-19  fbrickR  20-28
/ /*634*/ fconc    11-19  fconcR   20-28
/ /*635*/ ftile    11-19  ftileR   20-28
/ /*636*/ felse    11-19  felseR   20-28
/ /*640*/ wgrass   11-19  wgrassR  20-28
/ /*641*/ wmud     11-19  wmudR    20-28
/ /*642*/ wblock   11-19  wblockR  20-28
/ /*643*/ wwood    11-19  wwoodR   20-28
/ /*644*/ wbrick   11-19  wbrickR  20-28
/ /*645*/ wmetal   11-19  wmetalR  20-28
/ /*646*/ wstone   11-19  wstoneR  20-28
/ /*647*/ wconc    11-19  wconcR   20-28
/ /*648*/ wekra    11-19  wekraR   20-28
/ /*649*/ welse    11-19  welseR   20-28
/ /*650*/ rec650    5-7
    	  h3tot    11-19  h3totR   20-28
/ /*651*/ hown     11-19  hownR    20-28
/ /*652*/ hrent    11-19  hrentR   20-28
/ /*653*/ htelse   11-19  htelseR  20-28
/ /*654*/ hn1t2    11-19  hn1t2R   20-28
/ /*655*/ hn3t5    11-19  hn3t5R   20-28
/ /*656*/ hn6t8    11-19  hn6t8R   20-28
/ /*657*/ hn9p     11-19  hn9pR    20-28
/ /*660*/ rooms0   11-19  rooms0R  20-28
/ /*661*/ rooms1   11-19  rooms1R  20-28
/ /*662*/ rooms2   11-19  rooms2R  20-28
/ /*663*/ rooms3   11-19  rooms3R  20-28
/ /*664*/ rooms4   11-19  rooms4R  20-28
/ /*665*/ rooms5   11-19  rooms5R  20-28
/ /*666*/ rooms6   11-19  rooms6R  20-28
/ /*667*/ roomsx   11-19  roomsxR  20-28
/ /*670*/ rec670    5-7
    	  h4tot    11-19  h4totR   20-28
/ /*671*/ helec    11-19  helecR   20-28
/ /*672*/ toilet   11-19  toiletR  20-28
/ /*681*/ hwell    11-19  hwellR   20-28
/ /*682*/ htap     11-19  htapR    20-28
/ /*683*/ hpump    11-19  hpumpR   20-28
/ /*684*/ hriver   11-19  hriverR  20-28
/ /*685*/ htank    11-19  htankR   20-28
/ /*686*/ hwelse   11-19  hwelseR  20-28
/ /*687*/ hwin     11-19  hwinR    20-28
/ /*688*/ hwout    11-19  hwoutR   20-28
/ /*689*/ hitap    11-19  hitapR   20-28
/ /*690*/ rec690    5-7
    	  cdung    11-19  cdungR   20-28
/ /*691*/ celec    11-19  celecR   20-28
/ /*692*/ ccoal    11-19  ccoalR   20-28
/ /*693*/ ccharc   11-19  ccharcR  20-28
/ /*694*/ cgas     11-19  cgasR    20-28
/ /*695*/ cwood    11-19  cwoodR   20-28
/ /*696*/ cbio     11-19  cbioR    20-28
/ /*697*/ ckero    11-19  ckeroR   20-28
/ /*698*/ celse    11-19  celseR   20-28
/ /*699*/ cunsp    11-19  cunspR   20-28

;


array x {*} _NUMERIC_ ;
do ivar=1 to dim(x);
    if x(ivar)= -1 then x(ivar)=.;
end;
drop ivar;

urban= pop-rural;
female= pop-male;

rfemale= rural-Rmale;
umale  = male -Rmale;
ufemale= urban-umale;


label   stateid =  'State ID' ;
label   distid  =  'District ID within state' ;
label   rec000  =  'Record ID (check always=000)' ;
label   year    =  'Year ID (check always=81)' ;
label   version =  'Version ID (check always=2)' ;
label   dlabel  =  'District name' ;

label   pop =   'Total population' ;
label   rural = 'Rural population' ;
label   urban = 'Urban population' ;
label   male =   'Total male population' ;
label   Rmale =  'Rural male population' ;
label   female  = 'Total female population' ;
label   Rfemale = 'Rural female population' ;
label   Ufemale = 'Urban female population' ;
label   Umale   = 'Urban male population' ;

/* labor force variables */
label work =  'Total labor force' ;
label workR = 'Labor force, rural' ;
label workM = 'Labor force, men' ;
label workRM ='Labor force, rural men' ;
label farm =    'Farm' ;
label farmR =   'Farm, rural' ;
label farmM =   'Farm, men' ;
label farmRM =  'Farm, rural men' ;
label cult =    'Cultivators' ;
label cultR =   'Cultivators, rural' ;
label cultM =   'Cultivators, men' ;
label cultRM =  'Cultivators, rural men' ;
label alab =    'Landless labor' ;
label alabR =   'Landless labor, rural' ;
label alabM =   'Landless labor, men' ;
label alabRM =  'Landless labor, rural men' ;
label hind =    'Household industry' ;
label hindR =   'Household industry, rural' ;
label hindM =   'Household industry, men' ;
label hindRM =  'Household industry, rural men' ;
label othr =    'Nonfarm nonhh' ;
label othrR =   'Nonfarm nonhh, rural' ;
label othrM =   'Nonfarm nonhh, men' ;
label othrRM =  'Nonfarm nonhh, rural men' ;
label manf =    'Manufacturing' ;
label manfR =   'Manufacturing, rural' ;
label manfM =   'Manufacturing, men' ;
label manfRM =  'Manufacturing, rural men' ;
label live =    'Livestock, orchards, etc.' ;
label liveR =   'Livestock, orchards, etc., rural' ;
label liveM =   'Livestock, orchards, etc., men' ;
label liveRM =  'Livestock, orchards, etc., rural men' ;
label mine  =   'Mining' ;
label mineR =   'Mining, rural' ;
label mineM =   'Mining, men' ;
label mineRM =  'Mining, rural men' ;
label cons =    'Construction' ;
label consR =   'Construction, rural' ;
label consM =   'Construction, men' ;
label consRM =  'Construction, rural men' ;
label comm =    'Commerce' ;
label commR =   'Commerce, rural' ;
label commM =   'Commerce, men' ;
label commRM =  'Commerce, rural men' ;
label tran =    'Transport and Communication' ;
label tranR =   'Transport and communication, rural' ;
label tranM =   'Transport and communication, men' ;
label tranRM =  'Transport and communication, rural men' ;
label serv =    'Other services' ;
label servR =   'Other services, rural' ;
label servM =   'Other services, men' ;
label servRM =  'Other services, rural men' ;
label marg =    'Marginal workers' ;
label margR =   'Marginal workers, rural' ;
label margM =   'Marginal workers, men' ;
label margRM =  'Marginal workers, rural men' ;
label nowk =    'Not main or marginal worker' ;
label nowkR =   'Not main or marginal worker, rural' ;
label nowkM =   'Not main or marginal worker, men' ;
label nowkRM =  'Not main or marginal worker, rural men' ;
label twork  =   'Marginal + main workers' ;
label tworkR =   'Marginal + main workers, rural' ;
label tworkM =   'Marginal + main workers, men' ;
label tworkRM =  'Marginal + main workers, rural men' ;
label nmain =   'Not main worker' ;
label nmainR =  'Not main worker, rural' ;
label nmainM =  'Not main worker, men' ;
label nmainRM = 'Not main worker, rural men' ;
label wk00   =   'Main workers 0-14' ;
label wk00R  =   'Main workers 0-14, rural' ;
label wk00M  =   'Main workers 0-14, boys' ;
label wk00RM =   'Main workers 0-14, rural boys' ;
label twk00  =   'Marginal + main workers 0-14' ;
label twk00R  =  'Marginal + main workers 0-14, rural' ;
label twk00M  =  'Marginal + main workers 0-14, boys' ;
label twk00RM =  'Marginal + main workers 0-14, rural boys' ;

/* age ranges */
label pop00 =   'Children 0-4' ;
label pop00R =  'Rural children 0-4' ;
label pop00M =  'Boys 0-4' ;
label pop00RM = 'Rural boys 0-4' ;
label pop05 =   'Children 5-9' ;
label pop05R =  'Rural children 5-9' ;
label pop05M =  'Boys 5-9' ;
label pop05RM = 'Rural boys 5-9' ;
label pop07 =   'Children 7-9' ;
label pop07R =  'Rural children 7-9' ;
label pop07M =  'Boys 7-9' ;
label pop07RM = 'Rural boys 7-9' ;
label pop10 =   'Children 10-14' ;
label pop10R =  'Children 10-14, rural' ;
label pop10M =  'Boys 10-14' ;
label pop10RM = 'Boys 10-14, rural' ;
label pop15 =   'Persons 15-24' ;
label pop15R =  'Persons 15-24, rural' ;
label pop15M =  'Men 15-24' ;
label pop15RM = 'Men 15-24, rural' ;
label pop20 =   'Persons 20-24' ;
label pop20R =  'Persons 20-24, rural' ;
label pop20M =  'Men 20-24' ;
label pop20RM = 'Men 20-24, rural' ;
label pop25 =   'Persons 25-29' ;
label pop25R =  'Persons 25-29, rural' ;
label pop25M =  'Men 25-29' ;
label pop25RM = 'Men 25-29, rural' ;
label pop30 =   'Persons 30-34' ;
label pop30R =  'Persons 30-34, rural' ;
label pop30M =  'Men 30-34' ;
label pop30RM = 'Men 30-34, rural' ;
label pop35 =   'Persons 35-39' ;
label pop35R =  'Persons 35-39, rural' ;
label pop35M =  'Men 35-39' ;
label pop35RM = 'Men 35-39, rural' ;
label pop40 =   'Persons 40-44' ;
label pop40R =  'Persons 40-44, rural' ;
label pop40M =  'Men 40-44' ;
label pop40RM = 'Men 40-44, rural' ;
label pop45 =   'Persons 45-49' ;
label pop45R =  'Persons 45-49, rural' ;
label pop45M =  'Men 45-49' ;
label pop45RM = 'Men 45-49, rural' ;
label pop50 =   'Persons 50-54' ;
label pop50R =  'Persons 50-54, rural' ;
label pop50M =  'Men 50-54' ;
label pop50RM = 'Men 50-54, rural' ;
label pop55 =   'Persons 55-59' ;
label pop55R =  'Persons 55-59, rural' ;
label pop55M =  'Men 55-59' ;
label pop55RM = 'Men 55-59, rural' ;
label pop60 =   'Persons 60-64' ;
label pop60R =  'Persons 60-64, rural' ;
label pop60M =  'Men 60-64' ;
label pop60RM = 'Men 60-64, rural' ;
label pop65 =   'Persons 65-69' ;
label pop65R =  'Persons 65-69, rural' ;
label pop65M =  'Men 65-69' ;
label pop65RM = 'Men 65-69, rural' ;
label pop70 =   'Persons 70-74' ;
label pop70R =  'Persons 70-74, rural' ;
label pop70M =  'Men 70-74' ;
label pop70RM = 'Men 70-74, rural' ;
label pop75 =   'Persons 75-79' ;
label pop75R =  'Persons 75-79, rural' ;
label pop75M =  'Men 75-79' ;
label pop75RM = 'Men 75-79, rural' ;
label pop80 =   'Persons 80-84' ;
label pop80R =  'Persons 80-84, rural' ;
label pop80M =  'Men 80-84' ;
label pop80RM = 'Men 80-84, rural' ;
label pop85 =   'Persons 85-89' ;
label pop85R =  'Persons 85-89, rural' ;
label pop85M =  'Men 85-89' ;
label pop85RM = 'Men 85-89, rural' ;
label pop90 =   'Persons 90-94' ;
label pop90R =  'Persons 90-94, rural' ;
label pop90M =  'Men 90-94' ;
label pop90RM = 'Men 90-94, rural' ;
label pop95 =   'Persons 95+' ;
label pop95R =  'Persons 95+, rural' ;
label pop90M =  'Men 90+' ;
label pop90RM = 'Men 90+, rural' ;
label popNA =   'Persons no age stated' ;
label popNAR =  'Persons no age stated, rural' ;
label popNAM =  'Men no age stated' ;
label popNARM = 'Men no age stated, rural' ;

label lit =     'Literates' ;
label litR =    'Literates, rural' ;
label litM =    'Literates, men' ;
label litRM =   'Literates, rural men' ;
label lit07 =   'Literates: Ages 7-9' ;
label lit07R =  'Literates: ages 7-9, rural' ;
label lit07M =  'Literates: ages 7-9, boys' ;
label lit07RM = 'Literates: ages 7-9, rural boys' ;
label lit10 =   'Literates: ages 10-14' ;
label lit10R =  'Literates: ages 10-14, rural' ;
label lit10M =  'Literates: ages 10-14, boys' ;
label lit10RM = 'Literates: ages 10-14, rural boys' ;
label lit15 =   'Literates: ages 15-24' ;
label lit15R =  'Literates: ages 15-24, rural' ;
label lit15M =  'Literates: ages 15-24, men' ;
label lit15RM = 'Literates: ages 15-24, rural men' ;
label lit20 =   'Literates: ages 20-24' ;
label lit20R =  'Literates: ages 20-24, rural' ;
label lit20M =  'Literates: ages 20-24, men' ;
label lit20RM = 'Literates: ages 20-24, rural men' ;
label lit25 =   'Literates: ages 25-29' ;
label lit25R =  'Literates: ages 25-29, rural' ;
label lit25M =  'Literates: ages 24-29, men' ;
label lit25RM = 'Literates: ages 24-29, rural men' ;
label lit30 =   'Literates: ages 30-34' ;
label lit30R =  'Literates: ages 30-34, rural' ;
label lit30M =  'Literates: ages 30-34, men' ;
label lit30RM = 'Literates: ages 30-34, rural men' ;
label lit35 =   'Literates: ages 35-59' ;
label lit35R =  'Literates: ages 35-59, rural' ;
label lit35M =  'Literates: ages 35-59, men' ;
label lit35RM = 'Literates: ages 35-59, rural men' ;
label lit60 =   'Literates: ages 60+' ;
label lit60R =  'Literates: ages 60+, rural' ;
label lit60M=   'Literates: ages 60+, men' ;
label lit60RM = 'Literates: ages 60+, rural men' ;
label litNA =   'Literates: no age stated' ;
label litNAR =  'Literates: no age stated, rural' ;
label litNAM=   'Literates: no age stated, men' ;
label litNARM = 'Literates: no age stated, rural men' ;

label pri =     'Primary school or higher' ;
label priR =    'Primary school or higher, rural' ;
label priM =    'Primary school or higher, men' ;
label priRM =   'Primary school or higher, rural men' ;
label pri07 =   'Primary school +, 7-9' ;
label pri07R =  'Primary school +, 7-9, rural' ;
label pri07M =  'Primary school +, 7-9, boys' ;
label pri07RM = 'Primary school +, 7-9, rural boys' ;
label pri10 =   'Primary school +, 10-14' ;
label pri10R =  'Primary school +, 10-14, rural' ;
label pri10M =  'Primary school +, 10-14, boys' ;
label pri10RM = 'Primary school +, 10-14, rural boys' ;
label pri15 =   'Primary school +, 15-19' ;
label pri15R =  'Primary school +, 15-19, rural' ;
label pri15M =  'Primary school +, 15-19, men' ;
label pri15RM = 'Primary school +, 15-19, rural men' ;
label pri20 =   'Primary school +, 20-24' ;
label pri20R =  'Primary school +, 20-24, rural' ;
label pri20M =  'Primary school +, 20-24, men' ;
label pri20RM = 'Primary school +, 20-24, rural men' ;
label pri25 =   'Primary school +, 25-29' ;
label pri25R =  'Primary school +, 25-29, rural' ;
label pri25M =  'Primary school +, 25-29, men' ;
label pri25RM = 'Primary school +, 25-29, rural men' ;
label pri30 =   'Primary school +, 30-34' ;
label pri30R =  'Primary school +, 30-34, rural' ;
label pri30M =  'Primary school +, 30-34, men' ;
label pri30RM = 'Primary school +, 30-34, rural men' ;
label pri35 =   'Primary school +, 35-59' ;
label pri35R =  'Primary school +, 35-59, rural' ;
label pri35M =  'Primary school +, 35-59, men' ;
label pri35RM = 'Primary school +, 35-59, rural men' ;
label pri60 =   'Primary school +, 60+' ;
label pri60R =  'Primary school +, 60+, rural' ;
label pri60M =  'Primary school +, 60+, men' ;
label pri60RM = 'Primary school +, 60+, rural men' ;
label priNA =   'Primary school +, age missing' ;
label priNAR =  'Primary school +, age missing, rural' ;
label priNAM =  'Primary school +, age missing, men' ;
label priNARM = 'Primary school +, age missing, rural men' ;

label mid =     'Middle school of higher' ;
label midR =    'Middle school or higher, rural' ;
label midM =    'Middle school or higher, men' ;
label midRM =   'Middle school or higher, rural men' ;

label mat =    'Matriculate or higher' ;
label matR =   'Matriculate or higher, rural' ;
label matM =   'Matriculate or higher, men' ;
label matRM =  'Matriculate or higher, rural men' ;

label mat10 =    'Matriculate +, 10-14' ;
label mat10R =   'Matriculate +, 10-14, rural' ;
label mat10M =   'Matriculate +, 10-14, boys' ;
label mat10RM =  'Matriculate +, 10-14, rural boys' ;
label mat15 =    'Matriculate +, 15-19' ;
label mat15R =   'Matriculate +, 15-19, rural' ;
label mat15M =   'Matriculate +, 15-19, men' ;
label mat15RM =  'Matriculate +, 15-19, rural men' ;
label mat20 =    'Matriculate +, 20-24' ;
label mat20R =   'Matriculate +, 20-24, rural' ;
label mat20M =   'Matriculate +, 20-24, men' ;
label mat20RM =  'Matriculate +, 20-24, rural men' ;
label mat25 =    'Matriculate +, 25-29' ;
label mat25R =   'Matriculate +, 25-29, rural' ;
label mat25M =   'Matriculate +, 25-29, men' ;
label mat25RM =  'Matriculate +, 25-29, rural men' ;
label mat30 =    'Matriculate +, 30-34' ;
label mat30R =   'Matriculate +, 30-34, rural' ;
label mat30M =   'Matriculate +, 30-34, men' ;
label mat30RM =  'Matriculate +, 30-34, rural men' ;
label mat35 =    'Matriculate +, 35-59' ;
label mat35R =   'Matriculate +, 35-59, rural' ;
label mat35M =   'Matriculate +, 35-59, men' ;
label mat35RM =  'Matriculate +, 35-59, rural men' ;
label mat60 =    'Matriculate +, 60+' ;
label mat60R =   'Matriculate +, 60+, rural' ;
label mat60M =   'Matriculate +, 60+, men' ;
label mat60RM =  'Matriculate +, 60+, rural men' ;
label matNA =    'Matriculate +, age missing' ;
label matNAR =   'Matriculate +, age missing, rural' ;
label matNAM =   'Matriculate +, age missing, men' ;
label matNARM =  'Matriculate +, age missing, rural men' ;

label ntdip =   'Non-technical diploma or higher' ;
label ntdipR =  'Non-technical diploma or higher, rural' ;
label ntdipM =  'Non-technical diploma or higher, men' ;
label ntdipRM = 'Non-technical diploma or +, rural men' ;

label dip =     'Diploma or higher' ;
label dipR =    'Diploma or higher, rural' ;
label dipM =    'Diploma or higher, men' ;
label dipRM =   'Diploma or higher, rural men' ;

label grad =    'Graduate or higher' ;
label gradR =   'Graduate or higher, rural' ;
label gradM =   'Graduate or higher, men' ;
label gradRM =  'Graduate or higher, rural men' ;

label sc =      'Scheduled Caste population' ;
label scR =     'Scheduled Caste population, rural' ;
label scM =     'Scheduled Caste population, men' ;
label scRM =    'Scheduled Caste population, rural men' ;
label st =      'Scheduled Tribe population' ;
label stR =     'Scheduled Tribe population, rural' ;
label stM =     'Scheduled Tribe population, men' ;
label stRM =    'Scheduled Tribe population, rural men' ;

label mig =     'Migrants' ;
label migR =    'Migrants, rural' ;
label migM =    'Migrants, male ' ;
label migRM =   'Migrants, rural men' ;
label migod =    'Migrants from other district' ;
label migodR =   'Migrants from other district, rural' ;
label migodM =   'Migrants from other district, male ' ;
label migodRM =  'Migrants from other district, rural men' ;
label migos =    'Migrants from other state' ;
label migosR =   'Migrants from other state, rural' ;
label migosM =   'Migrants from other state, male ' ;
label migosRM =  'Migrants from other state, rural men' ;
label migfu =    'Migrants from urban India' ;
label migfuR =   'Migrants from urban India, rural' ;
label migfuM =   'Migrants from urban India, men' ;
label migfuRM =  'Migrants from urban India, rural men' ;
label migfr =   'Migrants from rural India' ;
label migfrR =  'Migrants from rural India, rural' ;
label migfrM =  'Migrants from rural India, men' ;
label migfrRM = 'Migrants from rural India, rural men' ;
label migrd =   'Migrants rural pt other district' ;
label migrdR =  'Migrants rural pt other district, rural' ;
label migrdM =  'Migrants rural pt other district, male ' ;
label migrdRM = 'Migrants rural other dist., rural men' ;
label migrs =   'Migrants rural part other state' ;
label migrsR =  'Migrants rural part other state, rural' ;
label migrsM =  'Migrants rural part other state, men' ;
label migrsRM = 'Migrants rural pt other st, rural men' ;

label migas =    'Migrants other Asian, incl USSR' ;
label migasR =   'Migrants other Asian, incl USSR, rural' ;
label migasM =   'Migrants other Asian, incl USSR, male ' ;
label migasRM =  'Migrants Asian, incl USSR, rural men' ;
label migeu =    'Migrants from Europe' ;
label migeuR =   'Migrants from Europe, rural' ;
label migeuM =   'Migrants from Europe, men' ;
label migeuRM =  'Migrants from Europe, rural men' ;
label migaf =   'Migrants from Africa' ;
label migafR =  'Migrants from Africa, rural' ;
label migafM =  'Migrants from Africa, men' ;
label migafRM = 'Migrants from Africa, rural men' ;
label migam =   'Migrants from Americas' ;
label migamR =  'Migrants from Americas, rural' ;
label migamM =  'Migrants from Americas, men' ;
label migamRM = 'Migrants from Americas, rural men' ;
label migoc =    'Migrants fron Oceania' ;
label migocR =   'Migrants fron Oceania, rural' ;
label migocM =   'Migrants fron Oceania, men' ;
label migocRM =  'Migrants fron Oceania, rural men' ;

label nvm =  'Never married' ;
label nvmR = 'Never married, rural' ;
label nvmM = 'Never married, men' ;
label nvmRM ='Never married, rural men' ;

label nvm10 =  'Never married 10-14' ;
label nvm10R = 'Never married 10-14, rural' ;
label nvm10M = 'Never married 10-14, boys' ;
label nvm10RM ='Never married 10-14, rural boys' ;
label nvm15 =  'Never married 15-19' ;
label nvm15R = 'Never married 15-19, rural' ;
label nvm15M = 'Never married 15-19, men' ;
label nvm15RM ='Never married 15-19, rural men' ;
label nvm20 =  'Never married 20-24' ;
label nvm20R = 'Never married 20-24, rural' ;
label nvm20M = 'Never married 20-24, men' ;
label nvm20RM ='Never married 20-24, rural men' ;
label nvm25 =  'Never married 25-29' ;
label nvm25R = 'Never married 25-29, rural' ;
label nvm25M = 'Never married 25-29, men' ;
label nvm25RM ='Never married 25-29, rural men' ;
label nvm30 =  'Never married 30-34' ;
label nvm30R = 'Never married 30-34, rural' ;
label nvm30M = 'Never married 30-34, men' ;
label nvm30RM ='Never married 30-34, rural men' ;
label nvm35 =  'Never married 35-39' ;
label nvm35R = 'Never married 35-39, rural' ;
label nvm35M = 'Never married 35-39, men' ;
label nvm35RM ='Never married 35-39, rural men' ;
label nvm40 =  'Never married 40-44' ;
label nvm40R = 'Never married 40-44, rural' ;
label nvm40M = 'Never married 40-44, men' ;
label nvm40RM ='Never married 40-44, rural men' ;
label nvm45 =  'Never married 45-49' ;
label nvm45R = 'Never married 45-49, rural' ;
label nvm45M = 'Never married 45-49, men' ;
label nvm45RM ='Never married 45-49, rural men' ;
label nvm50 =  'Never married 50-54' ;
label nvm50R = 'Never married 50-54, rural' ;
label nvm50M = 'Never married 50-54, men' ;
label nvm50RM ='Never married 50-54, rural men' ;
label nvm55 =  'Never married 55-59' ;
label nvm55R = 'Never married 55-59, rural' ;
label nvm55M = 'Never married 55-59, men' ;
label nvm55RM ='Never married 55-59, rural men' ;
label nvm60 =  'Never married 60-64' ;
label nvm60R = 'Never married 60-64, rural' ;
label nvm60M = 'Never married 60-64, men' ;
label nvm60RM ='Never married 60-64, rural men' ;
label nvm65 =  'Never married 65-69' ;
label nvm65R = 'Never married 65-69, rural' ;
label nvm65M = 'Never married 65-69, men' ;
label nvm65RM ='Never married 65-69, rural men' ;
label nvm70 =  'Never married 70-74' ;
label nvm70R = 'Never married 70-74, rural' ;
label nvm70M = 'Never married 70-74, men' ;
label nvm70RM ='Never married 70-74, rural men' ;
label nvm75 =  'Never married 75-79' ;
label nvm75R = 'Never married 75-79, rural' ;
label nvm75M = 'Never married 75-79, men' ;
label nvm75RM ='Never married 75-79, rural men' ;
label nvm80 =  'Never married 80+' ;
label nvm80R = 'Never married 80+, rural' ;
label nvm80M = 'Never married 80+, men' ;
label nvm80RM ='Never married 80+, rural men' ;
label nvmNA =  'Never married age missing' ;
label nvmNAR = 'Never married age missing, rural' ;
label nvmNAM = 'Never married age missing, men' ;
label nvmNARM ='Never married age missing, rural men' ;

/* Widow labels */
label wid     = 'Widowed' ;
label widR     = 'Widowed, rural' ;
label widM     = 'Widowed, men' ;
label widRM    = 'Widowed, rural men' ;

label wid10 =  'Widowed 10-14' ;
label wid10R = 'Widowed 10-14, rural' ;
label wid10M = 'Widowed 10-14, boys' ;
label wid10RM ='Widowed 10-14, rural boys' ;
label wid15 =  'Widowed 15-19' ;
label wid15R = 'Widowed 15-19, rural' ;
label wid15M = 'Widowed 15-19, men' ;
label wid15RM ='Widowed 15-19, rural men' ;
label wid20 =  'Widowed 20-24' ;
label wid20R = 'Widowed 20-24, rural' ;
label wid20M = 'Widowed 20-24, men' ;
label wid20RM ='Widowed 20-24, rural men' ;
label wid25 =  'Widowed 25-29' ;
label wid25R = 'Widowed 25-29, rural' ;
label wid25M = 'Widowed 25-29, men' ;
label wid25RM ='Widowed 25-29, rural men' ;
label wid30 =  'Widowed 30-34' ;
label wid30R = 'Widowed 30-34, rural' ;
label wid30M = 'Widowed 30-34, men' ;
label wid30RM ='Widowed 30-34, rural men' ;
label wid35 =  'Widowed 35-39' ;
label wid35R = 'Widowed 35-39, rural' ;
label wid35M = 'Widowed 35-39, men' ;
label wid35RM ='Widowed 35-39, rural men' ;
label wid40 =  'Widowed 40-44' ;
label wid40R = 'Widowed 40-44, rural' ;
label wid40M = 'Widowed 40-44, men' ;
label wid40RM ='Widowed 40-44, rural men' ;
label wid45 =  'Widowed 45-49' ;
label wid45R = 'Widowed 45-49, rural' ;
label wid45M = 'Widowed 45-49, men' ;
label wid45RM ='Widowed 45-49, rural men' ;
label wid50 =  'Widowed 50-54' ;
label wid50R = 'Widowed 50-54, rural' ;
label wid50M = 'Widowed 50-54, men' ;
label wid50RM ='Widowed 50-54, rural men' ;
label wid55 =  'Widowed 55-59' ;
label wid55R = 'Widowed 55-59, rural' ;
label wid55M = 'Widowed 55-59, men' ;
label wid55RM ='Widowed 55-59, rural men' ;
label wid60 =  'Widowed 60-64' ;
label wid60R = 'Widowed 60-64, rural' ;
label wid60M = 'Widowed 60-64, men' ;
label wid60RM ='Widowed 60-64, rural men' ;
label wid65 =  'Widowed 65-69' ;
label wid65R = 'Widowed 65-69, rural' ;
label wid65M = 'Widowed 65-69, men' ;
label wid65RM ='Widowed 65-69, rural men' ;
label wid70 =  'Widowed 70-74' ;
label wid70R = 'Widowed 70-74, rural' ;
label wid70M = 'Widowed 70-74, men' ;
label wid70RM ='Widowed 70-74, rural men' ;
label wid75 =  'Widowed 75-79' ;
label wid75R = 'Widowed 75-79, rural' ;
label wid75M = 'Widowed 75-79, men' ;
label wid75RM ='Widowed 75-79, rural men' ;
label wid80 =  'Widowed 80+' ;
label wid80R = 'Widowed 80+, rural' ;
label wid80M = 'Widowed 80+, men' ;
label wid80RM ='Widowed 80+, rural men' ;
label widNA =  'Widowed age missing' ;
label widNAR = 'Widowed age missing, rural' ;
label widNAM = 'Widowed age missing, men' ;
label widNARM ='Widowed age missing, rural men' ;

/* Divorced labels */
label div     = 'Divorced' ;
label divR     = 'Divorced, rural' ;
label divM     = 'Divorced, men' ;
label divRM    = 'Divorced, rural men' ;

label div10 =  'Divorced 10-14' ;
label div10R = 'Divorced 10-14, rural' ;
label div10M = 'Divorced 10-14, boys' ;
label div10RM ='Divorced 10-14, rural boys' ;
label div15 =  'Divorced 15-19' ;
label div15R = 'Divorced 15-19, rural' ;
label div15M = 'Divorced 15-19, men' ;
label div15RM ='Divorced 15-19, rural men' ;
label div20 =  'Divorced 20-24' ;
label div20R = 'Divorced 20-24, rural' ;
label div20M = 'Divorced 20-24, men' ;
label div20RM ='Divorced 20-24, rural men' ;
label div25 =  'Divorced 25-29' ;
label div25R = 'Divorced 25-29, rural' ;
label div25M = 'Divorced 25-29, men' ;
label div25RM ='Divorced 25-29, rural men' ;
label div30 =  'Divorced 30-34' ;
label div30R = 'Divorced 30-34, rural' ;
label div30M = 'Divorced 30-34, men' ;
label div30RM ='Divorced 30-34, rural men' ;
label div35 =  'Divorced 35-39' ;
label div35R = 'Divorced 35-39, rural' ;
label div35M = 'Divorced 35-39, men' ;
label div35RM ='Divorced 35-39, rural men' ;
label div40 =  'Divorced 40-44' ;
label div40R = 'Divorced 40-44, rural' ;
label div40M = 'Divorced 40-44, men' ;
label div40RM ='Divorced 40-44, rural men' ;
label div45 =  'Divorced 45-49' ;
label div45R = 'Divorced 45-49, rural' ;
label div45M = 'Divorced 45-49, men' ;
label div45RM ='Divorced 45-49, rural men' ;
label div50 =  'Divorced 50-54' ;
label div50R = 'Divorced 50-54, rural' ;
label div50M = 'Divorced 50-54, men' ;
label div50RM ='Divorced 50-54, rural men' ;
label div55 =  'Divorced 55-59' ;
label div55R = 'Divorced 55-59, rural' ;
label div55M = 'Divorced 55-59, men' ;
label div55RM ='Divorced 55-59, rural men' ;
label div60 =  'Divorced 60-64' ;
label div60R = 'Divorced 60-64, rural' ;
label div60M = 'Divorced 60-64, men' ;
label div60RM ='Divorced 60-64, rural men' ;
label div65 =  'Divorced 65-69' ;
label div65R = 'Divorced 65-69, rural' ;
label div65M = 'Divorced 65-69, men' ;
label div65RM ='Divorced 65-69, rural men' ;
label div70 =  'Divorced 70-74' ;
label div70R = 'Divorced 70-74, rural' ;
label div70M = 'Divorced 70-74, men' ;
label div70RM ='Divorced 70-74, rural men' ;
label div75 =  'Divorced 75-79' ;
label div75R = 'Divorced 75-79, rural' ;
label div75M = 'Divorced 75-79, men' ;
label div75RM ='Divorced 75-79, rural men' ;
label div80 =  'Divorced 80+' ;
label div80R = 'Divorced 80+, rural' ;
label div80M = 'Divorced 80+, men' ;
label div80RM ='Divorced 80+, rural men' ;
label divNA =  'Divorced age missing' ;
label divNAR = 'Divorced age missing, rural' ;
label divNAM = 'Divorced age missing, men' ;
label divNARM ='Divorced age missing, rural men' ;


label   area =   'Area in sq. kilometers' ;
label   houses = 'Houses' ;
label   hh =     'Households' ;
label   areaR =  'Area in sq. kilometers, rural' ;
label   housesR ='Houses, rural' ;
label   hhR =    'Households, rural' ;


    label vacant =   "H1: vacant census houses" ;
    label resid =    "H1: residence" ;
    label resshp =   "H1: shop cum residence" ;
    label reswk =    "H1: workshop cum residence" ;
    label resoth =   "H1: residence plus other use" ;
    label hotel =    "H1: hotels, sarais, etc." ;
    label shop =     "H1: shops exc. eating houses" ;
    label office =   "H1: business houses" ;
    label fact =     "H1: factory, workshop & workshed" ;
    label eating =   "H1: restaurant & eating place" ;
    label commun =   "H1: entertainment, community" ;
    label temple =   "H1: temple, mosque, church, etc." ;
    label helse  =   "H1: other non-residential houses" ;
    label h1tot =    "H1: total census houses" ;
    label rgrass =   "H2: roof= grass, mud, wood, etc." ;
    label rtile =    "H2: roof= tile, slate, shingle" ;
    label rmetal =   "H2: roof= metal" ;
    label rsheet =   "H2: roof= asbestos cement sheet" ;
    label rbrick =   "H2: roof= brick stone and lime" ;
    label rstone =   "H2: roof= stone" ;
    label rconc =    "H2: roof= concrete RBC/RCC" ;
    label relse  =   "H2: roof= other material nec" ;
    label fmud =     "H2: floor= mud" ;
    label fwood =    "H2: floor= wood, planks" ;
    label fgrass =   "H2: floor= grass, bamboo, etc." ;
    label fbrick =   "H2: floor= brick, stone & lime" ;
    label fconc =    "H2: floor= cement" ;
    label ftile =    "H2: floor= mosaic, tiles" ;
    label felse  =   "H2: floor= other material nes" ;
    label wgrass =   "H2: walls= grass, thatch, etc." ;
    label wmud =     "H2: walls= mud" ;
    label wblock =   "H2: walls= unburnt bricks" ;
    label wwood =    "H2: walls= wood" ;
    label wbrick =   "H2: walls= burnt bricks" ;
    label wmetal =   "H2: walls= GI sheets, other metal" ;
    label wstone =   "H2: walls= stone" ;
    label wconc =    "H2: walls= cement, concrete" ;
    label wekra =    "H2: walls= ekra" ;
    label welse  =   "H2: walls= other material nes" ;
    label h3tot =    "H3: total census households" ;
    label hown =     "H3: owned" ;
    label hrent =    "H3: rented" ;
    label htelse =   "H3: tenure= other" ;
    label hn1t2 =    "H3: 1-2 persons in hh" ;
    label hn3t5 =    "H3: 3-5 persons in hh" ;
    label hn6t8 =    "H3: 6-8 persons in hh" ;
    label hn9p =     "H3: 9+ persons in hh" ;
    label rooms0 =   "H3: no rooms" ;
    label rooms1 =   "H3: one room" ;
    label rooms2 =   "H3: two rooms" ;
    label rooms3 =   "H3: three rooms" ;
    label rooms4 =   "H3: four rooms" ;
    label rooms5 =   "H3: five rooms" ;
    label rooms6 =   "H3: six plus rooms" ;
    label roomsx =   "H3: unspecififed # rooms" ;
    label h4tot =    "H4: total census households" ;
    label helec =    "H4: hh electricity available" ;
    label toilet =   "H4: hh toilet available" ;
    label hwell =    "H5: hh water= well" ;
    label htap =     "H5: hh water= tap" ;
    label hpump =    "H5: hh water= handpump tubewell" ;
    label hriver =   "H5: hh water= river canal" ;
    label htank =    "H5: hh water= tank" ;
    label hwelse =   "H5: hh water= others" ;
    label hwin =     "H5: hh water= inside premises" ;
    label hwout =    "H5: hh water= outside premises" ;
    label hitap =    "H5: hh water= indoor tap" ;
    label cdung =    "H6: cook fuel: dung cakes" ;
    label celec =    "H6: cook fuel: electricity" ;
    label ccoal =    "H6: cook fuel: coal coke lignite" ;
    label ccharc =   "H6: cook fuel: charcoal" ;
    label cgas =     "H6: cook fuel: cooking gas" ;
    label cwood =    "H6: cook fuel: wood" ;
    label cbio =     "H6: cook fuel: biogas" ;
    label ckero =    "H6: cook fuel: kerosene" ;
    label celse =    "H6: cook fuel: other type" ;
    label cunsp =    "H6: unspecified cook fuel type" ;

    label vacantR =   "H1: rural vacant census houses" ;
    label residR =    "H1: rural residence" ;
    label resshpR =   "H1: rural shop cum residence" ;
    label reswkR =    "H1: rural workshop cum residence" ;
    label resothR =   "H1: rural residence plus other use" ;
    label hotelR =    "H1: rural hotels, sarais, etc." ;
    label shopR =     "H1: rural shops exc. eating houses" ;
    label officeR =   "H1: rural business houses" ;
    label factR =     "H1: rural factory, workshop & workshed" ;
    label eatingR =   "H1: rural restaurant & eating place" ;
    label communR =   "H1: rural entertainment, community" ;
    label templeR =   "H1: rural temple, mosque, church, etc." ;
    label helseR  =   "H1: rural other non-residential houses" ;
    label h1totR =    "H1: rural total census houses" ;
    label rgrassR =   "H2: rural roof= grass, mud, wood, etc." ;
    label rtileR =    "H2: rural roof= tile, slate, shingle" ;
    label rmetalR =   "H2: rural roof= metal" ;
    label rsheetR =   "H2: rural roof= asbestos cement sheet" ;
    label rbrickR =   "H2: rural roof= brick stone and lime" ;
    label rstoneR =   "H2: rural roof= stone" ;
    label rconcR =    "H2: rural roof= concrete RBC/RCC" ;
    label relseR  =   "H2: rural roof= other material nec" ;
    label fmudR =     "H2: rural floor= mud" ;
    label fwoodR =    "H2: rural floor= wood, planks" ;
    label fgrassR =   "H2: rural floor= grass, bamboo, etc." ;
    label fbrickR =   "H2: rural floor= brick, stone & lime" ;
    label fconcR =    "H2: rural floor= cement" ;
    label ftileR =    "H2: rural floor= mosaic, tiles" ;
    label felseR  =   "H2: rural floor= other material nes" ;
    label wgrassR =   "H2: rural walls= grass, thatch, etc." ;
    label wmudR =     "H2: rural walls= mud" ;
    label wblockR =   "H2: rural walls= unburnt bricks" ;
    label wwoodR =    "H2: rural walls= wood" ;
    label wbrickR =   "H2: rural walls= burnt bricks" ;
    label wmetalR =   "H2: rural walls= GI sheets, other metal" ;
    label wstoneR =   "H2: rural walls= stone" ;
    label wconcR =    "H2: rural walls= cement, concrete" ;
    label wekraR =    "H2: rural walls= ekra" ;
    label welseR  =   "H2: rural walls= other material nes" ;
    label h3totR =    "H3: rural total census households" ;
    label hownR =     "H3: rural owned" ;
    label hrentR =    "H3: rural rented" ;
    label htelseR =   "H3: rural tenure= other" ;
    label hn1t2R =    "H3: rural 1-2 persons in hh" ;
    label hn3t5R =    "H3: rural 3-5 persons in hh" ;
    label hn6t8R =    "H3: rural 6-8 persons in hh" ;
    label hn9pR =     "H3: rural 9+ persons in hh" ;
    label rooms0R =   "H3: rural no rooms" ;
    label rooms1R =   "H3: rural one room" ;
    label rooms2R =   "H3: rural two rooms" ;
    label rooms3R =   "H3: rural three rooms" ;
    label rooms4R =   "H3: rural four rooms" ;
    label rooms5R =   "H3: rural five rooms" ;
    label rooms6R =   "H3: rural six plus rooms" ;
    label roomsxR =   "H3: rural unspecififed # rooms" ;
    label h4totR =    "H4: rural total census households" ;
    label helecR =    "H4: rural hh electricity available" ;
    label toiletR =   "H4: rural hh toilet available" ;
    label hwellR =    "H5: rural hh water= well" ;
    label htapR =     "H5: rural hh water= tap" ;
    label hpumpR =    "H5: rural hh water= handpump tubewell" ;
    label hriverR =   "H5: rural hh water= river canal" ;
    label htankR =    "H5: rural hh water= tank" ;
    label hwelseR =   "H5: rural hh water= others" ;
    label hwinR =     "H5: rural hh water= inside premises" ;
    label hwoutR =    "H5: rural hh water= outside premises" ;
    label hitapR =    "H5: rural hh water= indoor tap" ;
    label cdungR =    "H6: rural cook fuel: dung cakes" ;
    label celecR =    "H6: rural cook fuel: electricity" ;
    label ccoalR =    "H6: rural cook fuel: coal coke lignite" ;
    label ccharcR =   "H6: rural cook fuel: charcoal" ;
    label cgasR =     "H6: rural cook fuel: cooking gas" ;
    label cwoodR =    "H6: rural cook fuel: wood" ;
    label cbioR =     "H6: rural cook fuel: biogas" ;
    label ckeroR =    "H6: rural cook fuel: kerosene" ;
    label celseR =    "H6: rural cook fuel: other type" ;
    label cunspR =    "H6: rural unspecified cook fuel type" ;

/* this creates a variable, SLABEL, with (1991) state names */
length SLABEL $ 24;
select (STATEID);
    when ('02') SLABEL = 'Andhra Pradesh' ;
    when ('03') SLABEL = 'Arunachal Pradesh' ;
    when ('04') SLABEL = 'Assam' ;
    when ('05') SLABEL = 'Bihar' ;
    when ('06') SLABEL = 'Goa' ;
    when ('07') SLABEL = 'Gujarat' ;
    when ('08') SLABEL = 'Haryana' ;
    when ('09') SLABEL = 'Himachal' ;
    when ('11') SLABEL = 'Karnataka' ;
    when ('12') SLABEL = 'Kerala' ;
    when ('13') SLABEL = 'Madhya Pradesh' ;
    when ('14') SLABEL = 'Maharashtra' ;
    when ('15') SLABEL = 'Manipur' ;
    when ('16') SLABEL = 'Meghalaya' ;
    when ('17') SLABEL = 'Mizoram' ;
    when ('18') SLABEL = 'Nagaland' ;
    when ('19') SLABEL = 'Orissa' ;
    when ('20') SLABEL = 'Punjab' ;
    when ('21') SLABEL = 'Rajasthan' ;
    when ('22') SLABEL = 'Sikkim' ;
    when ('23') SLABEL = 'Tamil Nadu' ;
    when ('24') SLABEL = 'Tripura' ;
    when ('25') SLABEL = 'Uttar Pradesh' ;
    when ('26') SLABEL = 'West Bengal' ;
    when ('27') SLABEL = 'Andaman & Nicobar' ;
    when ('28') SLABEL = 'Chandigarh' ;
    when ('29') SLABEL = 'Dadra + Nagar Haveli' ;
    when ('30') SLABEL = 'Daman & Diu' ;
    when ('31') SLABEL = 'Delhi' ;
    when ('32') SLABEL = 'Laksdadweep' ;
    when ('33') SLABEL = 'Pondicherry' ;
    when ('34') SLABEL = 'NE hill STATEs' ;
    when ('35') SLABEL = 'other' ;
    otherwise;
end;

proc contents;
    title3 '   contents of saved file.' ;

proc print uniform ;
    title3 '   print all districts.';
       var stateid distid rec000 dlabel pop houses hh h1tot h3tot h4tot;

proc means n nmiss mean std min max;
    title3 '   means of all districts.';

proc univariate plot;
	var pop area;
	id dlabel;

/*
proc means n nmiss mean std min max;
    title3 '   means of all districts.';
    var rec000 rec140 rec160 rec300 rec340 rec620 rec650 rec670 rec690 ;
*/



data  check91;
    set sasdata.dist91;

    chkpop = pop  - (work + nowk  + marg);
    chkrmale = rmale  - (workrm + nowkrm  + margrm);
    chkwork = work - (cult + alab + hind + live + mine + manf + cons +
                 comm + tran  + serv);
    chkfarm = farm - cult - alab;
    chkothr = othr - (live + mine + manf + cons + comm + tran + serv);
    chklit = lit  - (lit07 + lit10 + lit15 + lit20 + lit25 + lit30 + lit35 +
                 lit60 + litNA);
    chkage= pop - (pop00+pop05+pop10+pop15+pop20+pop25+pop30+pop35+pop40+pop45+
                 pop50+pop55+pop60+pop65+pop70+pop75+pop80+pop85+pop90+pop95+popNA) ;
    chkpri= pri - (pri07+pri10+pri15+pri20+pri25+pri30+pri35+pri60+priNA) ;
    chkmat= mat - (mat10+mat15+mat20+mat25+mat30+mat35+mat60+matNA) ;
    chknvm= nvm - (nvm10+nvm15+nvm20+nvm25+nvm30+nvm35+nvm40+nvm45+
                 nvm50+nvm55+nvm60+nvm65+nvm70+nvm75+nvm80+nvmNA) - pop00 - pop05 ;
    chkdiv= div - (div10+div15+div20+div25+div30+div35+div40+div45+
                 div50+div55+div60+div65+div70+div75+div80+divNA) ;
    chkwid= wid - (wid10+wid15+wid20+wid25+wid30+wid35+wid40+wid45+
                 wid50+wid55+wid60+wid65+wid70+wid75+wid80+widNA) ;
                
    checkh1= h1tot - sum(vacant,resid,resshp,reswk,resoth,hotel,shop,office,fact,eating,commun,temple,helse);
    label checkh1= 'H1: totals = sum of types?';

    checkh1R= h1totR - sum(vacantR,residR,resshpR,reswkR,resothR,hotelR,shopR,officeR,factR,eatingR,communR,templeR,helseR);
    label checkh1R= 'H1: rural = sum of types?';


    check2r= h1tot - sum (rgrass,rtile,rmetal,rsheet,rbrick,rstone,rconc,relse);
    check2f= h1tot - sum (fmud,fwood,fgrass,fbrick,fconc,ftile,felse);
    check2w= h1tot - sum (wgrass,wmud,wblock,wwood,wbrick,wmetal,wstone,wconc,wekra,welse);
    label check2r= 'H2: totals = sum of roof types?';
    label check2f= 'H2: totals = sum of floor types?';
    label check2w= 'H2: totals = sum of wall types?';

    check2rR= h1totR - sum (rgrassR,rtileR,rmetalR,rsheetR,rbrickR,rstoneR,rconcR,relseR);
    check2fR= h1totR - sum (fmudR,fwoodR,fgrassR,fbrickR,fconcR,ftileR,felseR);
    check2wR= h1totR - sum (wgrassR,wmudR,wblockR,wwoodR,wbrickR,wmetalR,wstoneR,wconcR,wekraR,welseR);
    label check2rR= 'H2: rural = sum of roof types?';
    label check2fR= 'H2: rural = sum of floor types?';
    label check2wR= 'H2: rural = sum of wall types?';

    check3t= h3tot - sum(hown,hrent,htelse);
    label check3t = 'H3: tot= own + rent + othertenure ?';

    check3tR= h3totR - sum(hownR,hrentR,htelseR);
    label check3tR = 'H3: rural= own + rent + othertenure ?';

    check3r= h3tot - sum(rooms0,rooms1,rooms2,rooms3,rooms4,rooms5,rooms6,roomsx) ;
    label check3r = 'H3: tot= sum rooms (0-6+,notspec) ?';

    check3rR= h3totR - sum(rooms0R,rooms1R,rooms2R,rooms3R,rooms4R,rooms5R,rooms6R,roomsxR) ;
    label check3rR = 'H3: rural= sum rooms (0-6+,notspec) ?';

    check3n= h3tot-hn1t2-hn3t5-hn6t8-hn9p ;
    label check3n = 'H3: tot= hn1t2+hn3t5+hn6t8+hn9p ?';

    check3nR= h3totR-hn1t2R-hn3t5R-hn6t8R-hn9pR ;
    label check3nR = 'H3: totR= hn1t2R+hn3t5R+hn6t8R+hn9pR ?';


    checkws= h4tot - sum(hwell,htap,hpump,hriver,htank,hwelse);
    label checkws= 'H5: h4tot = sum of water sources' ;

    checkwsR= h4totR - sum(hwellR,htapR,hpumpR,hriverR,htankR,hwelseR);
    label checkwsR= 'H5: h4totR = sum of water sources' ;

    checkwp= h4tot - sum(hwin,hwout);
    label checkwp= 'H5: h4tot = hwin + hwout' ;

    checkwpR= h4totR - sum(hwinR,hwoutR);
    label checkwpR= 'H5: h4totR = hwinR + hwoutR' ;

    check6= h4tot - sum(cdung,celec,ccoal,ccharc,cgas,cwood,cbio,ckero,celse,cunsp);
    label check6 = 'H6: check fuel type';

    check6R= h4totR - sum(cdungR,celecR,ccoalR,ccharcR,cgasR,cwoodR,cbioR,ckeroR,celseR,cunspR);
    label check6R = 'H6: rural check fuel type';


proc means n nmiss mean std min max;
    title3 '   means of check file; all check variables should equal zero.';

proc print uniform ;
    title3 '   print problem districts.';
    var stateid distid dlabel chkpop chkrmale chkwork chkfarm chkothr 
       chklit chkpri chkmat chkage ;
    where (chkpop ne 0 or chkrmale ne 0 or chkwork ne 0 or chkfarm ne 0 or chkothr ne 0
       or chklit ne 0 or chkmat ne 0 or chkmat ne 0 or chkage ne 0 or chknvm ne 0) ;


