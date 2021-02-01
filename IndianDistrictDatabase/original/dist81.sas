* name of program: dist81.sas;
* this program reads the 1981 India census district data;
* The data are read from dist81.data file;

options linesize=132 pagesize=55 nocenter;
/*********************************************************************/

title  'districts/1981/all/create81: 1981 Indian district sas file.' ;

/*********************************************************************/

/* Users will need to create their own libname and filename commands
   as appropriate for their local computer system
*/

libname  sasdata '.';
filename indata81  pipe 'gunzip -c dist81.data.gz';


data sasdata.dist81;

attrib DLABEL length = $ 24;
infile indata81 n=183;
    input
   /* 000 District label */  
              stateid  1-2    
              distid   3-4 
              record   5-7 
              year     8-9 
              version  10 
              dlabel   &  /* & = remainder of record */

   /* Total Population */  
 / /* 100 */  pop   11-19  rural  20-28  male   29-37  Rmale    38-46

   /* Total main workers */  
 / /* 111 */  work  11-19  workR  20-28  workM  29-37  workRM  38-46
 / /* 112 */  farm  11-19  farmR  20-28  farmM  29-37  farmRM  38-46
 / /* 113 */  cult  11-19  cultR  20-28  cultM  29-37  cultRm  38-46
 / /* 114 */  alab  11-19  alabR  20-28  alabM  29-37  alabRM  38-46
 / /* 115 */  hind  11-19  hindR  20-28  hindM  29-37  hindRM  38-46
 / /* 116 */  othr  11-19  othrR  20-28  othrM  29-37  othrRM  38-46
 / /* 117 */  live  11-19  liveR  20-28  liveM  29-37  liveRM  38-46
 / /* 118 */  mine  11-19  mineR  20-28  mineM  29-37  mineRM  38-46  
 / /* 119 */  manf  11-19  manfR  20-28  manfM  29-37  manfRM  38-46
 / /* 120 */  cons  11-19  consR  20-28  consM  29-37  consRM  38-46
 / /* 121 */  comm  11-19  commR  20-28  commM  29-37  commRM  38-46
 / /* 122 */  tran  11-19  tranR  20-28  tranM  29-37  tranRM  38-46
 / /* 123 */  serv  11-19  servR  20-28  servM  29-37  servRM  38-46

   /* Marginal Workers */ 
 / /* 124 */  marg  11-19  margR  20-28  margM  29-37  margRM  38-46

   /* Non-workers, not even marginal workers */ 
 / /* 125 */  nowk  11-19  nowkR  20-28  nowkM  29-37  nowkRM  38-46

   /* Marginal + main workers */  
 / /* 126 */  twork  11-19  tworkR  20-28  tworkM  29-37  tworkRM  38-46
 / /* 127 */  tfarm 11-19  tfarmR 20-28  tfarmM 29-37  tfarmRM 38-46 
 / /* 128 */  tcult 11-19  tcultR 20-28  tcultM 29-37  tcultRM 38-46 
 / /* 129 */  talab 11-19  talabR 20-28  talabM 29-37  talabRM 38-46
 / /* 130 */  thind 11-19  thindR 20-28  thindM 29-37  thindRM 38-46
 / /* 131 */  tothr 11-19  tothrR 20-28  tothrM 29-37  tothrRM 38-46
 / /* 132 */  tlive 11-19  tliveR 20-28  tliveM 29-37  tliveRM 38-46
 / /* 133 */  tmine 11-19  tmineR 20-28  tmineM 29-37  tmineRM 38-46
 / /* 134 */  tmanf 11-19  tmanfR 20-28  tmanfM 29-37  tmanfRM 38-46
 / /* 135 */  tcons 11-19  tconsR 20-28  tconsM 29-37  tconsRM 38-46
 / /* 136 */  tcomm 11-19  tcommR 20-28  tcommM 29-37  tcommRM 38-46
 / /* 137 */  ttran 11-19  ttranR 20-28  ttranM 29-37  ttranRM 38-46
 / /* 138 */  tserv 11-19  tservR 20-28  tservM 29-37  tservRM 38-46

   /* Non-(main) workers (includes marginal woworkers + no work) */ 
 / /* 139 */  nmain 11-19  nmainR 20-28  nmainM 29-37  nmainRM 38-46

   /* Literates (total & by age) */  
 / /* 140 */  lit   11-19    litR 20-28  litM   29-37  litRM   38-46
 / /* 141 */  lit05 11-19  lit05R 20-28  lit05M 29-37  lit05RM 38-46
 / /* 142 */  lit10 11-19  lit10R 20-28  lit10M 29-37  lit10RM 38-46
 / /* 143 */  lit15 11-19  lit15R 20-28  lit15M 29-37  lit15RM 38-46
 / /* 144 */  lit20 11-19  lit20R 20-28  lit20M 29-37  lit20RM 38-46
 / /* 145 */  lit25 11-19  lit25R 20-28  lit25M 29-37  lit25RM 38-46
 / /* 146 */  lit30 11-19  lit30R 20-28  lit30M 29-37  lit30RM 38-46
 / /* 147 */  lit35 11-19  lit35R 20-28  lit35M 29-37  lit35RM 38-46
 / /* 148 */  lit60 11-19  lit60R 20-28  lit60M 29-37  lit60RM 38-46

   /* Schooling */
 / /* 151 */  pri   11-19  priR   20-28  priM   29-37  priRM   38-46
 / /* 152 */  mid   11-19  midR   20-28  midM   29-37  midRM   38-46
 / /* 153 */  matr  11-19  matrR  20-28  matrM  29-37  matrRM  38-46
 / /* 154 */  ntdip 11-19  ntdipR 20-28  ntdipM 29-37  ntdipRM 38-46
 / /* 155 */  dip   11-19  dipR   20-28  dipM   29-37  dipRM   38-46
 / /* 156 */  grad  11-19  gradR  20-28  gradM  29-37  gradRM  38-46

   /* Age groups */
 / /* 160 */  pop00 11-19  pop00R 20-28  pop00M 29-37  pop00RM 38-46
 / /* 161 */  pop05 11-19  pop05R 20-28  pop05M 29-37  pop05RM 38-46
 / /* 162 */  pop10 11-19  pop10R 20-28  pop10M 29-37  pop10RM 38-46
 / /* 163 */  pop15 11-19  pop15R 20-28  pop15M 29-37  pop15RM 38-46
 / /* 164 */  pop20 11-19  pop20R 20-28  pop20M 29-37  pop20RM 38-46
 / /* 165 */  pop25 11-19  pop25R 20-28  pop25M 29-37  pop25RM 38-46
 / /* 166 */  pop30 11-19  pop30R 20-28  pop30M 29-37  pop30RM 38-46
 / /* 167 */  pop35 11-19  pop35R 20-28  pop35M 29-37  pop35RM 38-46
 / /* 168 */  pop60 11-19  pop60R 20-28  pop60M 29-37  pop60RM 38-46

   /* Scheduled Caste population */  
 / /* 200 */ sc      11-19  scR     20-28  scM     29-37  scRM     38-46
 / /* 211 */ scwork    11-19  scworkR   20-28  scworkM   29-37  scworkRM   38-46
 / /* 212 */ scfarm    11-19  scfarmR   20-28  scfarmM   29-37  scfarmRM   38-46
 / /* 213 */ sccult   11-19  sccultR  20-28  sccultM  29-37  sccultRM  38-46
 / /* 214 */ scalab  11-19  scalabR 20-28  scalabM 29-37  scalabRM 38-46
 / /* 215 */ schind  11-19  schindR 20-28  schindM 29-37  schindRM 38-46
 / /* 216 */ scothr  11-19  scothrR 20-28  scothrM 29-37  scothrRM 38-46
 / /* 224 */ scmarg  11-19  scmargR 20-28  scmargM 29-37  scmargRM 38-46
 / /* 225 */ scnowk  11-19  scnowkR 20-28  scnowkM 29-37  scnowkRM 38-46
 / /* 240 */ sclit   11-19  sclitR  20-28  sclitM  29-37  sclitRM  38-46

   /* Scheduled Tribe population */  
 / /* 250 */  st     11-19  stR     20-28  stM     29-37  stRM     38-46
 / /* 261 */  stwork   11-19  stworkR   20-28  stworkM   29-37  stworkRM   38-46
 / /* 262 */  stfarm   11-19  stfarmR   20-28  stfarmM   29-37  stfarmRM   38-46
 / /* 263 */  stcult  11-19  stcultR  20-28  stcultM  29-37  stcultRM  38-46
 / /* 264 */  stalab 11-19  stalabR 20-28  stalabM 29-37  stalabRM 38-46 
 / /* 265 */  sthind 11-19  sthindR 20-28  sthindM 29-37  sthindRM 38-46
 / /* 266 */  stothr 11-19  stothrR 20-28  stothrM 29-37  stothrRM 38-46
 / /* 274 */  stmarg 11-19  stmargR 20-28  stmargM 29-37  stmargRM 38-46
 / /* 275 */  stnowk 11-19  stnowkR 20-28  stnowkM 29-37  stnowkRM 38-46
 / /* 290 */  stlit  11-19  stlitR  20-28  stlitM  29-37  stlitRM  38-46

   /* Migrants */
 / /* 300 */  mig   11-19  migR   20-28  migM   29-37  migRM   38-46
 / /* 301 */  migod 11-19  migodR 20-28  migodM 29-37  migodRM 38-46
 / /* 302 */  migos 11-19  migosR 20-28  migosM 29-37  migosRM 38-46
 / /* 303 */  migfu 11-19  migfuR 20-28  migfuM 29-37  migfuRM 38-46
 / /* 304 */  migfr 11-19  migfrR 20-28  migfrM 29-37  migfrRM 38-46 
 / /* 305 */  migrd 11-19  migrdR 20-28  migrdM 29-37  migrdRM 38-46 
 / /* 306 */  migrs 11-19  migrsR 20-28  migrsM 29-37  migrsRM 38-46 
 / /* 307 */  migas 11-19  migasR 20-28  migasM 29-37  migasRM 38-46 
 / /* 308 */  migeu 11-19  migeuR 20-28  migeuM 29-37  migeuRM 38-46 
 / /* 309 */  migaf 11-19  migafR 20-28  migafM 29-37  migafRM 38-46 
 / /* 310 */  migam 11-19  migamR 20-28  migamM 29-37  migamRM 38-46
 / /* 311 */  migoc 11-19  migocR 20-28  migocM 29-37  migocRM 38-46

   /* Child death counts 321-328 , dropped April 2001 */

   /* Religion */
 / /* 332 */  musl  11-19  muslR 20-28  muslM 29-37  muslRM 38-46
 / /* 335 */  bud   11-19  budR  20-28  budM  29-37  budRM  38-46

   /* Never married */
 / /* 340 */  nvmar 11-19 nvmarR 20-28  nvmarM 29-37  nvmarRM 38-46
 / /* 341 */  nvm10 11-19 nvm10R 20-28  nvm10M 29-37  nvm10RM 38-46
 / /* 342 */  nvm15 11-19 nvm15R 20-28  nvm15M 29-37  nvm15RM 38-46
 / /* 343 */  nvm20 11-19 nvm20R 20-28  nvm20M 29-37  nvm20RM 38-46
 / /* 344 */  nvm25 11-19 nvm25R 20-28  nvm25M 29-37  nvm25RM 38-46
 / /* 345 */  nvm30 11-19 nvm30R 20-28  nvm30M 29-37  nvm30RM 38-46
 / /* 346 */  nvm35 11-19 nvm35R 20-28  nvm35M 29-37  nvm35RM 38-46

   /* Widowed */
 / /* 355 */  wid   11-19  widR    20-28  widM    29-37  widRM   38-46
 / /* 356 */  wid10 11-19  wid10R  20-28  wid10M  29-37  wid10RM 38-46
 / /* 357 */  wid15 11-19  wid15R  20-28  wid15M  29-37  wid15RM 38-46
 / /* 358 */  wid20 11-19  wid20R  20-28  wid20M  29-37  wid20RM 38-46

   /* Divorced & separated */
 / /* 370 */  div   11-19  divR    20-28  divM    29-37  divRM   38-46
 / /* 371 */  div10 11-19  div10R  20-28  div10M  29-37  div10RM 38-46
 / /* 372 */  div15 11-19  div15R  20-28  div15M  29-37  div15RM 38-46
 / /* 373 */  div20 11-19  div20R  20-28  div20M  29-37  div20RM 38-46

   /* work by age */
 / /* 390 */  wk00  11-19  wk00R  20-28  wk00M  29-37  wk00RM  38-46
 / /* 391 */  twk00 11-19  twk00R 20-28  twk00M 29-37  twk00RM 38-46

   /* Occupations */
 / /* 407 */  doc   11-19  docR   20-28 docM   29-37  docRM   38-46
 / /* 415 */  teach 11-19  teachR 20-28 teachM 29-37  teachRM 38-46


   /* Crops: area and production */
 / /* 501 */  ricea  11-19    ricep  20-28
 / /* 502 */  jowara 11-19    jowarp 20-28
 / /* 503 */  bajraa 11-19    bajrap 20-28
 / /* 504 */  maizea 11-19    maizep 20-28
 / /* 505 */  ragia  11-19    ragip  20-28
 / /* 506 */  milla 11-19    millp 20-28
 / /* 507 */  wheata 11-19    wheatp 20-28
 / /* 508 */  barlya 11-19    barlyp 20-28
 / /* 509 */  grama  11-19    gramp  20-28
 / /* 510 */  tura   11-19    turp   20-28
 / /* 511 */  opulsa 11-19    opulsp 20-28
 / /* 512 */  gnuta  11-19    gnutp  20-28
 / /* 513 */  cseeda 11-19    cseedp 20-28
 / /* 514 */  sesma  11-19    sesmp  20-28
 / /* 515 */  rseeda 11-19    rseedp 20-28
 / /* 516 */  lseeda 11-19    lseedp 20-28
 / /* 517 */  cota   11-19    cotp   20-28
 / /* 518 */  jutea  11-19    jutep  20-28
 / /* 519 */  mestaa 11-19    mestap 20-28
 / /* 520 */  potata 11-19    potatp 20-28
 / /* 522 */  sugara 11-19    sugarp 20-28
 / /* 523 */  chilia 11-19    chilip 20-28
 / /* 524 */  gina   11-19    ginp   20-28
 / /* 525 */  tobaca 11-19    tobacp 20-28
 / /* 526 */  bpeppa 11-19    bpeppp 20-28
 / /* 527 */  conuta 11-19    conutp 20-28
 / /* 528 */  turma  11-19    turmp  20-28
 / /* 529 */  hempa  11-19    hempp  20-28
 / /* 530 */  gseeda 11-19    gseedp 20-28
 / /* 531 */  tapia  11-19    tapip  20-28
 / /* 532 */  anuta  11-19    anutp  20-28
 / /* 533 */  banaa  11-19    banap  20-28
 / /* 534 */  coria  11-19    corip  20-28
 / /* 535 */  carda  11-19    cardp  20-28
 / /* 536 */  saffa  11-19    saffp  20-28
 / /* 537 */  nseeda 11-19    nseedp 20-28
 / /* 538 */  swpota 11-19    swpotp 20-28
 / /* 539 */  garla  11-19    garlp  20-28
 / /* 540 */  sunfa  11-19    sunfp  20-28
 / /* 541 */  oniona 11-19    onionp 20-28

   /* crop totals across 33,19,and 31 crops */
 / /* 580 */ crop33a 11-19  crop33v 20-28
 / /* 581 */ crop19a 11-19  crop19v 20-28
 / /* 582 */ cropa   11-19  cropv   20-28

 / /* 600 */  area   11-19  areaR   20-28
 / /* 601 */  houses 11-19  housesR 20-28

   /* Households */
 / /* 602 */  hh    11-19 hhR    20-28
 / /* 607 */  hhlin 11-19 hhlinR 20-28
 / /* 608 */  hhcol 11-19 hhcolR 20-28

   /* Child mortality RATES */
   /* Child mortality RATES (not graduated) */
 / /* 651 */ cm1   11-13  cm1R   14-16  cm1U  17-19 
             cm1M  20-22  cm1RM  23-25  cm1UM 26-28 
             cm1F  29-31  cm1RF  32-34  cm1UF 35-37
 / /* 652 */ cm2   11-13  cm2R   14-16  cm2U  17-19 
             cm2M  20-22  cm2RM  23-25  cm2UM 26-28 
             cm2F  29-31  cm2RF  32-34  cm2UF 35-37
 / /* 654 */ cm5   11-13  cm5R   14-16  cm5U  17-19 
             cm5M  20-22  cm5RM  23-25  cm5UM 26-28 
             cm5F  29-31  cm5RF  32-34  cm5UF 35-37
   /* Child mortality RATES (graduated) */
 / /* 655 */ cm01  11-13  cm01R  14-16  cm01U 17-19 
             cm01M 20-22  cm01RM 23-25  cm01UM 26-28 
             cm01F 29-31  cm01RF 32-34  cm01UF 35-37
 / /* 656 */ cm02  11-13  cm02R  14-16  cm02U 17-19 
             cm02M 20-22  cm02RM 23-25  cm02UM 26-28 
             cm02F 29-31  cm02RF 32-34  cm02UF 35-37
 / /* 658 */ cm05  11-13  cm05R  14-16  cm05U 17-19 
             cm05M 20-22  cm05RM 23-25  cm05UM 26-28 
             cm05F 29-31  cm05RF 32-34  cm05UF 35-37

 / /* 670 - Total fertility RATES last year (unadjusted) */ utfr 11-16
 / /* 672 - Age specific fertility rates for women 15-19 */ sfr15 11-16
 / /* 673 - Age specific fertility rates for women 20-24 */ sfr20 11-16
 / /* 674 - Age specific fertility rates for women 25-29 */ sfr25 11-16
 / /* 675 - Age specific fertility rates for women 30-34 */ sfr30 11-16
 / /* 676 - Age specific fertility rates for women 35-39 */ sfr35 11-16
 / /* 677 - Age specific fertility rates for women 40-44 */ sfr40 11-16
 / /* 678 - Age specific fertility rates for women 45-49 */ sfr45 11-16
 / /* 680 - Total fertility rate last year (adjusted) */  tfr 11-16
    ;
    ;

array xvar {*} _NUMERIC_ ;
do ivar=1 to dim(xvar);
    if xvar(ivar)= -1 then xvar(ivar)=.;
end;
drop ivar;



/*  ID variables */
label   stateid =  'State ID' ;
label   distid  =  'District ID within state' ;
label   record  =  'Record ID (check always=000)' ;
label   year    =  'Year ID (check always=81)' ;
label   version =  'Version ID (check always=2)' ;
label   dlabel  =  'District name' ;

id = stateid * 100 + distid;
label   id  =  'District ID including state id' ;


STATE2 = stateid;
label   STATE2 = 'Collapsed list of states' ;
if (stateid in(1,7,15,23,30)) then STATE2 = 33;   /* small STATEs */
if (stateid in(6,8))  then STATE2 = 33;   /* small STATEs */
if (stateid in(3,18,19,21,27,31))  then STATE2 = 32; /* other NE Hill STATEs */

length SLABEL $ 24;
select (stateid);
    when (1) SLABEL = 'Andaman' ;
    when (2) SLABEL = 'Andhra' ;
    when (3) SLABEL = 'Arunachal' ;
    when (4) SLABEL = 'Assam' ;
    when (5) SLABEL = 'Bihar' ;
    when (6) SLABEL = 'Chandigarh' ;
    when (7) SLABEL = 'Dadra +' ;
    when (8) SLABEL = 'Delhi' ;
    when (9) SLABEL = 'Goa +' ;
    when (10) SLABEL = 'Gujarat' ;
    when (11) SLABEL = 'Haryana' ;
    when (12) SLABEL = 'Himachal' ;
    when (13) SLABEL = 'J & K' ;
    when (14) SLABEL = 'Kerala' ;
    when (15) SLABEL = 'Laccadive +' ;
    when (16) SLABEL = 'Madhya Pradesh' ;
    when (17) SLABEL = 'Maharashtra' ;
    when (18) SLABEL = 'Manipur' ;
    when (19) SLABEL = 'Meghalaya' ;
    when (20) SLABEL = 'Karnataka' ;
    when (21) SLABEL = 'Nagaland' ;
    when (22) SLABEL = 'Orissa' ;
    when (23) SLABEL = 'Pondicherry' ;
    when (24) SLABEL = 'Punjab' ;
    when (25) SLABEL = 'Rajasthan' ;
    when (26) SLABEL = 'Tamil Nadu' ;
    when (27) SLABEL = 'Tripura' ;
    when (28) SLABEL = 'Uttar Pradesh' ;
    when (29) SLABEL = 'West Bengal' ;
    when (30) SLABEL = 'Sikkim' ;
    when (31) SLABEL = 'Mizoram' ;
    when (32) SLABEL = 'NE hill states' ;
    when (33) SLABEL = 'other' ;
    otherwise;
end;

/*  Population variables */
urban = pop - rural ;
label   pop =   'Total population' ;
label   rural = 'Rural population' ;
label   urban = 'Urban population' ;
label   male =   'Total male population' ;
label   Rmale =  'Rural male population' ;

female= pop-male ;
Rfemale = rural - Rmale ;
Ufemale = female - Rfemale ;
Umale = male - Rmale ;
label   female  = 'Total female population' ;
label   Rfemale = 'Rural female population' ;
label   Ufemale = 'Urban female population' ;
label   Umale   = 'Urban male population' ;


/*  labor force variables */
label   work =  'Total labor force' ;
label   workR = 'Labor force, rural' ;
label   workM = 'Labor force, men' ;
label   workRM ='Labor force, rural men' ;

label   farm =    'Farm' ;
label   farmR =   'Farm, rural' ;
label   farmM =   'Farm, men' ;
label   farmRM =  'Farm, rural men' ;
label   cult =    'Cultivators' ;
label   cultR =   'Cultivators, rural' ;
label   cultM =   'Cultivators, men' ;
label   cultRM =  'Cultivators, rural men' ;
label   alab =    'Landless labor' ;
label   alabR =   'Landless labor, rural' ;
label   alabM =   'Landless labor, men' ;
label   alabRM =  'Landless labor, rural men' ;
label   hind =    'Household industry' ;
label   hindR =   'Household industry, rural' ;
label   hindM =   'Household industry, men' ;
label   hindRM =  'Household industry, rural men' ;
label   othr =    'Nonfarm nonhh' ;
label   othrR =   'Nonfarm nonhh, rural' ;
label   othrM =   'Nonfarm nonhh, men' ;
label   othrRM =  'Nonfarm nonhh, rural men' ;
label   manf =    'Manufacturing' ;
label   manfR =   'Manufacturing, rural' ;
label   manfM =   'Manufacturing, men' ;
label   manfRM =  'Manufacturing, rural men' ;
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
label tfarm =   'Farmer: marginal + main' ;
label tfarmR =  'Farmers: marginal + main, rural' ;
label tfarmM =  'Farmers: marginal + main, men' ;
label tfarmRM = 'Farmer: marginal + main, rural men' ;
label tcult =   'Cultivators: marginal+main' ;
label tcultR =  'Cultivators: marginal+main, rural' ;
label tcultM =  'Cultivators: marginal+main, men' ;
label tcultRM = 'Cultivators: marginal+main, rural men' ;
label talab =   'Agri. Labr: marginal+main' ;
label talabR =  'Agri. labr: marginal+main, rural' ;
label talabM =  'Agri. labr: marginal+main, men' ;
label talabRM = 'Agri. labr: marginal+main, rural men' ;
label thind =   'Household ind: marginal+main' ;
label thindR =  'Household ind: marginal+main, rural' ;
label thindM =  'Household ind: marginal+main, men' ;
label thindRM = 'Household ind: marginal+main, rural men' ;
label tothr =   'Other sectors: marginal+main' ;
label tothrR =  'Other sectors: marginal+main, rural' ;
label tothrM =  'Other sectors: marginal+main, men' ;
label tothrRM = 'Other sectors: marginal+main, rural men' ;
label tlive =   'Livestock, orchards, etc.: marginal+main' ;
label tliveR =  'Livestock: marginal+main, rural' ;
label tliveM =  'Livestock: marginal+main, men' ;
label tliveRM = 'Livestock: marginal+main, rural men' ;
label tmine =   'Mining: marginal+main' ;
label tmineR =  'Mining: marginal+main, rural' ;
label tmineM =  'Mining: marginal+main, men' ;
label tmineRM = 'Mining: marginal+main, rural men' ;
label tmanf =   'Manufacturing: marginal+main' ;
label tmanfR =  'Manufacturing: marginal+main, rural' ;
label tmanfM =  'Manufacturing: marginal+main, men' ;
label tmanfRM = 'Manufacturing: marginal+main, rural men' ;
label tcons =   'Construction: marginal+main' ;
label tconsR =  'Construction: marginal+main, rural' ;
label tconsM =  'Construction: marginal+main, men' ;
label tconsRM = 'Construction: marginal+main, rural men' ;
label tcomm =   'Commerce: marginal+main' ;
label tcommR =  'Commerce: marginal+main, rural' ;
label tcommM =  'Commerce: marginal+main, men' ;
label tcommRM = 'Commerce: marginal+main, rural men' ;
label ttran =   'Transport+commun: marginal+main' ;
label ttranR =  'Transport+commun: marginal+main, rural' ;
label ttranM =  'Transport+commun: marginal+main, men' ;
label ttranRM = 'Transport+commun: marg+main, rural men' ;
label tserv =   'Other Services: marginal+main' ;
label tservR =  'Other services: marginal+main, rural' ;
label tservM =  'Other services: marginal+main, men' ;
label tservRM = 'Other services: marg+main, rural men' ;
label nmain =   'Not main worker' ;
label nmainR =  'Not main worker, rural' ;
label nmainM =  'Not main worker, men' ;
label nmainRM = 'Not main worker, rural men' ;

label wk00   =   'Main workers 0-14' ;
label wk00R  =   'Main workers 0-14, rural' ;
label wk00M  =   'Main workers 0-14, men' ;
label wk00RM =   'Main workers 0-14, rural men' ;

label twk00  =   'Marginal + main workers 0-14' ;
label twk00R  =  'Marginal + main workers 0-14, rural' ;
label twk00M  =  'Marginal + main workers 0-14, men' ;
label twk00RM =  'Marginal + main workers 0-14, rural men' ;


/* age variables */
label pop00 =   'Children 0-4' ;
label pop00R =  'Rural children 0-4' ;
label pop00M =  'Boys 0-4' ;
label pop00RM = 'Rural boys 0-4' ;
label pop05 =   'Children 5-9' ;
label pop05R =  'Rural children 5-9' ;
label pop05M =  'Boys 5-9' ;
label pop05RM = 'Rural boys 5-9' ;
label pop10 =   'Children 10-14' ;
label pop10R =  'Children 10-14, rural' ;
label pop10M =  'Boys 10-14' ;
label pop10RM = 'Boys 10-14, rural' ;
label pop15 =   'Persons 15-24' ;
label pop15R =  'Persons: 15-24, rural' ;
label pop15M =  'Males 15-24' ;
label pop15RM = 'Males: 15-24, rural' ;
label pop20 =   'Persons 20-24' ;
label pop20R =  'Persona: 20-24, rural' ;
label pop20M =  'Male: 20-24' ;
label pop20RM = 'Males 20-24, rural' ;
label pop25 =   'Persons 25-29' ;
label pop25R =  'Persons: 25-29, rural' ;
label pop25M =  'Males; 25-29' ;
label pop25RM = 'Males 25-29, rural' ;
label pop30 =   'Persons 30-34' ;
label pop25R =  'Persons: 30-34, rural' ;
label pop30M =  'Males: 30-34' ;
label pop30RM = 'Males: 30-34, rural' ;
label pop35 =   'Persons 35-59' ;
label pop35R =  'Persons:30-59, rural' ;
label pop35M =  'Males; 35-59' ;
label pop35RM = 'Males: 30-59, rural' ;
label pop60 =   'Persons 60+' ;
label pop60R =  'Persons: 60+, rural' ;
label pop60M =  'Males : 60+' ;
label pop60RM = 'Males: 60+, rural' ;


/*  Literacy */
label lit =     'Literates' ;
label litR =    'Literates, rural' ;
label litM =    'Literates, men' ;
label litRM =   'Literates, rural men' ;
label lit05 =   'Literates: Ages 5-9' ;
label lit05R =  'Literates: ages 5-9, rural' ;
label lit05M =  'Literates: ages 5-9, men' ;
label lit05RM = 'Literates: ages 5-9, rural men' ;
label lit10 =   'Literates: ages 10-14' ;
label lit10R =  'Literates: ages 10-14, rural' ;
label lit10M =  'Literates: ages 10-14, men' ;
label lit10RM = 'Literates: ages 10-14, rural men' ;
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



/* education */

label pri =     'Primary school or higher' ;
label priR =    'Primary school or higher, rural' ;
label priM =    'Primary school or higher, men' ;
label priRM =   'Primary school or higher, rural men' ;
label mid =     'Middle school of higher' ;
label midR =    'Middle school or higher, rural' ;
label midM =    'Middle school or higher, men' ;
label midRM =   'Middle school or higher, rural men' ;
label matr =    'Matriculate or higher' ;
label matrR =   'Matriculate or higher, rural' ;
label matrM =   'Matriculate or higher, men' ;
label matrRM =  'Matriculate or higher, rural men' ;
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




/* Scheduled Caste variables */
label sc =      'Scheduled Caste population' ;
label scR =     'Scheduled Caste population, rural' ;
label scM =     'Scheduled Caste population, men' ;
label scRM =    'Scheduled Caste population, rural men' ;
label scwork =  'Sched Caste: workers' ;
label scworkR = 'Sched Caste: workers, rural' ;
label scworkM = 'Sched Caste: workers, men' ;
label scworkRM ='Sched Caste: workers, rural men' ;
label scfarm =  'Sched Caste: all farm' ;
label scfarmR = 'Sched Caste: all farm, rural' ;
label scfarmM = 'Sched Caste: all farm, men' ;
label scfarmRM ='Sched Caste: all farm, rural men' ;
label sccult =  'Sched Caste: Cultivators' ;
label sccultR = 'Sched Caste: cultivators, rural' ;
label sccultM = 'Sched Caste: cultivators, men' ;
label sccultRM ='Sched Caste: cultivators, rural men' ;
label scalab =  'Sched Caste: agricultural Laborers' ;
label scalabR = 'Sched Caste: agri labor, rural' ;
label scalabM = 'Sched Caste: agri labor, men' ;
label scalabRM ='Sched Caste: agri labor, rural men' ;
label schind =  'Sched Caste: hh industry' ;
label schindR = 'Sched Caste: hh industry, rural' ;
label schindM = 'Sched Caste: hh industry, men' ;
label schindRM= 'Sched Caste: hh industry, rural men' ;
label scothr =  'Sched Caste: Other sectors' ;
label scothrR = 'Sched Caste: other sectors, rural' ;
label scothrM = 'Sched Caste: other sectors, men' ;
label scothrRM ='Sched Caste: other sectors, rural men' ;
label scmarg =  'Sched Caste: Marginal workers' ;
label scmargR = 'Sched Caste: marginal workers, rural' ;
label scmargM = 'Sched Caste: marginal workers, men' ;
label scmargRM ='Sched Caste: marg. wrkrs, rural men' ;
label scnowk =  'Sched Caste: Non-workers' ;
label scnowkR = 'Sched Caste: non-workers, rural' ;
label scnowkM = 'Sched Caste: non-workers, men' ;
label scnowkRM ='Sched Caste: non-workers, rural men' ;
label sclit =   'Sched Caste: Literates' ;
label sclitR =  'Sched Caste: Literates, rural' ;
label sclitM =  'Sched Caste: Literates, men' ;
label sclitRM = 'Sched Caste: literates, rural men' ;


/* Scheduled Tribe variables */
label st =      'Scheduled Tribe population' ;
label stR =     'Scheduled Tribe population, rural' ;
label stM =     'Scheduled Tribe population, men' ;
label stRM =    'Scheduled Tribe population, rural men' ;
label stwork =  'Sched Tribe: workers' ;
label stworkR = 'Sched Tribe: workers, rural' ;
label stworkM = 'Sched Tribe: workers, men' ;
label stworkRM ='Sched Tribe: workers, rural men' ;
label stfarm =  'Sched Tribe: all farm' ;
label stfarmR = 'Sched Tribe: all farm, rural' ;
label stfarmM = 'Sched Tribe: all farm, men' ;
label stfarmRM ='Sched Tribe: all farm, rural men' ;
label stcult =   'Sched Tribe: cultivators' ;
label stcultR =  'Sched Tribe: cultivators, rural' ;
label stcultM =  'Sched Tribe: cultivators, men' ;
label stcultRM = 'Sched Tribe: cultivators, rural men' ;
label stalab =  'Sched Tribe: agricultural laborers' ;
label stalabR = 'Sched Tribe: agri laborers, rural' ;
label stalabM = 'Sched Tribe: agri laborers, men' ;
label stalabRM ='Sched Tribe: agri laborers, rural men' ;
label sthind =  'Sched Tribe: hh industry' ;
label sthindR = 'Sched Tribe: hh industry, rural' ;
label sthindM = 'Sched Tribe: hh industry, men' ;
label sthindRM ='Sched Tribe: hh industry, rural men' ;
label stothr =  'Sched Tribe: other sectors' ;
label stothrR = 'Sched Tribe: other sectors, rural' ;
label stothrM = 'Sched Tribe: other sectors, men' ;
label stothrRM ='Sched Tribe: other sectors, rural men' ;
label stmarg =  'Sched Tribe: marginal workers' ;
label stmargR = 'Sched Tribe: marginal workers, rural' ;
label stmargM = 'Sched Tribe: marginal workers, men' ;
label stmargRM ='Sched Tribe: marg workers, rural men' ;
label stnowk =  'Sched Tribe: non-workers' ;
label stnowkR = 'Sched Tribe: non-workers, rural' ;
label stnowkM = 'Sched Tribe: non-workers, men' ;
label stnowkRM ='Sched Tribe: non-workers, rural men' ;
label stlit =   'Sched Tribe: literates' ;
label stlitR =  'Sched Tribe: Literates, rural' ;
label stlitM =  'Sched Tribe: literates, men' ;
label stlitRM = 'Sched Tribe: literates, rural men' ;



/*  Migrants */
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

/* 'Migrants from rural part of another Indian district' */
label migrd =   'Migrants rural pt other district' ;
label migrdR =  'Migrants rural pt other district, rural' ;
label migrdM =  'Migrants rural pt other district, male ' ;
label migrdRM = 'Migrants rural other dist., rural men' ;

/* 'Migrants from rural part of another Indian state' */
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




/* child mortality rates (graduated) */
label cm01 =   'Child mort rate 0-1 years' ;
label cm01R =  'Child mort rate 0-1 years, rural' ;
label cm01U =  'Child mort rate 0-1 years, urban' ;
label cm01M =  'Child mort rate 0-1 years, men' ;
label cm01F =  'Child mort rate 0-1 years, women' ;
label cm01RM = 'Child mort rate 0-1 years, rural men' ;
label cm01RF = 'Child mort rate 0-1 years, rural women' ;
label cm01UM = 'Child mort rate 0-1 years, urban men' ;
label cm01UF = 'Child mort rate 0-1 years, urban women' ;

label cm02 =   'Child mort rate 0-2 years' ;
label cm02R =  'Child mort rate 0-2 years, rural' ;
label cm02U =  'Child mort rate 0-2 years, urban' ;
label cm02M =  'Child mort rate 0-2 years, men' ;
label cm02F =  'Child mort rate 0-2 years, women' ;
label cm02RM = 'Child mort rate 0-2 years, rural men' ;
label cm02RF = 'Child mort rate 0-2 years, rural women' ;
label cm02UM = 'Child mort rate 0-2 years, urban men' ;
label cm02UF = 'Child mort rate 0-2 years, urban women' ;

label cm05 =   'Child mort rate 0-5 years' ;
label cm05R =  'Child mort rate 0-5 years, rural' ;
label cm05U =  'Child mort rate 0-5 years, urban' ;
label cm05M =  'Child mort rate 0-5 years, men' ;
label cm05F =  'Child mort rate 0-5 years, women' ;
label cm05RM = 'Child mort rate 0-5 years, rural men' ;
label cm05RF = 'Child mort rate 0-5 years, rural women' ;
label cm05UM = 'Child mort rate 0-5 years, urban men' ;
label cm05UF = 'Child mort rate 0-5 years, urban women' ;



/* Muslims */
label musl =    'Muslims' ;
label muslR =   'Muslims, rural' ;
label muslM =   'Muslims, men' ;
label muslRM =  'Muslims, rural men' ;


/* Buddhists */
label bud =     'Buddhists' ;
label budR =    'Buddhists, rural' ;
label budM =    'Buddhists, men' ;
label budRM =   'Buddhists, rural men' ;



/* Age and Marital Status labels*/
label nvmar =  'Never married' ;
label nvmarR = 'Never married, rural' ;
label nvmarM = 'Never married, men' ;
label nvmarRM ='Never married, rural men' ;

label nvm10 =  'Never married 10-14' ;
label nvm10R = 'Never married 10-14, rural' ;
label nvm10M = 'Never married 10-14, men' ;
label nvm10RM ='Never married 10-14, rural men' ;

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


/* Widow labels */
label wid     = 'Widowed' ;
label wid10   = 'Widowed, 10-14' ;
label wid15   = 'Widowed, 15-24' ;
label wid20   = 'Widowed, 20-24' ;

label widR     = 'Widowed, rural' ;
label wid10R   = 'Widowed, rural 10-14' ;
label wid15R   = 'Widowed, rural 15-24' ;
label wid20R   = 'Widowed, rural 20-24' ;

label widM     = 'Widowed, men' ;
label wid10M   = 'Widowed, male 10-14' ;
label wid15M   = 'Widowed, male 15-24' ;
label wid20M   = 'Widowed, male 20-24' ;

label widRM    = 'Widowed, rural men' ;
label wid10RM  = 'Widowed, rural men 10-14' ;
label wid15RM  = 'Widowed, rural men 15-24' ;
label wid20RM  = 'Widowed, rural men 20-24' ;

/* Divorced labels */
label div     = 'Divorced' ;
label div10   = 'Divorced, 10-14' ;
label div15   = 'Divorced, 15-24' ;
label div20   = 'Divorced, 20-24' ;

label divR     = 'Divorced, rural' ;
label div10R   = 'Divorced, rural 10-14' ;
label div15R   = 'Divorced, rural 15-24' ;
label div20R   = 'Divorced, rural 20-24' ;

label divM     = 'Divorced, men' ;
label div10M   = 'Divorced, male 10-14' ;
label div15M   = 'Divorced, male 15-24' ;
label div20M   = 'Divorced, male 20-24' ;

label divRM    = 'Divorced, rural men' ;
label div10RM  = 'Divorced, rural men 10-14' ;
label div15RM  = 'Divorced, rural men 15-24' ;
label div20RM  = 'Divorced, rural men 20-24' ;


/* Doctors*/
label doc =  'Physicians (+dent+vet)' ;
label docR = 'Physicians (+dent+vet), rural' ;
label docM = 'Physicians (+dent+vet), men' ;
label docRM ='Physicians (+dent+vet), rural men' ;


/*  Teachers */
label teach =  'Teachers' ;
label teachR = 'Teachers, rural' ;
label teachM = 'Teachers, men' ;
label teachRM ='Teachers, rural men' ;



/*  Agricultural variables */

label ricea =   'Rice area, 1000 ha' ;
label wheata =  'Wheat area, 1000 ha' ;
label jowara =  'Jowar area, 1000 ha' ;
label bajraa =  'Bajra area, 1000 ha' ;
label maizea =  'Maize area, 1000 ha' ;
label ragia =   'Ragi area, 1000 ha' ;
label milla =   'Millet area, 1000 ha' ;
label barlya =  'Barley area, 1000 ha' ;
label grama =   'Gram area, 1000 ha' ;
label tura =    'Tur area, 1000 ha' ;
label opulsa =  'Other Pulses area, 1000 ha' ;
label gnuta =   'Groundnut area, 1000 ha' ;
label cseeda =  'Castor seed area, 1000 ha' ;
label sesma =   'Sesamum/ til area, 1000 ha' ;
label rseeda =  'Rapeseed/ Mustardseed area, 1000 ha' ;
label lseeda =  'Linseed area, 1000 ha' ;
label cota =    'Cotton area, 1000 ha' ;
label jutea =   'Jute area, 1000 ha' ;
label mestaa =  'Mesta area, 1000 ha' ;
label potata =  'Potato area, 1000 ha' ;
label sugara =  'Sugar area, 1000 ha' ;
label chilia =  'Chili area, 1000 ha' ;
label gina =    'Ginger area, 1000 ha' ;
label tobaca =  'Tobacco area, 1000 ha' ;
label bpeppa =  'Black Pepper area, 1000 ha' ;
label conuta =  'Coconut area, 1000 ha' ;
label turma =   'Turmeric area, 1000 ha' ;
label hempa =   'Sannhemp area, 1000 ha' ;
label gseeda =  'Guarseed area, 1000 ha' ;
label tapia =   'Tapioca area, 1000 ha' ;
label anuta =   'Arecanut area, 1000 ha' ;
label banaa =   'Banana area, 1000 ha' ;
label coria =   'Coriander area, 1000 ha' ;
label carda =   'Cardamom area, 1000 ha' ;
label saffa =   'Safflower area, 1000 ha' ;
label nseeda =  'Nigerseed area, 1000 ha' ;
label swpota =  'Sweet Potato area, 1000 ha' ;
label garla =   'Garlic area, 1000 ha' ;
label sunfa =   'Sunflower area, 1000 ha' ;
label oniona =  'Onion area, 1000 ha' ;

label cropa =   '37 crops total: area, 1000 ha' ;
label crop33a = '33 crops total: area, 1000 ha' ;
label crop19a = '19 crops total: area, 1000 ha' ;

label  ricep =   'Rice production, 1000 tonnes' ;
label  wheatp =  'Wheat production, 1000 tonnes' ;
label  jowarp =  'Jowar production, 1000 tonnes' ;
label  bajrap =  'Bajra production, 1000 tonnes' ;
label  maizep =  'Maize production, 1000 tonnes' ;
label  ragip =   'Ragi production, 1000 tonnes' ;
label  millp =   'Millet production, 1000 tonnes' ;
label  gramp =   'Gram production, 1000 tonnes' ;
label  barlyp =  'Barley production, 1000 tonnes' ;
label  turp =    'Tur production, 1000 tonnes' ;
label  opulsp =  'Other pulses production, 1000 tonnes' ;
label  gnutp =   'Groundnut production, 1000 tonnes' ;
label  cseedp =  'Castor seed production, 1000 tonnes' ;
label  sesmp =   'Sesmum/ til production, 1000 tonnes' ;
label  rseedp =  'Rapeseed/ Mustardseed prod, 1000 tonnes' ;
label  lseedp =  'Linseed production, 1000 tonnes' ;
label  cotp =    'Cotton production, 1000 tonnes' ;
label  jutep =   'Jute production, 1000 tonnes' ;
label  mestap =  'Mesta production, 1000 tonnes' ;
label  potatp =  'potato production, 1000 tonnes' ;
label  sugarp =  'Sugar production, 1000 tonnes' ;
label  chilip =  'Chili production, 1000 tonnes' ;
label  ginp =    'Ginger production, 1000 tonnes' ;
label  tobacp =  'Tobacco production, 1000 tonnes' ;
label  bpeppp =  'Black Pepper production, 1000 tonnes' ;
label  conutp =  'Coconut production, 1000 tonnes' ;
label  turmp =   'Turmeric production, 1000 tonnes' ;
label  hempp =   'Sannhemp production, 1000 tonnes' ;
label  gseedp =  'Guarseed production, 1000 tonnes' ;
label  tapip =   'Tapioca production, 1000 tonnes' ;
label  anutp =   'Arecanut production, 1000 tonnes' ;
label  banap =   'Banana production, 1000 tonnes' ;
label  corip =   'Coriander production, 1000 tonnes' ;
label  cardp =   'Cardamom production, 1000 tonnes' ;
label  saffp =   'Safflower production, 1000 tonnes' ;
label  nseedp =  'Nigerseed production, 1000 tonnes' ;
label  swpotp =  'Sweet Potato production, 1000 tonnes' ;
label  garlp =   'Garlic production, 1000 tonnes' ;
label  sunfp =   'Sunflower production, 1000 tonnes' ;
label  onionp =  'Onion production, 1000 tonnes' ;

label cropv =   '37 crops: value of production, 1000 Rs' ;
label crop33v = '33 crops: value of production, 1000 Rs' ;
label crop19v = '19 crops: value of production, 1000 Rs' ;



/* area and household data */
label   area =   'Area in sq. kilometers' ;
label   houses = 'Houses' ;
label   hh =     'Households' ;
label   hhlin =  'Lineal joint households' ;
label   hhcol =  'Collateral joint households' ;

label   areaR =  'Area in sq. kilometers, rural' ;
label   housesR ='Houses, rural' ;
label   hhR =    'Households, rural' ;
label   hhlinR = 'Lineal joint households, rural' ;
label   hhcolR = 'Collateral joint households, rural' ;



/* Fertility Variables*/

label tfr   = 'Calculated total fertility rate' ;
label utfr  = 'Total fertility rate (unadjusted)';
label sfr15 = 'Age specific fertility rate women 15-19';
label sfr20 = 'Age specific fertility rate women 20-24';
label sfr25 = 'Age specific fertility rate women 25-29';
label sfr30 = 'Age specific fertility rate women 30-34';
label sfr35 = 'Age specific fertility rate women 35-39';
label sfr40 = 'Age specific fertility rate women 40-44';
label sfr45 = 'Age specific fertility rate women 45-49';

urban= pop-rural; 

proc contents;
proc means n nmiss mean std min max ;
proc print uniform;
    var stateid distid dlabel pop rural urban area ;

ENDSAS;

