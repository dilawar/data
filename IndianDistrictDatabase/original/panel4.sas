* name of program: panel.sas;
* this program reads the 1961-1991 India census district data;
* The data are read from panel4.data file;

options linesize=132 pagesize=55 nocenter;
/*********************************************************************/

title  'panel4: 1961-1991 Indian district sas file.' ;

/*********************************************************************/

/* Users will need to create their own libname and filename commands
   as appropriate for their local computer system
*/

libname  sasdata '.';
filename inpanel  pipe 'gunzip -c panel4.data.gz';

data sasdata.panel91;

attrib DLABEL length = $ 28;

infile INPANEL;
input  
/*  Record ID # 000  district label */  
    /*  skip 1961 label record */
  / /*  skip 1971 label record */
  / /*  read 1981 label record */
  STATEID $ 1-2 DISTID $ 3-4 RECORD  5-7  YEAR  8-9  VERSION  10  DLABEL &
  / /*  skip 1991 label record */

/*  Record ID # 100 - Total population */
  / POP6 11-19    RURAL6 20-28   MALE6 29-37    RMALE6 38-46
  / POP7 11-19    RURAL7 20-28   MALE7 29-37    RMALE7 38-46
  / POP8 11-19    RURAL8 20-28   MALE8 29-37    RMALE8 38-46
  / POP9 11-19    RURAL9 20-28   MALE9 29-37    RMALE9 38-46

/*  Record ID # 111 - Total main workers */
  / WORK6 11-19   WORKr6 20-28   WORKm6 29-37   WORKrm6 38-46 /* estimated */
  / WORK7 11-19   WORKr7 20-28   WORKm7 29-37   WORKrm7 38-46
  / WORK8 11-19   WORKr8 20-28   WORKm8 29-37   WORKrm8 38-46
  / WORK9 11-19   WORKr9 20-28   WORKm9 29-37   WORKrm9 38-46

/*  Record ID # 112 - Farm workers (main) */
  / FARM6 11-19   FARMr6 20-28   FARMm6 29-37   FARMRm6 38-46 /* estimated */
  / FARM7 11-19   FARMr7 20-28   FARMm7 29-37   FARMRm7 38-46
  / FARM8 11-19   FARMr8 20-28   FARMm8 29-37   FARMrm8 38-46
  / FARM9 11-19   FARMr9 20-28   FARMm9 29-37   FARMrm9 38-46

/*  Record ID # 113 - Cultivators (main) */
  / CULT6 11-19   CULTr6 20-28   CULTm6 29-37   CULTrm6 38-46 /* estimated */
  / CULT7 11-19   CULTr7 20-28   CULTm7 29-37   CULTrm7 38-46
  / CULT8 11-19   CULTr8 20-28   CULTm8 29-37   CULTrm8 38-46
  / CULT9 11-19   CULTr9 20-28   CULTm9 29-37   CULTrm9 38-46

/*  Record ID # 114 - Agricultural Laborers (main) */
  / ALAB6 11-19   ALABr6 20-28   ALABm6 29-37   ALABrm6 38-46 /* estimated */
  / ALAB7 11-19   ALABr7 20-28   ALABm7 29-37   ALABrm7 38-46
  / ALAB8 11-19   ALABr8 20-28   ALABm8 29-37   ALABrm8 38-46
  / ALAB9 11-19   ALABr9 20-28   ALABm9 29-37   ALABrm9 38-46

/*  Record ID # 115 - Household Industry (main) */
  / HIND6 11-19   HINDr6 20-28   HINDm6 29-37   HINDrm6 38-46 /* estimated */
  / HIND7 11-19   HINDr7 20-28   HINDm7 29-37   HINDrm7 38-46
  / HIND8 11-19   HINDr8 20-28   HINDm8 29-37   HINDrm8 38-46
  / HIND9 11-19   HINDr9 20-28   HINDm9 29-37   HINDrm9 38-46

/*  Record ID # 116 - Other sectors (main) */  
  / OTHR6 11-19   OTHRr6 20-28   OTHRm6 29-37   OTHRRm6 38-46 /* estimated */
  / OTHR7 11-19   OTHRr7 20-28   OTHRm7 29-37   OTHRRm7 38-46
  / OTHR8 11-19   OTHRr8 20-28   OTHRm8 29-37   OTHRrm8 38-46
  / OTHR9 11-19   OTHRr9 20-28   OTHRm9 29-37   OTHRrm9 38-46

/*  Record ID # 117 - Livestock, orchards, etc. (main) */
  / LIVE6 11-19   LIVEr6 20-28   LIVEm6 29-37   LIVErm6 38-46 /* estimated */
  / LIVE7 11-19   LIVEr7 20-28   LIVEm7 29-37   LIVErm7 38-46
  / LIVE8 11-19   LIVEr8 20-28   LIVEm8 29-37   LIVErm8 38-46
  / LIVE9 11-19   LIVEr9 20-28   LIVEm9 29-37   LIVErm9 38-46

/*  Record ID # 118 - Mining (main) */
  / MINE6 11-19   MINEr6 20-28   MINEm6 29-37   MINErm6 38-46 /* estimated */
  / MINE7 11-19   MINEr7 20-28   MINEm7 29-37   MINErm7 38-46
  / MINE8 11-19   MINEr8 20-28   MINEm8 29-37   MINErm8 38-46
  / MINE9 11-19   MINEr9 20-28   MINEm9 29-37   MINErm9 38-46

/*  Record ID # 119 - Manufacturing (main) */
  / MANF6 11-19   MANFr6 20-28   MANFm6 29-37   MANFrm6 38-46 /* estimated */
  / MANF7 11-19   MANFr7 20-28   MANFm7 29-37   MANFrm7 38-46
  / MANF8 11-19   MANFr8 20-28   MANFm8 29-37   MANFrm8 38-46
  / MANF9 11-19   MANFr9 20-28   MANFm9 29-37   MANFrm9 38-46

/*  Record ID # 120 - Construction (main) */
  / CONS6 11-19   CONSr6 20-28   CONSm6 29-37   CONSrm6 38-46 /* estimated */
  / CONS7 11-19   CONSr7 20-28   CONSm7 29-37   CONSrm7 38-46
  / CONS8 11-19   CONSr8 20-28   CONSm8 29-37   CONSrm8 38-46
  / CONS9 11-19   CONSr9 20-28   CONSm9 29-37   CONSrm9 38-46

/*  Record ID # 121 - Commerce (main) */
  / COMM6 11-19   COMMr6 20-28   COMMm6 29-37   COMMrm6 38-46 /* estimated */
  / COMM7 11-19   COMMr7 20-28   COMMm7 29-37   COMMrm7 38-46
  / COMM8 11-19   COMMr8 20-28   COMMm8 29-37   COMMrm8 38-46
  / COMM9 11-19   COMMr9 20-28   COMMm9 29-37   COMMrm9 38-46

/*  Record ID # 122 - Transport and Communication (main) */
  / TRAN6 11-19   TRANr6 20-28   TRANm6 29-37   TRANrm6 38-46 /* estimated */
  / TRAN7 11-19   TRANr7 20-28   TRANm7 29-37   TRANrm7 38-46
  / TRAN8 11-19   TRANr8 20-28   TRANm8 29-37   TRANrm8 38-46
  / TRAN9 11-19   TRANr9 20-28   TRANm9 29-37   TRANrm9 38-46

/*  Record ID # 123 - Other Services (main) */
  / SERV6 11-19   SERVr6 20-28   SERVm6 29-37   SERVrm6 38-46 /* estimated */
  / SERV7 11-19   SERVr7 20-28   SERVm7 29-37   SERVrm7 38-46
  / SERV8 11-19   SERVr8 20-28   SERVm8 29-37   SERVrm8 38-46
  / SERV9 11-19   SERVr9 20-28   SERVm9 29-37   SERVrm9 38-46

/*  Record ID # 124 - Marginal workers */ 
  / MARG6 11-19   MARGr6 20-28   MARGm6 29-37   MARGrm6 38-46 /* estimated */
  / MARG7 11-19   MARGr7 20-28   MARGm7 29-37   MARGrm7 38-46 /* estimated */
  / MARG8 11-19   MARGr8 20-28   MARGm8 29-37   MARGrm8 38-46
  / MARG9 11-19   MARGr9 20-28   MARGm9 29-37   MARGrm9 38-46

/*  Record ID # 125 - Non-workers, not even marginal workers */ 
  / NOWK6 11-19   NOWKr6 20-28   NOWKm6 29-37   NOWKrm6 38-46 
  / NOWK7 11-19   NOWKr7 20-28   NOWKm7 29-37   NOWKrm7 38-46 /* estimated */
  / NOWK8 11-19   NOWKr8 20-28   NOWKm8 29-37   NOWKrm8 38-46
  / NOWK9 11-19   NOWKr9 20-28   NOWKm9 29-37   NOWKrm9 38-46

/*  Record ID # 126 - Marginal + main workers */
  / TWORK6 11-19  TWORKr6 20-28  TWORKm6 29-37  TWORKrm6 38-46
  / TWORK7 11-19  TWORKr7 20-28  TWORKm7 29-37  TWORKrm7 38-46 /* estimated */
  / TWORK8 11-19  TWORKr8 20-28  TWORKm8 29-37  TWORKrm8 38-46
  / TWORK9 11-19  TWORKr9 20-29  TWORKm9 29-37  TWORKrm9 38-46

/*  Record ID # 127 Farm workers (main and marginal) */
  / TFARM6 11-19  TFARMr6 20-28  TFARMm6 29-37  TFARMrm6 38-46
  / TFARM7 11-19  TFARMr7 20-28  TFARMm7 29-37  TFARMrm7 38-46 /* estimated */
  / TFARM8 11-19  TFARMr8 20-28  TFARMm8 29-37  TFARMrm8 38-46
  / /*  1991 not available */

/*  Record ID # 128 - Cultivators (main and marginal) */ 
  / TCULT6 11-19  TCULTr6 20-28  TCULTm6 29-37  TCULTrm6 38-46
  / TCULT7 11-19  TCULTr7 20-28  TCULTm7 29-37  TCULTrm7 38-46 /* estimated */
  / TCULT8 11-19  TCULTr8 20-28  TCULTm8 29-37  TCULTrm8 38-46
  / /*  1991 not available */

/*  Record ID # 129 - Agricultural Laborers (main and marginal) */ 
  / TALAB6 11-19  TALABr6 20-28  TALABm6 29-37  TALABrm6 38-46
  / TALAB7 11-19  TALABr7 20-28  TALABm7 29-37  TALABrm7 38-46 /* estimated */
  / TALAB8 11-19  TALABr8 20-28  TALABm8 29-37  TALABrm8 38-46
  / /*  1991 not available */

/*  Record ID # 130 - Household Industry (main and marginal) */ 
  / THIND6 11-19  THINDr6 20-28  THINDm6 29-37  THINDrm6 38-46
  / THIND7 11-19  THINDr7 20-28  THINDm7 29-37  THINDrm7 38-46 /* estimated */
  / THIND8 11-19  THINDr8 20-28  THINDm8 29-37  THINDrm8 38-46
  / /*  1991 not available */

/*  Record ID # 131 - Other sectors (main and marginal) */
  / TOTH6 11-19   TOTHr6 20-28   TOTHm6 29-37   TOTHrm6 38-46
  / TOTH7 11-19   TOTHr7 20-28   TOTHm7 29-37   TOTHrm7 38-46 /* estimated */
  / TOTH8 11-19   TOTHr8 20-28   TOTHm8 29-37   TOTHrm8 38-46
  / /*  1991 not available */

/*  Record ID # 132 - Livestock, orchards, etc. (main and marginal) */
  / TLIVE6 11-19  TLIVEr6 20-28  TLIVEm6 29-37  TLIVErm6 38-46
  / TLIVE7 11-19  TLIVEr7 20-28  TLIVEm7 29-37  TLIVErm7 38-46 /* estimated */
  / TLIVE8 11-19  TLIVEr8 20-28  TLIVEm8 29-37  TLIVErm8 38-46
  / /*  1991 not available */

/*  Record ID # 133 - Mining (main and marginal) */
  / TMINE6 11-19  TMINEr6 20-28  TMINEm6 29-37  TMINErm6 38-46
  / TMINE7 11-19  TMINEr7 20-28  TMINEm7 29-37  TMINErm7 38-46 /* estimated */
  / TMINE8 11-19  TMINEr8 20-28  TMINEm8 29-37  TMINErm8 38-46
  / /*  1991 not available */

/*  Record ID # 134 - Manufacturing (main and marginal) */
  / TMANF6 11-19  TMANFr6 20-28  TMANFm6 29-37  TMANFrm6 38-46
  / TMANF7 11-19  TMANFr7 20-28  TMANFm7 29-37  TMANFrm7 38-46 /* estimated */
  / TMANF8 11-19  TMANFr8 20-28  TMANFm8 29-37  TMANFrm8 38-46
  / /*  1991 not available */

/*  Record ID # 135 - Construction (main and marginal) */
  / TCONS6 11-19  TCONSr6 20-28  TCONSm6 29-37  TCONSrm6 38-46
  / TCONS7 11-19  TCONSr7 20-28  TCONSm7 29-37  TCONSrm7 38-46 /* estimated */
  / TCONS8 11-19  TCONSr8 20-28  TCONSm8 29-37  TCONSrm8 38-46
  / /*  1991 not available * /

/*  Record ID # 136 - Commerce (main and marginal) */
  / TCOMM6 11-19  TCOMMr6 20-28  TCOMMm6 29-37  TCOMMrm6 38-46
  / TCOMM7 11-19  TCOMMr7 20-28  TCOMMm7 29-37  TCOMMrm7 38-46 /* estimated */
  / TCOMM8 11-19  TCOMMr8 20-28  TCOMMm8 29-37  TCOMMrm8 38-46
  / /*  1991 not available */

/*  Record ID # 137 - Transport and Communnication (main and marginal) */
  / TTRAN6 11-19  TTRANr6 20-28  TTRANm6 29-37  TTRANrm6 38-46
  / TTRAN7 11-19  TTRANr7 20-28  TTRANm7 29-37  TTRANrm7 38-46 /* estimated */
  / TTRAN8 11-19  TTRANr8 20-28  TTRANm8 29-37  TTRANrm8 38-46
  / /*  1991 not available */

/*  Record ID # 138 - Other services (main and marginal) */
  / TSERV6 11-19  TSERVr6 20-28  TSERVm6 29-37  TSERVrm6 38-46
  / TSERV7 11-19  TSERVr7 20-28  TSERVm7 29-37  TSERVrm7 38-46 /* estimated */
  / TSERV8 11-19  TSERVr8 20-28  TSERVm8 29-37  TSERVrm8 38-46
  / /*  1991 not available */

/*  Record ID # 139 - Non- main workers, but including marginal */
  / NMAIN6 11-19  NMAINr6 20-28  NMAINm6 29-37  NMAINrm6 38-46 /* estimated */
  / NMAIN7 11-19  NMAINr7 20-28  NMAINm7 29-37  NMAINrm7 38-46
  / NMAIN8 11-19  NMAINr8 20-28  NMAINm8 29-37  NMAINrm8 38-46
  / NMAIN9 11-19  NMAINr9 20-28  NMAINm9 29-37  NMAINrm9 38-46

/*  Record ID # 140 - Literates (ages 5+) */
  / LIT6 11-19    LITr6 20-28    LITm6 29-37    LITrm6 38-46
  / LIT7 11-19    LITr7 20-28    LITm7 29-37    LITrm7 38-46
  / LIT8 11-19    LITr8 20-28    LITm8 29-37    LITrm8 38-46
  / LIT9 11-19    LITr9 20-28    LITm9 29-37    LITrm9 38-46
/*  Record ID # 141 - Literates: ages 5-9 */
  / LIT056 11-19  LIT05r6 20-28  LIT05m6 29-37  LIT05rm6 38-46
  / LIT057 11-19  LIT05r7 20-28  LIT05m7 29-37  LIT05rm7 38-46
  / LIT058 11-19  LIT05r8 20-28  LIT05m8 29-37  LIT05rm8 38-46 
  / LIT079 11-19  LIT07r9 20-28  LIT07m9 29-37  LIT07rm9 38-46
/*  Record ID # 142 - Literates: ages 10-14 */
  / LIT106 11-19  LIT10r6 20-28  LIT10m6 29-37  LIT10rm6 38-46
  / LIT107 11-19  LIT10r7 20-28  LIT10m7 29-37  LIT10rm7 38-46
  / LIT108 11-19  LIT10r8 20-28  LIT10m8 29-37  LIT10rm8 38-46
  / LIT109 11-19  LIT10r9 20-28  LIT10m9 29-37  LIT10rm9 38-46
/*  Record ID # 143 - Literates: ages 15-19 */
  / LIT156 11-19  LIT15r6 20-28  LIT15m6 29-37  LIT15rm6 38-46
  / LIT157 11-19  LIT15r7 20-28  LIT15m7 29-37  LIT15rm7 38-46
  / LIT158 11-19  LIT15r8 20-28  LIT15m8 29-37  LIT15rm8 38-46
  / LIT159 11-19  LIT15r9 20-28  LIT15m9 29-37  LIT15rm9 38-46
/*  Record ID # 144 - Literates: ages 20-24 */
  / LIT206 11-19  LIT20r6 20-28  LIT20m6 29-37  LIT20rm6 38-46
  / LIT207 11-19  LIT20r7 20-28  LIT20m7 29-37  LIT20rm7 38-46
  / LIT208 11-19  LIT20r8 20-28  LIT20m8 29-37  LIT20rm8 38-46
  / LIT209 11-19  LIT20r9 20-28  LIT20m9 29-37  LIT20rm9 38-46
/*  Record ID # 145 - Literates: ages 25-34 */
  / LIT256 11-19  LIT25r6 20-28  LIT25m6 29-37  LIT25rm6 38-46
  / LIT257 11-19  LIT25r7 20-28  LIT25m7 29-37  LIT25rm7 38-46
  / LIT258 11-19  LIT25r8 20-28  LIT25m8 29-37  LIT25rm8 38-46
  / LIT259 11-19  LIT25r9 20-28  LIT25m9 29-37  LIT25rm9 38-46
/*  Record ID # 147 - Literates: ages 35+ */
  / LIT356 11-19  LIT35r6 20-28  LIT35m6 29-37  LIT35rm6 38-46
  / LIT357 11-19  LIT35r7 20-28  LIT35m7 29-37  LIT35rm7 38-46
  / LIT358 11-19  LIT35r8 20-28  LIT35m8 29-37  LIT35rm8 38-46
  / LIT359 11-19  LIT35r9 20-28  LIT35m9 29-37  LIT35rm9 38-46

/*  Record ID # 151 - Primary School or higher */
  / PRIM6 11-19   PRIMr6 20-28   PRIMm6 29-37   PRIMrm6 38-46
  / PRIM7 11-19   PRIMr7 20-28   PRIMm7 29-37   PRIMrm7 38-46
  / PRIM8 11-19   PRIMr8 20-28   PRIMm8 29-37   PRIMrm8 38-46
  / PRIM9 11-19   PRIMr9 20-28   PRIMm9 29-37   PRIMrm9 38-46

/*  Record ID # 152 - Middle School or higher */
  / /* 1961 not available */
  / MID7 11-19    MIDr7 20-28    MIDm7 29-37    MIDrm7 38-46
  / MID8 11-19    MIDr8 20-28    MIDm8 29-37    MIDrm8 38-46
  / MID9 11-19    MIDr9 20-28    MIDm9 29-37    MIDrm9 38-46

/*  Record ID # 153 - Matriculates or higher */
  / MATR6 11-19   MATRr6 20-28   MATRm6 29-37   MATRrm6 38-46
  / MATR7 11-19   MATRr7 20-28   MATrm7 29-37   MATRRm7 38-46
  / MATR8 11-19   MATRr8 20-28   MATrm8 29-37   MATRrm8 38-46
  / MATR9 11-19   MATRr9 20-28   MATrm9 29-37   MATRrm9 38-46

/*  Record ID # 154 - Non-technical diploma or higher */
  / /* 1961 not available*/
  / NTDIP7 11-19  NTDIPr7 20-28  NTDIPm7 29-37  NTDIPrm7 38-46
  / NTDIP8 11-19  NTDIPr8 20-28  NTDIPm8 29-37  NTDIPrm8 38-46
  / NTDIP9 11-19  NTDIPr9 20-28  NTDIPm9 29-37  NTDIPrm9 38-46

/*  Record ID # 155 - Diploma or higher */
  / /* 1961 not available */
  / DIP7 11-19    DIPr7 20-28    DIPm7 29-37    DIPrm7 38-46
  / DIP8 11-19    DIPr8 20-28    DIPm8 29-37    DIPrm8 38-46
  / DIP9 11-19    DIPr9 20-28    DIPm9 29-37    DIPrm9 38-46

/*  Record ID # 156 - Graduates or higher */
  / /* 1961 not available */
  / GRAD7 11-19   GRADr7 20-28   GRADm7 29-37   GRADrm7 38-46
  / GRAD8 11-19   GRADr8 20-28   GRADm8 29-37   GRADrm8 38-46
  / GRAD9 11-19   GRADr9 20-28   GRADm9 29-37   GRADrm9 38-46

/*  Record ID # 160 - Age: 0-4 */
  / POP006 11-19  POP00r6 20-28  POP00m6 29-37  POP00rm6 38-46
  / POP007 11-19  POP00r7 20-28  POP00m7 29-37  POP00rm7 38-46
  / POP008 11-19  POP00r8 20-28  POP00m8 29-37  POP00rm8 38-46
  / POP009 11-19  POP00r9 20-28  POP00m9 29-37  POP00rm9 38-46
/*  Record ID # 16 - Age 5-9 */
  / POP056 11-19  POP05r6 20-28  POP05m6 29-37  POP05rm6 38-46
  / POP057 11-19  POP05r7 20-28  POP05m7 29-37  POP05rm7 38-46
  / POP058 11-19  POP05r8 20-28  POP05m8 29-37  POP05rm8 38-46
  / POP059 11-19  POP05r9 20-28  POP05m9 29-37  POP05rm9 38-46
/*  Record ID # 162 Age 10-14 */
  / POP106 11-19  POP10r6 20-28  POP10m6 29-37  POP10rm6 38-46
  / POP107 11-19  POP10r7 20-28  POP10m7 29-37  POP10rm7 38-46
  / POP108 11-19  POP10r8 20-28  POP10m8 29-37  POP10rm8 38-46
  / POP109 11-19  POP10r9 20-28  POP10m9 29-37  POP10rm9 38-46
/*  Record ID # 163 - Age 15-19  */
  / POP156 11-19  POP15r6 20-28  POP15m6 29-37  POP15rm6 38-46
  / POP157 11-19  POP15r7 20-28  POP15m7 29-37  POP15rm7 38-46
  / POP158 11-19  POP15r8 20-28  POP15m8 29-37  POP15rm8 38-46
  / POP159 11-19  POP15r9 20-28  POP15m9 29-37  POP15rm9 38-46
/*  Record ID # 164 - Age 20-24 */
  / POP206 11-19  POP20r6 20-28  POP20m6 29-37  POP20rm6 38-46
  / POP207 11-19  POP20r7 20-28  POP20m7 29-37  POP20rm7 38-46
  / POP208 11-19  POP20r8 20-28  POP20m8 29-37  POP20rm8 38-46
  / POP209 11-19  POP20r9 20-28  POP20m9 29-37  POP20rm9 38-46
/*  Record ID # 165 - Age 25-34 */
  / POP256 11-19  POP25r6 20-28  POP25m6 29-37  POP25rm6 38-46
  / POP257 11-19  POP25r7 20-28  POP25m7 29-37  POP25rm7 38-46
  / POP258 11-19  POP25r8 20-28  POP25m8 29-37  POP25rm8 38-46
  / POP259 11-19  POP25r9 20-28  POP25m9 29-37  POP25rm9 38-46
/*  Record ID # 166 - Age 35+ */
  / POP356 11-19  POP35r6 20-28  POP35m6 29-37  POP35rm6 38-46
  / POP357 11-19  POP35r7 20-28  POP35m7 29-37  POP35rm7 38-46
  / POP358 11-19  POP35r8 20-28  POP35m8 29-37  POP35rm8 38-46
  / POP359 11-19  POP35r9 20-28  POP35m9 29-37  POP35rm9 38-46

/*  Record ID # 200 - Total Scheduled Caste population */
  / SC6 11-19     SCr6 20-28     SCm6 29-37     SCrm6 38-46
  / SC7 11-19     SCr7 20-28     SCm7 29-37     SCrm7 38-46
  / SC8 11-19     SCr8 20-28     SCm8 29-37     SCrm8 38-46
  / SC9 11-19     SCr9 20-28     SCm9 29-37     SCrm9 38-46

/*  Record ID # 250 - Total Scheduled tribe population */
  / ST6 11-19     STr6 20-28     STm6 29-37     STrm6 38-46
  / ST7 11-19     STr7 20-28     STm7 29-37     STrm7 38-46
  / ST8 11-19     STr8 20-28     STm8 29-37     STrm8 38-46
  / ST9 11-19     STr9 20-28     STm9 29-37     STrm9 38-46

/*  Record ID # 300 - Migrants (total) */
  / MIG6 11-19    MIGr6 20-28    MIGm6 29-37    MIGrm6 38-46
  / MIG7 11-19    MIGr7 20-28    MIGm7 29-37    MIGrm7 38-46
  / MIG8 11-19    MIGr8 20-28    MIGm8 29-37    MIGrm8 38-46
  / MIG9 11-19    MIGr9 20-28    MIGm9 29-37    MIGrm9 38-46

/*  Record ID # 301 - Migration from another district or state */
  / MIGDI6 11-19  MIGDIr6 20-28  MIGDIm6 29-37  MIGDIrm6 38-46
  / /* 1971 migration data now covers only from place */
  / MIGDI8 11-19  MIGDIr8 20-28  MIGDIm8 29-37  MIGDIrm8 38-46
  / MIGDI9 11-19  MIGDIr9 20-28  MIGDIm9 29-37  MIGDIrm9 38-46

/*  Record ID # 302 - Migrants from another state */
  / MIGST6 11-19  MIGSTr6 20-28  MIGSTm6 29-37  MIGSTrm6 38-46
  / /* 1971 not available as yet */
  / MIGST8 11-19  MIGSTr8 20-28  MIGSTm8 29-37  MIGSTrm8 38-46
  / MIGST9 11-19  MIGSTr9 20-28  MIGSTm9 29-37  MIGSTrm9 38-46

/*  Record ID # 303 - Migrants from urban India */
  / MIGFU6 11-19  MIGFUr6 20-28  MIGFUm6 29-37  MIGFUrm6 38-46
  / /* 1971 not available as yet */
  / MIGFU8 11-19  MIGFUr8 20-28  MIGFUm8 29-37  MIGFUrm8 38-46
  / MIGFU9 11-19  MIGFUr9 20-28  MIGFUm9 29-37  MIGFUrm9 38-46

/*  Record ID # 304 - Migrants from rural India */
  / MIGFR6 11-19  MIGFRr6 20-28  MIGFRm6 29-37  MIGFRrm6 38-46
  / /* 1971 not available as yet */
  / MIGFR8 11-19  MIGFRr8 20-28  MIGFRm8 29-37  MIGFRrm8 38-46
  / MIGFR9 11-19  MIGFRr9 20-28  MIGFRm9 29-37  MIGFRrm9 38-46

/*  Record ID # 305 - Migrants from rural part of another Indian district */
  / MIGRD6 11-19  MIGRDr6 20-28  MIGRDm6 29-37  MIGRDrm6 38-46
  / /* 1971 not available as yet */
  / MIGRD8 11-19  MIGRDr8 20-28  MIGRDm8 29-37  MIGRDrm8 38-46
  / MIGRD9 11-19  MIGRDr9 20-28  MIGRDm9 29-37  MIGRDrm9 38-46

/*  Record ID # 306 - Migrants from rural part of another Indian State */
  / MIGRS6 11-19  MIGRSr6 20-28  MIGRSm6 29-37  MIGRSrm6 38-46
  / /* 1971 not available as yet */
  / MIGRS8 11-19  MIGRSr8 20-28  MIGRSm8 29-37  MIGRSrm8 38-46
  / MIGRS9 11-19  MIGRSr9 20-28  MIGRSm9 29-37  MIGRSrm9 38-46

/*  Record ID # 307 - Migrants from another Asian country (including USSR) */
  / MIGAS6 11-19  MIGASr6 20-28  MIGASm6 29-37  MIGASrm6 38-46
  / /* 1971 not available as yet */
  / MIGAS8 11-19  MIGASr8 20-28  MIGASm8 29-37  MIGASrm8 38-46
  / MIGAS9 11-19  MIGASr9 20-28  MIGASm9 29-37  MIGASrm9 38-46

/*  Record ID # 308 - Migrants from Europe */
  / MIGEU6 11-19  MIGEUr6 20-28  MIGEUm6 29-37  MIGEUrm6 38-46
  / /* 1971 not available as yet */
  / MIGEU8 11-19  MIGEUr8 20-28  MIGEUm8 29-37  MIGEUrm8 38-46
  / MIGEU9 11-19  MIGEUr9 20-28  MIGEUm9 29-37  MIGEUrm9 38-46

/*  Record ID # 309 - Migrants from Africa */
  / MIGAF6 11-19  MIGAFr6 20-28  MIGAFm6 29-37  MIGAFrm6 38-46
  / /* 1971 not available as yet */
  / MIGAF8 11-19  MIGAFr8 20-28  MIGAFm8 29-37  MIGAFrm8 38-46
  / MIGAF9 11-19  MIGAFr9 20-28  MIGAFm9 29-37  MIGAFrm9 38-46

/*  Record ID # 310 - Migrants from Americas */
  / MIGAM6 11-19  MIGAMr6 20-28  MIGAMm6 29-37  MIGAMrm6 38-46
  / /* 1971 not available as yet */
  / MIGAM8 11-19  MIGAMr8 20-28  MIGAMm8 29-37  MIGAMrm8 38-46
  / MIGAM9 11-19  MIGAMr9 20-28  MIGAMm9 29-37  MIGAMrm9 38-46

/*  Record ID # 311 - Migrants from Oceania */
  / MIGOC6 11-19  MIGOCr6 20-28  MIGOCm6 29-37  MIGOCrm6 38-46
  / /* 1971 not available as yet */
  / MIGOC8 11-19  MIGOCr8 20-28  MIGOCm8 29-37  MIGOCrm8 38-46
  / MIGOC9 11-19  MIGOCr9 20-28  MIGOCm9 29-37  MIGOCrm9 38-46

/*  Record ID # 342 - 15-19 never married */
  / NVM156 11-19  NVM15r6 20-28  NVM15m6 29-37  NVM15rm6 38-46
  / /* 1971 not available as yet */
  / NVM158 11-19  NVM15r8 20-28  NVM15m8 29-37  NVM15rm8 38-46
  / NVM159 11-19  NVM15r9 20-28  NVM15m9 29-37  NVM15rm9 38-46

/*  Record ID # 501 - Rice */
  / RICEA6 11-19  RICEP6 20-28
  / RICEA7 11-19  RICEP7 20-28
  / RICEA8 11-19  RICEP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 502 - Jowar (Cholum/Sorghum) */
  / JOWAR6 11-19  JOWARP6 20-28
  / JOWAR7 11-19  JOWARP7 20-28
  / JOWAR8 11-19  JOWARP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 503 - Bajra */
  / BAJRAA6 11-19 BAJRAP6 20-28
  / BAJRAA7 11-19 BAJRAP7 20-28
  / BAJRAA8 11-19 BAJRAP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 504 - Maize */
  / MAIZA6 11-19  MAIZP6 20-28
  / MAIZA7 11-19  MAIZP7 20-28
  / MAIZA8 11-19  MAIZP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 505 - Ragi (Marua) */
  / RAGIA6 11-19  RAGIP6 20-28
  / RAGIA7 11-19  RAGIP7 20-28
  / RAGIA8 11-19  RAGIP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 506 - Small millets */
  / MILLA6 11-19  MILLP6 20-28
  / MILLA7 11-19  MILLP7 20-28
  / MILLA8 11-19  MILLP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 507 - Wheat */
  / WHEATA6 11-19 WHEATP6 20-28
  / WHEATA7 11-19 WHEATP7 20-28
  / WHEATA8 11-19 WHEATP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 508 - Barley */
  / BARLYA6 11-19 BARLYP6 20-28
  / BARLYA7 11-19 BARLYP7 20-28
  / BARLYA8 11-19 BARLYP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 509 - Gram (chana) */
  / GRAMA6 11-19  GRAMP6 20-28
  / GRAMA7 11-19  GRAMP7 20-28
  / GRAMA8 11-19  GRAMP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 510 - Tur (arhar/red grams) */
  / TURA6 11-19   TURP6 20-28
  / TURA7 11-19   TURP7 20-28
  / TURA8 11-19   TURP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 511 - Other pulses */
  / OPULSA6 11-19 OPULSP6 20-28
  / OPULSA7 11-19 OPULSP7 20-28
  / OPULSA8 11-19 OPULSP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 512 - Groundnut */
  / GNUTA6 11-19  GNUTP6 20-28
  / GNUTA7 11-19  GNUTP7 20-28
  / GNUTA8 11-19  GNUTP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 513 - Castor seed */
  / CSEEDA6 11-19 CSEEDP6 20-28
  / CSEEDA7 11-19 CSEEDP7 20-28
  / CSEEDA8 11-19 CSEEDP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 514 - Sesamum (Til) */
  / SESMA6 11-19  SESMP6 20-28
  / SESMA7 11-19  SESMP7 20-28
  / SESMA8 11-19  SESMP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 515 - Rapeseed/ Mustard seed */
  / RSEEDA6 11-19 RSEEDP6 20-28
  / RSEEDA7 11-19 RSEEDP7 20-28
  / RSEEDA8 11-19 RSEEDP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 516 - Linseed */
  / LSEEDA6 11-19 LSEEDP6 20-28
  / LSEEDA7 11-19 LSEEDP7 20-28
  / LSEEDA8 11-19 LSEEDP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 517- Cotton */
  / COTTA6 11-19  COTTP6 20-28
  / COTTA7 11-19  COTTP7 20-28
  / COTTA8 11-19  COTTP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 518 - Jute */
  / JUTEA6 11-19  JUTEP6 20-28
  / JUTEA7 11-19  JUTEP7 20-28
  / JUTEA8 11-19  JUTEP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 519 - Mesta */
  / MESTAA6 11-19 MESTAP6 20-28
  / MESTAA7 11-19 MESTAP7 20-28
  / MESTAA8 11-19    MESTAP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 520 - Potato */
/   POTA6 11-19   POTP6 20-28
/   POTA7 11-19   POTP7 20-28
/   POTA8 11-19   POTP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 521 - Sugar (gur) */
  / SUGAR6 11-19  SUGARP6 20-28
  / SUGAR7 11-19  SUGARP7 20-28
  / SUGAR8 11-19  SUGARP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 522 - Chili */
  / CHILIA6 11-19 CHILIP6 20-28
  / CHILIA7 11-19 CHILIP7 20-28
  / CHILIA8 11-19 CHILIP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 523 - Ginger */
  / GINGA6 11-19  GINGP6 20-28
  / GINGA7 11-19  GINGP7 20-28
  / GINGA8 11-19  GINGP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 524 - Tobacco */
  / TOBACA6 11-19 TOBACP6 20-28
  / TOBACA7 11-19 TOBACP7 20-28
  / TOBACA8 11-19 TOBACP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 525 - Black Pepper */
  / BKPEPA6 11-19 BKPEPP6 20-28
  / BKPEPA7 11-19 BKPEPP7 20-28
  / BKPEPA8 11-19 BKPEPP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 526 - Coconut */
  / CONUTA6 11-19 CONUTP6 20-28
  / CONUTA7 11-19 CONUTP7 20-28
  / CONUTA8 11-19 CONUTP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 527 - Turmeric */
  / TURMA6 11-19  TURMP6 20-28
  / TURMA7 11-19  TURMP7 20-28
  / TURMA8 11-19  TURMP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 528 - Sanhemp */
  / HEMPA6 11-19  HEMPP6 20-28
  / HEMPA7 11-19  HEMPP7 20-28
  / HEMPA8 11-19  HEMPP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 530 - Guarseed */
  / GSEEDA6 11-19 GSEEDP6 20-28
  / GSEEDA7 11-19 GSEEDP7 20-28
  / GSEEDA8 11-19 GSEEDP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 531 - Tapioca */
  / TAPIA6 11-19  TAPIP6 20-28
  / TAPIA7 11-19  TAPIP7 20-28
  / TAPIA8 11-19  TAPIP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 532 - Arecanut */
  / ANUTA6 11-19  ANUTP6 20-28
  / ANUTA7 11-19  ANUTP7 20-28
  / ANUTA8 11-19  ANUTP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 533 - Banana */
  / BANA6 11-19   BANAP6 20-28
  / BANA7 11-19   BANAP7 20-28
  / BANA8 11-19   BANAP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 534 - Coriander */ 
  / CORIA6 11-19  CORIP6 20-28
  / CORIA7 11-19  CORIP7 20-28
  / CORIA8 11-19  CORIP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 535 - Cardamom */
  / CARDA6 11-19  CARDP6 20-28
  / CARDA7 11-19  CARDP7 20-28
  / CARDA8 11-19  CARDP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 536 - Safflower */
  / SAFFA6  11-19 SAFFP6 20-28
  / SAFFA7  11-19 SAFFP7 20-28
  / SAFFA8  11-19 SAFFP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 537 - Nigerseed */
  / NSEEDA6 11-19 NSEEDP6 20-28
  / NSEEDA7 11-19 NSEEDP7 20-28
  / NSEEDA8 11-19 NSEEDP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 538 - Sweet Potato */
  / SWPOTA6 11-19 SWPOTP6 20-28
  / SWPOTA7 11-19 SWPOTP7 20-28
  / SWPOTA8 11-19 SWPOTP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 539 - Garlic */
  / GARLA6 11-19  GARLP6 20-28
  / GARLA7 11-19  GARLP7 20-28
  / GARLA8 11-19  GARLP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 540 Sunflower */
  / SUNFA6 11-19  SUNFP6 20-28
  / SUNFA7 11-19  SUNFP7 20-28
  / SUNFA8 11-19  SUNFP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 541 - Onion */
  / ONIONA6 11-19 ONIONP6 20-28
  / ONIONA7 11-19 ONIONP7 20-28
  / ONIONA8 11-19 ONIONP8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 542 - Soya */
  / SOYAA6 11-19  SOYAP6 20-28
  / SOYAA7 11-19  SOYAP7 20-28
  / SOYAA8 11-19  SOYAP8 20-28
  / /* 1991 not available as yet */

/*  Record ID # 580 - 33 Crop total (501-528, 531-533,535, 538 ) */
  / CR33A6 11-19  CR33P6 20-28
  / CR33A7 11-19  CR33P7 20-28
  / CR33A8 11-19  CR33P8 20-28
  / /* 1991 not available as yet */
/*  Record ID # 58 - 19 crop total (501-505, 507-510, 512-519, 521, 524) */
  / CR19A6 11-19  CR19P6 20-28     
  / CR19A7 11-19  CR19P7 20-28     
  / CR19A8 11-19  CR19P8 20-28     
  / /* 1991 not available as yet */
/*  Record ID # 582 - 37 crop total ( 501-528, 530-538 ) */
  / CR37A6 11-19  CR37P6 20-28
  / CR37A7 11-19  CR37P7 20-28
  / CR37A8 11-19  CR37P8 20-28
  / /* 1991 not available as yet */

/*  Record ID # 600 - Area (square kilometers) */
  / AREA6 11-19   AREAr6 20-28    
  / AREA7 11-19   AREAr7 20-28    
  / AREA8 11-19   AREAr8 20-28    
  / AREA9 11-19   AREAr9 20-28    

/*  Record ID # 601 - Houses */
  / HOUSE6 11-19  HOUSEr6 20-28    
  / HOUSE7 11-19  HOUSEr7 20-28    
  / HOUSE8 11-19  HOUSEr8 20-28    
  / HOUSE9 11-19  HOUSEr9 20-28    

/*  Record ID # 602 - Households */
   / HH6 11-19    HH6R 20-28
   / HH7 11-19    HH7R 20-28
   / HH8 11-19    HH8R 20-28
   / HH9 11-19    HH9R 20-28

  ;

array M {*} _NUMERIC_;
do I=1 to dim (M);
   if M (I) < 0 then M (I)=.;
end;
drop i;

/* temporary fix on 1991 TWORK vars */
   TWORK9 = WORK9 + MARG9;
   TWORKr9 = WORKr9 + MARGr9;
   TWORKm9 = WORKm9 + MARGm9;
   TWORKrm9 = WORKrm9 + MARGrm9;

if STATEID = '01'  then  SLABEL = 'Andaman and Nicobar';
if STATEID = '02'  then  SLABEL = 'Andhra Pradesh';
if STATEID = '03'  then  SLABEL = 'Arunachal Pradesh';
if STATEID = '04'  then  SLABEL = 'Assam';
if STATEID = '05'  then  SLABEL = 'Bihar';
if STATEID = '06'  then  SLABEL = 'Chandigarh';
if STATEID = '07'  then  SLABEL = 'Dadra and Nagar Haveli';
if STATEID = '08'  then  SLABEL = 'Delhi';
if STATEID = '09'  then  SLABEL = 'Goa, Daman and Diu';
if STATEID = '10'  then  SLABEL = 'Gujarat';
if STATEID = '11'  then  SLABEL = 'Haryana';
if STATEID = '12'  then  SLABEL = 'Himachal Pradesh';
if STATEID = '13'  then  SLABEL = 'Jammu and Kashmir';
if STATEID = '14'  then  SLABEL = 'Kerala';
if STATEID = '15'  then  SLABEL = 'Lakshadweep';
if STATEID = '16'  then  SLABEL = 'Madhya Pradesh';
if STATEID = '17'  then  SLABEL = 'Maharashtra';
if STATEID = '18'  then  SLABEL = 'Manipur';
if STATEID = '19'  then  SLABEL = 'Meghalaya';
if STATEID = '20'  then  SLABEL = 'Karnataka';
if STATEID = '21'  then  SLABEL = 'Nagaland';
if STATEID = '22'  then  SLABEL = 'Orissa';
if STATEID = '23'  then  SLABEL = 'Pondicherry';
if STATEID = '24'  then  SLABEL = 'Punjab';
if STATEID = '25'  then  SLABEL = 'Rajasthan';
if STATEID = '26'  then  SLABEL = 'Tamil Nadu';
if STATEID = '27'  then  SLABEL = 'Tripura';
if STATEID = '28'  then  SLABEL = 'Uttar Pradesh';
if STATEID = '29'  then  SLABEL = 'West Bengal';
if STATEID = '30'  then  SLABEL = 'Sikkim';
if STATEID = '31'  then  SLABEL = 'Mizoram';
if STATEID = '32'  then  SLABEL = 'NE Hill states';
if STATEID = '33'  then  SLABEL = 'others';

select (STATEID);
   when ('01', '03', '04', '05', '18', '19', '21', '22', '27', '29', '30', '31')
        REGION4 = 'E';
   when ('02', '09', '14', '15', '20', '23', '26')
        REGION4 = 'S';
   when ('06', '08', '11', '12', '13', '16', '24', '28')
        REGION4 = 'N';
   when ('07', '10', '17', '25')
        REGION4 = 'W';
   otherwise REGION4 = 'X';
end;

select (STATEID);
   when ('01', '03', '04', '05', '18', '19', '21', '22', '27', '29', '30', '31')
        REGION5 = 'E';
   when ('02', '14', '15', '20', '23', '26')
        REGION5 = 'S';
   when ('06', '08', '11', '12', '13', '24', '25')
        REGION5 = 'N';
   when ('16', '28')
        REGION5 = 'C';
   when ('07', '09', '10', '17')
        REGION5 = 'W';
   otherwise REGION5 = 'X';
end;

SLABEL2 = SLABEL;
if STATEID='03' or STATEID='18' or STATEID='19' or STATEID='21' or
              STATEID='27' or STATEID='31' then SLABEL2='NE Hill States';
if STATEID ='01' or STATEID='06' or STATEID='07' or STATEID='08' or
              STATEID='15' or STATEID='23' or STATEID='30' then SLABEL2='others';
if STATEID='33' then SLABEL2='  ';


LABEL
      STATEID         = 'State ID'
      SLABEL2         = 'State ID grouped'
      DISTID          = 'District ID'
      RECORD             = 'Record ID'
      ;

/* Population */

label   POP6 = 'Total population - 1961';
label   POP7 = 'Total population - 1971';
label   POP8 = 'Total population - 1981';
label   POP9 = 'Total population - 1991';

label  RURAL6  = 'Rural pop 1961';
label  RURAL7  = 'Rural pop 1971';
label  RURAL8  = 'Rural pop 1981';
label  RURAL9  = 'Rural pop 1991';

URBAN6   = POP6 - RURAL6 ;
URBAN7   = POP7 - RURAL7 ;
URBAN8   = POP8 - RURAL8 ;
URBAN9   = POP9 - RURAL9 ;
label  URBAN6  = 'Urban pop 1961';
label  URBAN7  = 'Urban pop 1971';
label  URBAN8  = 'Urban pop 1981';
label  URBAN9  = 'Urban pop 1991';

URBANP6   = URBAN6 / POP6 ;
URBANP7   = URBAN7 / POP7 ;
URBANP8   = URBAN8 / POP8 ;
URBANP9   = URBAN9 / POP9 ;
label  URBANP6  = '% urban pop 1961';
label  URBANP7  = '% urban pop 1971';
label  URBANP8  = '% urban pop 1981';
label  URBANP9  = '% urban pop 1991';



/* Labor Force Variables*/

label WORK6 = 'Main Workers - 1961, estimated';
label WORK7 = 'Main Workers - 1971';
label WORK8 = 'Main Workers - 1981';
label WORK9 = 'Main Workers - 1991';

label FARM6 =' Farmers - 1961, estimated';
label FARM7 =' Farmers - 1971';
label FARM8 = 'Farmers - 1981';
label FARM9 = 'Farmers - 1991';

label CULT6 = 'Cultivators - 1961, estimated';
label CULT7 = 'Cultivators - 1971';
label CULT8 = 'Cultivators - 1981';
label CULT9 = 'Cultivators - 1991';

label ALAB6 = ' Agri. Laborers -1961, estimated';
label ALAB7 = ' Agri. Laborers -1971';
label ALAB8 = ' Agri. laborers - 1981';
label ALAB9 = ' Agri. laborers - 1991';

label HIND6 = 'Household industry - 1961, estimated';
label HIND7 = 'Household industry - 1971';
label HIND8 = 'Household Industry - 1981';
label HIND9 = 'Household Industry - 1991';

label OTHR6 = 'Other sectors - 1961, estimated';
label OTHR7 = 'Other sectors - 1971';
label OTHR8 = 'Other sectors - 1981';
label OTHR9 = 'Other sectors - 1991';

label LIVE6 = 'Livestock, orchards, etc - 1961, estimated';
label LIVE7 = 'Livestock, orchards, etc - 1971';
label LIVE8 = 'Livestock, orchards, etc - 1981';
label LIVE9 = 'Livestock, orchards, etc - 1991';

label MINE6 = 'Mining - 1961, estimated';
label MINE7 = 'Mining - 1971';
label MINE8 = 'Mining - 1981';
label MINE9 = 'Mining - 1991';

label MANF6 = 'Manufacturing - 1961, estimated';
label MANF7 = 'Manufacturing - 1971';
label MANF8 = 'Manufacturing - 1981';
label MANF9 = 'Manufacturing - 1991';

label CONS6 = 'Construction - 1961, estimated';
label CONS7 = 'Construction - 1971';
label CONS8 = 'Construction - 1981';
label CONS9 = 'Construction - 1991';

label COMM6 = 'Commerce - 1961, estimated';
label COMM7 = 'Commerce - 1971';
label COMM8 = 'Commerce - 1981';
label COMM9 = 'Commerce - 1991';

label TRAN6 = 'Transport and communication - 1961, estimated';
label TRAN7 = 'Transport and communication - 1971';
label TRAN8 = 'Transport and communication - 1981';
label TRAN9 = 'Transport and communication - 1991';

label SERV6 = 'Other Services - 1961, estimated';
label SERV7 = 'Other Services - 1971';
label SERV8 = 'Other Services - 1981';
label SERV9 = 'Other Services - 1991';

label MARG8 = 'Marginal workers - 1961, estimated';
label MARG8 = 'Marginal workers - 1971, estimated';
label MARG8 = 'Marginal workers - 1981';
label MARG9 = 'Marginal workers - 1991';

label NOWK6 = 'Non-workers not even marginal-1961';
label NOWK7 = 'Non-workers not even marginal-1971, estimated';
label NOWK8 = 'Non-workers not even marginal-1981';
label NOWK9 = 'Non-workers not even marginal-1991';

label TWORK6 = 'Marginal + main workers-1961, estimated';
label TWORK7 = 'Marginal + main workers-1971, estimated';
label TWORK8 = 'Marginal + main workers-1981';

label TFARM6 = 'Farm wrkrs- marg+main - 1961';
label TFARM7 = 'Farm wrkrs- marg+main - 1971, estimated';
label TFARM8 = 'Farm wrkrs- marg+main - 1981';

label TCULT6 = 'Cultivators - marg+main - 1961';
label TCULT7 = 'Cultivators - marg+main - 1971, estimated';
label TCULT8 = 'Cultivators - marg+main - 1981';

label TALAB6 = 'Agri.labr -main+marg - 1961';
label TALAB7 = 'Agri.labr -main+marg - 1971, estimated';
label TALAB8 = 'Agri.labr -main+marg - 1981';

label THIND6 = 'Household ind- marg+main - 1961';
label THIND7 = 'Household ind- marg+main - 1971, estimated';
label THIND8 = 'Household ind- marg+main - 1981';

label TOTH6 = 'Other sector- main+marg - 1961';
label TOTH7 = 'Other sector- main+marg - 1971, estimated';
label TOTH8 = 'Other sector- main+marg - 1981';

label TLIVE6 = 'Livestock,etc-main+marg - 1961';
label TLIVE7 = 'Livestock,etc-main+marg - 1971, estimated';
label TLIVE8 = 'Livestock,etc-main+marg - 1981';

label TMINE6 = 'Mining - main+marg- 1961';
label TMINE7 = 'Mining - main+marg- 1971, estimated';
label TMINE8 = 'Mining - main+marg- 1981';

label TMANF6 = 'Manufacturing- main+marg- 1961';
label TMANF7 = 'Manufacturing- main+marg- 1971, estimated';
label TMANF8 = 'Manufacturing- main+marg- 1981';

label TCONS6 = 'Construction- main+marg- 1961';
label TCONS7 = 'Construction- main+marg- 1971, estimated';
label TCONS8 = 'Construction- main+marg- 1981';

label TCOMM6 = 'Commerce- main+marg- 1961';
label TCOMM7 = 'Commerce- main+marg- 1971, estimated';
label TCOMM8 = 'Commerce- main+marg- 1981';

label TTRAN6 = 'Transport+commun- main+marg-1961';
label TTRAN7 = 'Transport+commun- main+marg-1971, estimated';
label TTRAN8 = 'Transport+commun- main+marg-1981';

label TSERV6 = 'Other services-main+marg- 1961';
label TSERV7 = 'Other services-main+marg- 1971, estimated';
label TSERV8 = 'Other services-main+marg- 1981';

label NMAIN6 = 'Not main workers -1961, estimated';
label NMAIN7 = 'Not main workers -1971';
label NMAIN8 = 'Not main workers -1981';


/*     Sex                    */

label  MALE6  = 'Total men 1961';
label  MALE7  = 'Total men 1971';
label  MALE8  = 'Total men 1981';
label  MALE9  = 'Total men 1991';

label  RMALE6  = 'Rural men 1961';
label  RMALE7  = 'Rural men 1971';
label  RMALE8  = 'Rural men 1981';
label  RMALE9  = 'Rural men 1991';

FEM6       = POP6    - MALE6 ;
FEM7       = POP7    - MALE7 ;
FEM8       = POP8    - MALE8 ;
FEM9       = POP9    - MALE9 ;
label  FEM6  = 'Total women 1961';
label  FEM7  = 'Total women 1971';
label  FEM8  = 'Total women 1981';
label  FEM9  = 'Total women 1991';

RFEM6       = RURAL6    - RMALE6 ;
RFEM7       = RURAL7    - RMALE7 ;
RFEM8       = RURAL8    - RMALE8 ;
RFEM9       = RURAL9    - RMALE9 ;
label  RFEM6  = 'Rural women 1961';
label  RFEM7  = 'Rural women 1971';
label  RFEM8  = 'Rural women 1981';
label  RFEM9  = 'Rural women 1991';


/* Literacy*/

label LIT6 = 'Literates - ages5+ - 1961'; 
label LIT7 = 'Literates - ages5+ - 1971'; 
label LIT8 = 'Literates - ages5+ - 1981'; 
label LIT9 = 'Literates - ages5+ - 1991'; 

label LIT056 = 'Literates: ages 5-9 - 1961';
label LIT057 = 'Literates: ages 5-9 - 1971';
label LIT058 = 'Literates: ages 5-9 - 1981';
label LIT079 = 'Literates: ages 5-9 - 1991';

label LIT106 = 'Literates: ages 10-14 - 1961';
label LIT107 = 'Literates: ages 10-14 - 1971';
label LIT108 = 'Literates: ages 10-14 - 1981';
label LIT109 = 'Literates: ages 10-14 - 1991';

label LIT156 = 'Literates: ages 15-19 - 1961';
label LIT157 = 'Literates: ages 15-19 - 1971';
label LIT158 = 'Literates: ages 15-19 - 1981';
label LIT159 = 'Literates: ages 15-19 - 1991';

label LIT206 = 'Literates: ages 20-24 - 1961';
label LIT207 = 'Literates: ages 20-24 - 1971';
label LIT208 = 'Literates: ages 20-24 - 1981';
label LIT209 = 'Literates: ages 20-24 - 1991';

label LIT256 = 'Literates: ages 25-34 - 1961';
label LIT257 = 'Literates: ages 25-34 - 1971';
label LIT258 = 'Literates: ages 25-34 - 1981';
label LIT259 = 'Literates: ages 25-34 - 1991';

label LIT356 = 'Literates: ages 35+ - 1961';
label LIT357 = 'Literates: ages 35+ - 1971';
label LIT358 = 'Literates: ages 35+ - 1981';
label LIT359 = 'Literates: ages 35+ - 1991';




/*  Education Variables*/

label PRIM6 = 'Primary school or higher- 1961';
label PRIM7 = 'Primary school or higher- 1971';
label PRIM8 = 'Primary school or higher- 1981';
label PRIM9 = 'Primary school or higher- 1991';

label MID7 = ' Middle school or higher- 1971';
label MID8 = ' Middle school or higher- 1981';
label MID9 = ' Middle school or higher- 1991';

label MATR6 = 'Matriculates or higher- 1961';
label MATr7 = 'Matriculates or higher- 1971';
label MATr8 = 'Matriculates or higher- 1981';
label MATr9 = 'Matriculates or higher- 1991';

label NTDIP7 = 'Non-technical diploma or higher- 1971';
label NTDIP8 = 'Non-technical diploma or higher- 1981';
label NTDIP9 = 'Non-technical diploma or higher- 1991';

label DIP7 = 'Diploma or higher- 1971';
label DIP8 = 'Diploma or higher- 1981';
label DIP9 = 'Diploma or higher- 1991';

label GRAD7 = 'Graduates or higher- 1971';
label GRAD8 = 'Graduates or higher- 1981';
label GRAD9 = 'Graduates or higher- 1991';



/* Age Variables */

label POP006 = ' Ages 0-4 - 1961';
label POP007 = ' Ages 0-4 - 1971';
label POP008 = ' Ages 0-4 - 1981';
label POP009 = ' Ages 0-4 - 1991';

label POP056 = 'Ages 5-9 - 1961';
label POP057 = 'Ages 5-9 - 1971';
label POP058 = 'Ages 5-9 - 1981';
label POP059 = 'Ages 5-9 - 1991';

label POP106 = 'Ages 10-14 - 1961';
label POP107 = 'Ages 10-14 - 1971';
label POP108 = 'Ages 10-14 - 1981';
label POP109 = 'Ages 10-14 - 1991';

label POP156 = 'Ages 15-19 - 1961';
label POP157 = 'Ages 15-19 - 1971';
label POP158 = 'Ages 15-19 - 1981';
label POP159 = 'Ages 15-19 - 1991';

label POP206 = 'Ages 20-24 - 1961';
label POP207 = 'Ages 20-24 - 1971';
label POP208 = 'Ages 20-24 - 1981';
label POP209 = 'Ages 20-24 - 1991';

label POP256 = 'Ages 25-34 - 1961';
label POP257 = 'Ages 25-34 - 1971';
label POP258 = 'Ages 25-34 - 1981';
label POP259 = 'Ages 25-34 - 1991';

label POP356 = 'Ages 35-39 - 1961';
label POP357 = 'Ages 35-39 - 1971';
label POP358 = 'Ages 35-59 - 1981';
label POP359 = 'Ages 35-59 - 1991';



/* Scheduled Caste and Tribe */

label SC6 = 'Total scheduled caste pop - 1961';
label SC7 = 'Total scheduled caste pop - 1971';
label SC8 = 'Total scheduled caste pop - 1981';
label SC9 = 'Total scheduled caste pop - 1991';

label ST6 = 'Total scheduled tribe pop - 1961';
label ST7 = 'Total scheduled tribe pop - 1971';
label ST8 = 'Total scheduled tribe pop - 1981';
label ST9 = 'Total scheduled tribe pop - 1991';




/* Migrants */

label MIG6 = 'Total migrants - 1961';
label MIG7 = 'Total migrants - 1971';
label MIG8 = 'Total migrants - 1981';
label MIG9 = 'Total migrants - 1991';

label MIGDI6 = 'Migrants from another district-1961';
label MIGDI8 = 'Migrants from another district-1981';
label MIGDI9 = 'Migrants from another district-1991';

label MIGST6 = 'Migrants from another state-1961';
label MIGST8 = 'Migrants from another state-1981';
label MIGST9 = 'Migrants from another state-1991';

label MIGFU6 = 'Migrants from urban India-1961';
label MIGFU8 = 'Migrants from urban India-1981';
label MIGFU9 = 'Migrants from urban India-1991';

label MIGFR6 = 'Migrants from rural India-1961';
label MIGFR8 = 'Migrants from rural India-1981';
label MIGFR9 = 'Migrants from rural India-1991';

label MIGRD6 = 'Migrants fr rural part of another dist-1961';
label MIGRD8 = 'Migrants fr rural part of another dist-1981';
label MIGRD9 = 'Migrants fr rural part of another dist-1991';

label MIGRS6 = 'Migrants fr rural part of another state-1961';
label MIGRS8 = 'Migrants fr rural part of another state-1981';
label MIGRS9 = 'Migrants fr rural part of another state-1991';

label MIGAS6 = 'Migrants fr Asian country (+USSR)-1961';
label MIGAS8 = 'Migrants fr Asian country (+USSR)-1981';
label MIGAS9 = 'Migrants fr Asian country (+USSR)-1991';

label MIGEU6 = 'Migrants fr Europe -1961';
label MIGEU8 = 'Migrants fr Europe -1981';
label MIGEU9 = 'Migrants fr Europe -1991';

label MIGAF6 = 'Migrants fr Africa- 1961';
label MIGAF8 = 'Migrants fr Africa- 1981';
label MIGAF9 = 'Migrants fr Africa- 1991';

label MIGAM6 = 'Migrants fr Americas- 1961';
label MIGAM8 = 'Migrants fr Americas- 1981';
label MIGAM9 = 'Migrants fr Americas- 1991';

label MIGOC6 = 'Migrants fr Oceania- 1961';
label MIGOC8 = 'Migrants fr Oceania- 1981';
label MIGOC9 = 'Migrants fr Oceania- 1991';


/* Marital status by age variables */


label NVM158 = 'Never married: 15-19 - 1981';
label NVM159 = 'Never married: 15-19 - 1991';


/*  Agricultural Variables */

label RICEA6 = 'Rice area, 1000 ha-1961';
label RICEA7 = 'Rice area, 1000 ha-1971';
label RICEA8 = 'Rice area, 1000 ha-1981';
label JOWAR6 = 'Jowar area, 1000 ha-1961';
label JOWAR7 = 'Jowar area, 1000 ha-1971';
label JOWAR8 = 'Jowar area, 1000 ha-1981';
label BAJRAA6 = 'Bajra area, 1000 ha-1961';
label BAJRAA7 = 'Bajra area, 1000 ha-1971';
label BAJRAA8 = 'Bajra area, 1000 ha-1981';
label MAIZA6 = 'Maize area, 1000 ha-1961';
label MAIZA7 = 'Maize area, 1000 ha-1971';
label MAIZA8 = 'Maize area, 1000 ha-1981';
label RAGIA6 = 'Ragi area, 1000 ha-1961';
label RAGIA7 = 'Ragi area, 1000 ha-1971';
label RAGIA8 = 'Ragi area, 1000 ha-1981';
label MILLA6 = 'Millet area, 1000 ha-1961';
label MILLA7 = 'Millet area, 1000 ha-1971';
label MILLA8 = 'Millet area, 1000 ha-1981';
label WHEATA6 = 'Wheat area, 1000 ha-1961';
label WHEATA7 = 'Wheat area, 1000 ha-1971';
label WHEATA8 = 'Wheat area, 1000 ha-1981';
label BARLYA6 = 'Barley area, 1000 ha-1961';
label BARLYA7 = 'Barley area, 1000 ha-1971';
label BARLYA8 = 'Barley area, 1000 ha-1981';
label GRAMA6 = 'Gram area, 1000 ha-1961';
label GRAMA7 = 'Gram area, 1000 ha-1971';
label GRAMA8 = 'Gram area, 1000 ha-1981';
label TURA6 = 'Tur area, 1000 ha-1961';
label TURA7 = 'Tur area, 1000 ha-1971';
label TURA8 = 'Tur area, 1000 ha-1981';
label OPULSA6 = 'Other pulses area, 1000 ha-1961';
label OPULSA7 = 'Other pulses area, 1000 ha-1971';
label OPULSA8 = 'Other pulses area, 1000 ha-1981';
label GNUTA6 = 'Groundnut area, 1000 ha-1961';
label GNUTA7 = 'Groundnut area, 1000 ha-1971';
label GNUTA8 = 'Groundnut area, 1000 ha-1981';
label CSEEDA6 = 'Castor seed area, 1000 ha- 1961';
label CSEEDA7 = 'Castor seed area, 1000 ha- 1971';
label CSEEDA8 = 'Castor seed area, 1000 ha- 1981';
label SESMA6 = 'Sesmum area, 1000 ha-1961';
label SESMA7 = 'Sesmum area, 1000 ha-1971';
label SESMA8 = 'Sesmum area, 1000 ha-1981';
label RSEEDA6 = 'Rapeseed area, 1000 ha-1961';
label RSEEDA7 = 'Rapeseed area, 1000 ha-1971';
label RSEEDA8 = 'Rapeseed area, 1000 ha-1981';
label LSEEDA6 = 'Linseed area, 1000 ha-1961';
label LSEEDA7 = 'Linseed area, 1000 ha-1971';
label LSEEDA8 = 'Linseed area, 1000 ha-1981';
label COTTA6 = 'Cotton area, 1000 ha-1961';
label COTTA7 = 'Cotton area, 1000 ha-1971';
label COTTA8 = 'Cotton area, 1000 ha-1981';
label JUTEA6 = 'Jute area, 1000 ha-1961';
label JUTEA7 = 'Jute area, 1000 ha-1971';
label JUTEA8 = 'Jute area, 1000 ha-1981';
label MESTAA6 = 'Mesta area, 1000 ha-1961';
label MESTAA7 = 'Mesta area, 1000 ha-1971';
label MESTAA8 = 'Mesta area, 1000 ha-1981';
label POTA6 = 'Potato area, 1000 ha-1961';
label POTA7 = 'Potato area, 1000 ha-1971';
label POTA8 = 'Potato area, 1000 ha-1981';
label SUGAR6 = 'Sugar area, 1000 ha-1961';
label SUGAR7 = 'Sugar area, 1000 ha-1971';
label SUGAR8 = 'Sugar area, 1000 ha-1981';
label CHILIA6 = 'Chili area, 1000 ha-1961';
label CHILIA7 = 'Chili area, 1000 ha-1971';
label CHILIA8 = 'Chili area, 1000 ha-1981';
label GINGA6 = 'Ginger area, 1000 ha-1961';
label GINGA7 = 'Ginger area, 1000 ha-1971';
label GINGA8 = 'Ginger area, 1000 ha-1981';
label TOBACA6 = 'Tobacco area, 1000 ha-1961';
label TOBACA7 = 'Tobacco area, 1000 ha-1971';
label TOBACA8 = 'Tobacco area, 1000 ha-1981';
label BKPEPA6 = 'Black pepper area, 1000 ha-1961';
label BKPEPA7 = 'Black pepper area, 1000 ha-1971';
label BKPEPA8 = 'Black pepper area, 1000 ha-1981';
label CONUTA6 = 'Coconut area, 1000 ha-1961';
label CONUTA7 = 'Coconut area, 1000 ha-1971';
label CONUTA8 = 'Coconut area, 1000 ha-1981';
label TURMA6 = 'Turmeric area, 1000 ha-1961';
label TURMA7 = 'Turmeric area, 1000 ha-1971';
label TURMA8 = 'Turmeric area, 1000 ha-1981';
label HEMPA6 = 'Sannhemp area, 1000 ha-1961';
label HEMPA7 = 'Sannhemp area, 1000 ha-1971';
label HEMPA8 = 'Sannhemp area, 1000 ha-1981';
label GSEEDA6 = 'Guarseed area, 1000 ha-1961';
label GSEEDA7 = 'Guarseed area, 1000 ha-1971';
label GSEEDA8 = 'Guarseed area, 1000 ha-1981';
label TAPIA6 = 'Tapioca area, 1000 ha- 1961';
label TAPIA7 = 'Tapioca area, 1000 ha- 1971';
label TAPIA8 = 'Tapioca area, 1000 ha- 1981';
label ANUTA6 = 'Areca nut area, 1000 ha-1961';
label ANUTA7 = 'Areca nut area, 1000 ha-1971';
label ANUTA8 = 'Areca nut area, 1000 ha-1981';
label BANA6 = 'Banana area, 1000 ha- 1961';
label BANA7 = 'Banana area, 1000 ha- 1971';
label BANA8 = 'Banana area, 1000 ha- 1981';
label CORIA6 = 'Coriander area, 1000 ha-1961';
label CORIA7 = 'Coriander area, 1000 ha-1971';
label CORIA8 = 'Coriander area, 1000 ha-1981';
label CARDA6 = 'Cardamom area, 1000 ha- 1961';
label CARDA7 = 'Cardamom area, 1000 ha- 1971';
label CARDA8 = 'Cardamom area, 1000 ha- 1981';
label SAFFA6 = 'Safflower area, 1000 ha- 1961';
label SAFFA7 = 'Safflower area, 1000 ha- 1971';
label SAFFA8 = 'Safflower area, 1000 ha- 1981';
label NSEEDA6 = 'Niger seed area, 1000 ha- 1961';
label NSEEDA7 = 'Niger seed area, 1000 ha- 1971';
label NSEEDA8 = 'Niger seed area, 1000 ha- 1981';
label SWPOTA6 = 'Sweet Potato area, 1000 ha- 1961';
label SWPOTA7 = 'Sweet Potato area, 1000 ha- 1971';
label SWPOTA8 = 'Sweet Potato area, 1000 ha- 1981';
label GARLA6 = 'Garlic area, 1000 ha- 1961';
label GARLA7 = 'Garlic area, 1000 ha- 1971';
label GARLA8 = 'Garlic area, 1000 ha- 1981';
label SUNFA6 = 'Sunflower area, 1000 ha- 1961';
label SUNFA7 = 'Sunflower area, 1000 ha- 1971';
label SUNFA8 = 'Sunflower area, 1000 ha- 1981';
label ONIONA6 = 'Onion area, 1000 ha -1961';
label ONIONA7 = 'Onion area, 1000 ha -1971';
label ONIONA8 = 'Onion area, 1000 ha -1981';
label SOYAA6 = 'Soya area, 1000 ha-1961';
label SOYAA7 = 'Soya area, 1000 ha-1971';
label SOYAA8 = 'Soya area, 1000 ha-1981';
label CR33A6 = '33 crops total area, 1000 ha - 1961';
label CR33A7 = '33 crops total area, 1000 ha - 1971';
label CR33A8 = '33 crops total area, 1000 ha - 1981';

label CR19A6 = '19 crop total area, 1000 ha - 1961';
label CR19A7 = '19 crop total area, 1000 ha - 1971';
label CR19A8 = '19 crop total area, 1000 ha - 1981';

label CR37A6 = '37 crops area, 1000 ha -1961';
label CR37A7 = '37 crops area, 1000 ha -1971';
label CR37A8 = '37 crops area, 1000 ha -1981';


/* Area */

label AREA6 = 'Total area in sq. kms. 1961';
label AREA7 = 'Total area in sq. kms. 1971';
label AREA8 = 'Total area in sq. kms. 1981';
label AREA9 = 'Total area in sq. kms. 1991';

/* Houses */

label HOUSE6 = 'Total houses 1961';
label HOUSE7 = 'Total houses 1971';
label HOUSE8 = 'Total houses 1981';
label HOUSE9 = 'Total houses 1991';

label HH6 = 'Total household 1961';
label HH7 = 'Total household 1971';
label HH8 = 'Total household 1981';
label HH9 = 'Total household 1991';


proc contents;
proc means n nmiss mean std min max ;
proc print uniform;
    var stateid distid dlabel record pop6 rural6 pop7 rural7 pop8 rural8 pop9 rural9;
proc univariate plot;
    id DLABEL;
    var pop6 pop7 pop8 pop9;
proc plot;
    plot pop7 * pop6 = SLABEL /hpos=80;
    plot pop8 * pop7 = SLABEL /hpos=80;
    plot pop9 * pop8 = SLABEL /hpos=80;

data check;
	set sasdata.panel91;

chkpop6 = pop6  - (work6 + nowk6  + marg6);
chkpop7 = pop7  - (work7 + nowk7  + marg7);
chkpop8 = pop8  - (work8 + nowk8  + marg8);
chkpop9 = pop9  - (work9 + nowk9  + marg9);

chkrm6 = rmale6  - (workrm6 + nowkrm6  + margrm6);
chkrm7 = rmale7  - (workrm7 + nowkrm7  + margrm7);
chkrm8 = rmale8  - (workrm8 + nowkrm8  + margrm8);
chkrm9 = rmale9  - (workrm9 + nowkrm9  + margrm9);

chkwork6 = work6- (cult6+alab6+hind6+live6+mine6+manf6+cons6+comm6+tran6+serv6);
chkwork7 = work7- (cult7+alab7+hind7+live7+mine7+manf7+cons7+comm7+tran7+serv7);
chkwork8 = work8- (cult8+alab8+hind8+live8+mine8+manf8+cons8+comm8+tran8+serv8);
chkwork9 = work9- (cult9+alab9+hind9+live9+mine9+manf9+cons9+comm9+tran9+serv9);

chkfarm6 = farm6 - cult6 - alab6;
chkfarm7 = farm7 - cult7 - alab7;
chkfarm8 = farm8 - cult8 - alab8;
chkfarm9 = farm9 - cult9 - alab9;

chkothr6 = othr6 - (live6 + mine6 + manf6 + cons6 + comm6 + tran6 + serv6);
chkothr7 = othr7 - (live7 + mine7 + manf7 + cons7 + comm7 + tran7 + serv7);
chkothr8 = othr8 - (live8 + mine8 + manf8 + cons8 + comm8 + tran8 + serv8);
chkothr9 = othr9 - (live9 + mine9 + manf9 + cons9 + comm9 + tran9 + serv9);

chklit6 = lit6  - (lit056+lit106+lit156+lit206+lit256+lit356);
chklit7 = lit7  - (lit057+lit107+lit157+lit207+lit257+lit357);
chklit8 = lit8  - (lit058+lit108+lit158+lit208+lit258+lit358);
chklit9 = lit9  - (lit079+lit109+lit159+lit209+lit259+lit359);

chkage6= pop6 - (pop006+pop056+pop106+pop156+pop206+pop256+pop356) ;
chkage7= pop7 - (pop007+pop057+pop107+pop157+pop207+pop257+pop357) ;
chkage8= pop8 - (pop008+pop058+pop108+pop158+pop208+pop258+pop358) ;
chkage9= pop9 - (pop009+pop059+pop109+pop159+pop209+pop259+pop359) ;
                

title2 "   check that totals add up";
proc means n nmiss mean sum std min max ;
	var chkpop6 -- chkage9 ;
proc print uniform;
    var stateid distid dlabel chkpop6--chkwork9 chklit6 -- chklit9 ;

