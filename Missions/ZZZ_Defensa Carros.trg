Var
{
  handle hEstrategia;
  handle hCivilizacionCPU;
  
  handle hEstrategiaAliados;
  handle hCivilizacionAliados;
  
  handle hCivilizacionGuias;  
  
  handle hGuia;
  
  handle hTacticaMantenerPosicion;
	handle hTacticaMantenerPosicionII;
	handle hTacticaMantenerPosicionIII;
	handle hTacticaMantenerPosicionIV;
	handle hTacticaMantenerPosicionV;
	handle hTacticaMantenerPosicionVI;
	handle hTacticaMantenerPosicionVII;
	handle hG_SUBIDA;
	handle hObjCazaYCaptura;
	
  // = = = = = = = = = = = = = = = = = = = = = = = = 
  // Defensa de los carros en las fortalezas
  // = = = = = = = = = = = = = = = = = = = = = = = = 
  handle hObjetivoDefensaPosicionFortalezaI;
  handle hObjetivoDefensaPosicionFortalezaII;
  handle hObjetivoDefensaPosicionFortalezaIII;
	
	handle hG_PATI;
	  
  handle hCarros;
  
  handle hCaza;
  
  // niveles de dificultad
  float fNivelDificultad          = 0;
  
  //OBJETIVOS
	handle hObjCarro1;
	handle hObjCarro2;
	handle hObjCarro3;
	handle hObjLabienoVivo;
	    
  bool bObjCarro1                 = FALSE;
	bool bObjCarro2                 = FALSE;
	bool bObjCarro3                 = FALSE;
	
  // briefing
  float fPuntoSincronia           = 0;
  handle hPuntoSincronia          = NULL;
  bool bBriefingEnded             = NULL;
	
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
  //restricciones de maquinas da asalto
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_BARBARA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_ROMANA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_EGIPCIA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_EGIPCIA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_BARBARA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_ROMANA", "");  
  
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
   
  //Las alianzas   
  CrearAlianzaPorNombre("PROTECCION_CARROS","ESCOLTA_CARROS");
  
  //Iluminar las tropas que esperan para refuerzos
  HacerVisibleGrupoTropas("G_ALIUNO", TRUE);
  HacerVisibleGrupoTropas("G_ALIDOS", TRUE);
 
  ActivarTrigger("Briefing");
  
}


Trigger "Main2" [ Inactivo ]
(
  TRUE
)
Do
{
  //Objetivos
  hObjCarro1=         CrearHandle("Bool");
	hObjCarro2=         CrearHandle("Bool");
	hObjCarro3=         CrearHandle("Bool");
	hObjLabienoVivo =   CrearHandle("Bool");
	  
  AgregarObjetivoMision(hObjCarro1, "LTEXT_MISION17_OBJETIVO_00_TXT");
  AgregarObjetivoMision(hObjCarro2, "LTEXT_MISION17_OBJETIVO_01_TXT");
  AgregarObjetivoMision(hObjCarro3, "LTEXT_MISION17_OBJETIVO_02_TXT");
  AgregarObjetivoMision(hObjLabienoVivo, "LTEXT_MISION17_OBJETIVO_03_TXT");
  
  // comprobar el nivel de dificultad
  fNivelDificultad = DarDificultadMision();
  if ( fNivelDificultad == 1 )
  {
    
  }
  else
  if ( fNivelDificultad == 2 )
  {
    
  }
  else
  if ( fNivelDificultad == 3 )
  {
    
  }
  else
  {
    MensajeChat("Nivel de dificulatd desconocido, oiga");
  }
          
  //Iluminar el mensajero neutro
  HacerVisibleGrupoTropas("G_MENSAKA", TRUE);
    
	//Se crea la estrategia de los enemigos y de los aliados
	hEstrategia = CrearEstrategiaScript();
  hCivilizacionCPU = DarCivilizacion("ENEMIGOS");
  AsignarEstrategia(hCivilizacionCPU, hEstrategia);
  StartEstrategia(hEstrategia);
  
  hEstrategiaAliados = CrearEstrategiaScript();
  hCivilizacionAliados = DarCivilizacion("PROTECCION_CARROS");
  AsignarEstrategia(hCivilizacionAliados, hEstrategiaAliados);
  StartEstrategia(hEstrategiaAliados);
  
	
	//Grupos que defienden la posicion emboscados
	hTacticaMantenerPosicion = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hTacticaMantenerPosicion, "G_AVANZADO");
  AnyadirObjetivo(hEstrategia, hTacticaMantenerPosicion);
	
	hTacticaMantenerPosicionII = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hTacticaMantenerPosicionII, "G_INTER");
  AnyadirObjetivo(hEstrategia, hTacticaMantenerPosicionII);
  
  hTacticaMantenerPosicionIII = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hTacticaMantenerPosicionIII, "G_SUPER");
  AnyadirObjetivo(hEstrategia, hTacticaMantenerPosicionIII);
  
  hTacticaMantenerPosicionIV = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hTacticaMantenerPosicionIV, "G_MEDIO");
  AnyadirObjetivo(hEstrategia, hTacticaMantenerPosicionIV);
  
  hTacticaMantenerPosicionV = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hTacticaMantenerPosicionV, "G_FINAL");
  AnyadirObjetivo(hEstrategia, hTacticaMantenerPosicionV);
  
  hTacticaMantenerPosicionVI = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hTacticaMantenerPosicionVI, "G_BINARIO");
  AnyadirObjetivo(hEstrategia, hTacticaMantenerPosicionVI);

	hTacticaMantenerPosicionVII = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hTacticaMantenerPosicionVII, "G_AVIZOR");
  AnyadirObjetivo(hEstrategia, hTacticaMantenerPosicionVII);  
  
  hG_SUBIDA = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_SUBIDA, "G_SUBIDA");
  AnyadirObjetivo(hEstrategia, hG_SUBIDA);  
 	
	//Las patrullas aleatorias
  hG_PATI = CrearObjetivo(hEstrategia, "PatrullaOleadasPeriodicas", 5400, 7200, 45, 90);
  AnyadirGrupoAObjetivo(hG_PATI, "G_PATRULLAS");
  SetParamObjetivo(hG_PATI, "ParametrosTacticas", "AtacarCorriendo", TRUE);	
	SetParamObjetivo(hG_PATI, "FACTOR_POTENCIA_TROPAS", 3);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_ENEMIGOS", 0.2);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hG_PATI, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hG_PATI, "MaxNumOleadas", 6);
  AnyadirObjetivo(hEstrategia, hG_PATI);
	
	//Activacion de triggers
	ActivarTrigger("TiempoParaLaMuerte");
	ActivarTrigger("RutasCarros");	
	ActivarTrigger("GameOver");	
	ActivarTrigger("EXITO");	
	ActivarTrigger("Dumnorix");
	
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
  ActivarPresentacion(TRUE, "LTEXT_MISION17_PRESENTACION_TITULO",
                            "LTEXT_MISION17_PRESENTACION_LUGAR", hPresentacion);
                            
  // camara a donde debe empezar
  EncolarColocarYMirarPunto("BRIEFING_1");
  EjecutarOrdenesCamara();
  
  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));
 
  ActivarPresentacion(FALSE, "", "", NULL);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);
  
  EncolarPausaCamara(1000);
  EncolaTrayectoriaCamara("BRIEFING_2", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  EncolarColocarYMirarPunto("BRIEFING_3");
  EncolarPausaCamara(2000);
  EncolarColocarYMirarPunto("BRIEFING_4");
  EncolarPausaCamara(2000);
  IntroducirLocucion("17N0", "LTEXT_MISION17_LOCUCION_00_TXT", 12000, 600, 100);
  IntroducirPuntoSincronia();        

  EncolarColocarYMirarPunto("BRIEFING_5");
  EncolarPausaCamara(1000);
  EncolaTrayectoriaCamara("BRIEFING_6", FALSE, FALSE, 0, 0);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("17N1", "LTEXT_MISION17_LOCUCION_01_TXT", 10000, 600, 100);
  IntroducirPuntoSincronia();        

  EncolaTrayectoriaCamara("BRIEFING_7", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("17N2", "LTEXT_MISION17_LOCUCION_02_TXT", 6000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("17N3", "LTEXT_MISION17_LOCUCION_03_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();
  
  EncolarColocarYMirarPunto("BRIEFING_8");
  EncolarPausaCamara(5000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("17N4", "LTEXT_MISION17_LOCUCION_04_TXT", 5000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("17N5", "LTEXT_MISION17_LOCUCION_05_TXT", 4000, 600, 100);
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
    
  }

  VaciarOrdenesCamara();
  VaciarLocuciones();


  // esto es todo amigos
  bBriefingEnded = TRUE;

  // colocamos la cámara
  if ( HandleDisparado(hEscape) )
  {
    MirarAPunto(x, y);
  }

  // restaurar
  ActivarCinemascope(FALSE);

  // activamos el main2 (reordenar luego)
  ActivarTrigger("Main2");

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

Trigger "ContarPuntosSincronia" [Inactivo]
(
  Wait(hPuntoSincronia)
)
Do
{
  fPuntoSincronia = fPuntoSincronia + 1;
  PonerHandleEsperaSincronizacion(hPuntoSincronia);
}


//////////////////////////////////////////////////////////////////
// TRIGGERS DE MISION
//////////////////////////////////////////////////////////////////

//-------------------------------
Trigger "RutasCarros" [ Inactivo ]
(
	DarPorcentajeTropasEnZona("ESCOLTA_CARROS","CAMPAMENTO_SALIDA") < 70
)
Do
{
  
  MensajeLocucionado("17N7","LTEXT_MISION17_MENSAJE_01_TXT");
  AvisoCivilizacion("ESCOLTA_CARROS", 93, 23);
  
  hCarros = CrearObjetivo (hEstrategiaAliados, "MostrarRutaCarros", "ESCOLTA_CARROS");

  SetParamEstrategia (hEstrategia, "ResetTropaRestringida");
  SetParamEstrategia (hEstrategia, "TropaRestringida", "convoyI");
  SetParamEstrategia (hEstrategia, "TropaRestringida", "convoyII");
  SetParamEstrategia (hEstrategia, "TropaRestringida", "convoyIII");

  SetParamObjetivo  (hCarros, "ANIADIR_CONVOY", "convoyI",   "G_ESCOLTAS_1", "RUTA_CONVOYS_1");	
  SetParamObjetivo  (hCarros, "ANIADIR_CONVOY", "convoyII",  "G_ESCOLTAS_2", "RUTA_CONVOYS_2");	
  SetParamObjetivo  (hCarros, "ANIADIR_CONVOY", "convoyIII", "G_ESCOLTAS_3", "RUTA_CONVOYS_3");	

  ActivarTrigger    ("CheckCarroI_Llegado");
  ActivarTrigger    ("CheckCarroII_Llegado");
  ActivarTrigger    ("CheckCarroIII_Llegado");

  AnyadirObjetivo   (hEstrategiaAliados,  hCarros);
  
  hGuia = CrearObjetivo(hEstrategiaAliados, "MostrarRuta", "RUTA_CONVOYS_3", "ESCOLTA_CARROS");
  AnyadirTropaAObjetivo(hGuia, "Guia");
  AnyadirGrupoAObjetivo(hGuia, "G_GUIA");
  
  SetParamObjetivo(hGuia, "RangoDeteccionTropas", 22);
  SetParamObjetivo(hGuia, "RangoEsperaTropas", 16);
   
  SetParamObjetivo(hGuia, "PuedeHuir", FALSE);
  SetParamObjetivo(hGuia, "Agresivo", FALSE); 
  AnyadirObjetivo(hEstrategiaAliados,  hGuia);
  
	DestruirTrigger   ("RutasCarros");
}




Trigger "Dumnorix" [ Inactivo ]
(
  HanEntradoCivilizacionesEnZona("ZONA_DUMNORIX", "ESCOLTA_CARROS")
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

  // handle de final y presentacion
  hCamaraEnd = CrearHandle("Bool");
  hEscape = CrearHandle("Bool");

  // cazar escape
  PonerHandleInterrupcion(hEscape);
  
  // posición actual
  DarPosicionCamara(&x, &y);

  // iluminación
  IluminarZonaOnOff(15, 3, 136, 15, "dumnorix", TRUE);

  hTimer = CrearTimer(100);
  Wait(hTimer);

  // cine
  ActivarCinemascope(TRUE);
  PararLogica(TRUE);
    
  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);
  
  EncolarTrayectoriaMirarEnteCamara("DUMNORIX", TRUE, FALSE, 2, 0);
  IntroducirLocucion("1770", "LTEXT_MISION17_EVENT1_00_TXT", 5000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("1771", "LTEXT_MISION17_EVENT1_01_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();
  
  EncolarTrayectoriaMirarEnteCamara("DUMNORIX", FALSE, TRUE, 0, 2);
  IntroducirPuntoSincronia();
  
  
  IntroducirPonerModoJuegoCamara(TRUE);

  // acción
  EjecutarOrdenesCamara();

  // final  
  PonerHandleBoolACamara(hCamaraEnd);
  WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));

  // fuera luces
  IluminarZonaOnOff(15, 3, 136, 15, "dumnorix", FALSE);

  VaciarOrdenesCamara();
  VaciarLocuciones();

  MirarAPunto(x, y);

  // restaurar
  PararLogica(FALSE);
  ActivarCinemascope(FALSE);

  
  hObjCazaYCaptura = CrearObjetivo(hEstrategia, "CazaYCaptura");
  AnyadirGrupoAObjetivo(hObjCazaYCaptura, "G_DUMNORIX");
  AnyadirObjetivo(hEstrategia, hObjCazaYCaptura);

  DestruirTrigger("Dumnorix");
  
}




// = = = = = = = = = = = = = = = = = = = = = = = = =
// INICIO Chequeo de la llegada de los carros a sus zonas
// = = = = = = = = = = = = = = = = = = = = = = = = =

// ---------------
// CheckCarroI_Llegado
// ---------------
Trigger "CheckCarroI_Llegado" [ Inactivo ]
(
	EstaTropaViva        ("convoyI") && 
  HaEntradoTropaEnZona ("ZONA_CONVOYI", "convoyI")
)
Do
{
  
  MensajeLocucionado("17N6","LTEXT_MISION17_MENSAJE_00_TXT");
  AvisoCivilizacion("ESCOLTA_CARROS", 18, 15);
  
	// Eliminamos el convoy
  SetParamObjetivo  (hCarros, "QUITAR_CONVOY", "convoyI");	

  // Ponemos a las tropas protegiendo la zona del puebloI, esto o que se pasen al bando del jugador...
  hObjetivoDefensaPosicionFortalezaI  = CrearObjetivo (hEstrategiaAliados, "DefenderPosicion", 20.5, 16.5, 0);
  AnyadirGrupoAObjetivo               (hObjetivoDefensaPosicionFortalezaI, "G_ESCOLTAS_1");
  AnyadirObjetivo                     (hEstrategiaAliados, hObjetivoDefensaPosicionFortalezaI);
  
  CambiarBandoPorGrupo("G_ALIUNO", "ESCOLTA_CARROS");
  CambiarBandoPorGrupo("G_CARRO1", "guia");
  
  bObjCarro1 = TRUE;
  IndicarObjetivoCumplido(hObjCarro1);

  TropaSigueRutaPredefinida ("convoyI", "PuntoFinalCarroI");
	
	DestruirTrigger ("CheckCarroI_Llegado");	
}

// ---------------
// CheckCarroII_Llegado
// ---------------
Trigger "CheckCarroII_Llegado" [ Inactivo ]
(
	EstaTropaViva        ("convoyII") && 
  HaEntradoTropaEnZona ("ZONA_CONVOYII", "convoyII")
)
Do
{
  
  MensajeLocucionado("17N6","LTEXT_MISION17_MENSAJE_00_TXT");
  AvisoCivilizacion("ESCOLTA_CARROS", 143, 136);
    
	// Eliminamos el convoy
  SetParamObjetivo  (hCarros, "QUITAR_CONVOY", "convoyII");	

  // Ponemos a las tropas protegiendo la zona del puebloII
  hObjetivoDefensaPosicionFortalezaII = CrearObjetivo (hEstrategiaAliados, "DefenderPosicion", 143.5, 133.5, 0);
  AnyadirGrupoAObjetivo                (hObjetivoDefensaPosicionFortalezaII, "G_ESCOLTAS_2");
  AnyadirObjetivo                      (hEstrategiaAliados, hObjetivoDefensaPosicionFortalezaII);
  
  CambiarBandoPorGrupo("G_ALIDOS", "ESCOLTA_CARROS");
  CambiarBandoPorGrupo("G_CARRO2", "guia");
 
  bObjCarro2 = TRUE; 
  IndicarObjetivoCumplido(hObjCarro2);

  TropaSigueRutaPredefinida ("convoyII", "PuntoFinalCarroII");
	
	DestruirTrigger("CheckCarroII_Llegado");	
}


// ---------------
// CheckCarroIII_Llegado
// ---------------
Trigger "CheckCarroIII_Llegado" [ Inactivo ]
(
	EstaTropaViva        ("convoyIII") && 
  HaEntradoTropaEnZona ("ZONA_CONVOYIII", "convoyIII")
)
Do
{
	// Eliminamos el convoy
  SetParamObjetivo  (hCarros, "QUITAR_CONVOY", "convoyIII");	

  // Ponemos a las tropas protegiendo la zona del puebloIII
  hObjetivoDefensaPosicionFortalezaIII = CrearObjetivo (hEstrategiaAliados, "DefenderPosicion", 15.5, 135.5, 0);
  AnyadirGrupoAObjetivo                (hObjetivoDefensaPosicionFortalezaIII, "G_ESCOLTAS_3");
  AnyadirObjetivo                      (hEstrategiaAliados, hObjetivoDefensaPosicionFortalezaIII);
  
  CambiarBandoPorGrupo("G_CARRO3", "guia");
  
  bObjCarro3 = TRUE;
  IndicarObjetivoCumplido(hObjCarro3);

  TropaSigueRutaPredefinida ("convoyIII", "PuntoFinalCarroIII");
	
	DestruirTrigger ("CheckCarroIII_Llegado");	
}

// ---------------
Trigger "EXITO" [ Inactivo ]
(
  bObjCarro1 && 
  bObjCarro2 &&
  bObjCarro3 
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(10000); //10 sec
	Wait(hTimer);
  
  IndicarObjetivoCumplido(hObjLabienoVivo);
  
	FinalizarMision(TRUE);
	
	DestruirTrigger ("EXITO");	
}

// = = = = = = = = = = = = = = = = = = = = = = = = =
// FIN Chequeo de la llegada de los carros a sus zonas
// = = = = = = = = = = = = = = = = = = = = = = = = =


//-------------------------------
Trigger "GameOver" [ Inactivo ]
(
  !EstaTropaViva("convoyI") || 
	!EstaTropaViva("convoyII") ||
	!EstaTropaViva("convoyIII") ||
	!EstaTropaViva("Labieno")
)
Do
{

  if ( !EstaTropaViva("Labieno") )
  {
    IndicarObjetivoFracasado(hObjLabienoVivo); 
  }
  
  if (!EstaTropaViva("convoyI") )
  {
    IndicarObjetivoFracasado(hObjCarro1);
  }

  if (!EstaTropaViva("convoyII") )
  {
    IndicarObjetivoFracasado(hObjCarro2);
  }

  if (!EstaTropaViva("convoyIII") )
  {
    IndicarObjetivoFracasado(hObjCarro3);
  }
	
	FinalizarMision(FALSE);
		
	DestruirTrigger("GameOver");	
}

//---------------------------
Trigger "End" [ Activo ]  
(
  TRUE
)
Do
{
}