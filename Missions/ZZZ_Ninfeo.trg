Var
{	
  handle hEstrategia;
	handle hCivilizacionCPU;
	
	handle hEstrategiaAliados;
	handle hCivilizacionAliados;
		
	handle hEstrategiaMercenarios;
	handle hCivilizacionMercenarios;
	
	handle hDefPuebloI;
	handle hDefPuebloII;
	
	handle hG_A1;
	handle hG_A2;
	handle hG_A3;
	handle hG_A4;
	handle hG_A5;
	handle hG_PLAYA;
	handle hG_CAMINO;
	handle hG_ARQI;
	handle hG_ARQII;
	
	handle hG_P1;
	handle hG_P2;
	handle hG_P3;
	handle hG_P4;
	handle hG_P5;
  handle hG_VANDIDOS;
		
	handle hAsaltoFuerte;
	handle hRefuerzos;
	handle hMercenariosMalos;
	handle hAtaqueSecundario;
	
	
	// Dificultad
	float fNivelDificultad;
	
	// Objetivos
	handle hObjDefensaFortaleza;
	handle hObjMeetAlis;
	handle hObjDefenderAlis;
	handle hObjDiezmarEnemigos;
	
	float fOleadasI;
	float fOleadasII;
	float fOleadasIII;
	float fOleadasIV;
	float fOleadasV;
	float fOleadasVI;
	
	float fTiempoI;
	float fTiempoII;
	float fTiempoIII;
	float fTiempoIV;
	float fTiempoV;
	
	float fEsperaPlayaI;
	float fEsperaPlayaII;
      
  bool bObjDefensaFortaleza         = FALSE;
  bool bObjMeetAlis                 = FALSE;
  bool bNoSeHabiaCreado             = FALSE;
  bool bAunNo                       = FALSE;
  bool bTodaviaNo                   = FALSE;
  bool bAlisTuyos                   = FALSE;
  bool bAtaqueCaminoCorto           = FALSE;
  bool bCarroI                      = FALSE;
  bool bCarroII                     = FALSE;
    
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
   
  // arrancamos el briefing
  ActivarTrigger("Briefing");
}



//-------------------------------------
Trigger "Main2" [Inactivo]
(
  TRUE
)
Do
{
  
  //Los aliados son visibles
  //HacerVisibleGrupoTropas("G_ALI", TRUE);
  
  // Restricciones de la mision
  
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_ARQUERA", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_PESADA", "");
  /*
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "HONDERO", "");
  
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_CAZADOR", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_GERMANA", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_ESPADON", "");
  */
  
  // Objetivos
  hObjDefensaFortaleza = CrearHandle("Bool");
  //hObjDiezmarEnemigos = CrearHandle("Bool");
    
  AgregarObjetivoMision(hObjDefensaFortaleza, "LTEXT_MISION20_OBJETIVO_00_TXT");
  //AgregarObjetivoMision(hObjDiezmarEnemigos, "Diezma la población enemiga");
      
  // Comprobar el nivel de dificultad
  fNivelDificultad = DarDificultadMision();
  if ( fNivelDificultad == 1 )
  { 
    fOleadasI = 90;
	  fOleadasII = 130;
	  fOleadasIII = 150;
	  fOleadasIV = 180;
	  fOleadasV = 190;
	  fOleadasVI = 210;
	  
	  fTiempoI = 7;
	  fTiempoII = 8;
	  fTiempoIII = 9;
	  fTiempoIV = 11;
	  fTiempoV = 4; 
	  
	  fEsperaPlayaI = 360000; // 6 min
	  fEsperaPlayaII = 1200000; // 20 min (10)
  }
  else
  if ( fNivelDificultad == 2 )
  {    
    fOleadasI = 80;
	  fOleadasII = 120;
	  fOleadasIII = 140;
	  fOleadasIV = 170;
	  fOleadasV = 180;
	  fOleadasVI = 200;
	  
	  fTiempoI = 9;
	  fTiempoII = 10;
	  fTiempoIII = 11;
	  fTiempoIV = 13;
	  fTiempoV = 6;
	  
	  fEsperaPlayaI = 300000; // 5 min
	  fEsperaPlayaII = 1080000; // 18 min (8)
  }
  else
  if ( fNivelDificultad == 3 )
  {
    //Una torre que solo aparece en hard
    InteractuarTropaConEnte("ARQ2", "TORRE_2");
    
    fOleadasI = 60;
	  fOleadasII = 100;
	  fOleadasIII = 120;
	  fOleadasIV = 150;
	  fOleadasV = 160;
	  fOleadasVI = 180;
	  
	  fTiempoI = 11;
	  fTiempoII = 12;
	  fTiempoIII = 14;
	  fTiempoIV = 15;
	  fTiempoV = 8; 
	  
	  fEsperaPlayaI = 300000; // 5 min
	  fEsperaPlayaII = 1020000; // 17 min (7)
  }
  else
  {
    fOleadasI = 60;
	  fOleadasII = 100;
	  fOleadasIII = 120;
	  fOleadasIV = 150;
	  fOleadasV = 160;
	  fOleadasVI = 180;
	  
	  fTiempoI = 10;
	  fTiempoII = 11;
	  fTiempoIII = 13;
	  fTiempoIV = 14;
	  fTiempoV = 7; 
	  
	  fEsperaPlayaI = 180000; // 3 min
	  fEsperaPlayaII = 1020000; // 17 min (7)
        
    MensajeChat("Nivel de dificulatd desconocido, oiga");
  }
    
  // Estrategia del enemigo y de los aliados
  hEstrategia = CrearEstrategiaScript();
  hCivilizacionCPU = DarCivilizacion("Enemigos");
  AsignarEstrategia(hCivilizacionCPU, hEstrategia);		
  StartEstrategia(hEstrategia);
    
  hEstrategiaAliados = CrearEstrategiaScript();
  hCivilizacionAliados = DarCivilizacion("Aliados");
  AsignarEstrategia(hCivilizacionAliados, hEstrategiaAliados);		
  StartEstrategia(hEstrategiaAliados);
  
  SetParamEstrategia(hEstrategiaAliados, "AtacarCorriendo", TRUE);
  
  hEstrategiaMercenarios = CrearEstrategiaScript();
  hCivilizacionMercenarios = DarCivilizacion("Tribu");
  AsignarEstrategia(hCivilizacionMercenarios, hEstrategiaMercenarios);		
  StartEstrategia(hEstrategiaMercenarios);
    
  // La gestion del pueblo enemigo
  hDefPuebloI = CrearObjetivo(hEstrategia, "ConquistaPueblo2", "puebloI");
  AnyadirGrupoAObjetivo(hDefPuebloI, "G_DEFPUEBLOI");  
  AnyadirObjetivo(hEstrategia, hDefPuebloI);
  SetParamObjetivo(hDefPuebloI, "NombreGrupoGenerado", "G_1");
  SetParamObjetivo(hDefPuebloI, "PuedePedirRefuerzos", FALSE);
  //SetDelayEntrenamientoTropasPueblo(hEstrategia, "puebloI", 60000);  
  
  hDefPuebloII = CrearObjetivo(hEstrategiaMercenarios, "ConquistaPueblo2", "puebloII");
  AnyadirGrupoAObjetivo(hDefPuebloII, "G_DEFPUEBLOII");  
  AnyadirObjetivo(hEstrategiaMercenarios, hDefPuebloII);
  SetParamObjetivo(hDefPuebloII, "NombreGrupoGenerado", "G_DEFPUEBLOII");
  SetParamObjetivo(hDefPuebloII, "PuedePedirRefuerzos", FALSE);
  SetDelayEntrenamientoTropasPueblo(hEstrategiaMercenarios, "puebloII", 180000);  
  



  hAsaltoFuerte = CrearObjetivo(hEstrategia, "OleadasFortaleza", "NINFEO_FORTRESS");
  
  // Le damos tropas iniciales
  AnyadirGrupoAObjetivo(hAsaltoFuerte, "G_1");
  
  // Que coja tropas de ambos pueblos
  SetParamObjetivo(hAsaltoFuerte, "ObjetivoAtracable", hDefPuebloI);
    
  SetParamObjetivo(hAsaltoFuerte, "RobarTropasEducadamente", FALSE);
  
  SetParamObjetivo(hAsaltoFuerte, "Secuencial", TRUE);
  
  SetParamObjetivo(hAsaltoFuerte, "ResetComposicion", "AsaltoMuralla");
  SetParamObjetivo(hAsaltoFuerte, "AddComposicion", "AsaltoMuralla", "FORT_ESCALAS", 30, TRUE);
  SetParamObjetivo(hAsaltoFuerte, "AddComposicion", "AsaltoMuralla", "FORT_MELEE_PESADA", 30, FALSE);
  SetParamObjetivo(hAsaltoFuerte, "AddComposicion", "AsaltoMuralla", "FORT_PIQUEROS", 20, FALSE);
  SetParamObjetivo(hAsaltoFuerte, "AddComposicion", "AsaltoMuralla", "FORT_DISTANCIA", 20, FALSE);
  
  SetParamObjetivo(hAsaltoFuerte, "ResetComposicion", "AtaquePuerta");
  SetParamObjetivo(hAsaltoFuerte, "AddComposicion", "AtaquePuerta", "FORT_ARIETE", 1, TRUE);
  SetParamObjetivo(hAsaltoFuerte, "AddComposicion", "AtaquePuerta", "FORT_CATAPULTAS", 2, TRUE); 
  SetParamObjetivo(hAsaltoFuerte, "AddComposicion", "AtaquePuerta", "FORT_MELEE_PESADA", 2, FALSE);
  SetParamObjetivo(hAsaltoFuerte, "AddComposicion", "AtaquePuerta", "FORT_DISTANCIA", 3, FALSE);
  
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AsaltoMuralla",  fTiempoI, fTiempoI, fOleadasI, fOleadasI, FALSE, 68, 168, 108, 147);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AtaquePuerta",  fTiempoI, fTiempoI, fOleadasI, fOleadasI, FALSE, 7, 95);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoMuralla", fTiempoII, fTiempoII, fOleadasII, fOleadasII, FALSE, 62, 133);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AsaltoMuralla",  fTiempoII, fTiempoII, fOleadasII, fOleadasII, FALSE, 7, 95);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AsaltoMuralla",  fTiempoIII, fTiempoIII, fOleadasIII, fOleadasIII, FALSE, 68, 168, 108, 147);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AtaquePuerta",  fTiempoIII, fTiempoIII, fOleadasIII, fOleadasIII, FALSE, 7, 95);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoMuralla", fTiempoIV, fTiempoIV, fOleadasIV, fOleadasIV, FALSE, 62, 133);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AsaltoMuralla",  fTiempoIV, fTiempoIV, fOleadasIV, fOleadasIV, FALSE, 7, 95);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AsaltoMuralla",  fTiempoI, fTiempoI, fOleadasV, fOleadasV, FALSE, 68, 168, 108, 147);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AtaquePuerta",  fTiempoI, fTiempoI, fOleadasV, fOleadasV, FALSE, 7, 95);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoMuralla", fTiempoV, fTiempoV, fOleadasVI, fOleadasVI, FALSE, 62, 133);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AsaltoMuralla",  fTiempoV, fTiempoV, fOleadasVI, fOleadasVI, FALSE, 7, 95);
  
  AnyadirObjetivo(hEstrategia, hAsaltoFuerte);

  // Quiero que la primera oleada salga inmediatamente. OJO!, siempre poner despues de 'AnyadirObjetivo'
  SetParamObjetivo(hAsaltoFuerte, "RetardoSiguiente", 30);
  
  //Tropas enemigas que mantienen la posicion
  hG_A1 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_A1, "G_A1");
  SetParamObjetivo(hG_A1, "Tactica", "ActitudBatallon", "Defensiva");
  //SetParamObjetivo(hG_A1, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_A1);
  
  hG_A2 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_A2, "G_A2");
  SetParamObjetivo(hG_A2, "Tactica", "ActitudBatallon", "Defensiva");
  SetParamObjetivo(hG_A2, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_A2);
  
  hG_A3 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_A3, "G_A3");
  SetParamObjetivo(hG_A3, "Tactica", "ActitudBatallon", "Defensiva");
  //SetParamObjetivo(hG_A3, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_A3);
  
  hG_A4 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_A4, "G_A4");
  SetParamObjetivo(hG_A4, "Tactica", "ActitudBatallon", "Defensiva");
  SetParamObjetivo(hG_A4, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_A4);
  
  hG_A5 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_A5, "G_A5");
  SetParamObjetivo(hG_A5, "Tactica", "ActitudBatallon", "Defensiva");
  //SetParamObjetivo(hG_A5, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_A5);
  
  hG_VANDIDOS = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_VANDIDOS, "G_VANDIDOS");
  SetParamObjetivo(hG_VANDIDOS, "Tactica", "ActitudBatallon", "Defensiva");
  SetParamObjetivo(hG_VANDIDOS, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_VANDIDOS);
  
  //Los arqueros en las torres
  InteractuarTropaConEnte("ARQ1", "TORRE_1");
    
  hG_PLAYA = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_PLAYA, "G_PLAYA");
  //SetParamObjetivo(hG_PLAYA, "Tactica", "ActitudBatallon", "Defensiva");
  //SetParamObjetivo(hG_PLAYA, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_PLAYA);
  
  hG_CAMINO = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_CAMINO, "G_CAMINO");
  //SetParamObjetivo(hG_CAMINO, "Tactica", "ActitudBatallon", "Defensiva");
  SetParamObjetivo(hG_CAMINO, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_CAMINO);
  
  hAtaqueSecundario = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hAtaqueSecundario, "G_CAMINOII");
  SetParamObjetivo(hAtaqueSecundario, "Tactica", "ActitudBatallon", "Defensiva");
  //SetParamObjetivo(hAtaqueSecundario, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hAtaqueSecundario);
  
  // Las torres de la planicie
  InteractuarTropaConEnte("ARQUISI", "TORREI");
  InteractuarTropaConEnte("ARQUISII", "TORREII");
  
  hG_ARQI = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_ARQI, "G_ARQI");
  AnyadirObjetivo(hEstrategia, hG_ARQI);
  
  hG_ARQII = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_ARQII, "G_ARQII");
  AnyadirObjetivo(hEstrategia, hG_ARQII);
  
  // Carrera de obstáculos
  hG_P1 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_P1, "G_P1");
  SetParamObjetivo(hG_P1, "Tactica", "ActitudBatallon", "Defensiva");
  //SetParamObjetivo(hG_P1, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_P1);
  
  hG_P2 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_P2, "G_P2");
  SetParamObjetivo(hG_P2, "Tactica", "ActitudBatallon", "Defensiva");
  //SetParamObjetivo(hG_P2, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_P2);
  
  hG_P3 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_P3, "G_P3");
  SetParamObjetivo(hG_P3, "Tactica", "ActitudBatallon", "Defensiva");
  //SetParamObjetivo(hG_P3, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_P3);
  
  hG_P4 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_P4, "G_P4");
  SetParamObjetivo(hG_P4, "Tactica", "ActitudBatallon", "Defensiva");
  //SetParamObjetivo(hG_P4, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_P4);
  
  hG_P5 = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_P5, "G_P5");
  SetParamObjetivo(hG_P5, "Tactica", "ActitudBatallon", "Defensiva");
  //SetParamObjetivo(hG_P5, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hG_P5);
  
  // Estos son para que unos triggers revienten cuando deban y no antes...
  bAunNo = TRUE;
  bTodaviaNo = TRUE;
  
	// Activacion de triggers
	ActivarTrigger("A5_A2_A3_UP");
	ActivarTrigger("DialogoOfensivo");
	ActivarTrigger("ConocerMercenarios");
	ActivarTrigger("LosAlisEnLaPlaya");
	ActivarTrigger("LleganLosRefuerzosII");
	ActivarTrigger("LleganLosRefuerzosIII");
	ActivarTrigger("AlisTuyos");
	ActivarTrigger("AtaqueSecundarioEnElCamino");
	ActivarTrigger("ConseguirCaballos");
	ActivarTrigger("MercenariosEnemigos");
	ActivarTrigger("FortalezaDefendida");
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
    
  // Presentacion
  ActivarPresentacion(TRUE, "LTEXT_MISION20_PRESENTACION_TITULO",
                            "LTEXT_MISION20_PRESENTACION_LUGAR", hPresentacion);
                            
  // camara a donde debe empezar
  EncolarColocarYMirarPunto("BRIEFING_1");
  EjecutarOrdenesCamara();
  
  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));
 
  ActivarPresentacion(FALSE, "", "", NULL);

 

    // cámaras
    IntroducirPonerModoJuegoCamara(FALSE);

    EncolaTrayectoriaCamara("BRIEFING_2", FALSE, FALSE, 0, 0);
    EncolarPausaCamara(2000);
    IntroducirLocucion("20N0", "LTEXT_MISION20_LOCUCION_00_TXT", 8000, 600, 100);
    IntroducirPuntoSincronia();    
    
    EncolarColocarYMirarPunto("BRIEFING_3");
    EncolarPausaCamara(6000);
    EncolarColocarYMirarPunto("BRIEFING_4");
    EncolarPausaCamara(2000);
    IntroducirLocucion("", "", 100, 0, 0);
    IntroducirLocucion("20N1", "LTEXT_MISION20_LOCUCION_01_TXT", 12000, 600, 100);
    IntroducirPuntoSincronia();        
   
    EncolarColocarYMirarPunto("BRIEFING_5");
    EncolarPausaCamara(8000);
    IntroducirLocucion("", "", 100, 0, 0);
    IntroducirLocucion("20N2", "LTEXT_MISION20_LOCUCION_02_TXT", 8000, 600, 100); 
    IntroducirPuntoSincronia();    

    EncolarColocarYMirarPunto("BRIEFING_8");
    EncolarPausaCamara(2000);
    EncolaTrayectoriaCamara("BRIEFING_6", FALSE, FALSE, 0, 0);
    IntroducirLocucion("", "", 100, 0, 0);
    IntroducirLocucion("20N3", "LTEXT_MISION20_LOCUCION_03_TXT", 7000, 600, 100);
    IntroducirPuntoSincronia();    

    IntroducirLocucion("", "", 100, 0, 0);
    IntroducirLocucion("20N4", "LTEXT_MISION20_LOCUCION_04_TXT", 4000, 600, 100);
    IntroducirPuntoSincronia();    
    
    IntroducirPonerModoJuegoCamara(TRUE);


  // si no se ha interrumpido
  if ( !HandleDisparado(hEscape) )
  {

    // truco siniestro para la iluminación
    CrearAlianzaPorNombre("Romanos", "Enemigos");
    CrearAlianzaPorNombre("Romanos", "Tribu");
    IluminarZonaOnOff(18, 2, 14, 15,"barco", TRUE);

    // efectos especiales
    ActivarTrigger("EfectosBriefing");
    
    // acción
    EjecutarOrdenesCamara();

    // final  
    PonerHandleBoolACamara(hCamaraEnd);
    WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
        
    // truco siniestro para la iluminación
    RomperAlianzaPorNombre("Romanos", "Enemigos");
    RomperAlianzaPorNombre("Enemigos", "Tribu");
    IluminarZonaOnOff(18, 2, 14, 15,"barco", FALSE);
    
    NeutralizarCivilizacion("Tribu", TRUE);
  
  }
  
  VaciarOrdenesCamara();
  VaciarLocuciones();

  // activamos el main2
  ActivarTrigger("Main2");

  // esto es todo amigos
  bBriefingEnded = TRUE;

  // colocamos la cámara
  if ( HandleDisparado(hEscape) )
  {
    MirarAPunto(x, y);
  }

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


// **************************************************************************
// TRIGGERS DE MISION
// **************************************************************************

//--------------------------------------------
Trigger "A5_A2_A3_UP" [Inactivo]
(
	HanEntradoCivilizacionesEnZona("Z_REACCION", "Romanos")
)
Do
{
  SetParamObjetivo(hG_A2, "Tactica", "ActitudBatallon", "Ofensiva");
  SetParamObjetivo(hG_A3, "Tactica", "ActitudBatallon", "Ofensiva");
  SetParamObjetivo(hG_A5, "Tactica", "ActitudBatallon", "Ofensiva");
	
	DestruirTrigger("A5_A2_A3_UP");
}

//--------------------------------------------
Trigger "DialogoOfensivo" [Inactivo]
(
	HanEntradoCivilizacionesEnZona("Z_DIALOGO", "Romanos")
)
Do
{
  SetParamObjetivo(hG_VANDIDOS, "Tactica", "ActitudBatallon", "Ofensiva");
	
	DestruirTrigger("DialogoOfensivo");
}

//------------------------------------------
Trigger "ConocerMercenarios" [Inactivo]
(
	HanEntradoCivilizacionesEnZona("Z_ADVERTENCIA", "Romanos") &&
	!HaEntradoTropaEnZona("Z_ADVERTENCIA", "CarroI") &&
	!HaEntradoTropaEnZona("Z_ADVERTENCIA", "CarroII")
) 
Do
{

  MensajeLocucionado("20N5","LTEXT_MISION20_MENSAJE_00_TXT");
  AvisoCivilizacion("Romanos", 154, 150);
	
	DestruirTrigger("ConocerMercenarios");
}

//--------------------------------------------
Trigger "AlisTuyos" [Inactivo]
(
	HanEntradoCivilizacionesEnZona("Z_LlegadaAlis", "Aliados")
)
Do
{
  bAlisTuyos = TRUE;
		
	//CambiarBando("Aliados", "Romanos");
	
	IndicarObjetivoCumplido(hObjDefenderAlis);
	//IndicarObjetivoCumplido(hObjDiezmarEnemigos);
	//IndicarObjetivoCumplido(hObjDefensaFortaleza);
	
  //FinalizarMision(TRUE);
  
  GrupoTropasSeguirRutaPredefinida("G_ALI", "R_Triunfo"); 
	
	ActivarTrigger("HappyEnd");
	
	DestruirTrigger("AlisTuyos");
}

//--------------------------------------------
Trigger "HappyEnd" [Inactivo]
(
	TRUE
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(3000); // 3 sec antes de acabar la mision
  Wait(hTimer); 
  	
	//IndicarObjetivoCumplido(hObjDiezmarEnemigos);
	IndicarObjetivoCumplido(hObjDefensaFortaleza);
	
  FinalizarMision(TRUE);
		
	DestruirTrigger("HappyEnd");
}

//--------------------------------------------
Trigger "LosAlisEnLaPlaya" [Inactivo]
(
	TRUE
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(600000); // 10 min //**
  Wait(hTimer); 
  
  bAunNo = FALSE;
    
  CrearAlianzaPorNombre("Romanos", "Aliados");
  
  if (bTodaviaNo)
  {      
    hObjMeetAlis = CrearHandle("Bool");
    AgregarObjetivoMision(hObjMeetAlis, "LTEXT_MISION20_OBJETIVO_01_TXT");
    ObjetivosMisionCambiados();
    
    ActivarTrigger("CinematicaRefuerzos");
  }

			
	DestruirTrigger("LosAlisEnLaPlaya");
}

//--------------------------------------------
Trigger "LleganLosRefuerzos" [Inactivo]
(
	TRUE
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(fEsperaPlayaI); // 4 min //**
  Wait(hTimer); 
  
  DestruirTrigger("LosAlisEnLaPlaya");
  
  DestruirTrigger("LleganLosRefuerzosII");
  DestruirTrigger("LleganLosRefuerzosIII");
  
  EliminarObjetivoMision(hObjMeetAlis);

  hObjDefenderAlis = CrearHandle("Bool");
  AgregarObjetivoMision(hObjDefenderAlis, "LTEXT_MISION20_OBJETIVO_02_TXT");
  
  MensajeLocucionado("20N8","LTEXT_MISION20_MENSAJE_03_TXT");
  ObjetivosMisionCambiados();
  
  AvisoCivilizacion("Romanos", 174, 48);
  	
	if (bNoSeHabiaCreado)
	{
	  DestruirTrigger("LosAlisEnLaPlaya");
	}
	
	ActivarTrigger("LosRefuerzosVanYa");
		
	DestruirTrigger("LleganLosRefuerzos");
}

//--------------------------------------------
Trigger "LleganLosRefuerzosII" [Inactivo]
(
	TRUE
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(fEsperaPlayaII); // 18 min //**
  Wait(hTimer); 
  
  DestruirTrigger("LosAlisEnLaPlaya");

  DestruirTrigger("LleganLosRefuerzos");
  DestruirTrigger("LleganLosRefuerzosIII");

  EliminarObjetivoMision(hObjMeetAlis);
  
  hObjDefenderAlis = CrearHandle("Bool");
  AgregarObjetivoMision(hObjDefenderAlis, "LTEXT_MISION20_OBJETIVO_02_TXT");

	MensajeLocucionado("20N8","LTEXT_MISION20_MENSAJE_03_TXT");
	ObjetivosMisionCambiados();
	
	ActivarTrigger("CinematicaRefuerzos");
	
	ActivarTrigger("LosRefuerzosVanYa");
		
	DestruirTrigger("LleganLosRefuerzosII");
}

//--------------------------------------------
Trigger "LleganLosRefuerzosIII" [Inactivo]
(
	HanEntradoCivilizacionesEnZona("Z_Refuerzos", "Romanos")
)
Do
{
  bObjMeetAlis = TRUE;
  bNoSeHabiaCreado = TRUE;
   
  DestruirTrigger("LleganLosRefuerzos");
  DestruirTrigger("LleganLosRefuerzosII");
  
  bTodaviaNo = FALSE;

  // CEINEMATICA CHACHI DE QUE LLEGAN LOS REFUERZOS
	MensajeLocucionado("20N8","LTEXT_MISION20_MENSAJE_03_TXT");
	ActivarTrigger("CinematicaRefuerzos");
	
	if (bAunNo)
	{
	  hObjMeetAlis = CrearHandle("Bool");
    AgregarObjetivoMision(hObjMeetAlis, "LTEXT_MISION20_OBJETIVO_01_TXT");
    //ObjetivosMisionCambiados();
    
    ActivarTrigger("CinematicaRefuerzos");
  }
	
	hObjDefenderAlis = CrearHandle("Bool");
  AgregarObjetivoMision(hObjDefenderAlis, "LTEXT_MISION20_OBJETIVO_02_TXT");
  ObjetivosMisionCambiados();
	
	ActivarTrigger("LosRefuerzosVanYa");
	
	DestruirTrigger("LleganLosRefuerzosIII");
}



////////////////////////////////////////////////////////
// CINEMATICA DE LLEGADA DE REFUERZOS A LA PLAYA

Trigger "CinematicaRefuerzos" [Inactivo]
(
  TRUE
)
Var
{
  float x, y;
  handle hCamaraEnd;
  handle hEscape;
  handle hTimer;
}
Do
{


  // Iluminar
  IluminarZonaOnOff(145,3,65,20,"malosplaya", TRUE);

  hTimer = CrearTimer(500);
  Wait(hTimer);

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

  EncolaTrayectoriaCamara("EVENTO_1", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  IntroducirLocucion("20B0", "LTEXT_MISION20_EVENTO1_00_TXT", 4000, 600, 100);
  IntroducirPuntoSincronia();    
    
  EncolaTrayectoriaCamara("EVENTO_2", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  IntroducirLocucion("20B1", "LTEXT_MISION20_EVENTO1_01_TXT", 6000, 600, 100);
  IntroducirPuntoSincronia();    
    
  IntroducirPonerModoJuegoCamara(TRUE);

  // acción
  EjecutarOrdenesCamara();

  // final  
  PonerHandleBoolACamara(hCamaraEnd);
  WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
        
  VaciarOrdenesCamara();
  VaciarLocuciones();
    
  MirarAPunto(x, y);

  // restaurar
  PararLogica(FALSE);
  ActivarCinemascope(FALSE);

  IluminarZonaOnOff(145,3,65,20,"malosplaya", FALSE);

  // eliminamosel trigger  
  DestruirTrigger("CinematicaRefuerzos");
  
}







//--------------------------------------------
Trigger "LosRefuerzosVanYa" [Inactivo]
(
	TRUE
)
Do
{  
  //HacerVisibleGrupoTropas("G_ALI", FALSE);
  
  CrearAlianzaPorNombre("Romanos", "Aliados");
  
  if (!EstaPuebloConquistado("Enemigos", "puebloI"))
  {
    hRefuerzos = CrearObjetivo(hEstrategiaAliados, "PatrullarRuta", "R_AlisII");
    AnyadirGrupoAObjetivo(hRefuerzos, "G_ALI"); 
    AnyadirObjetivo(hEstrategiaAliados,  hRefuerzos);
    
    bAtaqueCaminoCorto = TRUE;
  }
  
  else
  {
    hRefuerzos = CrearObjetivo(hEstrategiaAliados, "PatrullarRuta", "R_Alis");
    AnyadirGrupoAObjetivo(hRefuerzos, "G_ALI"); 
    AnyadirObjetivo(hEstrategiaAliados,  hRefuerzos);
  }
  
  // LOS PONEMOS A SEGUIR LA RUTA EN DEFENSIVO
  SetParamObjetivo(hRefuerzos, "PatrullarDefensivo", TRUE);
  
  SetParamObjetivo(hG_A1, "Tactica", "ActitudBatallon", "Ofensiva");
  SetParamObjetivo(hG_A2, "Tactica", "ActitudBatallon", "Ofensiva");
  SetParamObjetivo(hG_A3, "Tactica", "ActitudBatallon", "Ofensiva");
  SetParamObjetivo(hG_A4, "Tactica", "ActitudBatallon", "Ofensiva");
  SetParamObjetivo(hG_A5, "Tactica", "ActitudBatallon", "Ofensiva");
  
  if (bObjMeetAlis)
  {
  IndicarObjetivoCumplido(hObjMeetAlis);
  }
  
  ActivarTrigger("RutaNoVuelta"); 
  
	DestruirTrigger("LosRefuerzosVanYa");
}

//--------------------------------------------
Trigger "RutaNoVuelta" [Inactivo]
(
	HanEntradoCivilizacionesEnZona("Z_NoVuelta", "Aliados") &&
	!bAtaqueCaminoCorto
)
Var
{
  handle hTimer;
}
Do
{ 
  DisposeHandle(&hRefuerzos);
  
  //CambiarObjetivo(&hRefuerzos, "DefensaSemiCoordinada");
  
  hRefuerzos = CrearObjetivo(hEstrategiaAliados, "PatrullarRuta", "R_NoVuelta");
  AnyadirGrupoAObjetivo(hRefuerzos, "G_ALI"); 
  AnyadirObjetivo(hEstrategiaAliados,  hRefuerzos);
       
  // LOS PONEMOS A SEGUIR LA RUTA EN DEFENSIVO
  SetParamObjetivo(hRefuerzos, "PatrullarDefensivo", TRUE);
     
  hTimer = CrearTimer(140000); // 2 min 20 sec
  Wait(hTimer); 
  
  DisposeHandle(&hG_A1);
  DisposeHandle(&hG_A2);
  DisposeHandle(&hG_A4);
      
  hG_A1 = CrearObjetivo(hEstrategia, "AtacarPunto", 46, 139);
  AnyadirGrupoAObjetivo(hG_A1, "G_A1");
  AnyadirObjetivo(hEstrategia, hG_A1);
  
  hG_A2 = CrearObjetivo(hEstrategia, "AtacarPunto", 71, 118);
  AnyadirGrupoAObjetivo(hG_A2, "G_A2");
  AnyadirObjetivo(hEstrategia, hG_A2);
    
  hG_A4 = CrearObjetivo(hEstrategia, "AtacarPunto", 82, 85);
  AnyadirGrupoAObjetivo(hG_A4, "G_A4");
  AnyadirObjetivo(hEstrategia, hG_A4);
  
  hTimer = CrearTimer(60000); // 60 sec 
  Wait(hTimer); 
  
  DisposeHandle(&hG_A3);
    
  hG_A3 = CrearObjetivo(hEstrategia, "AtacarPunto", 100, 72);
  AnyadirGrupoAObjetivo(hG_A3, "G_A3");
  AnyadirObjetivo(hEstrategia, hG_A3);
  
  hTimer = CrearTimer(60000); // 60 sec 
  Wait(hTimer); 
  
  DisposeHandle(&hG_A5);
  
  hG_A5 = CrearObjetivo(hEstrategia, "AtacarPunto", 117, 64);
  AnyadirGrupoAObjetivo(hG_A5, "G_A5");
  AnyadirObjetivo(hEstrategia, hG_A5);
    
	DestruirTrigger("RutaNoVuelta");
}

//--------------------------------------------
Trigger "AtaqueAlCaminoAlternativo" [Activo]
(
	bAtaqueCaminoCorto
)
Var
{
  handle hTimer;
}
Do
{  
  DisposeHandle(&hG_A1);
  DisposeHandle(&hG_A2);
  DisposeHandle(&hG_A4);
      
  hG_A1 = CrearObjetivo(hEstrategia, "AtacarPunto", 46, 139);
  AnyadirGrupoAObjetivo(hG_A1, "G_A1");
  AnyadirObjetivo(hEstrategia, hG_A1);
  
  hG_A2 = CrearObjetivo(hEstrategia, "AtacarPunto", 71, 118);
  AnyadirGrupoAObjetivo(hG_A2, "G_A2");
  AnyadirObjetivo(hEstrategia, hG_A2);
    
  hG_A4 = CrearObjetivo(hEstrategia, "AtacarPunto", 82, 85);
  AnyadirGrupoAObjetivo(hG_A4, "G_A4");
  AnyadirObjetivo(hEstrategia, hG_A4);
  
  hTimer = CrearTimer(60000); // 60 sec 
  Wait(hTimer); 
  
  DisposeHandle(&hG_A3);
    
  hG_A3 = CrearObjetivo(hEstrategia, "AtacarPunto", 100, 72);
  AnyadirGrupoAObjetivo(hG_A3, "G_A3");
  AnyadirObjetivo(hEstrategia, hG_A3);
  
  hTimer = CrearTimer(60000); // 60 sec 
  Wait(hTimer); 
  
  DisposeHandle(&hG_A5);
  
  hG_A5 = CrearObjetivo(hEstrategia, "AtacarPunto", 117, 64);
  AnyadirGrupoAObjetivo(hG_A5, "G_A5");
  AnyadirObjetivo(hEstrategia, hG_A5);
    
  DestruirTrigger("AtaqueAlCaminoAlternativo");
}

/*
//------------------------------------------
Trigger "FortalezaDefendida" [Inactivo]
(
	(DarPotenciaCivilizacion("Enemigos") < 50000) // + o -  
) 
Do
{
  DestruirTrigger("GameOver");
  
	MensajeChat("Perfect, has conseguido que los enemigos");
	MensajeChat("sean solo cuatro gatos");
	MensajeChat("ya podemos irnos...");
	IndicarObjetivoCumplido(hObjDiezmarEnemigos);
	IndicarObjetivoCumplido(hObjDefensaFortaleza);
	
  FinalizarMision(TRUE);
		
	DestruirTrigger("FortalezaDefendida");
}
*/

//------------------------------------------
Trigger "GameOver" [Inactivo]
(
	EstructuraDestruida("BarraconNinfeo") ||
	CivilizacionEstaKO("Aliados")
) 
Do
{
	
	if (EstructuraDestruida("BarraconNinfeo"))
	{
	DestruirTrigger("FortalezaDefendida");
	IndicarObjetivoFracasado(hObjDefensaFortaleza);
	FinalizarMision(FALSE);
  }
  
  if (CivilizacionEstaKO("Aliados"))
	{
	  if (!bAlisTuyos)
	  {
	   DestruirTrigger("FortalezaDefendida");
	   IndicarObjetivoFracasado(hObjDefenderAlis);
	   FinalizarMision(FALSE);
	  }
  }
  ActivarTrigger("GameOverII");	
	DestruirTrigger("GameOver");
}

//------------------------------------------
Trigger "GameOverII" [Inactivo]
(
	EstructuraDestruida("BarraconNinfeo")
) 
Do
{
		
	DestruirTrigger("FortalezaDefendida");
	IndicarObjetivoFracasado(hObjDefensaFortaleza);
	FinalizarMision(FALSE);
  
  DestruirTrigger("GameOverII");
}

//--------------------------------------------
Trigger "ConseguirCaballos" [Inactivo]
(
	(HaEntradoTropaEnZona("Z_Mercenarios", "CarroI")) ||
  (HaEntradoTropaEnZona("Z_Mercenarios", "CarroII"))	
)
Do
{
  DestruirTrigger("ConocerMercenarios");
  
	MensajeLocucionado("20N6","LTEXT_MISION20_MENSAJE_01_TXT");
	AvisoCivilizacion("Romanos", 154, 150);
	
	CambiarBandoPorGrupo("G_CABALLOS", "Romanos");
			
	ActivarTrigger("LleganLosRefuerzos");
	
	if (HaEntradoTropaEnZona("Z_Mercenarios", "CarroI")) 
	{
	CambiarBandoPorGrupo("G_CARRO1", "Tribu");
	NeutralizarCivilizacion("Tribu", TRUE);
	bCarroI = TRUE;
	//ActivarTrigger("LlevarseCarroI");
  }
		
	if (HaEntradoTropaEnZona("Z_Mercenarios", "CarroII")) 
	{
	CambiarBandoPorGrupo("G_CARRO2", "Tribu");
	NeutralizarCivilizacion("Tribu", TRUE);  
	bCarroII = TRUE;
	//ActivarTrigger("LlevarseCarroII");
  }
	
	ActivarTrigger("NeutralizarCarros");
	
	DestruirTrigger("ConseguirCaballos");
	
}

//--------------------------------------------
Trigger "NeutralizarCarros" [Inactivo]
(
	(HaEntradoTropaEnZona("Z_Mercenarios", "CarroI") && !bCarroI) ||
  (HaEntradoTropaEnZona("Z_Mercenarios", "CarroII") && !bCarroII)	
)
Do
{
  if (HaEntradoTropaEnZona("Z_Mercenarios", "CarroI")) 
	{
	CambiarBandoPorGrupo("G_CARRO1", "Tribu");
	NeutralizarCivilizacion("Tribu", TRUE);
	}
		
	if (HaEntradoTropaEnZona("Z_Mercenarios", "CarroII")) 
	{
	CambiarBandoPorGrupo("G_CARRO2", "Tribu");
	NeutralizarCivilizacion("Tribu", TRUE);  
	}
	
	DestruirTrigger("NeutralizarCarros");
}

//--------------------------------------------
Trigger "LlevarseCarroI" [Inactivo]
(
	(!HaEntradoTropaEnZona("Z_Mercenarios", "CarroI") && EstaTropaViva("CarroI"))
)
Do
{
  
  CambiarBandoPorGrupo("G_CABALLOS", "Tribu");
	NeutralizarCivilizacion("Tribu", TRUE);
				
	DestruirTrigger("LlevarseCarroI");
}

//--------------------------------------------
Trigger "LlevarseCarroII" [Inactivo]
(
  (!HaEntradoTropaEnZona("Z_Mercenarios", "CarroII") && EstaTropaViva("CarroII"))	
)
Do
{
  
  CambiarBandoPorGrupo("G_CABALLOS", "Tribu");
	NeutralizarCivilizacion("Tribu", TRUE);
				
	DestruirTrigger("LlevarseCarroII");
}

//--------------------------------------------
Trigger "MercenariosEnemigos" [Inactivo]
(
	EsEstructuraAtacada("MERCENARIOS_GUARNICION", "Romanos") ||
	EsEstructuraAtacada("puebloII", "Romanos")
)
Do
{
  MensajeLocucionado("20N7","LTEXT_MISION20_MENSAJE_02_TXT");
  AvisoCivilizacion("Romanos", 154, 150);
	
	CambiarBandoPorGrupo("G_CABALLOS", "Tribu");
		
	CrearAlianzaPorNombre("Enemigos", "Tribu");
	
	DisposeHandle(&hDefPuebloII);
	
	hMercenariosMalos= CrearObjetivo(hEstrategiaMercenarios, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hMercenariosMalos, "G_DEFPUEBLOII");
  AnyadirGrupoAObjetivo(hMercenariosMalos, "G_CABALLOS");
  AnyadirObjetivo(hEstrategiaMercenarios, hMercenariosMalos);
  
  DestruirTrigger("ConseguirCaballos");
			
	DestruirTrigger("MercenariosEnemigos");
}

//--------------------------------------------
Trigger "AtaqueSecundarioEnElCamino" [Inactivo]
(
	DarTropasVivasDeGrupo("G_CAMINO") == 0
)
Do
{
  DisposeHandle(&hAtaqueSecundario);
    
  hAtaqueSecundario = CrearObjetivo(hEstrategia, "AtacarPunto", 141, 176);
  AnyadirGrupoAObjetivo(hAtaqueSecundario, "G_CAMINOII");
  AnyadirObjetivo(hEstrategia, hAtaqueSecundario);
    			
	DestruirTrigger("AtaqueSecundarioEnElCamino");
}

//---------------------------
Trigger "End" [ Activo ]  
(
  TRUE
)
Do
{
}