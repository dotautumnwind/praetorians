Var
{
	handle hEstrategiaPompeyo;
	handle hEstrategiaMasPompeyo;
	handle hEstrategiaAliados;
		
	handle hCivilizacionPompeyo;
	handle hCivilizacionMasPompeyo;
	handle hCivilizacionAliados;
		
	handle hAsaltoCesar;
	handle hAsaltoAliados;
	handle hDefensaAliados;
	
	handle hDefensaPompeyo;
	handle hDefensaMasPompeyo;
	
	handle hMensaka;
	
	handle hCentu1;
	handle hCentu2;
	
	handle hAtUno;
	handle hAtDos;
	
	bool bComp                        = FALSE;
		
	//Condiciones victoria
	handle hExito;
	handle hRescateCentu1;
	handle hRescateCentu2;
	handle hViveCentu1;
	handle hViveCentu2;
	
	bool bRescateCentu1               = FALSE;
	bool bRescateCentu2               = FALSE;
	
	bool bRescateCentuUno             = FALSE; 
	bool bRescateCentuDos             = FALSE;
	
	//bool bObjetivoCumplido          = FALSE;
	
	//niveles de dificultad
  float fNivelDificultad            = 0; 
  
  float fNumeroHuida                = 0;
  float fTiempoAtaqueI              = 0;
  float fTiempoAtaqueII             = 0;
  float fPotenciaAtaqueI            = 0;
  float fPotenciaAtaqueII           = 0;
  
  // briefings  
  float fPuntoSincronia                    = 0;
  handle hPuntoSincronia                   = NULL;
  bool bBriefingEnded                      = FALSE;
  
}

#include "FunScript.h"
/////////////////////////////////////////////////////////////////
// MAIN
/////////////////////////////////////////////////////////////////

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

  // Alianzas de los enemigos
	CrearAlianzaPorNombre("CESAR", "ALIADOS_CESAR");
	CrearAlianzaPorNombre("POMPEYO", "MASPOMPEYO");

  // siguiente...
  ActivarTrigger("Briefing");

}



Trigger "Main2" [Inactivo]
(
  TRUE
)
Do
{
  
  //Para que los 2 pueblos se vean del enemigo  
  IluminarZonaOnOff(172, 2, 77, 20, "enemigos", TRUE);
  IluminarZonaOnOff(164, 2, 12, 20, "enemigo", TRUE);
    
  IluminarZonaOnOff(172, 2, 77, 20, "enemigos", FALSE);
  IluminarZonaOnOff(164, 2, 12, 20, "enemigo", FALSE);
      
  // comprobar el nivel de dificultad
  fNivelDificultad = DarDificultadMision();
  if ( fNivelDificultad == 1 )
  {    
    fNumeroHuida = 38; 
    
    fTiempoAtaqueI = 180;// 3 min
    fTiempoAtaqueII = 210;// 3 min 30 sec
    fPotenciaAtaqueI = 23000;
    fPotenciaAtaqueII = 20000;
    
  }
  else
  if ( fNivelDificultad == 2 )
  {    
    fNumeroHuida = 42;
    
    fTiempoAtaqueI = 150;// 2 min 30 sec
    fTiempoAtaqueII = 180;// 3 min 
    fPotenciaAtaqueI = 27000;
    fPotenciaAtaqueII = 24000;
    
  }
  else
  if ( fNivelDificultad == 3 )
  {
    fNumeroHuida = 45;
    
    fTiempoAtaqueI = 120;// 2 min
    fTiempoAtaqueII = 150;// 2 min 30 sec
    fPotenciaAtaqueI = 30000;
    fPotenciaAtaqueII = 27000; 
    
  }
  else
  {
    fNumeroHuida = 43;
        
    fTiempoAtaqueI = 120;// 2 min
    fTiempoAtaqueII = 180;// 3 min
    fPotenciaAtaqueI = 40000;     
    fPotenciaAtaqueII = 30000;
    
    MensajeChat("Nivel de dificulatd desconocido, oiga");
  }
  
  // Objetivos
  hExito = CrearHandle("Bool");
    
  AgregarObjetivoMision(hExito, "LTEXT_MISION19_OBJETIVO_00_TXT");
      
		
	//InteractuarTropaConEnte("Quinto","Pueblo_Quinto");
	
	//Creamos las estategias de la CPU y de los aliados
	hEstrategiaPompeyo = CrearEstrategiaScript();
  hCivilizacionPompeyo = DarCivilizacion("POMPEYO");
  AsignarEstrategia(hCivilizacionPompeyo, hEstrategiaPompeyo);
  StartEstrategia(hEstrategiaPompeyo);

  hEstrategiaMasPompeyo = CrearEstrategiaScript();
  hCivilizacionMasPompeyo = DarCivilizacion("MASPOMPEYO");
  AsignarEstrategia(hCivilizacionMasPompeyo, hEstrategiaMasPompeyo);
  StartEstrategia(hEstrategiaMasPompeyo);
  
  hEstrategiaAliados = CrearEstrategiaScript();
  hCivilizacionAliados = DarCivilizacion("ALIADOS_CESAR");
  AsignarEstrategia(hCivilizacionAliados, hEstrategiaAliados);
  StartEstrategia(hEstrategiaAliados);
  
  SetParamEstrategia(hEstrategiaPompeyo, "AtacarCorriendo", TRUE);
  SetParamEstrategia(hEstrategiaMasPompeyo, "AtacarCorriendo", TRUE);

    
  //Un mensajero aliado te guia un poco por el mapa
  //TropaSigueRutaPredefinida("MensajeroAli", "R_Aprox");

  		
	//La gestion del pueblo aliado	
	hDefensaAliados = CrearObjetivo(hEstrategiaAliados, "ConquistaPueblo2", "pueblo_no");
  AnyadirGrupoAObjetivo(hDefensaAliados, "G_ALIADOS");  
  AnyadirObjetivo(hEstrategiaAliados,  hDefensaAliados);
  SetParamObjetivo(hDefensaAliados, "NombreGrupoGenerado", "G_ALIADOS");
  //SetValue(hEstrategiaAliados, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  //SetValue(hEstrategiaAliados, "GRUPOTROPAS_A_ENTRENAR", "LIGERAS", 70);
  //SetValue(hEstrategiaAliados, "GRUPOTROPAS_A_ENTRENAR", "PESADAS", 0);
  SetDelayEntrenamientoTropasPueblo(hEstrategiaAliados, "pueblo_no", 120000);// cada 2 min se ponen a entrenar una tropa
  SetParamObjetivo(hDefensaAliados, "PuedePedirRefuerzos", FALSE);	
		
  //La gestion de los pueblos enemigos
  hDefensaPompeyo = CrearObjetivo(hEstrategiaPompeyo, "ConquistaPueblo2", "pueblo_se");
  AnyadirGrupoAObjetivo(hDefensaPompeyo, "G_DEFPOMPEYO");  
  AnyadirObjetivo(hEstrategiaPompeyo,  hDefensaPompeyo);
  SetParamObjetivo(hDefensaPompeyo, "NombreGrupoGenerado", "G_ATCESAR");
  SetParamObjetivo(hDefensaPompeyo, "POTMIN_DEFENSA_PUEBLO", 15000);
  SetParamObjetivo(hDefensaPompeyo, "PuedePedirRefuerzos", FALSE);
  
  hDefensaMasPompeyo = CrearObjetivo(hEstrategiaMasPompeyo, "ConquistaPueblo2", "pueblo_so");
  AnyadirGrupoAObjetivo(hDefensaMasPompeyo, "G_DEFMASPOMPEYO");  
  AnyadirObjetivo(hEstrategiaMasPompeyo,  hDefensaMasPompeyo);
  SetParamObjetivo(hDefensaMasPompeyo, "NombreGrupoGenerado", "G_ATALIADOS");
  SetParamObjetivo(hDefensaMasPompeyo, "POTMIN_DEFENSA_PUEBLO", 15000);
  SetValue(hEstrategiaMasPompeyo, "GRUPOTROPAS_A_ENTRENAR", "PESADAS", 0);
  SetParamObjetivo(hDefensaMasPompeyo, "PuedePedirRefuerzos", FALSE);
     
  //Que no ataquen a los centuriones hasta que el resto de suu escolta no muera...
  SetParamEstrategia(hEstrategiaPompeyo, "ResetTropaRestringida");
  SetParamEstrategia(hEstrategiaMasPompeyo, "ResetTropaRestringida");
  
  SetParamEstrategia(hEstrategiaMasPompeyo, "TropaRestringida", "CentuI");
  SetParamEstrategia(hEstrategiaPompeyo, "TropaRestringida", "CentuII");
  SetParamEstrategia(hEstrategiaPompeyo, "TropaRestringida", "CentuI");
  SetParamEstrategia(hEstrategiaMasPompeyo, "TropaRestringida", "CentuII");
       
  //Activacion de triggers
  ActivarTrigger("Centu1");
  ActivarTrigger("Centu2");
  ActivarTrigger("CentusAlisMuertos");
  ActivarTrigger("AsaltoACesar");
  ActivarTrigger("AsaltoAAliados");
  ActivarTrigger("IntermediateAtack");
  ActivarTrigger("UltimateAtack");
  ActivarTrigger("IntroduccionAliado");
  ActivarTrigger("ExplicacionIAliado");
  ActivarTrigger("ExplicacionIIAliado");
  ActivarTrigger("Centurion1");
  ActivarTrigger("Centurion2");
  ActivarTrigger("Centurion3");
  ActivarTrigger("Centurion4");
  ActivarTrigger("CenturionA");
  ActivarTrigger("CenturionB");
  ActivarTrigger("CenturionC");
  ActivarTrigger("CenturionD");
  ActivarTrigger("Huida");
  ActivarTrigger("GameOver");
  ActivarTrigger("GameOverII");
  ActivarTrigger("1erAtaqueAliado");
  ActivarTrigger("GestionDelPuebloAliado");
  
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
  ActivarPresentacion(TRUE, "LTEXT_MISION19_PRESENTACION_TITULO",
                            "LTEXT_MISION19_PRESENTACION_LUGAR", hPresentacion);
 
  // camara a donde debe empezar
  EncolarColocarYMirarPunto("BRIEFING_1");
  EjecutarOrdenesCamara();
  
  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));
 
  ActivarPresentacion(FALSE, "", "", NULL);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolarPausaCamara(4000);
  EncolarColocarYMirarPunto("BRIEFING_2");
  EncolarPausaCamara(4000);
  IntroducirLocucion("19N0", "LTEXT_MISION19_LOCUCION_00_TXT", 10000, 600, 100);
  IntroducirPuntoSincronia(); 

  EncolaTrayectoriaCamara("BRIEFING_3", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("19N1", "LTEXT_MISION19_LOCUCION_01_TXT", 10000, 600, 100);
  IntroducirPuntoSincronia();
  
  EncolarColocarYMirarPunto("BRIEFING_4");
  EncolarPausaCamara(5000);
  EncolarColocarYMirarPunto("BRIEFING_5");
  EncolarPausaCamara(5000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("19N2", "LTEXT_MISION19_LOCUCION_02_TXT", 10000, 600, 100);
  IntroducirPuntoSincronia();
  
  EncolaTrayectoriaCamara("BRIEFING_6", FALSE, FALSE, 0, 0);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("19N3", "LTEXT_MISION19_LOCUCION_03_TXT", 10000, 600, 100);
  IntroducirPuntoSincronia();
  
  EncolarPausaCamara(3000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("19N4", "LTEXT_MISION19_LOCUCION_04_TXT", 5000, 600, 100);
  IntroducirPuntoSincronia();

  IntroducirPonerModoJuegoCamara(TRUE);

  // si no se ha interrumpido
  if ( !HandleDisparado(hEscape) )
  {

    // efectos especiales
    ActivarTrigger("EfectosBriefing");

    IluminarZonaOnOff(148, 2, 20, 20, "enemigos1", TRUE);
    IluminarZonaOnOff(151, 2, 56, 20, "enemigos2", TRUE);

    // acción
    EjecutarOrdenesCamara();

    // final  
    PonerHandleBoolACamara(hCamaraEnd);
    WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
   
    IluminarZonaOnOff(148, 2, 20, 20, "enemigos1", FALSE);
    IluminarZonaOnOff(151, 2, 56, 20, "enemigos2", FALSE);
    
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





//////////////////////////////////////////////////////
// TRIGGERS DE MISION
//////////////////////////////////////////////////////

// ---------------------------
Trigger "Centu1" [Inactivo]
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(480000); // 8 min  //33
  Wait(hTimer); 
 
  GrupoTropasSeguirRutaPredefinida("G_CENTU1", "R_Centu1");
  
  TropaSigueRutaPredefinida("CentuI", "R_Centu1");
  
  ActivarTrigger("Centu1Llega");
  DestruirTrigger("Centu1");
  
}


// ---------------------------
Trigger "Centu1Llega" [Inactivo]
(
  DarNumUnidadesEnZona("TRAIDORES", "Z_Centu1") > 1 &&
  ( (DarNumUnidadesEnZona("POMPEYO", "Z_Centu1") <= 1) &&
    (DarNumUnidadesEnZona("MASPOMPEYO", "Z_Centu1") <= 1) )
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(60000); // 1 min para que se reagrupen neutralmente
  Wait(hTimer); 
  
  MensajeLocucionado("19N5","LTEXT_MISION19_MENSAJE_00_TXT");
  AvisoCivilizacion("CESAR", 101, 10);
  
  //CambiarBandoPorGrupo("G_CENTU1", "ALIADOS_CESAR");
  HacerVisibleGrupoTropas("G_CENTU1", TRUE);
  
  //CambiarBandoPorGrupo("G_I", "ALIADOS_CESAR");
  HacerVisibleGrupoTropas("G_I", TRUE);
  
  OrdenarTropaMantenerPosicion("CentuI", TRUE);
   
  hCentu1 = CrearObjetivo(hEstrategiaAliados, "DefenderPosicion", 97.6, 9.5);
  AnyadirGrupoAObjetivo(hCentu1, "G_CENTU1");
  SetParamObjetivo(hCentu1, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaAliados, hCentu1);
  
  hRescateCentu1 = CrearHandle ("Bool");
  hViveCentu1 = CrearHandle ("Bool");
  
  AgregarObjetivoMision(hRescateCentu1, "LTEXT_MISION19_OBJETIVO_01_TXT");
  AgregarObjetivoMision(hViveCentu1, "LTEXT_MISION19_OBJETIVO_02_TXT");
  
  bRescateCentu1 = TRUE;

  ActivarTrigger("VerCentu1");
    
  hTimer = CrearTimer(300000); // Un tiempecillo y el centurion se vuelve vulnerable //33
  Wait(hTimer);
  
  if  ((DarNumUnidadesEnZona("TRAIDORES", "Z_Centu1") >= 1) &&
      (DarNumUnidadesEnZona("CESAR", "Z_Centu1") == 0) )
    {
      CambiarObjetivo(hAtUno, "AtacarPunto", 101, 10);
           
      CambiarBandoPorGrupo("G_CENTU1", "ALIADOS_CESAR");
      CambiarBandoPorGrupo("G_I", "ALIADOS_CESAR");
      
      DisposeHandle(&hCentu1);
      
      hCentu1 = CrearObjetivo(hEstrategiaAliados, "DefenderPosicion", 97.6, 9.5);
      AnyadirGrupoAObjetivo(hCentu1, "G_CENTU1");
      SetParamObjetivo(hCentu1, "Tactica", "ActitudBatallon", "Defensiva");
      AnyadirObjetivo(hEstrategiaAliados, hCentu1);
    }
  
  hTimer = CrearTimer(60000); // Un tiempecillo antes de cambiar de objetivo 
  Wait(hTimer); 
    
  DisposeHandle(&hAtUno);
  AnyadirGrupoAObjetivo(hAsaltoAliados, "G_ATUNO");
    
  DestruirTrigger("Centu1Llega");
}

// ---------------------------
Trigger "Centu2" [Inactivo]
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(1080000); // 18 min //33 
  Wait(hTimer); 
  
  GrupoTropasSeguirRutaPredefinida("G_CENTU2", "R_Centu2");
  
  TropaSigueRutaPredefinida("CentuII", "R_Centu2");
  
  ActivarTrigger("Centu2Llega");
  
  DestruirTrigger("Centu2");
}

// ---------------------------
Trigger "Centu2Llega" [Inactivo]
(
  DarNumUnidadesEnZona("TRAIDORES", "Z_Centu2") > 1 &&
  ( (DarNumUnidadesEnZona("POMPEYO", "Z_Centu2") <= 1) &&
    (DarNumUnidadesEnZona("MASPOMPEYO", "Z_Centu2") <= 1) )
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(60000); // 1 min para que se reagrupen neutralmente
  Wait(hTimer); 
  
  SetParamEstrategia(hEstrategiaPompeyo, "ResetTropaRestringida");
  SetParamEstrategia(hEstrategiaMasPompeyo, "ResetTropaRestringida");
  
  MensajeLocucionado("19N6","LTEXT_MISION19_MENSAJE_01_TXT");
  AvisoCivilizacion("CESAR", 126, 83);
    
  //CambiarBandoPorGrupo("G_CENTU2", "ALIADOS_CESAR");
  HacerVisibleGrupoTropas("G_CENTU2", TRUE);
  
  //CambiarBandoPorGrupo("G_II", "ALIADOS_CESAR");
  HacerVisibleGrupoTropas("G_II", TRUE);
  
  OrdenarTropaMantenerPosicion("CentuII", TRUE);
  
  hCentu2 = CrearObjetivo(hEstrategiaAliados, "DefenderPosicion", 127.6, 82);
  AnyadirGrupoAObjetivo(hCentu2, "G_CENTU2");
  SetParamObjetivo(hCentu2, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaAliados, hCentu2);
  
  hRescateCentu2 = CrearHandle ("Bool");
  hViveCentu2 = CrearHandle ("Bool");
  
  AgregarObjetivoMision(hRescateCentu2, "LTEXT_MISION19_OBJETIVO_03_TXT");
  AgregarObjetivoMision(hViveCentu2, "LTEXT_MISION19_OBJETIVO_04_TXT");
  
  bRescateCentu2 = TRUE;
  
  CambiarObjetivo(hAtDos, "AtacarPunto", 127, 83);
  //hAtDos= CrearObjetivo(hEstrategiaPompeyo, "AtacarPunto", 127, 83);
  //AnyadirGrupoAObjetivo(hAtDos, "G_ATDOS");  
  //AnyadirObjetivo(hEstrategiaPompeyo, hAtDos);
  
  ActivarTrigger("VerCentu2");
  
  hTimer = CrearTimer(140000);// Un tiempecillo antes de cambiar de objetivo 
  Wait(hTimer); 
  
  DisposeHandle(&hAtDos);
  
  AnyadirGrupoAObjetivo(hAsaltoCesar, "G_ATDOS");
  
  hTimer = CrearTimer(240000);// Un tiempecillo y el centurion se vuelve vulnerable 
  Wait(hTimer);
  
  if  ((DarNumUnidadesEnZona("TRAIDORES", "Z_Centu2") >= 1) &&
      (DarNumUnidadesEnZona("CESAR", "Z_Centu2") == 0) )
    {
      CambiarBandoPorGrupo("G_CENTU2", "ALIADOS_CESAR");
      CambiarBandoPorGrupo("G_II", "ALIADOS_CESAR");
      
      DisposeHandle(&hCentu2);
      
      hCentu2 = CrearObjetivo(hEstrategiaAliados, "DefenderPosicion", 127.6, 82);
      AnyadirGrupoAObjetivo(hCentu2, "G_CENTU2");
      SetParamObjetivo(hCentu2, "Tactica", "ActitudBatallon", "Defensiva");
      AnyadirObjetivo(hEstrategiaAliados, hCentu2);
    }
    
  DestruirTrigger("Centu2Llega");
}

// ---------------------------
Trigger "VerCentu1" [Inactivo]
(
  HanEntradoCivilizacionesEnZona("Z_Centu1", "CESAR")
)
Do
{
  
  MensajeLocucionado("19N7","LTEXT_MISION19_MENSAJE_02_TXT");
   
  //DisposeHandle(&hCentu1);
    
  //AnyadirGrupoAObjetivo(hDefensaAliados, "G_CENTU1");
  
  OrdenarTropaMantenerPosicion("CentuI", FALSE);
  
  CambiarBandoPorGrupo("G_CENTU1", "CESAR");
  
  CambiarBandoPorGrupo("G_I", "CESAR");
  HacerVisibleGrupoTropas("G_I", FALSE);
  
  IndicarObjetivoCumplido(hRescateCentu1);
  
  bRescateCentuUno = TRUE; 
    
  DestruirTrigger("VerCentu1");
}

Trigger "VerCentu2" [Inactivo]
// ---------------------------
(
  HanEntradoCivilizacionesEnZona("Z_Centu2", "CESAR")
)
Do
{
  
  MensajeLocucionado("19N7","LTEXT_MISION19_MENSAJE_02_TXT");
    
  //DisposeHandle(&hCentu2);
    
  //AnyadirGrupoAObjetivo(hDefensaAliados, "G_CENTU2");
  
  OrdenarTropaMantenerPosicion("CentuII", FALSE);
  
  CambiarBandoPorGrupo("G_CENTU2", "CESAR");
  
  CambiarBandoPorGrupo("G_II", "CESAR");
  HacerVisibleGrupoTropas("G_II", FALSE);
  
  IndicarObjetivoCumplido(hRescateCentu2);
  
  bRescateCentuDos = TRUE; 
      
  DestruirTrigger("VerCentu2");
}



Trigger "Huida" [Inactivo]
// ---------------------------
(
  (DarTropasMuertasDeGrupo("G_ATCESAR") > fNumeroHuida &&
  DarTropasMuertasDeGrupo("G_ATALIADOS") > fNumeroHuida &&
  bRescateCentuUno &&
  bRescateCentuDos)
||
  (EstaPuebloConquistado("CESAR", "pueblo_se") || EstructuraDestruida("pueblo_se")
  || EstaPuebloConquistado("CESAR", "pueblo_so") || EstructuraDestruida("pueblo_se"))
)
Do
{
  
  MensajeLocucionado("19N8","LTEXT_MISION19_MENSAJE_03_TXT");
    
  DisposeHandle(&hAsaltoCesar);
  DisposeHandle(&hAsaltoAliados);
  
  hAsaltoCesar = CrearObjetivo(hEstrategiaPompeyo, "Retirada", hDefensaPompeyo);//Retirada...
  AnyadirGrupoAObjetivo(hAsaltoCesar , "G_ATCESAR");
  AnyadirObjetivo(hEstrategiaPompeyo,  hAsaltoCesar );
  
  hAsaltoAliados = CrearObjetivo(hEstrategiaMasPompeyo, "Retirada", hDefensaMasPompeyo);//Retirada...
  AnyadirGrupoAObjetivo(hAsaltoAliados , "G_ATALIADOS"); 
  AnyadirObjetivo(hEstrategiaMasPompeyo,  hAsaltoAliados );
  
  ActivarTrigger("EXITO");
  DestruirTrigger("Huida");
  
}



Trigger "AsaltoACesar" [ Inactivo ]  
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
  hTimer = CrearTimer(120000); //2 min 
  Wait(hTimer);

  hAtDos = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hAtDos, "G_ATDOS");
  AnyadirObjetivo(hEstrategiaPompeyo, hAtDos);

  // ...Creamos el objetivo de asalto al campamento
  hAsaltoCesar = CrearObjetivo(hEstrategiaPompeyo, "AsaltarCampamento", "pueblo_ne", "G_ATCESAR");
  AnyadirGrupoAObjetivo(hAsaltoCesar, "G_ATCESAR");
  SetParamObjetivo(hAsaltoCesar, "RobaTropasLibres", TRUE);  
  SetParamObjetivo(hAsaltoCesar, "RobarPoderoso", TRUE);

  // ...Parametrizamos las tropas a seleccionar (Antes de añadirselo al objetivo)
  SetParamObjetivo (hAsaltoCesar, "PotenciaAtaque", fPotenciaAtaqueI);
  SetParamObjetivo (hAsaltoCesar, "FuerzaTropasASeleccionar", "CENTURION", 1, 3, 5);
  SetParamObjetivo (hAsaltoCesar, "FuerzaTropasASeleccionar", "EXPLORADOR", 1, 3, 8, 14);
  SetParamObjetivo (hAsaltoCesar, "FuerzaTropasASeleccionar", "MEDICO", 2, 5);
  
  // ...Finalmente añadimos el objetivo a la estrategia
  AnyadirObjetivo (hEstrategiaPompeyo,  hAsaltoCesar);

  // ...Ponemos más parámetros
  SetParamObjetivo (hAsaltoCesar, "NombreGrupoGenerado", "G_ATCESAR");
  SetParamObjetivo (hAsaltoCesar, "TiempoParaAtaque", fTiempoAtaqueI);
  SetParamObjetivo (hAsaltoCesar, "PuedePedirRefuerzos", FALSE);

  //SetValue(hEstrategiaPompeyo, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  //SetValue(hEstrategiaPompeyo, "GRUPOTROPAS_A_ENTRENAR", "LIGERAS", 70);
  //SetValue(hEstrategiaPompeyo, "GRUPOTROPAS_A_ENTRENAR", "PESADAS", 0);
   
  DestruirTrigger ("AsaltoACesar");
}

Trigger "AsaltoAAliados" [ Inactivo ]  
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
  hTimer = CrearTimer(30000); //30 seg 
  Wait(hTimer);

  hAtUno = CrearObjetivo(hEstrategiaMasPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hAtUno, "G_ATUNO");
  AnyadirObjetivo(hEstrategiaMasPompeyo, hAtUno);

  // ...Creamos el objetivo de asalto al campamento
  hAsaltoAliados = CrearObjetivo(hEstrategiaMasPompeyo, "AsaltarCampamento", "pueblo_no", "G_ATALIADOS");
  AnyadirGrupoAObjetivo(hAsaltoAliados, "G_ATALIADOS");  
  SetParamObjetivo(hAsaltoAliados, "RobaTropasLibres", TRUE);  
  SetParamObjetivo(hAsaltoAliados, "RobarPoderoso", TRUE);

  // ...Parametrizamos las tropas a seleccionar (Antes de añadirselo al objetivo)
  SetParamObjetivo (hAsaltoAliados, "PotenciaAtaque", fPotenciaAtaqueII);
  SetParamObjetivo (hAsaltoAliados, "FuerzaTropasASeleccionar", "CENTURION", 1, 3, 5);
  SetParamObjetivo (hAsaltoAliados, "FuerzaTropasASeleccionar", "EXPLORADOR", 2, 4, 18);
  SetParamObjetivo (hAsaltoAliados, "FuerzaTropasASeleccionar", "MEDICO", 1, 3);
  
  // ...Añadimos el objetivo a la estrategia
  AnyadirObjetivo(hEstrategiaMasPompeyo,  hAsaltoAliados);

  SetParamObjetivo (hAsaltoAliados, "NombreGrupoGenerado", "G_ATALIADOS");
  SetParamObjetivo (hAsaltoAliados, "TiempoParaAtaque", fTiempoAtaqueII);
  SetParamObjetivo (hAsaltoAliados, "PuedePedirRefuerzos", FALSE);
  
  //SetValue(hEstrategiaMasPompeyo, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  //SetValue(hEstrategiaMasPompeyo, "GRUPOTROPAS_A_ENTRENAR", "LIGERAS", 70);
  
  DestruirTrigger ("AsaltoAAliados");
}

Trigger "IntermediateAtack" [ Inactivo ]  
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
  hTimer = CrearTimer(780000); //13 min 
  Wait(hTimer);
  
  if (fNivelDificultad == 1)
  {
  SetParamObjetivo(hAsaltoCesar, "PotenciaAtaque", 31000); 
  SetParamObjetivo(hAsaltoAliados, "PotenciaAtaque", 28000);
  }
  
  if (fNivelDificultad == 2)
  {
  SetParamObjetivo(hAsaltoCesar, "PotenciaAtaque", 37000); 
  SetParamObjetivo(hAsaltoAliados, "PotenciaAtaque", 34000);
  }
  
  if (fNivelDificultad == 3)
  {
  SetParamObjetivo(hAsaltoCesar, "PotenciaAtaque", 42000); 
  SetParamObjetivo(hAsaltoAliados, "PotenciaAtaque", 40000);
  }
  
  SetParamObjetivo(hAsaltoCesar, "TiempoParaAtaque", 130);
  SetParamObjetivo(hAsaltoAliados, "TiempoParaAtaque", 140);
  
  DestruirTrigger("IntermediateAtack");
}

//Teoricamente, el ultimo ataque, que si se resiste, se gana
Trigger "UltimateAtack" [ Inactivo ]  
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
  hTimer = CrearTimer(1140000); //19 min 
  Wait(hTimer);
    
  if (fNivelDificultad == 1)
  {
  SetParamObjetivo(hAsaltoCesar, "PotenciaAtaque", 38000); 
  SetParamObjetivo(hAsaltoAliados, "PotenciaAtaque", 36000);
  }
  
  if (fNivelDificultad == 2)
  {
  SetParamObjetivo(hAsaltoCesar, "PotenciaAtaque", 48000); 
  SetParamObjetivo(hAsaltoAliados, "PotenciaAtaque", 46000);
  }
  
  if (fNivelDificultad == 3)
  {
  SetParamObjetivo(hAsaltoCesar, "PotenciaAtaque", 58000); 
  SetParamObjetivo(hAsaltoAliados, "PotenciaAtaque", 56000);
  }
  
  SetParamObjetivo(hAsaltoCesar, "TiempoParaAtaque", 60);
  SetParamObjetivo(hAsaltoAliados, "TiempoParaAtaque", 70);
    
  DestruirTrigger("UltimateAtack");
}

// ---------------------------
//El comportamiento de los aliados
Trigger "AyudaAliada" [ Inactivo ]  
(
  (DarPotenciaCivilizacion("ALIADOS_CESAR") > 45000) &&
  (DarPotenciaCivilizacion("CESAR") < 15000) 
)
Do
{
  
  DisposeHandle(&hDefensaAliados);
  
  hDefensaAliados = CrearObjetivo(hEstrategiaAliados, "ConquistaPueblo2", "pueblo_ne");
  AnyadirGrupoAObjetivo(hDefensaAliados, "G_ALIADOS");  
  AnyadirObjetivo(hEstrategiaAliados,  hDefensaAliados);
  SetParamObjetivo(hDefensaAliados, "NombreGrupoGenerado", "G_ALIADOS");
  //SetValue(hEstrategiaAliados, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  //SetValue(hEstrategiaAliados, "GRUPOTROPAS_A_ENTRENAR", "LIGERAS", 70);
  //SetValue(hEstrategiaAliados, "GRUPOTROPAS_A_ENTRENAR", "PESADAS", 0);
  SetDelayEntrenamientoTropasPueblo(hEstrategiaAliados, "pueblo_no", 60000);// cada 3 min se ponen a entrenar una tropa
  SetParamObjetivo(hDefensaAliados, "PuedePedirRefuerzos", FALSE);
  ActivarTrigger("GestionDelPuebloAliado");
  
  DesactivarTrigger("AyudaAliada");
}
  
 Trigger "GestionDelPuebloAliado" [ Inactivo ]  
// ---------------------------
(
  (DarPotenciaCivilizacion("CESAR") > 30000) &&
  bComp
)
Do
{ 
  
  DisposeHandle(&hDefensaAliados);
  
	hDefensaAliados = CrearObjetivo(hEstrategiaAliados, "ConquistaPueblo2", "pueblo_no");
  AnyadirGrupoAObjetivo(hDefensaAliados, "G_ALIADOS");  
  AnyadirObjetivo(hEstrategiaAliados,  hDefensaAliados);
  SetParamObjetivo(hDefensaAliados, "NombreGrupoGenerado", "G_ALIADOS");
  
  // cada 3 min se ponen a entrenar una tropa
  SetDelayEntrenamientoTropasPueblo(hEstrategiaAliados, "pueblo_no", 60000);
  SetParamObjetivo(hDefensaAliados, "PuedePedirRefuerzos", FALSE);
  
  ActivarTrigger("AyudaAliada");
  DesactivarTrigger("GestionDelPuebloAliado");
  
}



////////////////////////////////////////////////
// CONDICIONES DE FINALIZACION

Trigger "CentusAlisMuertos" [Inactivo]
// ---------------------------
(
  !EstaTropaViva("CentuI") || !EstaTropaViva("CentuII") 
)
Do
{
  
  if (!EstaTropaViva("CentuI")) 
  {
    IndicarObjetivoFracasado(hViveCentu1);
  }
  else 
  {
    IndicarObjetivoFracasado(hViveCentu2);
  }
  
  FinalizarMision(FALSE);
    
  DestruirTrigger("CentusAlisMuertos");
}


// ---------------------------
Trigger "EXITO" [Inactivo]
(
  TRUE
)
Var
{		
  handle hTimer;
}
Do
{	
  
  hTimer = CrearTimer(20000); //20 seg antes de que se acabe la mis y que se vea como huyen
  Wait(hTimer);
  
  //bObjetivoCumplido = TRUE;
  IndicarObjetivoCumplido(hExito);
  
  if (bRescateCentu1)
  {
    IndicarObjetivoCumplido(hViveCentu1);
  }
  
  if (bRescateCentu2)
  {
    IndicarObjetivoCumplido(hViveCentu2);
  }
  
  FinalizarMision(TRUE);
  DestruirTrigger("EXITO");
  
}


// ---------------------------
Trigger "GameOver" [Inactivo]
(
  CivilizacionEstaKO("CESAR") ||
  CivilizacionEstaKO("ALIADOS_CESAR")
)
Do
{
  IndicarObjetivoFracasado(hExito);
  FinalizarMision(FALSE);
  DestruirTrigger("GameOver");
}


// ---------------------------
Trigger "GameOverII" [Inactivo]
(
    (EstaPuebloConquistado("POMPEYO", "pueblo_ne"))
  ||(EstaPuebloConquistado("MASPOMPEYO", "pueblo_no"))
)
Do
{
  IndicarObjetivoFracasado(hExito);
  FinalizarMision(FALSE);
  DestruirTrigger("GameOverII");
}



Trigger "End" [ Activo ]  
// ---------------------------
(
  TRUE
)
Do
{
}