Var
{
	handle hEstrategia;
	handle hCivilizacionCPU;
	
	handle hCivDumnorix;
	handle hEstDumnorix;
	
	handle hEstrategiaExp;
	handle hCivilizacionExp;
	
	handle hTacticaPuente0;		
	handle hTacticaPuente1;		
	handle hTacticaPuente2;		
		
	handle hExp;
	
	handle hDestruccion;
	
	handle hObjetivoDefensa; 
	
	handle hObjetivoConquista; 
	
	handle hPatrullas;
	
	handle hG_RESERVA;
	
	handle hG_EXTERMINACION;
	
	handle hATAQUE0;
	handle hATAQUE1;
	handle hATAQUE2;
	handle hCONQUISTA;
	
	handle hG_1;
	handle hG_2;
	handle hG_3;
	handle hG_4;
	
	bool bHuida                       = FALSE; 
	
	//OBJETIVOS
	handle hObjNeutralizarCEnemigo;
	handle hObjResistir;
	handle hObjLabienoVivo;
  
  bool bObjetivoCumplido            = FALSE;
  
  // briefings  
  float fPuntoSincronia             = 0;
  handle hPuntoSincronia            = NULL;
  bool bBriefingEnded               = FALSE;
    
  // niveles de dificultad
  float fNivelDificultad            = 0;
  float fEntrenamientoGalo;
  float fOle;
  float fTrups;
  float fTime; 
  float fPower;
  
  float fTimeHuida; 
  
  // otros
  float fVidaCaballeria             = 0;
  
}


#include "FunScript.h"

//////////////////////////////////////////////////////////////////////////////
//------------------ MAIN
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
 
  // neutralizar a los eduos
  NeutralizarCivilizacion("EDUOS", TRUE);

  // vida inicial de la caballeria aliada 
  fVidaCaballeria = DarVidaGrupo("CABALLERIA_ALIADA");

  // quieeeeeeeto
  OrdenarTropaMantenerPosicion("LABIENO", TRUE);

  ActivarTrigger("Briefing");
  DestruirTrigger("Main");
  
}

Trigger "Main2" [ Inactivo ]  
(
  TRUE
)
Var
{
  float fHig;
  float fLow;   
}
Do
{
  
  // que se vea a dumnorix
  HacerVisibleTropa("DUMNORIX", TRUE);
  
  //restricciones de maquinas da asalto
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_BARBARA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_ROMANA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_EGIPCIA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_EGIPCIA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_BARBARA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_ROMANA", "");
  
  //restricciones de la mision
  IntroducirRestriccionUnidad("ORDEN_TRANSFORMAR_A_CENTURION", "GALO_CABALLERIA_PESADA", "Romanos");
  IntroducirRestriccionUnidad("ORDEN_TRANSFORMAR_A_CENTURION", "GALO_LIGERA", "Romanos");
  
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GLADIADOR", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "PIQUERO_ELITE", "");
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "HONDERO", "");
  
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_CAZADOR", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_GERMANA", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_ESPADON", "");
  
  //IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "BALLESTA_MOVIL_BARBARA", "");
  //IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "CATAPULTA_BARBARA", "");
  
  // comprobar el nivel de dificultad
  fNivelDificultad = DarDificultadMision();
  if ( fNivelDificultad == 1 )
  { 
    //Regulado del ritmo de produccion enemigo   
    fEntrenamientoGalo = 240000;// 4 min
    
    //Tropas que hay que matar para que huyan los enemigos
    fOle = 5; //5
    fTrups = 3;
    
    //fHig = 1020000;// 17 min
    //fLow = 240000;// 4 min
    
    fPower = 20000; 
    fTime = 50; 
    
    fTimeHuida = 900000; // 15 minutos
      
    //Los enemigos no pueden construir torres de defensa
    //IntroducirRestriccionEstructura("ORDEN_CONSTRUIR", "TORRE_DEFENSA_BARBARA", "");
  }
  else
  if ( fNivelDificultad == 2 )
  {    
    //Regulado del ritmo de produccion enemigo   
    fEntrenamientoGalo = 120000;// 2 min
    
    //Tropas que hay que matar para que huyan los enemigos
    fOle = 6; //8
    fTrups = 3;
    
    //fHig = 840000;// 14 min
    //fLow = 120000;// 2 min 
    
    fPower = 25000; 
    fTime = 40; 
    
    fTimeHuida = 960000; // 16 minutos
                
    //Los enemigos no pueden construir torres de defensa
    //IntroducirRestriccionEstructura("ORDEN_CONSTRUIR", "TORRE_DEFENSA_BARBARA", "");
  }
  else
  if ( fNivelDificultad == 3 )
  {
    //Regulado del ritmo de produccion enemigo   
    fEntrenamientoGalo = 60000;// 1 min
    
    //Tropas que hay que matar para que huyan los enemigos
    fOle = 8; //10
    fTrups = 4;
    
    //fHig = 480000;// 8 min
    //fLow = 30000;// 1/2 min
    
    fPower = 30000; 
    fTime = 30; 
    
    fTimeHuida = 1020000; // 17 minutos
  }
  else
  {
    //Regulado del ritmo de produccion enemigo   
    fEntrenamientoGalo = 60000;// 1 min
    
    //fHig = 480000;// 8 min
    //fLow = 30000;// 1/2 min 
    fOle = 10;
    fTrups = 4;
    
    fPower = 150000; 
    fTime = 20; 
            
    MensajeChat("Nivel de dificulatd desconocido, oiga");
  }
  
  //Objetivos
  hObjNeutralizarCEnemigo = CrearHandle("Bool");
  hObjResistir = CrearHandle("Bool");
  hObjLabienoVivo = CrearHandle("Bool");
  AgregarObjetivoMision(hObjResistir, "LTEXT_MISION9_OBJETIVO_00_TXT");  
  AgregarObjetivoMision(hObjNeutralizarCEnemigo, "LTEXT_MISION9_OBJETIVO_01_TXT");
  AgregarObjetivoMision(hObjLabienoVivo, "LTEXT_MISION9_OBJETIVO_02_TXT");
    
  //Alianza con los exp
  CrearAlianzaPorNombre("Romanos", "exploradores");
  
  // Estrategia de los neutrales aliados de dumnorix
  hEstDumnorix = CrearEstrategiaScript();
  hCivDumnorix = DarCivilizacion("EDUOS");
  AsignarEstrategia(hCivDumnorix, hEstDumnorix);
  StartEstrategia(hEstDumnorix);
    
  //Esrategia de la CPU
	hEstrategia = CrearEstrategiaScript();
  hCivilizacionCPU = DarCivilizacion("Suevos");
  AsignarEstrategia(hCivilizacionCPU, hEstrategia);		
  StartEstrategia(hEstrategia);
  
  //Estrategia de los exploradores
  hEstrategiaExp = CrearEstrategiaScript();
  hCivilizacionExp = DarCivilizacion("exploradores");
  AsignarEstrategia(hCivilizacionExp, hEstrategiaExp);
  StartEstrategia(hEstrategiaExp);
  
  SetParamEstrategia(hEstrategia, "AtacarCorriendo", TRUE);
  
  //Los grupos que construyen los puentes mientras esperan, están manteniendo la posicion
  hATAQUE0 = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hATAQUE0, "ATAQUE0");
	AnyadirObjetivo(hEstrategia, hATAQUE0);
	
	hATAQUE1 = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hATAQUE1, "ATAQUE1");
	AnyadirObjetivo(hEstrategia, hATAQUE1);
	
	hATAQUE2 = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hATAQUE2, "ATAQUE2");
	AnyadirObjetivo(hEstrategia, hATAQUE2);
  
  hCONQUISTA = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hCONQUISTA, "G_CONQUISTA");
	AnyadirObjetivo(hEstrategia, hCONQUISTA);
    
  //Grupos de la entrada a la orilla enemiga por el puente fijo, de puteo 
  hDestruccion = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hDestruccion, "G_EXTERMINACION");
	AnyadirObjetivo(hEstrategia, hDestruccion);
	
	hG_EXTERMINACION = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hG_EXTERMINACION, "G_EXTERMINACIONII");
	AnyadirObjetivo(hEstrategia, hG_EXTERMINACION);
	
	//El grupo de defensa mantiene la posicion mientras no patrulla 
	hG_RESERVA = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hG_RESERVA, "G_RESERVA");
	AnyadirObjetivo(hEstrategia, hG_RESERVA);
	
	//Defensa del pueblo galo
	hObjetivoDefensa = CrearObjetivo(hEstrategia, "ConquistaPueblo2", "Coblenza");
  AnyadirGrupoAObjetivo(hObjetivoDefensa , "G_DEFENSA"); 
   
  SetParamObjetivo(hObjetivoDefensa , "NombreGrupoGenerado", "G_CONQUISTA");
  SetValue(hEstrategia , "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  SetParamObjetivo(hObjetivoDefensa , "PuedePedirRefuerzos", FALSE);
  SetParamObjetivo(hObjetivoDefensa, "POTMIN_DEFENSA_PUEBLO", 30000);
  SetDelayEntrenamientoTropasPueblo_DOS(hEstrategia, "Coblenza", fEntrenamientoGalo);
  //SetDelayEntrenamientoTropasPueblo(hEstrategia, "Coblenza", 10000);
  AnyadirObjetivo(hEstrategia,  hObjetivoDefensa );
  
  //Objetivo de los exploradores que mantienen posicion
  hExp = CrearObjetivo(hEstrategiaExp, "Exploracion");
	AnyadirGrupoAObjetivo(hExp, "G_EXP");
	SetParamObjetivo(hExp, "PuedePedirRefuerzos", FALSE);
	AnyadirObjetivo(hEstrategiaExp, hExp);      
	SetParamObjetivo(hExp, "PuedeMoverse", FALSE);
  
  //Arqueros que defienden la posición
  hG_1 = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hG_1, "G_1");
	AnyadirObjetivo(hEstrategia, hG_1);      
	
	hG_2 = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hG_2, "G_2");
	AnyadirObjetivo(hEstrategia, hG_2);      
	
	hG_3 = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hG_3, "G_3");
	AnyadirObjetivo(hEstrategia, hG_3);
	
	hG_4 = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hG_4, "G_4");
	AnyadirObjetivo(hEstrategia, hG_4);
	
	// Activacion de Triggers
	ActivarTrigger("PuebloEnemigoCapturado");      
	ActivarTrigger("GameOver");
	ActivarTrigger("GameOverII");
	ActivarTrigger("ConstruccionPuenteI");
	ActivarTrigger("ConstruccionPuenteII");
	ActivarTrigger("ConstruccionPuenteIII");
	ActivarTrigger("Aglomeracion"); 
  ActivarTrigger("Huida");
  ActivarTrigger("AtaqueConquista");
  ActivarTrigger("Patrullitas");
  ActivarTrigger("ConquistaFinal");
  ActivarTrigger("CaballeriaCobarde");
  
  // fueeeera
  DestruirTrigger("Main2");
  
}


/////////////////////////////////////////////////
// BRIEFING
/////////////////////////////////////////////////
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
  ActivarPresentacion(TRUE, "LTEXT_MISION9_PRESENTACION_TITULO",
                            "LTEXT_MISION9_PRESENTACION_LUGAR", hPresentacion);

 
  // camara a donde debe empezar
  EncolarColocarYMirarPunto("TOMA_1");
  EjecutarOrdenesCamara();
  
  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));
 
  ActivarPresentacion(FALSE, "", "", NULL);
 
  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);
  
  EncolarColocarYMirarPunto("TOMA_1");
  IntroducirLocucion("09N0", "LTEXT_MISION9_LOCUCION_00_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();
  
  EncolaTrayectoriaCamara("RECORRIDO_1", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);    
  EncolaTrayectoriaCamara("RECORRIDO_2", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);    
  EncolaTrayectoriaCamara("RECORRIDO_3", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("09N1", "LTEXT_MISION9_LOCUCION_01_TXT", 9000, 600, 100);
  IntroducirPuntoSincronia();
  
  EncolaTrayectoriaCamara("RECORRIDO_6", TRUE, FALSE, 2, 0);
  EncolarPausaCamara(1500);
  EncolaTrayectoriaCamara("RECORRIDO_4", TRUE, FALSE, 2, 0);
  EncolarPausaCamara(1500);
  EncolaTrayectoriaCamara("RECORRIDO_7", TRUE, FALSE, 1, 0);
  EncolarPausaCamara(1500);
  IntroducirLocucion("", "", 100, 0, 0);    
  IntroducirLocucion("09N2", "LTEXT_MISION9_LOCUCION_02_TXT", 10000, 600, 100);
  IntroducirPuntoSincronia();
  
  EncolarColocarYMirarPunto("TOMA_3");
  IntroducirLocucion("", "", 100, 0, 0);    
  IntroducirLocucion("09N3", "LTEXT_MISION9_LOCUCION_03_TXT", 7000, 600, 100);
  IntroducirPuntoSincronia();
  
  EncolaTrayectoriaCamara("RECORRIDO_5", FALSE, FALSE, 0, 0);
  IntroducirLocucion("", "", 100, 0, 0);    
  IntroducirLocucion("09N4", "LTEXT_MISION9_LOCUCION_04_TXT", 4000, 600, 100);
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

  // pueblos
  IluminarZona(33, 0, 57, 10, 60000);
  IluminarZona(78, 0, 32, 10, 60000);
  IluminarZona(68, 0, 14, 10, 60000);
  IluminarZona(130, 0, 23, 10, 60000);
  IluminarZona(96, 0, 42, 10, 60000);
  IluminarZona(48, 0, 81, 10, 60000);
  IluminarZona(80, 0, 63, 10, 60000);
     
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
// TRIGGERS DE MISIÓN
//////////////////////////////////////////////////////////////////


//--------------------------------
Trigger "PuebloEnemigoCapturado" [Inactivo]
(
  EstaPuebloConquistado("Romanos", "Coblenza") ||
  CivilizacionEstaKO("Suevos")
)
Do
{
  
  bObjetivoCumplido = TRUE;
  
  IndicarObjetivoCumplido(hObjNeutralizarCEnemigo);
  IndicarObjetivoCumplido(hObjLabienoVivo);
  IndicarObjetivoCumplido(hObjResistir);
  
  FinalizarMision(TRUE);
  
  
  DestruirTrigger("GameOver");
  DestruirTrigger("GameOverII");
  
  DestruirTrigger("PuebloEnemigoCapturado");
  
}

//--------------------------------
Trigger "GameOver" [ Inactivo ]
(
    CivilizacionEstaKO("Romanos")
    || EstaPuebloConquistado("Suevos", "Mogontiacun")
    || EstructuraDestruida("Mogontiacun")
    || !EstaTropaViva("LABIENO")
)
Do
{
  
  if ( !EstaTropaViva("LABIENO") )
  {
    IndicarObjetivoFracasado(hObjLabienoVivo);
  }
  else
  {
    IndicarObjetivoFracasado(hObjResistir);
  }
  
  FinalizarMision(FALSE);
  DestruirTrigger("PuebloEnemigoCapturado");
  DestruirTrigger("GameOverII");
  DestruirTrigger("GameOver"); 
}

//--------------------------------
Trigger "GameOverII" [ Inactivo ]
(
  EstructuraDestruida("Coblenza")
)
Do
{
  
  IndicarObjetivoFracasado(hObjNeutralizarCEnemigo);
  
  FinalizarMision(FALSE);
    
  DestruirTrigger("PuebloEnemigoCapturado");
  DestruirTrigger("GameOver"); 
  DestruirTrigger("GameOverII"); 
}

//-------------------------------------------------
Trigger "ConstruccionPuenteI" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(DarNumeroAleatorio(60000, 240000));
  Wait(hTimer);
  
  DisposeHandle(&hATAQUE0);
   
  hTacticaPuente0 = CrearObjetivo(hEstrategia, "PuentesRhin", "puenteI");
  AnyadirGrupoAObjetivo(hTacticaPuente0, "ATAQUE0");
  AnyadirGrupoAObjetivo(hTacticaPuente0, "ATAQUE0II");
  SetParamObjetivo(hTacticaPuente0, "GrupoPrioritario", "G_RESERVA");
  AnyadirObjetivo(hEstrategia, hTacticaPuente0);
    
  /*
  hTacticaPuente3 = CrearObjetivo(hEstrategia, "PuentesRhin", "Mogontiacun");
  AnyadirGrupoAObjetivo(hTacticaPuente3, "ATAQUE3");
  AnyadirObjetivo(hEstrategia, hTacticaPuente3);
  */
  DestruirTrigger("ConstruccionPuenteI"); 
}

//-------------------------------------------------
Trigger "Aglomeracion" [ Activo ]
(
  TRUE //!EstaPuenteConstruido ("puenteI") && !EstaPuenteConstruido ("puenteII") && !EstaPuenteConstruido ("puenteIII")
)
Var
{
  handle hTimer; 
}
Do
{
  hTimer = CrearTimer(720000); // 12 minutos y todas las tropas pasan de intentar construir los puentes y van a por el campamento del jugador//**
  Wait(hTimer);
  
  DisposeHandle(&hTacticaPuente0);
  DisposeHandle(&hTacticaPuente1);
  DisposeHandle(&hTacticaPuente2);
  
  AnyadirGrupoAObjetivo(hObjetivoConquista, "ATAQUE0");
  AnyadirGrupoAObjetivo(hObjetivoConquista, "ATAQUE0II");

  AnyadirGrupoAObjetivo(hObjetivoConquista, "ATAQU10");
  AnyadirGrupoAObjetivo(hObjetivoConquista, "ATAQUE1II");

  AnyadirGrupoAObjetivo(hObjetivoConquista, "ATAQUE2");
  AnyadirGrupoAObjetivo(hObjetivoConquista, "ATAQUE2II");

  DestruirTrigger("Aglomeracion");
}

//-------------------------------------------------
Trigger "PuenteIConstruido" [ Activo ]
(
  EstaPuenteConstruido ("puenteI")
)
Do
{
  if (HandleInicializado (hObjetivoConquista))
  {
    // Metemos las tropas
    DisposeHandle         (&hTacticaPuente0);
    AnyadirGrupoAObjetivo (hObjetivoConquista, "ATAQUE0");
    AnyadirGrupoAObjetivo(hObjetivoConquista, "ATAQUE0II");
    
    AnyadirGrupoAObjetivo(hPatrullas, "G_RESERVA");

    SetParamObjetivo  (hObjetivoConquista, "PonPuntoPosibleRuta", 48.5, 76.5);
    DestruirTrigger   ("PuenteIConstruido"); 
    ActivarTrigger    ("PuenteIDestruido");
  }
}

//-------------------------------------------------
Trigger "PuenteIDestruido" [ Inactivo ]
(
  !EstaPuenteConstruido ("puenteI")
)
Do
{
  if (HandleInicializado (hObjetivoConquista))
  {
    SetParamObjetivo (hObjetivoConquista, "QuitaPuntoPosibleRuta", 48.5, 76.5);
    DestruirTrigger  ("PuenteIDestruido");
  }
}

//----------------------------------------------------
Trigger "ConstruccionPuenteII" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(DarNumeroAleatorio(60000, 240000));
  Wait(hTimer);
  
  DisposeHandle(&hATAQUE1);
    
  hTacticaPuente1 = CrearObjetivo(hEstrategia, "PuentesRhin", "puenteII");
  AnyadirGrupoAObjetivo(hTacticaPuente1, "ATAQUE1");
  AnyadirGrupoAObjetivo(hTacticaPuente1, "ATAQUE1II");
  SetParamObjetivo(hTacticaPuente1, "GrupoPrioritario", "G_RESERVA");
  AnyadirObjetivo(hEstrategia, hTacticaPuente1);
    
  /*
  hTacticaPuente3 = CrearObjetivo(hEstrategia, "PuentesRhin", "Mogontiacun");
  AnyadirGrupoAObjetivo(hTacticaPuente3, "ATAQUE3");
  AnyadirObjetivo(hEstrategia, hTacticaPuente3);
  */
  DestruirTrigger("ConstruccionPuenteII"); 
}

//-------------------------------------------------
Trigger "PuenteIIConstruido" [ Activo ]
(
  EstaPuenteConstruido ("puenteII")
)
Do
{
  if (HandleInicializado (hObjetivoConquista))
  {
    // Metemos las tropas
    DisposeHandle         (&hTacticaPuente1);
    AnyadirGrupoAObjetivo (hObjetivoConquista, "ATAQUE1");
    AnyadirGrupoAObjetivo (hObjetivoConquista, "ATAQUE1II");
    
    AnyadirGrupoAObjetivo(hPatrullas, "G_RESERVA");

    SetParamObjetivo  (hObjetivoConquista, "PonPuntoPosibleRuta", 96.5, 37.5);
    DestruirTrigger   ("PuenteIIConstruido"); 
    ActivarTrigger    ("PuenteIIDestruido");
  }  
}

//-------------------------------------------------
Trigger "PuenteIIDestruido" [ Inactivo ]
(
  !EstaPuenteConstruido ("puenteII")
)
Do
{
  if (HandleInicializado (hObjetivoConquista))
  {
    SetParamObjetivo (hObjetivoConquista, "QuitaPuntoPosibleRuta", 96.5, 37.5);
    DestruirTrigger  ("PuenteIIDestruido");
  }
}

//-----------------------------------------------------------
Trigger "ConstruccionPuenteIII" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(DarNumeroAleatorio(60000, 240000));
  Wait(hTimer);
  
  DisposeHandle(&hATAQUE2);
    
  hTacticaPuente2 = CrearObjetivo(hEstrategia, "PuentesRhin", "puenteIII");
  AnyadirGrupoAObjetivo(hTacticaPuente2, "ATAQUE2");
  AnyadirGrupoAObjetivo(hTacticaPuente2, "ATAQUE2II");
  SetParamObjetivo(hTacticaPuente2, "GrupoPrioritario", "G_RESERVA");
  AnyadirObjetivo(hEstrategia, hTacticaPuente2);
  /*
  hTacticaPuente3 = CrearObjetivo(hEstrategia, "PuentesRhin", "Mogontiacun");
  AnyadirGrupoAObjetivo(hTacticaPuente3, "ATAQUE3");
  AnyadirObjetivo(hEstrategia, hTacticaPuente3);
  */
  DestruirTrigger("ConstruccionPuenteIII"); 
}

//-------------------------------------------------
Trigger "PuenteIIIConstruido" [ Activo ]
(
  EstaPuenteConstruido ("puenteIII")
)
Do
{
  if (HandleInicializado (hObjetivoConquista))
  {
    // Metemos las tropas
    DisposeHandle         (&hTacticaPuente2);
    AnyadirGrupoAObjetivo (hObjetivoConquista, "ATAQUE2");
    AnyadirGrupoAObjetivo (hObjetivoConquista, "ATAQUE2II");
    
    AnyadirGrupoAObjetivo(hPatrullas, "G_RESERVA");

    SetParamObjetivo  (hObjetivoConquista, "PonPuntoPosibleRuta", 130.5, 18.5);
    DestruirTrigger   ("PuenteIIIConstruido");
    ActivarTrigger    ("PuenteIIIDestruido");
  }
}

//-------------------------------------------------
Trigger "PuenteIIIDestruido" [ Inactivo ]
(
  !EstaPuenteConstruido ("puenteIII")
)
Do
{
  if (HandleInicializado (hObjetivoConquista))
  {
    SetParamObjetivo (hObjetivoConquista, "QuitaPuntoPosibleRuta", 130.5, 18.5);
    DestruirTrigger  ("PuenteIIIDestruido");
  }
}

//-------------------------------------------------
Trigger "Traduccion" [ Activo ]
(
  (DarTropasMuertasDeGrupo("G_CONQUISTA") > fOle) && // 6, 9, 11 . 5, 6, 8
  (DarTropasMuertasDeGrupo("ATAQUE0") > 4) && // 5
  (DarTropasMuertasDeGrupo("ATAQUE1") > fTrups) && // 4, 4, 5
  (DarTropasMuertasDeGrupo("ATAQUE2") > fTrups)  
)
Do
{
    bHuida = TRUE;
  
    DestruirTrigger("Traduccion");
}

//--------------------------------------------
Trigger "Huida" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(fTimeHuida); // n minutos y los enemigos huyen igualmente...
  WaitBool( HandleDisparado(hTimer) || bHuida);
    
  // completado el objetivo
  IndicarObjetivoCumplido(hObjResistir);
  MensajeLocucionado("09N5","LTEXT_MISION9_MENSAJE_00_TXT");
  AvisoCivilizacion("Romanos", 10, 7);
  
  DisposeHandle(&hObjetivoConquista);
  
  hObjetivoConquista = CrearObjetivo(hEstrategia, "Retirada", hObjetivoDefensa);//Retirada...
  AnyadirGrupoAObjetivo(hObjetivoConquista , "G_CONQUISTA");
  AnyadirGrupoAObjetivo(hObjetivoConquista , "ATAQUE0");
  AnyadirGrupoAObjetivo(hObjetivoConquista , "ATAQUE0II");
  AnyadirGrupoAObjetivo(hObjetivoConquista , "ATAQUE1");
  AnyadirGrupoAObjetivo(hObjetivoConquista , "ATAQUE1II");
  AnyadirGrupoAObjetivo(hObjetivoConquista , "ATAQUE2"); 
  AnyadirGrupoAObjetivo(hObjetivoConquista , "ATAQUE2II");
  AnyadirObjetivo(hEstrategia,  hObjetivoConquista );
  
  //Las patrullas van a buscar más el campamento del jugador, pues no, las patrulas se quedan mongas...
  SetParamObjetivo(hPatrullas, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hPatrullas, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hPatrullas, "EXPLORAR_FACTOR_PUEBLOS", 0);//10
  SetParamObjetivo(hPatrullas, "EXPLORAR_FACTOR_VISTA_YA", 0);//0.5
  
  //Los enemigos entrenan menos a partir de este momento
  SetDelayEntrenamientoTropasPueblo_DOS(hEstrategia, "Coblenza", 600000);// cada 10 min se ponen a entrenar una tropa
         
  DestruirTrigger("Huida");
}

//--------------------------------------
Trigger "AtaqueConquista" [ Inactivo ]  
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(300000); //5 min que se espera antes de lanzar el ataque al pueblo del jugador//**
  Wait(hTimer);
  
  DisposeHandle(&hCONQUISTA);

  hObjetivoConquista = CrearObjetivo(hEstrategia, "AsaltarCampamento", "Mogontiacun", "G_CONQUISTA");
  AnyadirGrupoAObjetivo(hObjetivoConquista , "G_CONQUISTA"); 
  SetParamObjetivo(hObjetivoConquista, "RobaTropasLibres", TRUE);
  SetParamObjetivo(hObjetivoConquista, "TiempoParaAtaque", fTime); //30
  SetParamObjetivo(hObjetivoConquista, "PotenciaAtaque", fPower); //30000
   
  AnyadirObjetivo(hEstrategia,  hObjetivoConquista );
  SetParamObjetivo(hObjetivoConquista , "NombreGrupoGenerado", "G_CONQUISTA");
  SetValue(hEstrategia , "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  SetParamObjetivo(hObjetivoConquista , "PuedePedirRefuerzos", FALSE);
  //SetDelayEntrenamientoTropasPueblo(hEstrategia, "Mogontiacun", 10000);
  
  DestruirTrigger("AtaqueConquista");
}

//-----------------------------------------
Trigger "Patrullitas" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(240000); //4 min que se espera antes de patrullar //** 
  Wait(hTimer);
  
  DisposeHandle(&hG_RESERVA);
  
  hPatrullas= CrearObjetivo(hEstrategia, "PatrullaOleadasPeriodicas", 10000, 10000, 30, 60);//6000
  AnyadirGrupoAObjetivo(hPatrullas, "G_RESERVA");
  
  SetParamObjetivo(hPatrullas, "EXPLORAR_FACTOR_ENEMIGOS", 0);  
  SetParamObjetivo(hPatrullas, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hPatrullas, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hPatrullas, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hPatrullas, "MaxNumOleadas", 3);
  SetParamObjetivo(hPatrullas, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hPatrullas, "FACTOR_POTENCIA_TROPAS", 2);
  //SetParamObjetivo(hPatrullas, "ObjetivoAtracable", hPuebloBoios); // Saca las tropas del pueblo

  AnyadirObjetivo(hEstrategia, hPatrullas);
  
  DestruirTrigger("Patrullitas"); 
}

//-----------------------------------------
Trigger "ConquistaFinal" [ Inactivo ]
(
  (DarPorcentajeTropasEnZona("Romanos", "Z_FINAL") > 2)
)
Do
{
  
  DisposeHandle(&hTacticaPuente0);
  DisposeHandle(&hTacticaPuente1);
  DisposeHandle(&hTacticaPuente2);
  DisposeHandle(&hObjetivoConquista);
  DisposeHandle(&hPatrullas);
  DisposeHandle(&hG_1);
  DisposeHandle(&hG_2);
  DisposeHandle(&hG_3);
  DisposeHandle(&hG_4);
  DisposeHandle(&hDestruccion);
  
  hDestruccion = CrearObjetivo(hEstrategia, "AsaltarCampamento", "Coblenza");
  AnyadirGrupoAObjetivo(hDestruccion, "G_CONQUISTA"); 
  AnyadirGrupoAObjetivo(hDestruccion, "G_EXTERMINACION"); 
  AnyadirGrupoAObjetivo(hDestruccion, "ATAQUE0");
  AnyadirGrupoAObjetivo(hDestruccion, "ATAQUE0II");
  AnyadirGrupoAObjetivo(hDestruccion, "ATAQUE1"); 
  AnyadirGrupoAObjetivo(hDestruccion, "ATAQUE1II");
  AnyadirGrupoAObjetivo(hDestruccion, "ATAQUE2"); 
  AnyadirGrupoAObjetivo(hDestruccion, "ATAQUE2II");
  AnyadirGrupoAObjetivo(hDestruccion, "G_RESERVA"); 
  AnyadirGrupoAObjetivo(hDestruccion, "G_1"); 
  AnyadirGrupoAObjetivo(hDestruccion, "G_2"); 
  AnyadirGrupoAObjetivo(hDestruccion, "G_3"); 
  AnyadirGrupoAObjetivo(hDestruccion, "G_4"); 
  
  SetParamObjetivo(hDestruccion, "TiempoParaAtaque", 10);
  SetParamObjetivo(hDestruccion, "PotenciaAtaque", 18000);
   
  AnyadirObjetivo(hEstrategia,  hDestruccion);
  SetParamObjetivo(hDestruccion , "NombreGrupoGenerado", "G_CONQUISTA");
  SetParamObjetivo(hDestruccion , "PuedePedirRefuerzos", FALSE);
  //SetDelayEntrenamientoTropasPueblo_DOS(hEstrategia, "Mogontiacun", 10000);
    
  DestruirTrigger("ConquistaFinal"); 
}


////////////////////////////////////////////////////////
// Trigger para la huida de los hombres de dumnorix
// cuando pierden la mitad de sus puntos de vida

Trigger "CaballeriaCobarde" [Inactivo]
(
  DarVidaGrupo("CABALLERIA_ALIADA") < (fVidaCaballeria/2)
)
Var
{
  float x, y;
  handle hCamaraEnd;
  handle hEscape;
  handle hTimer;
  handle hTacticaHuir;
}
Do
{
  
  QuitarEfectosHabilidades("CABALLERIA_ALIADA");
  CambiarBandoPorGrupo("CABALLERIA_ALIADA", "EDUOS");
  HacerVisibleGrupoTropas("CABALLERIA_ALIADA", TRUE);

  SetMoverFisicoGrupoTropas("CABALLERIA_ALIADA", TRUE);
  GrupoTropasSeguirRutaPredefinida("CABALLERIA_ALIADA", "CAB1");
  SetMoverFisicoTropa("DUMNORIX", TRUE);
  TropaSigueRutaPredefinida("DUMNORIX", "DUM1");

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
    
  EncolarColocarYMirarPunto("DUMNORIX");
  IntroducirLocucion("0970", "LTEXT_MISION9_EVENTO1_00_TXT", 4000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("0971", "LTEXT_MISION9_EVENTO1_01_TXT", 3000, 600, 100);
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
  
  // apagamos a la gente
  hTimer = CrearTimer(10000);
  Wait(hTimer);
  
  HacerVisibleGrupoTropas("CABALLERIA_ALIADA", FALSE);
  HacerVisibleTropa("DUMNORIX", FALSE);
  
  
  DestruirTrigger("CaballeriaCobarde");
  
}

////////////////////////////////////////////////////////

//------------------------------------------
Trigger "End" [ Activo ]  
(
  TRUE
)
Do
{
}