Var
{		
  handle hEstrategia;
	handle hEstrategiaEgipcios;
	handle hEstrategiaRomanos;
	handle hEstrategiaGalos;
	handle hEstrategiaAlis;
		
	handle hCivilizacion;
	handle hCivilizacionEgipcios;
	handle hCivilizacionRomanos;
	handle hCivilizacionGalos;
	handle hCivilizacionAlis;
	
	handle hProduccionAlis;
	
	handle hG_EGIPCIOS;
	handle hG_EGIPCIOSII;
	handle hG_EGIPCIOSIII;
	handle hG_ROMANOS;
	handle hG_ROMANOSII;
	handle hG_ROMANOSIII;
	handle hG_BARBAROS;
	handle hG_BARBAROSII;
	handle hG_BARBAROSIII;
	handle hG_MALOS;
	handle hG_MALOSII;
	handle hG_MALOSIII;
	
	handle hG_CENTUEGIPCIO;
	handle hG_CENTUROMANO;
	handle hG_CENTUGALO;
	
	handle hObjetivoDefensaFortaleza;
	
	handle hG_1; 
	handle hG_2; 
	handle hG_3; 
	handle hG_4;
	handle hG_5;
	handle hG_6;
	handle hG_7;
	handle hG_8;
	handle hG_9;
	handle hG_10;
	handle hG_11;
	handle hG_12;
	
	handle hLabieno;
	
	handle hPetarPuente;
		
	//OBJETIVOS
	handle hObjKillLabieno;
	  
  //Niveles de dificultad
  float fNivelDificultad                  = 0;
  float fEntrenamiento;
  float fX;
  
  // otros
  bool bBriefingEnded               = FALSE;
  float fPuntoSincronia             = 0;
  handle hPuntoSincronia            = NULL;
  
}

#include "FunScript.h"


// *******************************************************************
// ***********************   MAIN   **********************************
// *******************************************************************
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
  
  // Las alianzas enemigas iniciales
  CrearAlianzaPorNombre("MALOS", "EGIPCIOS");
  CrearAlianzaPorNombre("MALOS", "ROMANOS");
  CrearAlianzaPorNombre("MALOS", "BARBAROS");
  
  // arrancamos el briefing
  ActivarTrigger("Briefing");
}


//------------------------------------------
Trigger "Main2" [ Inactivo ]  
(
  TRUE
)
Do
{ 
  // Restricciones de la mision
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "BALLESTA_MOVIL_ROMANA", "MALOS");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "CATAPULTA_ROMANA", "MALOS");

  // comprobar el nivel de dificultad
  fNivelDificultad = DarDificultadMision();
  if ( fNivelDificultad == 1 )
  {
    fX = 140;
    
    fEntrenamiento = 60000;
  }
  else
  if ( fNivelDificultad == 2 )
  {
    fX = 128;
    
    fEntrenamiento = 30000;
  }
  else
  if ( fNivelDificultad == 3 )
  {
    fX = 128;
    
    fEntrenamiento = 0;
  }
  else
  {
    fX = 128;
    
    fEntrenamiento = 0;
    
    MensajeChat("Nivel de dificulatd desconocido, oiga");
  }
  
  //Objetivos
  hObjKillLabieno = CrearHandle("Bool");
	  
  AgregarObjetivoMision(hObjKillLabieno, "LTEXT_MISION24_OBJETIVO_00_TXT");
      
  //Las tiendas iluminadas
  IluminarZonaOnOff(158.5, 2, 8.4, 5, "ondeneivi", TRUE);
  IluminarZonaOnOff(134.5, 2, 86.6, 5, "ondeneivitwu", TRUE);
  IluminarZonaOnOff(162.3, 2, 146.1, 5, "ondeneivizri", TRUE);
      
  //Creamos las estrategias de enemigo 
  hEstrategia = CrearEstrategiaScript();
  hCivilizacion = DarCivilizacion("MALOS");
  AsignarEstrategia(hCivilizacion, hEstrategia);
  StartEstrategia(hEstrategia);
  
  hEstrategiaEgipcios = CrearEstrategiaScript();
  hCivilizacionEgipcios = DarCivilizacion("EGIPCIOS");
  AsignarEstrategia(hCivilizacionEgipcios, hEstrategiaEgipcios);
  StartEstrategia(hEstrategiaEgipcios);

  hEstrategiaRomanos = CrearEstrategiaScript();
  hCivilizacionRomanos = DarCivilizacion("ROMANOS");
  AsignarEstrategia(hCivilizacionRomanos, hEstrategiaRomanos);
  StartEstrategia(hEstrategiaRomanos);

  hEstrategiaGalos = CrearEstrategiaScript();
  hCivilizacionGalos = DarCivilizacion("BARBAROS");
  AsignarEstrategia(hCivilizacionGalos, hEstrategiaGalos);
  StartEstrategia(hEstrategiaGalos);

  //Objetivo de la defensa de la fortaleza
  hObjetivoDefensaFortaleza = CrearObjetivo(hEstrategia, "DefensaFortaleza", "MUNDA_FORTRESS");
  AnyadirGrupoAObjetivo(hObjetivoDefensaFortaleza , "G_FORT"); 
  AnyadirObjetivo(hEstrategia, hObjetivoDefensaFortaleza);
  
  SetDelayEntrenamientoTropasPueblo(hEstrategia, "barracon", fEntrenamiento);  
  
  // Los centuriones reclutadores que mantienen la posicion (sin acercarse demasiado al jugador)
  hG_CENTUEGIPCIO = CrearObjetivo(hEstrategiaEgipcios, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_CENTUEGIPCIO, "G_CENTUEGIPCIO");
  AnyadirObjetivo(hEstrategiaEgipcios, hG_CENTUEGIPCIO);
  
  hG_CENTUROMANO = CrearObjetivo(hEstrategiaRomanos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_CENTUROMANO, "G_CENTUROMANO");
  AnyadirObjetivo(hEstrategiaRomanos, hG_CENTUROMANO);
  
  hG_CENTUGALO = CrearObjetivo(hEstrategiaGalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_CENTUGALO, "G_CENTUGALO");
  AnyadirObjetivo(hEstrategiaGalos, hG_CENTUGALO);
  SetParamObjetivo(hG_CENTUGALO, "Tactica", "ProtegerEnte", "TentGala", 1);
      
  //Los arqueritos porculeros de las torres
  InteractuarTropaConEnte("arq", "torre");
  InteractuarTropaConEnte("arqII", "torreII");
  
  InteractuarTropaConEnte("arqrom", "TRomana");
  InteractuarTropaConEnte("arqegi", "TEgipcia");
  InteractuarTropaConEnte("arqgal", "TGala");

  //Labieno defiende la posición valientemente
  hLabieno = CrearObjetivo(hEstrategia, "DefenderPosicion", 23, 77);
  AnyadirTropaAObjetivo(hLabieno, "Labieno");
  //SetParamObjetivo(hLabieno, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hLabieno);

  //Algunos grupos que defienden la posicion
  hG_EGIPCIOS = CrearObjetivo(hEstrategiaEgipcios, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_EGIPCIOS, "G_EGIPCIOS");
  SetParamObjetivo(hG_EGIPCIOS, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategiaEgipcios, hG_EGIPCIOS);
       
  hG_ROMANOS = CrearObjetivo(hEstrategiaRomanos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_ROMANOS, "G_ROMANOS");
  AnyadirObjetivo(hEstrategiaRomanos, hG_ROMANOS);
  
  hG_BARBAROS = CrearObjetivo(hEstrategiaGalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_BARBAROS, "G_BARBAROS");
  SetParamObjetivo(hG_BARBAROS, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategiaGalos, hG_BARBAROS);
  
  hG_EGIPCIOSII = CrearObjetivo(hEstrategiaEgipcios, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_EGIPCIOSII, "G_EGIPCIOSII");
  AnyadirObjetivo(hEstrategiaEgipcios, hG_EGIPCIOSII);
   
  hG_ROMANOSII = CrearObjetivo(hEstrategiaRomanos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_ROMANOSII, "G_ROMANOSII");
  SetParamObjetivo(hG_ROMANOSII, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategiaRomanos, hG_ROMANOSII);
  
  hG_BARBAROSII = CrearObjetivo(hEstrategiaGalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_BARBAROSII, "G_BARBAROSII");
  AnyadirObjetivo(hEstrategiaGalos, hG_BARBAROSII);
  SetParamObjetivo(hG_BARBAROSII, "Tactica", "ProtegerEnte", "TentGala", 1);
  
  hG_EGIPCIOSIII = CrearObjetivo(hEstrategiaEgipcios, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_EGIPCIOSIII, "G_EGIPCIOSIII");
  AnyadirObjetivo(hEstrategiaEgipcios, hG_EGIPCIOSIII);
   
  hG_ROMANOSIII = CrearObjetivo(hEstrategiaRomanos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_ROMANOSIII, "G_ROMANOSIII");
  SetParamObjetivo(hG_ROMANOSIII, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategiaRomanos, hG_ROMANOSIII);
  
  hG_BARBAROSIII = CrearObjetivo(hEstrategiaGalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_BARBAROSIII, "G_BARBAROSIII");
  AnyadirObjetivo(hEstrategiaGalos, hG_BARBAROSIII);
  
  hG_MALOS = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_MALOS, "G_MALOS");
  //SetParamObjetivo(hG_MALOS, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_MALOS);
  
  hG_MALOSII = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_MALOSII, "G_MALOSII");
  //SetParamObjetivo(hG_MALOSII, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_MALOSII);
  
  hG_MALOSIII = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_MALOSIII, "G_MALOSIII");
  //SetParamObjetivo(hG_MALOSIII, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_MALOSIII);
 
  // El "tablero de ajedrez"
  hG_1 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_1, "G_1");
  SetParamObjetivo(hG_1, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_1);
  
  hG_2 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_2, "G_2");
  //SetParamObjetivo(hG_2, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_2);
  
  hG_3 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_3, "G_3");
  SetParamObjetivo(hG_3, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_3);
  
  hG_4 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_4, "G_4");
  //SetParamObjetivo(hG_4, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_4);
  
  hG_5 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_5, "G_5");
  SetParamObjetivo(hG_5, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_5);
  
  hG_6 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_6, "G_6");
  SetParamObjetivo(hG_6, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_6);
  
  hG_7 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_7, "G_7");
  AnyadirObjetivo(hEstrategia, hG_7);
  
  /*
  hG_8 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_8, "G_8");
  AnyadirObjetivo(hEstrategia, hG_8);
  
  hG_9 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_9, "G_9");
  AnyadirObjetivo(hEstrategia, hG_9);
  
  hG_10 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_10, "G_10");
  AnyadirObjetivo(hEstrategia, hG_10);

  //Los grupos de patrullas aleatorias
  hG_PATI = CrearObjetivo(hEstrategiaPompeyo, "PatrullaOleadasPeriodicas", 9000, 9000, 10, 10);
  AnyadirGrupoAObjetivo(hG_PATI, "G_PATI");
  SetParamObjetivo(hG_PATI, "ParametrosTacticas", "AtacarCorriendo", TRUE);	
	SetParamObjetivo(hG_PATI, "FACTOR_POTENCIA_TROPAS", 1);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hG_PATI, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hG_PATI, "MaxNumOleadas", 1);
  AnyadirObjetivo(hEstrategiaPompeyo, hG_PATI);
  
  hG_PATII = CrearObjetivo(hEstrategiaPompeyo, "PatrullaOleadasPeriodicas", 9000, 9000, 10, 10);
  AnyadirGrupoAObjetivo(hG_PATII, "G_PATII");
  SetParamObjetivo(hG_PATII, "ParametrosTacticas", "AtacarCorriendo", TRUE);	
	SetParamObjetivo(hG_PATII, "FACTOR_POTENCIA_TROPAS", 1);
  SetParamObjetivo(hG_PATII, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hG_PATII, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hG_PATII, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hG_PATII, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hG_PATII, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hG_PATII, "MaxNumOleadas", 1);
  AnyadirObjetivo(hEstrategiaPompeyo, hG_PATII);
  
  hG_PATIII = CrearObjetivo(hEstrategiaPompeyo, "PatrullaOleadasPeriodicas", 9000, 9000, 10, 10);
  AnyadirGrupoAObjetivo(hG_PATIII, "G_PATIII");
  SetParamObjetivo(hG_PATIII, "ParametrosTacticas", "AtacarCorriendo", TRUE);	
	SetParamObjetivo(hG_PATIII, "FACTOR_POTENCIA_TROPAS", 1);
  SetParamObjetivo(hG_PATIII, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hG_PATIII, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hG_PATIII, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hG_PATIII, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hG_PATIII, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hG_PATI, "MaxNumOleadas", 1);
  AnyadirObjetivo(hEstrategiaPompeyo, hG_PATIII);
  
  hG_PATIV = CrearObjetivo(hEstrategiaPompeyo, "PatrullaOleadasPeriodicas", 9000, 9000, 10, 10);
  AnyadirGrupoAObjetivo(hG_PATIV, "G_PATIV");
  SetParamObjetivo(hG_PATIV, "ParametrosTacticas", "AtacarCorriendo", TRUE);	
	SetParamObjetivo(hG_PATIV, "FACTOR_POTENCIA_TROPAS", 1);
  SetParamObjetivo(hG_PATIV, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hG_PATIV, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hG_PATIV, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hG_PATIV, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hG_PATIV, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hG_PATIV, "MaxNumOleadas", 1);
  AnyadirObjetivo(hEstrategiaPompeyo, hG_PATIV);
 */
 
  //Activacion de Triggers
  ActivarTrigger("TEgipciaPetada");
  ActivarTrigger("TRomanaPetada");
  ActivarTrigger("TGalaPetada");
  ActivarTrigger("2ªParte");
  ActivarTrigger("AlisTuyos");
  ActivarTrigger("Reunion");
  ActivarTrigger("LabienoEstoico");
  ActivarTrigger("GameOver");
  
  DestruirTrigger("Main2");
  
}


/////////////////////////////////////////////////
// Briefing

Trigger "Briefing" [Inactivo]
(
  TRUE
)
Var
{
  float x, y;
  handle hCamaraEnd;
  handle hPresentacion;
  handle hEscape;
  handle hTimer;
}
Do
{

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

  // efectos especiales: AKI POR MOTIVOS ESPECIALES
  ActivarTrigger("EfectosBriefing");

  // Presentacion
  ActivarPresentacion(TRUE, "LTEXT_MISION24_PRESENTACION_TITULO",
                            "LTEXT_MISION24_PRESENTACION_LUGAR", hPresentacion);
                            
  // camara a donde debe empezar
  EncolarColocarYMirarPunto("BRIEFING_1");
  EjecutarOrdenesCamara();
  
  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));

  ActivarPresentacion(FALSE, "", "", NULL);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolarPausaCamara(4000);
  IntroducirLocucion("24N0", "LTEXT_MISION24_LOCUCION_00_TXT", 7000, 600, 100);
  IntroducirPuntoSincronia();   
  
  EncolaTrayectoriaCamara("BRIEFING_2", FALSE, FALSE, 0, 0);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("24N1", "LTEXT_MISION24_LOCUCION_01_TXT", 8000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  EncolarPausaCamara(3000);
  IntroducirPuntoSincronia();    

  EncolaTrayectoriaCamara("BRIEFING_3", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(2000);
  IntroducirLocucion("24N2", "LTEXT_MISION24_LOCUCION_02_TXT", 10000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("24N3", "LTEXT_MISION24_LOCUCION_03_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();

  EncolarMirarEnteCamara("TentGala");
  EncolarPausaCamara(3000);
  EncolarMirarEnteCamara("TentEgipcia");
  EncolarPausaCamara(3000);
  EncolarMirarEnteCamara("TentRomana");
  EncolarPausaCamara(2000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("24N4", "LTEXT_MISION24_LOCUCION_04_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();    

  EncolaTrayectoriaCamara("BRIEFING_7", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(2000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("24N5", "LTEXT_MISION24_LOCUCION_05_TXT", 6000, 600, 100);
  IntroducirPuntoSincronia();

  IntroducirPonerModoJuegoCamara(TRUE);

  // si no se ha interrumpido
  if ( !HandleDisparado(hEscape) )
  {
    
    // iluminacion
    IluminarZonaOnOff(118, 2, 88, 40, "puente", TRUE);
    IluminarZonaOnOff(85, 2, 85, 40, "llanura", TRUE);
    IluminarZonaOnOff(58, 2, 83, 40, "llanura2", TRUE);
    IluminarZonaOnOff(25, 2, 77, 40, "fortaleza", TRUE);
    IluminarZonaOnOff(161, 2, 9, 40, "torreGala", TRUE);
    IluminarZonaOnOff(162, 2, 144, 40, "torreRomana", TRUE);
    
    // acción
    EjecutarOrdenesCamara();

    // final  
    PonerHandleBoolACamara(hCamaraEnd);
    WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));

    // luces
    IluminarZonaOnOff(118, 2, 88, 40, "puente", FALSE);
    IluminarZonaOnOff(85, 2, 85, 50, "llanura", FALSE);
    IluminarZonaOnOff(58, 2, 83, 40, "llanura2", FALSE);
    IluminarZonaOnOff(25, 2, 77, 40, "fortaleza", FALSE);
    IluminarZonaOnOff(161, 2, 9, 40, "torreGala", FALSE);
    IluminarZonaOnOff(162, 2, 144, 40, "torreRomana", FALSE);
    
  }
  
  VaciarOrdenesCamara();
  VaciarLocuciones();


  // activamos el main2
  ActivarTrigger("Main2");

  // esto es todo amigos
  bBriefingEnded = TRUE;

  // colocamos la cámara
  MirarAPunto(x, y);

  // restaurar
  ActivarCinemascope(FALSE);

  // eliminamos el briefing  
  DestruirTrigger("Briefing");
  
}

/////////////////////////////////////////////
// Efectos del briefing
Trigger "EfectosBriefing" [Inactivo]
(
  TRUE
)
Var
{
  handle hTimer; 
}
Do
{
  
  WaitBool(fPuntoSincronia == 1 || bBriefingEnded);
  
  SetMoverFisicoTropa("Labieno", TRUE);
  TropaSigueRutaPredefinida("Labieno", "LABIENO");
  
  WaitBool(fPuntoSincronia == 2 || bBriefingEnded);
  
  TropaSigueRutaPredefinida("Labieno", "LABIENO_2");
   
  DestruirTrigger("EfectosBriefing"); 
  
}


// Contamos los puntos de sincronia
//-----------------------------------
Trigger "ContarPuntosSincronia" [Inactivo]
(
  Wait(hPuntoSincronia)
)
Do
{
  fPuntoSincronia = fPuntoSincronia + 1;
  PonerHandleEsperaSincronizacion(hPuntoSincronia);
}



//**************************************************************************
// TRIGGERS DE MISION
//**************************************************************************

//-----------------------------------
Trigger "TEgipciaPetada" [Inactivo]
(
 	(EstructuraDestruida("TentEgipcia") && EstaTropaViva("CentuEgipcio")) ||
 	 !EstaTropaViva("CentuEgipcio") 
)
Do
{ 
  if (EstructuraDestruida("TentEgipcia") && EstaTropaViva("CentuEgipcio"))
  {
    
    MensajeLocucionado("24N6","LTEXT_MISION24_MENSAJE_00_TXT");  
    AvisoCivilizacion("CESAR", 133, 90);
    
    //RomperAlianzaPorNombre("MALOS", "EGIPCIOS");
    NeutralizarCivilizacion("EGIPCIOS", TRUE);
    CambiarBandoPorGrupo("G_CENTUEGIPCIO", "CESAR");  
    HacerVisibleGrupoTropas("G_REU2", TRUE);// No estoy seguro de que quiera iluminar este grupo
    HacerVisibleGrupoTropas("G_EGIPCIOS", TRUE);
    HacerVisibleGrupoTropas("G_EGIPCIOSII", TRUE);
    HacerVisibleGrupoTropas("G_EGIPCIOSIII", TRUE);
    
    ActivarTrigger("ReclutarEgipcios");
  }
  
  else
  {
    MensajeLocucionado("24N9","LTEXT_MISION24_MENSAJE_03_TXT");
    AvisoCivilizacion("CESAR", 133, 90);      
  }
  
  IluminarZonaOnOff(134.5, 2, 86.6, 5, "ondeneivitwu", FALSE);
  
  DestruirTrigger("TEgipciaPetada");
}

//-----------------------------------
Trigger "TRomanaPetada" [Inactivo]
(
 	(EstructuraDestruida("TentRomana") && EstaTropaViva("CentuRomano")) ||
 	 !EstaTropaViva("CentuRomano") 
)
Do
{
  if (EstructuraDestruida("TentRomana") && EstaTropaViva("CentuRomano"))
  {
    
    MensajeLocucionado("24N8","LTEXT_MISION24_MENSAJE_02_TXT");  
    AvisoCivilizacion("CESAR", 194, 135);
    
    //RomperAlianzaPorNombre("MALOS", "ROMANOS");
    NeutralizarCivilizacion("ROMANOS", TRUE);
    CambiarBandoPorGrupo("G_CENTUROMANO", "CESAR");
    HacerVisibleGrupoTropas("G_REU3", TRUE);// No estoy seguro de que quiera iluminar este grupo
    HacerVisibleGrupoTropas("G_ROMANOS", TRUE);
    HacerVisibleGrupoTropas("G_ROMANOSII", TRUE);
    HacerVisibleGrupoTropas("G_ROMANOSIII", TRUE);
    
    ActivarTrigger("ReclutarRomanos");
  }
  
  else
  {
    MensajeLocucionado("24NB","LTEXT_MISION24_MENSAJE_05_TXT");
    AvisoCivilizacion("CESAR", 158, 146);      
  }
  
  IluminarZonaOnOff(162.5, 2, 146.1, 5, "ondeneivizri", FALSE);
    
  DestruirTrigger("TRomanaPetada");
}

//-----------------------------------
Trigger "TGalaPetada" [Inactivo]
(
 	(EstructuraDestruida("TentGala") &&	EstaTropaViva("CentuGalo")) ||
 	!EstaTropaViva("CentuGalo") 
)
Do
{
  if (EstructuraDestruida("TentGala") && EstaTropaViva("CentuGalo"))
  {
    
    MensajeLocucionado("24N7","LTEXT_MISION24_MENSAJE_01_TXT");  
    AvisoCivilizacion("CESAR", 156, 10);
    
    //RomperAlianzaPorNombre("MALOS", "BARBAROS");
    NeutralizarCivilizacion("BARBAROS", TRUE);
    CambiarBandoPorGrupo("G_CENTUGALO", "CESAR");
    HacerVisibleGrupoTropas("G_REU1", TRUE);// No estoy seguro de que quiera iluminar este grupo
    HacerVisibleGrupoTropas("G_BARBAROS", TRUE);
    HacerVisibleGrupoTropas("G_BARBAROSII", TRUE);
    HacerVisibleGrupoTropas("G_BARBAROSIII", TRUE);
    
    ActivarTrigger("ReclutarGalos");
  }
   
   else
  {
    MensajeLocucionado("24NA","LTEXT_MISION24_MENSAJE_04_TXT");  
    AvisoCivilizacion("CESAR", 156, 10);
  }
  
  IluminarZonaOnOff(158.5, 2, 8.4, 5, "ondeneivi", FALSE);
    
  DestruirTrigger("TGalaPetada");
}

//---------------------------
Trigger "ReclutarEgipcios" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer; 
}
Do
{
  if ( ReclutarTropasCerca("CentuEgipcio", "EGIPCIOS", 14) )
  {
    MensajeLocucionado("24NC","LTEXT_MISION24_MENSAJE_06_TXT");
    ReclutarTropasCerca("CentuEgipcio", "EGIPCIOS", 18);
  }

  hTimer = CrearTimer(1000);
  Wait(hTimer);
}

//---------------------------
Trigger "ReclutarRomanos" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer; 
}
Do
{
  if ( ReclutarTropasCerca("CentuRomano", "ROMANOS", 14) )
  {
    MensajeLocucionado("24NC","LTEXT_MISION24_MENSAJE_06_TXT");
    ReclutarTropasCerca("CentuRomano", "ROMANOS", 18);
  }

  hTimer = CrearTimer(1000);
  Wait(hTimer);
}

//---------------------------
Trigger "ReclutarGalos" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer; 
}
Do
{
  if ( ReclutarTropasCerca("CentuGalo", "BARBAROS", 14) )
  {
    MensajeLocucionado("24NC","LTEXT_MISION24_MENSAJE_06_TXT");
    ReclutarTropasCerca("CentuGalo", "BARBAROS", 18);
  }

  hTimer = CrearTimer(1000);
  Wait(hTimer);
}

//-----------------------------------
Trigger "2ªParte" [Inactivo]
(
 	DarPorcentajeTropasEnZona("CESAR", "Z_CAMP") > 85
)
Do
{ 

  DisposeHandle(&hG_MALOS);
  DisposeHandle(&hG_MALOSII);
  
  hPetarPuente = CrearObjetivo(hEstrategia, "AtacarPunto", fX, 87); 
  AnyadirGrupoAObjetivo(hPetarPuente, "G_MALOS");
  AnyadirGrupoAObjetivo(hPetarPuente, "G_MALOSII");
  AnyadirObjetivo(hEstrategia, hPetarPuente);
  
  DestruirTrigger("2ªParte");
}

//-----------------------------------
Trigger "AlisTuyos" [Inactivo]
(
 	DarPorcentajeTropasEnZona("CESAR", "Z_Osuna") > 1
)
Do
{
  
  MensajeLocucionado("24ND","LTEXT_MISION24_MENSAJE_07_TXT");
  AvisoCivilizacion("CESAR", 105, 18);
  
  CambiarBandoPorGrupo("G_ALIS", "CESAR");
  CambiarBandoEstructura("town", "CESAR");
  
  DestruirTrigger("AlisTuyos");
}

/*//Este es el que hacia que las tropas mercenarias se volvieran neutrales sin razon aparente
//-----------------------------------
Trigger "Reunion" [Inactivo]
(
 	(HanEntradoCivilizacionesEnZona("Z_REUNION", "CESAR") || HanEntradoCivilizacionesEnZona("Z_REUNIONII", "CESAR"))
)
Do
{ 
  
  NeutralizarCivilizacion("EGIPCIOS", TRUE);
  NeutralizarCivilizacion("ROMANOS", TRUE);
  NeutralizarCivilizacion("BARBAROS", TRUE);
    
  DestruirTrigger("Reunion");
}
*/

//-----------------------------------
Trigger "GameOver" [Inactivo]
(
 	!EstaTropaViva("Labieno") ||
 	CivilizacionEstaKO("CESAR")
)
Do
{
  if (!EstaTropaViva("Labieno"))
  {
    IndicarObjetivoCumplido(hObjKillLabieno);
    FinalizarMision(TRUE);
  }
  else 
  {
    IndicarObjetivoFracasado(hObjKillLabieno);
    FinalizarMision(FALSE);
  }
  
  DestruirTrigger("GameOver");
}

//-----------------------------------
Trigger "LabienoEstoico" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_Muerte", "CESAR")
)
Do
{
  DisposeHandle(&hLabieno);
  
  SetMoverFisicoTropa("Labieno", TRUE);
  TropaSigueRutaPredefinida("Labieno", "R_Muerte");
  
  DestruirTrigger("LabienoEstoico");
}

//------------------------------
Trigger "End" [ Activo ]  
(
  TRUE
)
Do
{
}