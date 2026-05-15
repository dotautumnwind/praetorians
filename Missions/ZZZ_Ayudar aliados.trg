Var
{	
  handle hEstrategiaEnemigosI;
	handle hCivilizacionEnemigosI;	
	
  handle hEstrategiaAliadosI;
	handle hCivilizacionAliadosI;
	
	handle hEstrategiaAliadosII;
	handle hCivilizacionAliadosII;
	
	handle hObjetivoPueblo1;
	handle hObjetivoPueblo2;
	handle hObjetivoPueblo3;
	handle hObjetivoPueblo4;
	
	handle hTorresNubios;
	handle hTorresNubiosI;
	handle hTorresNubiosII;
	handle hTorresNubiosIII;
	
	// Condiciones victoria
  handle hObjNeutralizarEnemigos;
   
  handle hObjSobrevivirAliados;
  handle hObjSobrevivirAliadosII;
    
  float fNivelDificultad            = 0;
      
  float fHig;
  
  // briefing
  float fPuntoSincronia             = 0;
  handle hPuntoSincronia            = NULL;
  bool bBriefingEnded               = NULL;
  
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
   
  //Las alianzas de los aliados
  CrearAlianzaPorNombre("CESAR", "ALIADOSI");		
	CrearAlianzaPorNombre("CESAR", "ALIADOSII");
  
  ActivarTrigger("Briefing");
  
}


//-----------------------------
Trigger "Main2" [ Inactivo ]  
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
  
  //Objetivos
  hObjNeutralizarEnemigos = CrearHandle("Bool");
  hObjSobrevivirAliados = CrearHandle("Bool");
  hObjSobrevivirAliadosII = CrearHandle("Bool");
  
  AgregarObjetivoMision(hObjNeutralizarEnemigos, "LTEXT_MISION23_OBJETIVO_00_TXT");
  AgregarObjetivoMision(hObjSobrevivirAliados,"LTEXT_MISION23_OBJETIVO_01_TXT");
  AgregarObjetivoMision(hObjSobrevivirAliadosII,"LTEXT_MISION23_OBJETIVO_02_TXT");
  
  // Que los centuriones del jugador entren solos a los pueblos 
  OrdenarTropaMantenerPosicion("CentuEgipcio", FALSE);
  OrdenarTropaMantenerPosicion("CentuRomanoI", FALSE);
  OrdenarTropaMantenerPosicion("CentuRomanoII", FALSE);
  
  // comprobar el nivel de dificultad
  fNivelDificultad = DarDificultadMision();
  if ( fNivelDificultad == 1 )
  {    
    fHig = 40000;// 40 seg
    
  }
  else
  if ( fNivelDificultad == 2 )
  {    
    fHig = 20000;// 20 seg
    
  }
  else
  if ( fNivelDificultad == 3 )
  {
    fHig = 0;
    
  }
  else
  {
    fHig = 0;
        
    MensajeChat("Nivel de dificulatd desconocido, oiga");
  }
  
	  
  //Las estrategias del enemigo y de los aliados
  hEstrategiaAliadosI = CrearEstrategiaEscaramuza();
	hCivilizacionAliadosI = DarCivilizacion("ALIADOSI");	
	AsignarEstrategia(hCivilizacionAliadosI, hEstrategiaAliadosI);
	StartEstrategia(hEstrategiaAliadosI);			
	
	hEstrategiaAliadosII = CrearEstrategiaEscaramuza();
	hCivilizacionAliadosII = DarCivilizacion("ALIADOSII");	
	AsignarEstrategia(hCivilizacionAliadosII, hEstrategiaAliadosII);
	StartEstrategia(hEstrategiaAliadosII);			
			
			
	hEstrategiaEnemigosI = CrearEstrategiaEscaramuza();
	hCivilizacionEnemigosI = DarCivilizacion("EGIPCIOSI");	
	AsignarEstrategia(hCivilizacionEnemigosI, hEstrategiaEnemigosI);
  
  // *** OJO!! Hay que ponerlo ANTES del StartEstrategia
  //SetParamEstrategia(hEstrategiaEnemigosI, "NoObjFallback", TRUE);
  // ***
	StartEstrategia(hEstrategiaEnemigosI);			
		
	//Comportamiento de los enemigos
	SetValue(hEstrategiaEnemigosI, "POTMIN_DEFENSA_PUEBLO", 10000);	
	//SetValue(hEstrategiaEnemigosII, "POTMIN_DEFENSA_PUEBLO", 10000);
	//SetValue(hEstrategiaEnemigosIII, "POTMIN_DEFENSA_PUEBLO", 10000);
	//SetValue(hEstrategiaEnemigosIV, "POTMIN_DEFENSA_PUEBLO", 10000);
	
	SetValue(hEstrategiaEnemigosI, "VENTAJA_MINIMA_ATAQUE_PUEBLO", -0.7);
	//SetValue(hEstrategiaEnemigosII, "VENTAJA_MINIMA_ATAQUE_PUEBLO", -0.7);
	//SetValue(hEstrategiaEnemigosIII, "VENTAJA_MINIMA_ATAQUE_PUEBLO", 1.2);
	//SetValue(hEstrategiaEnemigosIV, "VENTAJA_MINIMA_ATAQUE_PUEBLO", 1.2);
	
	SetValue(hEstrategiaEnemigosI, "VENTAJA_DESEADA_ATAQUE_PUEBLO", 1);
	//SetValue(hEstrategiaEnemigosII, "VENTAJA_DESEADA_ATAQUE_PUEBLO", 1);
	//SetValue(hEstrategiaEnemigosIII, "VENTAJA_DESEADA_ATAQUE_PUEBLO", 1.8);
	//SetValue(hEstrategiaEnemigosIV, "VENTAJA_DESEADA_ATAQUE_PUEBLO", 1.8);
	
	SetValue(hEstrategiaEnemigosI, "POT_MINIMA_ATAQUE_PUEBLO", 25000);
	//SetValue(hEstrategiaEnemigosII, "POT_MINIMA_ATAQUE_PUEBLO", 25000);
	//SetValue(hEstrategiaEnemigosIII, "POT_MINIMA_ATAQUE_PUEBLO", 40000);
	//SetValue(hEstrategiaEnemigosIV, "POT_MINIMA_ATAQUE_PUEBLO", 40000);
	
	SetValue(hEstrategiaEnemigosI, "POT_DESEADA_ATAQUE_PUEBLO", 50000);
	//SetValue(hEstrategiaEnemigosII, "POT_DESEADA_ATAQUE_PUEBLO", 50000);
	//SetValue(hEstrategiaEnemigosIII, "POT_DESEADA_ATAQUE_PUEBLO", 90000);
	//SetValue(hEstrategiaEnemigosIV, "POT_DESEADA_ATAQUE_PUEBLO", 90000);
	
	// Unas cuantas torres con nubios para complicar un poco las cosas
	InteractuarTropaConEnte("N_1", "T_1");
	InteractuarTropaConEnte("N_2", "T_2");
	InteractuarTropaConEnte("N_3", "T_3");
	InteractuarTropaConEnte("N_4", "T_4");
	InteractuarTropaConEnte("N_5", "T_5");
	InteractuarTropaConEnte("N_6", "T_6");
	InteractuarTropaConEnte("N_7", "T_7");
	InteractuarTropaConEnte("N_8", "T_8");
				
	hTorresNubios = CrearObjetivo(hEstrategiaEnemigosI, "DefenderPosicion");
  AnyadirTropaAObjetivo(hTorresNubios, "N_1");
  AnyadirTropaAObjetivo(hTorresNubios, "N_2");
  AnyadirObjetivo(hEstrategiaEnemigosI, hTorresNubios);
  
  hTorresNubiosI = CrearObjetivo(hEstrategiaEnemigosI, "DefenderPosicion");
  AnyadirTropaAObjetivo(hTorresNubiosI, "N_3");
  AnyadirTropaAObjetivo(hTorresNubiosI, "N_4");
  AnyadirObjetivo(hEstrategiaEnemigosI, hTorresNubiosI);
  
  hTorresNubiosII = CrearObjetivo(hEstrategiaEnemigosI, "DefenderPosicion");
  AnyadirTropaAObjetivo(hTorresNubiosII, "N_6");
  AnyadirTropaAObjetivo(hTorresNubiosII, "N_5");
  AnyadirObjetivo(hEstrategiaEnemigosI, hTorresNubiosII);
  
  hTorresNubiosIII = CrearObjetivo(hEstrategiaEnemigosI, "DefenderPosicion");
  AnyadirTropaAObjetivo(hTorresNubiosIII, "N_7");
  AnyadirTropaAObjetivo(hTorresNubiosIII, "N_8");
  AnyadirObjetivo(hEstrategiaEnemigosI, hTorresNubiosIII);
		
	// Me aseguro de que los enemigos produciran en los pueblos que se le dan de inicio		
	hObjetivoPueblo1 = CrearObjetivo(hEstrategiaEnemigosI, "ConquistaPueblo2", "PUEB_ENEMIGOI");
  AnyadirGrupoAObjetivo(hObjetivoPueblo1, "G_DEFPUEBI");  
  AnyadirObjetivo(hEstrategiaEnemigosI,  hObjetivoPueblo1);
  SetParamObjetivo(hObjetivoPueblo1, "PuedePedirRefuerzos", FALSE);
	
	hObjetivoPueblo2 = CrearObjetivo(hEstrategiaEnemigosI, "ConquistaPueblo2", "PUEB_ENEMIGOII");
  AnyadirGrupoAObjetivo(hObjetivoPueblo2, "G_DEFPUEBII");  
  AnyadirObjetivo(hEstrategiaEnemigosI,  hObjetivoPueblo2);
  SetParamObjetivo(hObjetivoPueblo2, "PuedePedirRefuerzos", FALSE);
		
	hObjetivoPueblo3 = CrearObjetivo(hEstrategiaEnemigosI, "ConquistaPueblo2", "PUEB_ENEMIGOIII");
  AnyadirGrupoAObjetivo(hObjetivoPueblo3, "G_DEFPUEBIII");  
  AnyadirObjetivo(hEstrategiaEnemigosI,  hObjetivoPueblo3);
  SetParamObjetivo(hObjetivoPueblo3, "PuedePedirRefuerzos", FALSE);
  
  hObjetivoPueblo4 = CrearObjetivo(hEstrategiaEnemigosI, "ConquistaPueblo2", "PUEB_ENEMIGOIV");
  AnyadirGrupoAObjetivo(hObjetivoPueblo4, "G_DEFPUEBIV");  
  AnyadirObjetivo(hEstrategiaEnemigosI,  hObjetivoPueblo4);
  SetParamObjetivo(hObjetivoPueblo4, "PuedePedirRefuerzos", FALSE);
    
  SetDelayEntrenamientoTropasPueblo(hEstrategiaEnemigosI, "PUEB_ENEMIGOI", fHig);
  SetDelayEntrenamientoTropasPueblo(hEstrategiaEnemigosI, "PUEB_ENEMIGOII", fHig);
  SetDelayEntrenamientoTropasPueblo(hEstrategiaEnemigosI, "PUEB_ENEMIGOIII", fHig);
  SetDelayEntrenamientoTropasPueblo(hEstrategiaEnemigosI, "PUEB_ENEMIGOIV", fHig);
 
  
  // le digo a los aliados que traten de trincar pueblos
  SetParamEstrategia(hEstrategiaAliadosI, "ConvertirGuarnicionesAliadas", TRUE);
  SetParamEstrategia(hEstrategiaAliadosII, "ConvertirGuarnicionesAliadas", TRUE);
 
	//Activacion de triggers
	ActivarTrigger("EnemiesSinPueblos");
	ActivarTrigger("GameOver");
	ActivarTrigger("GameOverII");
	
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
  ActivarPresentacion(TRUE, "LTEXT_MISION23_PRESENTACION_TITULO",
                            "LTEXT_MISION23_PRESENTACION_LUGAR", hPresentacion);
                            
  // camara a donde debe empezar
  EncolarColocarYMirarPunto("BRIEFING_1");
  EjecutarOrdenesCamara();
  
  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));
 
  ActivarPresentacion(FALSE, "", "", NULL);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);
  
  EncolarPausaCamara(2000);
  EncolaTrayectoriaCamara("BRIEFING_2", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(2000);
  IntroducirLocucion("23N0", "LTEXT_MISION23_LOCUCION_00_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();        

  EncolarColocarYMirarPunto("PUEBLO_1");
  EncolarPausaCamara(8000);
  EncolarColocarYMirarPunto("PUEBLO_2");
  EncolarPausaCamara(2000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("23N1", "LTEXT_MISION23_LOCUCION_01_TXT", 10000, 600, 100);
  IntroducirPuntoSincronia();        

  EncolarColocarYMirarPunto("BRIEFING_3");
  EncolarPausaCamara(2000);
  EncolaTrayectoriaCamara("BRIEFING_4", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(2000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("23N2", "LTEXT_MISION23_LOCUCION_02_TXT", 8000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("23N3", "LTEXT_MISION23_LOCUCION_03_TXT", 5000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("23N4", "LTEXT_MISION23_LOCUCION_04_TXT", 3000, 600, 100);
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



////////////////////////////////////////////////////////////////
// TRIGGERS DE MISION
////////////////////////////////////////////////////////////////

//Control de la conquista de los pueblos enemigos
//------------------------------------
Trigger "EnemiesSinPueblos" [Inactivo]
(
  DarNumPueblosConqDestr("EGIPCIOSI", 
                         "PUEB_ENEMIGOI", "PUEB_ENEMIGOII", "PUEB_ENEMIGOIII", "PUEB_ENEMIGOIV", 
                         "PUEB_CESARI", "PUEB_CESARII", "PUEB_CESARIII", "PUEB_ALIADOI", "PUEB_ALIADOII",
                         TRUE, FALSE) == 0
                         // Solo valen los conquistados, los destruidos no
)
Do
{  
  
  IndicarObjetivoCumplido(hObjNeutralizarEnemigos);
  IndicarObjetivoCumplido(hObjSobrevivirAliados);
  IndicarObjetivoCumplido(hObjSobrevivirAliadosII);
  
  FinalizarMision(TRUE);
  
  DestruirTrigger("EnemiesSinPueblos");
}

//--------------------------------------
Trigger "GameOver" [ Inactivo ]
(
  CivilizacionEstaKO("CESAR")
)
Do
{
  IndicarObjetivoFracasado(hObjNeutralizarEnemigos);

  FinalizarMision(FALSE);
  DestruirTrigger("GameOver"); 
}

//--------------------------------------
Trigger "GameOverII" [ Inactivo ]
( 
  CivilizacionEstaKO("ALIADOSI") ||
  CivilizacionEstaKO("ALIADOSII")
)
Do
{
  if (CivilizacionEstaKO("ALIADOSI"))
  {
  IndicarObjetivoFracasado(hObjSobrevivirAliados);
  }
  
  if (CivilizacionEstaKO("ALIADOSII"))
  {
  IndicarObjetivoFracasado(hObjSobrevivirAliadosII);
  }
  
  FinalizarMision(FALSE);
  DestruirTrigger("GameOverII"); 
}

//--------------------------------
Trigger "End" [ Activo ]  
(
  TRUE
)
Do
{
}