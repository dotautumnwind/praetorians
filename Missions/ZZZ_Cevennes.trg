Var
{
  handle hEstrategia;
  handle hCiv;
  
  handle hEstrategiaTraidores;
  handle hCivTraidores;
    
  // Objetivos de defensa de las montañas
  handle hObjMont1;
  handle hObjMont2;
  handle hObjMont3;
  handle hObjMont4;
  handle hObjMont5;
  handle hObjMont6;
  handle hObjMont7;
  handle hObjMont8;
  handle hObjMont9;
  handle hObjMont10;
  
  handle hG_CAZADORES;
  handle hG_2;

  // Objetivos de defensa de la zona de los pueblos
  handle hObjDef1;
  handle hObjDef2;
  handle hObjDef3;
  handle hObjDef4;
  
  // Objetivos de gestion de pueblos, antes y despues de activarlos
  handle hObjPueblo1_Antes;
  handle hObjPueblo1_Despues;  
  handle hObjPueblo2_Antes;
  handle hObjPueblo2_Despues;  
  handle hObjPueblo3_Antes;
  handle hObjPueblo3_Despues;  

  // Objetivo de caza y captura para las tropas que hayan quedado vivas
  handle hObjCaza;
  
  
  bool bToledorixMuerto           = FALSE;
  bool bToledorixVivo             = FALSE;
  
  bool bNoRepeticion              = FALSE; // para que no se repitan los mensajes de reclutamiento cada 2 por 3
  
  // niveles de dificultad
  float fNivelDificultad          = 0;
  
  float fDelayPueblosAliados;
  float fDelayPueblosEnemigos;
  float fNumeroCatapI;
  float fNumeroCatapII;
  
  // objetivos
  handle hObjNeutralizarIlanna;
  handle hObjNeutralizarLucan;
  handle hObjNeutralizarUrsoli;
  handle hObjLabienoVivo;
  handle hObjCrastinoVivo;

  bool ursoliNeutralizado         = FALSE;
  bool lucanNeutralizado          = FALSE;
  bool ilannaNeutralizado         = FALSE;
  
  bool bGobannitioUp              = FALSE;
  bool bAlisUp                    = FALSE;
  
  // briefings  
  float fPuntoSincronia           = 0;
  handle hPuntoSincronia          = NULL;
  bool bBriefingEnded             = FALSE;
  
}

#include "FunScript.h"


//////////////////////////////////////////////////////////////////////////////
// MAIN
//////////////////////////////////////////////////////////////////////////////

Trigger "Main" [ Activo ]
(
  TRUE
)
Do
{
  
  // tips de la misión
  IntroducirTip("LTEXT_TIP0_TEXTO", "LTEXT_TIP0_TITULO");
  IntroducirTip("LTEXT_TIP1_TEXTO", "LTEXT_TIP1_TITULO");
  IntroducirTip("LTEXT_TIP2_TEXTO", "LTEXT_TIP2_TITULO");
  IntroducirTip("LTEXT_TIP3_TEXTO", "LTEXT_TIP3_TITULO");
  IntroducirTip("LTEXT_TIP4_TEXTO", "LTEXT_TIP4_TITULO");
  IntroducirTip("LTEXT_TIP5_TEXTO", "LTEXT_TIP5_TITULO");
  IntroducirTip("LTEXT_TIP6_TEXTO", "LTEXT_TIP6_TITULO");
  IntroducirTip("LTEXT_TIP7_TEXTO", "LTEXT_TIP7_TITULO");
  IntroducirTip("LTEXT_TIP8_TEXTO", "LTEXT_TIP8_TITULO");
  IntroducirTip("LTEXT_TIP9_TEXTO", "LTEXT_TIP9_TITULO");
  IntroducirTip("LTEXT_TIP10_TEXTO", "LTEXT_TIP10_TITULO");
  
  // siguiente...
  ActivarTrigger("Briefing");
  DestruirTrigger("Main");
}


Trigger "Main2" [Activo]
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{
 	//OBJETIVOS
  hObjNeutralizarIlanna = CrearHandle("Bool");
  hObjNeutralizarLucan = CrearHandle("Bool");
  hObjNeutralizarUrsoli = CrearHandle("Bool");
  hObjLabienoVivo = CrearHandle("Bool");
  hObjCrastinoVivo = CrearHandle("Bool");
  
  AgregarObjetivoMision(hObjNeutralizarIlanna, "LTEXT_MISION15_OBJETIVO_00_TXT");
  AgregarObjetivoMision(hObjNeutralizarUrsoli, "LTEXT_MISION15_OBJETIVO_01_TXT");
  AgregarObjetivoMision(hObjLabienoVivo, "LTEXT_MISION15_OBJETIVO_03_TXT");

  //restricciones de maquinas da asalto
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_BARBARA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_ROMANA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_EGIPCIA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_EGIPCIA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_BARBARA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_ROMANA", "");

  // Restricciones de la mision
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GLADIADOR", "");
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "PIQUERO_ELITE", "");
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "HONDERO", "");
  
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_CAZADOR", "CESAR");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_GERMANA", "CESAR");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_ESPADON", "CESAR");
  
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_CAZADOR", "");
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_GERMANA", "");
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_ESPADON", "");

  // comprobar el nivel de dificultad
  fNivelDificultad = DarDificultadMision();
  if ( fNivelDificultad == 1 )
  {
    fDelayPueblosAliados = 240000;//4 min
    fDelayPueblosEnemigos = 600000;//10 min
    
    fNumeroCatapI = 3;
    fNumeroCatapII = 5;
    
    //Toledorix en diferentes posiciones
    ActivarTrigger("ENCONTRAR_TRAIDORESI");
    IluminarZonaOnOff(289.1,2,67.4,22,"ZonaToledorix",TRUE);
  }
  else
  if ( fNivelDificultad == 2 )
  {
    fDelayPueblosAliados = 420000;//7 min
    fDelayPueblosEnemigos = 480000;//8 min
    
    fNumeroCatapI = 4;
    fNumeroCatapII = 6;
    
    //Toledorix en diferentes posiciones
    ActivarTrigger("ENCONTRAR_TRAIDORESII");
    IluminarZonaOnOff(235.1,2,37.4,22,"ZonaToledorix",TRUE);
  }
  else
  if ( fNivelDificultad == 3 )
  {
    fDelayPueblosAliados = 540000;//9 min
    fDelayPueblosEnemigos = 360000;//6 min
    
    //Toledorix en diferentes posiciones
    ActivarTrigger("ENCONTRAR_TRAIDORESIII");
    IluminarZonaOnOff(141.1,2,74.4,22,"ZonaToledorix",TRUE);
    
    fNumeroCatapI = 5;
    fNumeroCatapII = 7;
  }
  else
  {
    fDelayPueblosAliados = 540000;//9 min
    fDelayPueblosEnemigos = 240000;//4 min
    
    //Toledorix en diferentes posiciones
    ActivarTrigger("ENCONTRAR_TRAIDORESIII");
    IluminarZonaOnOff(141.1,2,74.4,22,"ZonaToledorix",TRUE);
    
    fNumeroCatapI = 5;
    fNumeroCatapII = 7;
    
    MensajeChat("Nivel de dificulatd desconocido, oiga");
   }

  // Esta es le trigger de condiciones de victoria
  ActivarTrigger("Game_OverII");
  ActivarTrigger("UrsoliCapturado");
  ActivarTrigger("IlannaCapturado");
  ActivarTrigger("UrsoliDestruido");
  ActivarTrigger("LucanDestruido");
  ActivarTrigger("IlannaDestruido");
	
	//Al inicio Toledorix está vivio
	bToledorixVivo = TRUE;
	
	//CrearAlianzaPorNombre("GALOS", "TRAIDORES");
//	CrearAlianzaPorNombre("GALOS", "AMBRIORIX_TEAM");
	CrearAlianzaPorNombre("CESAR", "AMIGOS");
	
	//CrearAlianzaPorNombre("GALOS", "exploradorI");
	//CrearAlianzaPorNombre("GALOS", "exploradorII");
	
  // Creamos la estrategia de los galos y de los traidores
  hEstrategia = CrearEstrategiaEscaramuza();
  hCiv = DarCivilizacion("GALOS");
  AsignarEstrategia(hCiv, hEstrategia);
  
  hEstrategiaTraidores = CrearEstrategiaScript();
  hCivTraidores = DarCivilizacion("TRAIDORES");
  AsignarEstrategia(hCivTraidores, hEstrategiaTraidores);
  
  
  //SetValue(hEstrategia, "RESOLUCION_MAPA_INFLUENCIA", 10);
  //SetValue(hEstrategia, "DECAY_POTENCIA_TROPAS", 0.7);
  //SetValue(hEstrategia, "THRESOLD_POTENCIA_TROPAS", 100);
  
  //SetValue(hEstrategia, "EXPLORAR_FACTOR_VISIBILIDAD", 0);
  
   
  
  // Sin planificador, de momento
  EjecutarPlanificador(hEstrategia, FALSE);
  
  StartEstrategia(hEstrategia);
  StartEstrategia(hEstrategiaTraidores);

  
  ///////////////////////////////////////////////////////////////////////////////////////////////  
  // Creamos los objetivos de defensa de las montañas

  // Los parametros no son necesarios (por defecto esta todo asi), pero permiten cambiar los valores
  //SetParamObjetivo(hObjMont1, "IluminarZonas", TRUE);
  //SetParamObjetivo(hObjMont1, "RadioIluminacion", 15);
  //SetParamObjetivo(hObjMont1, "TiempoIluminacion", 1000);
  //SetParamObjetivo(hObjMont1, "TiempoAlertar", 10000);

  hObjMont1 = CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hObjMont1, "G1_1", 1);
  AnyadirGrupoAObjetivo(hObjMont1, "G1_2", 2, "RutaII");
  AnyadirGrupoAObjetivo(hObjMont1, "G1_3", 3, "RutaIII");
  AnyadirGrupoAObjetivo(hObjMont1, "G1_4", 4);
  AnyadirObjetivo(hEstrategia, hObjMont1);

  hObjMont2 = CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hObjMont2, "G2_1", 1, "Ruta_Pruebecilla");
  AnyadirGrupoAObjetivo(hObjMont2, "G2_2", 2);
  AnyadirGrupoAObjetivo(hObjMont2, "G2_3", 3, "RutaIV");
  AnyadirGrupoAObjetivo(hObjMont2, "G2_4", 4, "RutaIV");
  AnyadirObjetivo(hEstrategia, hObjMont2);

  hObjMont3 = CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hObjMont3, "G3_1", 1);
  AnyadirGrupoAObjetivo(hObjMont3, "G3_2", 2, "RutaV");
  AnyadirGrupoAObjetivo(hObjMont3, "G3_3", 3);
  AnyadirGrupoAObjetivo(hObjMont3, "G3_4", 4, "RutaVI");
  AnyadirObjetivo(hEstrategia, hObjMont3);

  hObjMont4 = CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hObjMont4, "G4_1", 1);
  AnyadirGrupoAObjetivo(hObjMont4, "G4_2", 2);
  AnyadirGrupoAObjetivo(hObjMont4, "G4_3", 3, "RutaVII");
  AnyadirGrupoAObjetivo(hObjMont4, "G4_4", 4);
  AnyadirGrupoAObjetivo(hObjMont4, "G4_5", 5);
  AnyadirObjetivo(hEstrategia, hObjMont4);

  hObjMont5 = CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hObjMont5, "G5_1", 1);
  AnyadirGrupoAObjetivo(hObjMont5, "G5_2", 2);
  AnyadirObjetivo(hEstrategia, hObjMont5);

  hObjMont6 = CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hObjMont6, "G6_1", 1);
  AnyadirGrupoAObjetivo(hObjMont6, "G6_2", 2);
  AnyadirGrupoAObjetivo(hObjMont6, "G6_3", 3, "RutaVIII");
  AnyadirGrupoAObjetivo(hObjMont6, "G6_4", 4, "RutaVIII");
  AnyadirObjetivo(hEstrategia, hObjMont6);

  hObjMont7 = CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hObjMont7, "G7_1", 1);
  AnyadirGrupoAObjetivo(hObjMont7, "G7_2", 2, "RutaIX");
  AnyadirGrupoAObjetivo(hObjMont7, "G7_3", 3);
  AnyadirObjetivo(hEstrategia, hObjMont7);

  hObjMont8 = CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hObjMont8, "G8_1", 1);
  AnyadirGrupoAObjetivo(hObjMont8, "G8_2", 2, "RutaX");
  AnyadirGrupoAObjetivo(hObjMont8, "G8_3", 3, "RutaIX");
  AnyadirObjetivo(hEstrategia, hObjMont8);

  hObjMont9 = CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hObjMont9, "G9_1", 1);
  AnyadirGrupoAObjetivo(hObjMont9, "G9_2", 2);
  AnyadirGrupoAObjetivo(hObjMont9, "G9_3", 3);
  AnyadirObjetivo(hEstrategia, hObjMont9);

  hObjMont10 = CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hObjMont10, "G10_1", 1);
  AnyadirGrupoAObjetivo(hObjMont10, "G10_2", 2);
  AnyadirGrupoAObjetivo(hObjMont10, "G10_3", 3);
  AnyadirObjetivo(hEstrategia, hObjMont10);
  
  // Un grupo de 3 cazadores ladillas... y mas grupos que mantienen posicion
  hG_CAZADORES = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_CAZADORES, "G_CAZADORES");
  //SetParamObjetivo(hG_CAZADORES, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategia, hG_CAZADORES);

  hG_2 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_2, "G_2");
  //SetParamObjetivo(hG_2, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategia, hG_2);
  
  // Fin de creacion de objetivos de las montañas
  ///////////////////////////////////////////////////////////////////////////////////////////////  




  ///////////////////////////////////////////////////////////////////////////////////////////////  
  // Objetivos de defensa de la zona de los pueblos
  
  hObjDef1 = CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hObjDef1, "CHIVATOS", 1);
  AnyadirObjetivo(hEstrategia, hObjDef1);
  
  hObjDef2 = CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hObjDef2, "CHIVATOSII", 1);
  AnyadirObjetivo(hEstrategia, hObjDef2);
  
  hObjDef3 = CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hObjDef3, "CHIVATOSIII", 1);
  AnyadirObjetivo(hEstrategia, hObjDef3);
  
  hObjDef4 = CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hObjDef4, "CHIVATOSIV", 1);
  AnyadirObjetivo(hEstrategia, hObjDef4);
  
  // Fin de creacion de objetivos de defensa zona pueblos
  ///////////////////////////////////////////////////////////////////////////////////////////////  
  
  ///////////////////////////////////////////////////////////////////////////////////////////////  
  // Objetivos de los pueblos, inicialmente defensa  
  
  /*
  hObjPueblo1_Antes = CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hObjPueblo1_Antes, "PUEBLO1", 1);
  AnyadirObjetivo(hEstrategia, hObjPueblo1_Antes);
  */
  
  hObjPueblo1_Antes = CrearObjetivo(hEstrategia, "ConquistaPueblo2", "URSOLI");
  AnyadirGrupoAObjetivo(hObjPueblo1_Antes, "PUEBLO1");
  AnyadirObjetivo(hEstrategia, hObjPueblo1_Antes);
  SetDelayEntrenamientoTropasPueblo(hEstrategia, "URSOLI", fDelayPueblosEnemigos);
  
  /*
  hObjPueblo2_Antes = CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hObjPueblo2_Antes, "PUEBLO2", 1);
  AnyadirObjetivo(hEstrategia, hObjPueblo2_Antes);
  */
  
  hObjPueblo2_Antes = CrearObjetivo(hEstrategiaTraidores, "ConquistaPueblo2", "LUCAN");
  AnyadirGrupoAObjetivo(hObjPueblo2_Antes, "PUEBLO2");
  AnyadirObjetivo(hEstrategiaTraidores, hObjPueblo2_Antes);
  SetDelayEntrenamientoTropasPueblo(hEstrategiaTraidores, "LUCAN", fDelayPueblosEnemigos);
  
  /*
  hObjPueblo3_Antes = CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hObjPueblo3_Antes, "PUEBLO3", 1);
  AnyadirObjetivo(hEstrategia, hObjPueblo3_Antes);
  */
  
  hObjPueblo3_Antes = CrearObjetivo(hEstrategia, "ConquistaPueblo2", "ILANNA");
  AnyadirGrupoAObjetivo(hObjPueblo3_Antes, "PUEBLO3");
  AnyadirObjetivo(hEstrategia, hObjPueblo3_Antes);
  SetDelayEntrenamientoTropasPueblo(hEstrategia, "ILANNA", fDelayPueblosEnemigos);
  
  //Que corran todos...
  SetParamEstrategia(hEstrategia, "AtacarCorriendo", TRUE);
  
  // Fin de creacion de objetivos de defensa pueblos
  ///////////////////////////////////////////////////////////////////////////////////////////////  


  // Meto los centuriones en los pueblos
  InteractuarTropaConEnte("Centurion1", "URSOLI");
  InteractuarTropaConEnte("Centurion2", "LUCAN");
  InteractuarTropaConEnte("Centurion3", "ILANNA");
  
  InteractuarTropaConEnte("arquerosI","torreI");
  InteractuarTropaConEnte("arquerosII","torreII");
  InteractuarTropaConEnte("arquerosIII","torreIII");
  
  
  ActivarTrigger("HasConseguidoRefuerzos");
  ActivarTrigger("EliminarToledorixDelScript");
  ActivarTrigger("TeVen");
  ActivarTrigger("AtacanAUnPueblo");
  ActivarTrigger("PuebloToledorix");
  ActivarTrigger("AtacarGuarnicionNeutra");
  
  ActivarTrigger("IncrementarLaProduccionHo");
  ActivarTrigger("AmenizarReclutamiento");
  
  DestruirTrigger("Main2");
    
}


Trigger "Briefing" [ Inactivo ] 
(
  TRUE
)
Var
{
  float x, y;
  handle hCamaraEnd;
  handle hPresentacion;
  handle hEscape;
}
Do
{
  
  // iluminamos previamente para que se vean bien los colores de pueblos
  IluminarZona(38, 0, 48, 10, 60000);
  IluminarZona(32, 0, 177, 10, 60000);
  IluminarZona(110, 0, 113, 10, 60000);
   
  // handle de final y presentacion
  hCamaraEnd = CrearHandle("Bool");
  hPresentacion = CrearHandle("Bool");
  hEscape = CrearHandle("Bool");

  // contamos los puntos de sincronia
  hPuntoSincronia = CrearHandle("Bool");
  PonerHandleEsperaSincronizacion(hPuntoSincronia);
  ActivarTrigger("ContarPuntosSincronia");

  // cazar escape
  PonerHandleInterrupcion(hEscape);
  
  // posición actual
  DarPosicionCamara(&x, &y);

  // cine
  ActivarCinemascope(TRUE);
    
  // Presentacion
  ActivarPresentacion(TRUE, "LTEXT_MISION15_PRESENTACION_TITULO",
                            "LTEXT_MISION15_PRESENTACION_LUGAR", hPresentacion);
 
  // camara a donde debe empezar
  EncolarColocarYMirarPunto("TOMA_0");
  EjecutarOrdenesCamara();
  
  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));
 
  ActivarPresentacion(FALSE, "", "", NULL);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);
  
  EncolarColocarYMirarPunto("TOMA_0");
  EncolarPausaCamara(1000);
  EncolaTrayectoriaCamara("RECORRIDO_1", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  IntroducirLocucion("15N0", "LTEXT_MISION15_LOCUCION_00_TXT", 6000, 600, 100);
  IntroducirPuntoSincronia();

  EncolarColocarYMirarPunto("TOMA_1");
  EncolarPausaCamara(1000);
  EncolaTrayectoriaCamara("RECORRIDO_2", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("15N1", "LTEXT_MISION15_LOCUCION_01_TXT", 12000, 600, 100);
  IntroducirPuntoSincronia();
  
  EncolarColocarYMirarPunto("TOMA_2");
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("15N2", "LTEXT_MISION15_LOCUCION_02_TXT", 7000, 600, 100);
  IntroducirPuntoSincronia();
  
  EncolarMirarEnteCamara("TOLEDORIX");
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("15N3", "LTEXT_MISION15_LOCUCION_03_TXT", 6000, 600, 100);
  IntroducirPuntoSincronia();
  
  EncolarColocarYMirarPunto("TOMA_0");
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("15N4", "LTEXT_MISION15_LOCUCION_04_TXT", 2000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("15N5", "LTEXT_MISION15_LOCUCION_05_TXT", 4000, 600, 100);
  IntroducirPuntoSincronia();
    
  IntroducirPonerModoJuegoCamara(TRUE);



  // si no se ha interrumpido
  if ( !HandleDisparado(hEscape) )
  {

    // efectos especiales
    ActivarTrigger("EfectosBriefing");
    // acción
    EjecutarOrdenesCamara();

    // final  
    PonerHandleBoolACamara(hCamaraEnd);
    WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
    
  } // if

  VaciarOrdenesCamara();
  VaciarLocuciones();

  bBriefingEnded = TRUE;

  // activamos el main2
  ActivarTrigger("Main2");

  // colocamos la cámara
  if ( HandleDisparado(hEscape) )
  {
    MirarAPunto(x, y);
  }

  // restaurar
  ActivarCinemascope(FALSE);
 
  DestruirTrigger("Briefing"); 
  
}


/////////////////////////////////////////////
// Efectos del briefing
Trigger "EfectosBriefing" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer; 
}
Do
{

  // que llueva, que llueva
  ModificarLluvia(100.0, 100.0, 50.0, 240);
      
  // luces
  IluminarZona(58, 0, 13, 10, 60000);
      
  DestruirTrigger("EfectosBriefing");  

}


// Contamos los puntos de sincronia
Trigger "ContarPuntosSincronia" [ Inactivo ]
(
  Wait(hPuntoSincronia)
)
Do
{
  fPuntoSincronia = fPuntoSincronia + 1;
  PonerHandleEsperaSincronizacion(hPuntoSincronia);
}



//////////////////////////////////////////////////////////////
// TRIGGERS DE MISION
//////////////////////////////////////////////////////////////


Trigger "HasConseguidoRefuerzos" [ Inactivo ]
// ------------------------
(
  HanEntradoCivilizacionesEnZona("Refuerzos","CESAR")
)
Do
{
  MensajeLocucionado("15N6","LTEXT_MISION15_MENSAJE_00_TXT");
  
  // nuevo objetivo: mantener a crastino con vida
  AgregarObjetivoMision(hObjCrastinoVivo, "LTEXT_MISION15_OBJETIVO_04_TXT");
  ObjetivosMisionCambiados();
  
  CambiarBando("AMIGOS","CESAR");
  
  bAlisUp = TRUE;
  
  DestruirTrigger("HasConseguidoRefuerzos");
}

// En hard vamos a amenizar un poco el reclutamiento de tropas por parte de Gominolo
Trigger "AmenizarReclutamiento" [ Inactivo ]
// ------------------------
(
  bAlisUp && bGobannitioUp
)
Do
{
  
  if (fNivelDificultad == 3) 
  {
  DisposeHandle(&hObjMont1);
  DisposeHandle(&hObjMont2);
  DisposeHandle(&hObjMont3);
  DisposeHandle(&hObjMont4);
  DisposeHandle(&hObjMont5);
  DisposeHandle(&hObjMont6);
  DisposeHandle(&hObjMont7);
  DisposeHandle(&hObjMont8);
  DisposeHandle(&hObjMont9);
  DisposeHandle(&hObjMont10);
  
  hObjMont1 = CrearObjetivo(hEstrategia, "PatrullaOleadasPeriodicas", 10000, 10000, 20, 35);

	SetParamObjetivo(hObjMont1, "PuedeTenerTropasLibres", FALSE);

  // -- Parámetros
  //SetParamObjetivo(hObjCaza, "MaxNumOleadas", 5);
  SetParamObjetivo(hObjMont1, "ComposicionEstricta", FALSE);

  SetParamObjetivo(hObjMont1, "EXPLORAR_FACTOR_ENEMIGOS", 50);
  SetParamObjetivo(hObjMont1, "EXPLORAR_FACTOR_VISTA_YA", 0.5);
  //SetParamObjetivo(hObjMont1, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  //SetParamObjetivo(hObjMont1, "EXPLORAR_FACTOR_PUEBLOS", 0);
    
  // Las tropas estarán manteniendo posición hasta que les toque salir  

  AnyadirGrupoAObjetivo(hObjMont1, "G1_1");
  AnyadirGrupoAObjetivo(hObjMont1, "G1_2");
  AnyadirGrupoAObjetivo(hObjMont1, "G1_3");
  AnyadirGrupoAObjetivo(hObjMont1, "G1_4");

  AnyadirGrupoAObjetivo(hObjMont1, "G2_1");
  AnyadirGrupoAObjetivo(hObjMont1, "G2_2");
  AnyadirGrupoAObjetivo(hObjMont1, "G2_3");
  AnyadirGrupoAObjetivo(hObjMont1, "G2_4");

  AnyadirGrupoAObjetivo(hObjMont1, "G3_1");
  AnyadirGrupoAObjetivo(hObjMont1, "G3_2");
  AnyadirGrupoAObjetivo(hObjMont1, "G3_3");
  AnyadirGrupoAObjetivo(hObjMont1, "G3_4");

  AnyadirGrupoAObjetivo(hObjMont1, "G4_1");
  AnyadirGrupoAObjetivo(hObjMont1, "G4_2");
  AnyadirGrupoAObjetivo(hObjMont1, "G4_3");
  AnyadirGrupoAObjetivo(hObjMont1, "G4_4");
  AnyadirGrupoAObjetivo(hObjMont1, "G4_5");

  AnyadirGrupoAObjetivo(hObjMont1, "G5_1");
  AnyadirGrupoAObjetivo(hObjMont1, "G5_2");

  AnyadirGrupoAObjetivo(hObjMont1, "G6_1");
  AnyadirGrupoAObjetivo(hObjMont1, "G6_2");
  AnyadirGrupoAObjetivo(hObjMont1, "G6_3");
  AnyadirGrupoAObjetivo(hObjMont1, "G6_4");

  AnyadirGrupoAObjetivo(hObjMont1, "G7_1");
  AnyadirGrupoAObjetivo(hObjMont1, "G7_2");
  AnyadirGrupoAObjetivo(hObjMont1, "G7_3");

  AnyadirGrupoAObjetivo(hObjMont1, "G8_1");
  AnyadirGrupoAObjetivo(hObjMont1, "G8_2");
  AnyadirGrupoAObjetivo(hObjMont1, "G8_3");

  AnyadirGrupoAObjetivo(hObjMont1, "G9_1");
  AnyadirGrupoAObjetivo(hObjMont1, "G9_2");
  AnyadirGrupoAObjetivo(hObjMont1, "G9_3");

  AnyadirGrupoAObjetivo(hObjMont1, "G10_1");
  AnyadirGrupoAObjetivo(hObjMont1, "G10_2");
  AnyadirGrupoAObjetivo(hObjMont1, "G10_3");
  
  AnyadirObjetivo(hEstrategia, hObjMont1);
  }
  
  DestruirTrigger("AmenizarReclutamiento");
}

//////////////////////////////////////////////////////////////////////////////
// ACTIVAR PUEBLOS
//////////////////////////////////////////////////////////////////////////////
Trigger "ActivarPueblos" [ Inactivo ]
(
  TRUE
)
Do
{

  // Cancelo los objetivos que "defendian" los pueblos...
  /*DisposeHandle(&hObjPueblo1_Antes);
  DisposeHandle(&hObjPueblo2_Antes);
  DisposeHandle(&hObjPueblo3_Antes);*/
  
  // ...y creo los de gestion de pueblo de verdad
  //hObjPueblo1_Despues = CrearObjetivo(hEstrategia, "ConquistaPueblo2", "URSOLI");
  //AnyadirGrupoAObjetivo(hObjPueblo1_Despues, "PUEBLO1");
  //AnyadirObjetivo(hEstrategia, hObjPueblo1_Despues);
  //SetDelayEntrenamientoTropasPueblo(hEstrategia, "URSOLI", fDelayPueblosEnemigos);
  DarObjetivo2CPU(hObjPueblo1_Antes, TRUE);
  
  //hObjPueblo2_Despues = CrearObjetivo(hEstrategiaTraidores, "ConquistaPueblo2", "LUCAN");
  //AnyadirGrupoAObjetivo(hObjPueblo2_Despues, "PUEBLO2");
  //AnyadirObjetivo(hEstrategiaTraidores, hObjPueblo2_Despues);
  //SetDelayEntrenamientoTropasPueblo(hEstrategiaTraidores, "LUCAN", fDelayPueblosEnemigos);
  DarObjetivo2CPU(hObjPueblo2_Antes, TRUE);
  
  //hObjPueblo3_Despues = CrearObjetivo(hEstrategia, "ConquistaPueblo2", "ILANNA");
  //AnyadirGrupoAObjetivo(hObjPueblo3_Despues, "PUEBLO3");
  //AnyadirObjetivo(hEstrategia, hObjPueblo3_Despues);
  //SetDelayEntrenamientoTropasPueblo(hEstrategia, "ILANNA", fDelayPueblosEnemigos);
  DarObjetivo2CPU(hObjPueblo3_Antes, TRUE);



  // Destruimos los objetivos de defensa de las montañas...  
  DisposeHandle(&hObjMont1);
  DisposeHandle(&hObjMont2);
  DisposeHandle(&hObjMont3);
  DisposeHandle(&hObjMont4);
  DisposeHandle(&hObjMont5);
  DisposeHandle(&hObjMont6);
  DisposeHandle(&hObjMont7);
  DisposeHandle(&hObjMont8);
  DisposeHandle(&hObjMont9);
  DisposeHandle(&hObjMont10);
  DisposeHandle(&hObjDef1);
  DisposeHandle(&hObjDef2);
  DisposeHandle(&hObjDef3);
  DisposeHandle(&hObjDef4);
  
  ActivarTrigger("RetrasoCazaYCaptura");
  
  

  // Ahora la CPU ya puede ejecutar el planificador
  EjecutarPlanificador(hEstrategia, TRUE);

  DestruirTrigger("ActivarPueblos");
  
/*
  // Destruimos los triggers de los objetivos que ya no existen
  DestruirTrigger("Alertar_Mont1");
  DestruirTrigger("Alertar_Mont2");
  DestruirTrigger("Alertar_Mont3");
  DestruirTrigger("Alertar_Mont4");
  DestruirTrigger("Alertar_Mont5");
  DestruirTrigger("Alertar_Mont6");
  DestruirTrigger("Alertar_Mont7");
  DestruirTrigger("Alertar_Mont8");
  DestruirTrigger("Alertar_Mont9");
  DestruirTrigger("Alertar_Mont10");
*/
}

Trigger "RetrasoCazaYCaptura" [ Inactivo ]
(
	TRUE
)
Var
{
	handle hTimer;
}
Do
{
	// Este objetivo va creando patrullas para movilizar a las tropas de las montañas
  // 10000 de potencia, entre 10 y 60 segundos para que salga cada grupo
  hObjCaza = CrearObjetivo(hEstrategia, "PatrullaOleadasPeriodicas", 10000, 10000, 10, 60);

	SetParamObjetivo(hObjCaza, "PuedeTenerTropasLibres", FALSE);

  // -- Parámetros
  //SetParamObjetivo(hObjCaza, "MaxNumOleadas", 5);
  SetParamObjetivo(hObjCaza, "ComposicionEstricta", FALSE);

  SetParamObjetivo(hObjCaza, "EXPLORAR_FACTOR_ENEMIGOS", 100);
  SetParamObjetivo(hObjCaza, "EXPLORAR_FACTOR_VISTA_YA", 0.5);
  //SetParamObjetivo(hObjCaza, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  //SetParamObjetivo(hObjCaza, "EXPLORAR_FACTOR_PUEBLOS", 0);
    
  // Las tropas estarán manteniendo posición hasta que les toque salir  

  AnyadirGrupoAObjetivo(hObjCaza, "G1_1");
  AnyadirGrupoAObjetivo(hObjCaza, "G1_2");
  AnyadirGrupoAObjetivo(hObjCaza, "G1_3");
  AnyadirGrupoAObjetivo(hObjCaza, "G1_4");

  AnyadirGrupoAObjetivo(hObjCaza, "G2_1");
  AnyadirGrupoAObjetivo(hObjCaza, "G2_2");
  AnyadirGrupoAObjetivo(hObjCaza, "G2_3");
  AnyadirGrupoAObjetivo(hObjCaza, "G2_4");

  AnyadirGrupoAObjetivo(hObjCaza, "G3_1");
  AnyadirGrupoAObjetivo(hObjCaza, "G3_2");
  AnyadirGrupoAObjetivo(hObjCaza, "G3_3");
  AnyadirGrupoAObjetivo(hObjCaza, "G3_4");

  AnyadirGrupoAObjetivo(hObjCaza, "G4_1");
  AnyadirGrupoAObjetivo(hObjCaza, "G4_2");
  AnyadirGrupoAObjetivo(hObjCaza, "G4_3");
  AnyadirGrupoAObjetivo(hObjCaza, "G4_4");
  AnyadirGrupoAObjetivo(hObjCaza, "G4_5");

  AnyadirGrupoAObjetivo(hObjCaza, "G5_1");
  AnyadirGrupoAObjetivo(hObjCaza, "G5_2");

  AnyadirGrupoAObjetivo(hObjCaza, "G6_1");
  AnyadirGrupoAObjetivo(hObjCaza, "G6_2");
  AnyadirGrupoAObjetivo(hObjCaza, "G6_3");
  AnyadirGrupoAObjetivo(hObjCaza, "G6_4");

  AnyadirGrupoAObjetivo(hObjCaza, "G7_1");
  AnyadirGrupoAObjetivo(hObjCaza, "G7_2");
  AnyadirGrupoAObjetivo(hObjCaza, "G7_3");

  AnyadirGrupoAObjetivo(hObjCaza, "G8_1");
  AnyadirGrupoAObjetivo(hObjCaza, "G8_2");
  AnyadirGrupoAObjetivo(hObjCaza, "G8_3");

  AnyadirGrupoAObjetivo(hObjCaza, "G9_1");
  AnyadirGrupoAObjetivo(hObjCaza, "G9_2");
  AnyadirGrupoAObjetivo(hObjCaza, "G9_3");

  AnyadirGrupoAObjetivo(hObjCaza, "G10_1");
  AnyadirGrupoAObjetivo(hObjCaza, "G10_2");
  AnyadirGrupoAObjetivo(hObjCaza, "G10_3");
 
  AnyadirGrupoAObjetivo(hObjCaza, "CHIVATOS");
  AnyadirGrupoAObjetivo(hObjCaza, "CHIVATOSII");
  AnyadirGrupoAObjetivo(hObjCaza, "CHIVATOSIII");
  AnyadirGrupoAObjetivo(hObjCaza, "CHIVATOSIV");
 
  AnyadirObjetivo(hEstrategia, hObjCaza);
  
  DestruirTrigger("RetrasoCazaYCaptura");
}	
// Los pueblos se activan en el momento en que algun objetivo de defensa de los pueblos queda
// alertado: luchas y te vas (o mueres)
Trigger "TeVen" [ Inactivo ]
(
  ObjetivoGetParamBOOL(hObjDef1, "Alertado")
  || ObjetivoGetParamBOOL(hObjDef2, "Alertado")
  || ObjetivoGetParamBOOL(hObjDef3, "Alertado")
  || ObjetivoGetParamBOOL(hObjDef4, "Alertado")
)
Do
{
  ActivarTrigger("ActivarPueblos");
  DestruirTrigger("TeVen");
  DestruirTrigger("AtacanAUnPueblo");
}

// Tambien se activan en cuando un objetivo del pueblo entra en combate
Trigger "AtacanAUnPueblo" [ Inactivo ]
(
  ObjetivoGetParamBOOL(hObjPueblo1_Antes, "EstoyCombatiendo") 
  || ObjetivoGetParamBOOL(hObjPueblo2_Antes, "EstoyCombatiendo")
  || ObjetivoGetParamBOOL(hObjPueblo3_Antes, "EstoyCombatiendo")
)
Do
{
  ActivarTrigger("ActivarPueblos");
  DestruirTrigger("AtacanAUnPueblo");
  DestruirTrigger("TeVen");
}

//////////////////////////////////////////////////////////////////////////////
// PUEBLOS
//////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////
// capturar

Trigger "UrsoliCapturado" [ Inactivo ]
(
  EstaPuebloConquistado("CESAR", "URSOLI") 
)
Do
{
  ursoliNeutralizado = TRUE;
  IndicarObjetivoCumplido(hObjNeutralizarUrsoli);
  ActivarTrigger("UrsoliRecapturado");
  DesactivarTrigger("UrsoliCapturado");
}

Trigger "LucanCapturado" [ Inactivo ]
(
  EstaPuebloConquistado("CESAR", "LUCAN") ||
  (EstaPuebloConquistado("TRAIDORES", "LUCAN") && bToledorixVivo)
)
Do
{
  lucanNeutralizado = TRUE;
  IndicarObjetivoCumplido(hObjNeutralizarLucan);
  ActivarTrigger("LucanRecapturado");
  DesactivarTrigger("LucanCapturado");
}


Trigger "IlannaCapturado" [ Inactivo ]
(
  EstaPuebloConquistado("CESAR", "ILANNA")
)
Do
{
  ilannaNeutralizado = TRUE;
  IndicarObjetivoCumplido(hObjNeutralizarIlanna);
  ActivarTrigger("IlannaRecapturado");
  DesactivarTrigger("IlannaCapturado");
}

//////////////////////////////////////////////////////////////////////////////
// destruir

Trigger "UrsoliDestruido" [ Inactivo ]
(
  EstructuraDestruida("URSOLI")
)
Do
{
  ursoliNeutralizado = TRUE;
  IndicarObjetivoCumplido(hObjNeutralizarUrsoli);
  DestruirTrigger("UrsoliCapturado");
  DestruirTrigger("UrsoliRecapturado");
  DestruirTrigger("UrsoliDestruido");
}

Trigger "LucanDestruido" [ Inactivo ]
(
  EstructuraDestruida("LUCAN")
)
Do
{
  lucanNeutralizado = TRUE;
  IndicarObjetivoCumplido(hObjNeutralizarLucan);
  DestruirTrigger("LucanCapturado");
  DestruirTrigger("LucanRecapturado");
  DestruirTrigger("LucanDestruido");
}


Trigger "IlannaDestruido" [ Inactivo ]
(
  EstructuraDestruida("ILANNA")
)
Do
{
  ilannaNeutralizado = TRUE;
  IndicarObjetivoCumplido(hObjNeutralizarIlanna);
  DestruirTrigger("IlannaCapturado");
  DestruirTrigger("IlannaRecapturado");
  DestruirTrigger("IlannaDestruido");
}


//////////////////////////////////////////////////////////////////////////////
// el enemigo contrataca

Trigger "UrsoliRecapturado" [ Inactivo ]
(
  EstaPuebloConquistado("GALOS", "URSOLI")
)
Do
{
  ursoliNeutralizado = FALSE;
  IndicarObjetivoPendiente(hObjNeutralizarUrsoli);
  ActivarTrigger("UrsoliCapturado");
  DesactivarTrigger("UrsoliRecapturado");
}

Trigger "LucanRecapturado" [ Inactivo ]
(
  EstaPuebloConquistado("GALOS", "LUCAN") ||
  (EstaPuebloConquistado("TRAIDORES", "LUCAN") && bToledorixMuerto)
)
Do
{
  lucanNeutralizado = FALSE;
  IndicarObjetivoPendiente(hObjNeutralizarLucan);
  ActivarTrigger("LucanCapturado");
  DesactivarTrigger("LucanRecapturado"); 
}


Trigger "IlannaRecapturado" [ Inactivo ]
(
  EstaPuebloConquistado("GALOS", "ILANNA")
)
Do
{
  ilannaNeutralizado = FALSE;
  IndicarObjetivoPendiente(hObjNeutralizarIlanna);
  ActivarTrigger("IlannaCapturado");
  DesactivarTrigger("IlannaRecapturado");
}


/////////////////////////////////////////////////////////////////////////
// Funcion de fin

//-----------------------------------------
Trigger "Game_Over" [ Inactivo ]
(
  (ursoliNeutralizado && lucanNeutralizado && ilannaNeutralizado)
  ||
  (DarPotenciaCivilizacion("CESAR") == 0)
  ||
  !EstaTropaViva("LABIENO")
  ||
  !EstaTropaViva("CRASTINO")
)
Do
{
  
  if ( (DarPotenciaCivilizacion("CESAR") == 0) || !EstaTropaViva("LABIENO") || !EstaTropaViva("CRASTINO") )
  {
    
    if ( !EstaTropaViva("LABIENO") )
    {
      IndicarObjetivoFracasado(hObjLabienoVivo);
    }
    
    if ( !EstaTropaViva("CRASTINO") )
    {
      IndicarObjetivoFracasado(hObjCrastinoVivo);
    }
           
    FinalizarMision(FALSE);      
    
  }
  else
  {
    
    IndicarObjetivoCumplido(hObjLabienoVivo);
    IndicarObjetivoCumplido(hObjCrastinoVivo);
    
    FinalizarMision(TRUE); 
    
    
  }
  
  DestruirTrigger("Game_Over");
  
}

//---------------------------------------
Trigger "Game_OverII" [ Inactivo ]
(
  (ursoliNeutralizado && ilannaNeutralizado)
  ||
  (DarPotenciaCivilizacion("CESAR") == 0)
  ||
  !EstaTropaViva("LABIENO")
  ||
  !EstaTropaViva("CRASTINO")
)
Do
{
  
  if ( (DarPotenciaCivilizacion("CESAR") == 0) || !EstaTropaViva("LABIENO") || !EstaTropaViva("CRASTINO") )
  {
    
    if ( !EstaTropaViva("LABIENO") )
    {
      IndicarObjetivoFracasado(hObjLabienoVivo);
    }
    
    if ( !EstaTropaViva("CRASTINO") )
    {
      IndicarObjetivoFracasado(hObjCrastinoVivo);
    }
    
    FinalizarMision(FALSE);      
    
  }
  else
  {
    
    IndicarObjetivoCumplido(hObjLabienoVivo);
    IndicarObjetivoCumplido(hObjCrastinoVivo);
    
    FinalizarMision(TRUE); 
  }
  
  DestruirTrigger("Game_OverII");
  
}



/////////////////////////////////////////////////////////////
// Encuentro com gominolo-toledorix
/////////////////////////////////////////////////////////////

Trigger "ENCONTRAR_TRAIDORESI" [ Inactivo ]
(
	HanEntradoCivilizacionesEnZona("TRAIDORES_TUYOSI","CESAR") 
)
Var
{
  float x, y;
  handle hCamaraEnd;
  handle hEscape;
}
Do
{
   
  // handle de final y presentacion
  hCamaraEnd = CrearHandle("Bool");
  hEscape = CrearHandle("Bool");

  // cazar escape
  PonerHandleInterrupcion(hEscape);
  
  // posición actual
  DarPosicionCamara(&x, &y);

  // cine
  ActivarCinemascope(TRUE);
  PararLogica(TRUE);
    
  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolarTrayectoriaMirarEnteCamara("TOLEDORIX", TRUE, FALSE, 1, 0);
  EncolarPausaCamara(5000);
  IntroducirLocucion("15F0", "LTEXT_MISION15_EVENT1_00_TXT", 4000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("15F1", "LTEXT_MISION15_EVENT1_01_TXT", 5000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("15F2", "LTEXT_MISION15_EVENT1_02_TXT", 5000, 600, 100);
  IntroducirPuntoSincronia();
      
  IntroducirPonerModoJuegoCamara(TRUE);

  // acción
  EjecutarOrdenesCamara();

  // final  
  PonerHandleBoolACamara(hCamaraEnd);
  WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
   
  VaciarOrdenesCamara();
  VaciarLocuciones();
    
  // colocamos la cámara
  if ( HandleDisparado(hEscape) )
  {
    MirarAPunto(x, y);
  }

  // restaurar
  PararLogica(FALSE);
  ActivarCinemascope(FALSE);

  // cambiamos de bando
  CambiarBandoPorGrupo("TOLEDORIX_TEAM", "CESAR");

  IluminarZonaOnOff(235.1,2,37.4,22,"ZonaToledorix",FALSE);
  HacerVisibleGrupoTropas("TOLEDORIX_MONT", TRUE);
  
  bGobannitioUp = TRUE;

  ActivarTrigger("ReclutarGalosToledorix");  
  DestruirTrigger("ENCONTRAR_TRAIDORESI");
  
}

Trigger "ENCONTRAR_TRAIDORESII" [ Inactivo ]
(
	HanEntradoCivilizacionesEnZona("TRAIDORES_TUYOSII","CESAR") 
)
Var
{
  float x, y;
  handle hCamaraEnd;
  handle hEscape;
}
Do
{
   
  // handle de final y presentacion
  hCamaraEnd = CrearHandle("Bool");
  hEscape = CrearHandle("Bool");

  // cazar escape
  PonerHandleInterrupcion(hEscape);
  
  // posición actual
  DarPosicionCamara(&x, &y);

  // cine
  ActivarCinemascope(TRUE);
  PararLogica(TRUE);
    
  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolarTrayectoriaMirarEnteCamara("TOLEDORIX", TRUE, FALSE, 1, 0);
  EncolarPausaCamara(5000);
  IntroducirLocucion("15F0", "LTEXT_MISION15_EVENT1_00_TXT", 4000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("15F1", "LTEXT_MISION15_EVENT1_01_TXT", 5000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("15F2", "LTEXT_MISION15_EVENT1_02_TXT", 5000, 600, 100);
  IntroducirPuntoSincronia();
      
  IntroducirPonerModoJuegoCamara(TRUE);

  // acción
  EjecutarOrdenesCamara();

  // final  
  PonerHandleBoolACamara(hCamaraEnd);
  WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
   
  VaciarOrdenesCamara();
  VaciarLocuciones();
    
  // colocamos la cámara
  if ( HandleDisparado(hEscape) )
  {
    MirarAPunto(x, y);
  }

  // restaurar
  PararLogica(FALSE);
  ActivarCinemascope(FALSE);
  
  CambiarBandoPorGrupo("TOLEDORIX_TEAM", "CESAR");

  IluminarZonaOnOff(289.1,2,67.4,22,"ZonaToledorix",FALSE);
  HacerVisibleGrupoTropas("TOLEDORIX_MONT", TRUE);
  
  bGobannitioUp = TRUE;

  ActivarTrigger("ReclutarGalosToledorix");  
  DestruirTrigger("ENCONTRAR_TRAIDORESII");
  
}

Trigger "ENCONTRAR_TRAIDORESIII" [ Inactivo ]
(
	HanEntradoCivilizacionesEnZona("TRAIDORES_TUYOSIII","CESAR") 
)
Var
{
  float x, y;
  handle hCamaraEnd;
  handle hEscape;
}
Do
{
   
  // handle de final y presentacion
  hCamaraEnd = CrearHandle("Bool");
  hEscape = CrearHandle("Bool");

  // cazar escape
  PonerHandleInterrupcion(hEscape);
  
  // posición actual
  DarPosicionCamara(&x, &y);

  // cine
  ActivarCinemascope(TRUE);
  PararLogica(TRUE);
    
  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolarTrayectoriaMirarEnteCamara("TOLEDORIX", TRUE, FALSE, 1, 0);
  EncolarPausaCamara(5000);
  IntroducirLocucion("15F0", "LTEXT_MISION15_EVENT1_00_TXT", 4000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("15F1", "LTEXT_MISION15_EVENT1_01_TXT", 5000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("15F2", "LTEXT_MISION15_EVENT1_02_TXT", 5000, 600, 100);
  IntroducirPuntoSincronia();
      
  IntroducirPonerModoJuegoCamara(TRUE);

  // acción
  EjecutarOrdenesCamara();

  // final  
  PonerHandleBoolACamara(hCamaraEnd);
  WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
   
  VaciarOrdenesCamara();
  VaciarLocuciones();
    
  // colocamos la cámara
  if ( HandleDisparado(hEscape) )
  {
    MirarAPunto(x, y);
  }

  // restaurar
  PararLogica(FALSE);
  ActivarCinemascope(FALSE);
  
  CambiarBandoPorGrupo("TOLEDORIX_TEAM", "CESAR");
  IluminarZonaOnOff(141.1,2,74.4,22,"ZonaToledorix",FALSE);
  HacerVisibleGrupoTropas("TOLEDORIX_MONT", TRUE);

  bGobannitioUp = TRUE;

  ActivarTrigger("ReclutarGalosToledorix");  
  DestruirTrigger("ENCONTRAR_TRAIDORESIII");
  
}

/////////////////////////////////////////////////////////////

Trigger "ReclutarGalosToledorix" [ Inactivo ]
// ---------------------------
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{
  
  if (ReclutarTropasCerca("TOLEDORIX", "TRAIDORES", 14))
  {
    ReclutarTropasCerca("TOLEDORIX", "TRAIDORES", 18);
    if (!bNoRepeticion)
    {
      bNoRepeticion = TRUE;
      ActivarTrigger("bNoRepeticionFalse");
      MensajeLocucionado("15N7","LTEXT_MISION15_MENSAJE_01_TXT");
    }
  }  

  hTimer = CrearTimer(1000);
  Wait(hTimer);
  
}

Trigger "bNoRepeticionFalse" [ Inactivo ]
// ---------------------------
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(10000);
  Wait(hTimer);
  
  bNoRepeticion = FALSE;
  
  DesactivarTrigger("bNoRepeticionFalse");
}


Trigger "EliminarToledorixDelScript" [ Inactivo ]
// ---------------------------
(
 	!EstaTropaViva("TOLEDORIX") 
)
Do
{
  
  // mensaje
  MensajeLocucionado("15N8","LTEXT_MISION15_MENSAJE_02_TXT");

  // los coleguitas de gominolo se piran al enemigo
  CrearAlianzaPorNombre("TRAIDORES", "GALOS");
  
  // hay que trincar lucan
  ActivarTrigger("LucanCapturado");
  AgregarObjetivoMision(hObjNeutralizarLucan, "LTEXT_MISION15_OBJETIVO_02_TXT");
    
  bToledorixMuerto = TRUE;
  bToledorixVivo = FALSE;
  
  HacerVisibleGrupoTropas("TOLEDORIX_MONT", FALSE);
  
  DestruirTrigger("PuebloToledorix");
  DestruirTrigger("Game_OverII");
  ActivarTrigger("Game_Over");
  DestruirTrigger("EliminarToledorixDelScript");

}

//Toledorix enseña su pueblo

Trigger "PuebloToledorix" [ Inactivo ]
// ---------------------------
(
 	HaEntradoTropaEnZona("Salida_Mountain", "TOLEDORIX") 
)
Do
{
  HacerVisibleGrupoTropas("PUEBLO2", TRUE);
  DestruirTrigger("PuebloToledorix");
}

Trigger "IncrementarLaProduccionHo" [ Inactivo ]
// ---------------------------
(
 	HanEntradoCivilizacionesEnZona("Salida_Mountain", "CESAR") 
)
Do
{
  SetDelayEntrenamientoTropasPueblo(hEstrategia, "URSOLI", 20);
  SetDelayEntrenamientoTropasPueblo(hEstrategiaTraidores, "LUCAN", 20);
  SetDelayEntrenamientoTropasPueblo(hEstrategia, "ILANNA", 20);
    
  DestruirTrigger("IncrementarLaProduccionHo");
}

Trigger "AtacarGuarnicionNeutra" [ Inactivo ]
// ---------------------------
(
 	(bToledorixVivo 
 	 && (!TropaEstaEnCivilizacion("Centurion2", "CESAR"))
 	 && (EsEstructuraAtacada("LUCAN GARRISON", "CESAR") || EsEstructuraAtacada("LUCAN", "CESAR"))
 	)
)
Do
{
  
  IluminarZonaOnOff(289.1,2,67.4,22,"ZonaToledorix",FALSE);
  IluminarZonaOnOff(235.1,2,37.4,22,"ZonaToledorix",FALSE);
  IluminarZonaOnOff(141.1,2,74.4,22,"ZonaToledorix",FALSE);
  
  DestruirTrigger("ENCONTRAR_TRAIDORESI");
  DestruirTrigger("ENCONTRAR_TRAIDORESII");
  DestruirTrigger("ENCONTRAR_TRAIDORESIII");
  
  CrearAlianzaPorNombre("TRAIDORES", "GALOS");
  
  DestruirTrigger("PuebloToledorix");
  DestruirTrigger("EliminarToledorixDelScript"); 
  DestruirTrigger("AtacarGuarnicionNeutra");
}

Trigger "End" [Activo]
(
  TRUE
)
Do
{
}