Var
{		
  handle hEstrategiaPompeyo;
	handle hEstrategiaCiv1;
	handle hEstrategiaCiv2;
	handle hEstrategiaCiv3;
		
	handle hCivilizacionPompeyo;
	handle hCivilizacionCiv1;
	handle hCivilizacionCiv2;
	handle hCivilizacionCiv3;
	
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
	
	handle hG_INFRANQUEABLE;
	handle hG_HUNT;
	handle hG_HUNTII;
	
	handle hG_PATI;
	handle hG_PATII;
	handle hG_PATIII;
	handle hG_PATIV;
	handle hG_PATV;
	
	handle hG_ALDEA1;
	
	handle hG_CONQUISTA;
	handle hG_DEFENSA;

  handle hG_DEFENSAL3;	
	handle hG_CABALLOS;
	
	handle hG_ALFA;
	handle hG_BETA;
	handle hG_GAMMA;
	
	bool bForzado;
	bool bEspera;
	
	//OBJETIVOS
	handle hObjCapturarAldea1;
	handle hObjCapturarAldea2;
	handle hObjCapturarAldea3;
	handle hObjDefenderAldea1;
	handle hObjDefenderAldea2;
	handle hObjDefenderAldea3;
  handle hObjCrastinoVivo;
  
  bool bObjDefenderAldea1           = FALSE;
	bool bObjDefenderAldea2           = FALSE;
	bool bObjDefenderAldea3           = FALSE;
  
  //Niveles de dificultad
  float fNivelDificultad                = 0;

  // briefings  
  bool bBriefingEnded               = FALSE;
  float fPuntoSincronia             = 0;
  handle hPuntoSincronia            = NULL;

  
}

#include "FunScript.h"


//------------------------------------------
// MAIN
//------------------------------------------
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
 
  // vosotros, quietos
  OrdenarTropaMantenerPosicion("CENTURION_ALDEA1", TRUE);
  OrdenarTropaMantenerPosicion("CENTURION_ALDEA2", TRUE);
  OrdenarTropaMantenerPosicion("CENTURION_ALDEA3", TRUE);
  
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
  //Restricciones de la mision
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_BARBARA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_ROMANA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_EGIPCIA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_EGIPCIA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_BARBARA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_ROMANA", "");
  
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
  
  //Objetivos
	hObjCapturarAldea1 = CrearHandle("Bool");
	hObjCapturarAldea2 = CrearHandle("Bool");;
	hObjCapturarAldea3 = CrearHandle("Bool");;
  
  hObjDefenderAldea1 = CrearHandle("Bool");
	hObjDefenderAldea2 = CrearHandle("Bool");
	hObjDefenderAldea3 = CrearHandle("Bool");
	hObjCrastinoVivo = CrearHandle("Bool");	
  
  AgregarObjetivoMision(hObjCapturarAldea1, "LTEXT_MISION18_OBJETIVO_01_TXT");
  AgregarObjetivoMision(hObjCapturarAldea2, "LTEXT_MISION18_OBJETIVO_02_TXT");
  AgregarObjetivoMision(hObjCapturarAldea3, "LTEXT_MISION18_OBJETIVO_03_TXT");
  AgregarObjetivoMision(hObjCrastinoVivo, "LTEXT_MISION18_OBJETIVO_00_TXT");
    
  //Banderitas que se activan para regular algunas condiciones 
  bForzado = FALSE;
  bEspera = FALSE;
  
  //Creamos las estrategias de enemigo y de las civ neutras
  hEstrategiaPompeyo = CrearEstrategiaScript();
  hCivilizacionPompeyo = DarCivilizacion("POMPEYO");
  AsignarEstrategia(hCivilizacionPompeyo, hEstrategiaPompeyo);
  StartEstrategia(hEstrategiaPompeyo);
  
  //Algunos grupos que defienden la posicion
  hG_1 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_1, "G_1");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_1);
   
  hG_3 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_3, "G_3");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_3);
  
  hG_4 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_4, "G_4");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_4);
  
  hG_6 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_6, "G_6");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_6);
  
  hG_INFRANQUEABLE= CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_INFRANQUEABLE, "G_INFRANQUEABLE");
  SetParamObjetivo(hG_INFRANQUEABLE, "Tactica", "ActitudBatallon", "Defensiva");
  SetParamObjetivo(hG_INFRANQUEABLE, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategiaPompeyo, hG_INFRANQUEABLE);

  hG_HUNT= CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_HUNT, "G_POMPSHUNT");
  SetParamObjetivo(hG_HUNT, "Tactica", "ActitudBatallon", "Defensiva");
  SetParamObjetivo(hG_HUNT, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategiaPompeyo, hG_HUNT);
  
  hG_HUNTII= CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_HUNTII, "G_POMPSHUNTII");
  SetParamObjetivo(hG_HUNTII, "Tactica", "ActitudBatallon", "Defensiva");
  SetParamObjetivo(hG_HUNTII, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategiaPompeyo, hG_HUNTII);
  
  hG_ALFA = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_ALFA, "G_ALFA");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_ALFA);
  
  hG_BETA = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_BETA, "G_BETA");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_BETA);
  
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
  
  SetParamObjetivo(hG_PATI, "RectanguloPermitido", 40, 4, 138, 122);
  
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
  
  SetParamObjetivo(hG_PATII, "RectanguloPermitido", 40, 4, 138, 122);
  
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
  SetParamObjetivo(hG_PATIII, "MaxNumOleadas", 1);
  
  SetParamObjetivo(hG_PATIII, "RectanguloPermitido", 40, 4, 138, 122);
  
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
  
  SetParamObjetivo(hG_PATIV, "RectanguloPermitido", 40, 4, 138, 122);
  
  AnyadirObjetivo(hEstrategiaPompeyo, hG_PATIV);
    
  //Activacion de Triggers
  ActivarTrigger("PrimerAtaque");
  ActivarTrigger("AtaquePuente");
  ActivarTrigger("1ªCondicion");
  ActivarTrigger("1ªCondicionALDEA1");
  ActivarTrigger("ALDEA1Tuya");
  ActivarTrigger("2ªCondicionALDEA2");
  ActivarTrigger("ALDEA2Tuya");
  ActivarTrigger("ActivacionHunt");
  ActivarTrigger("ActivacionHuntII");
  ActivarTrigger("ConquistaALDEA2Forzada");
  ActivarTrigger("PuentesALDEA3Tuya");
  ActivarTrigger("ALDEA3Tuya");
  ActivarTrigger("AtaqueAldea3");
  ActivarTrigger("RendicionAldea3");
  ActivarTrigger("PuenteNOConstruido");
  ActivarTrigger("PuenteNEConstruido");
  ActivarTrigger("GAMEOVER");
  ActivarTrigger("DefensaAldea1");
  ActivarTrigger("DefensaAldea2");
  ActivarTrigger("ConseguirExplorador");
  ActivarTrigger("EXITO");
  
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
  ActivarPresentacion(TRUE, "LTEXT_MISION18_PRESENTACION_TITULO",
                            "LTEXT_MISION18_PRESENTACION_LUGAR", hPresentacion);
                            
  // camara a donde debe empezar
  EncolarColocarYMirarPunto("BRIEFING_1");
  EjecutarOrdenesCamara();
  
  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));
 
  ActivarPresentacion(FALSE, "", "", NULL);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolaTrayectoriaCamara("BRIEFING_2", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(2000);
  IntroducirLocucion("", "", 2000, 0, 0);
  IntroducirLocucion("18N0", "LTEXT_MISION18_LOCUCION_00_TXT", 6000, 600, 100);
  IntroducirPuntoSincronia();    
  
  EncolarColocarYMirarPunto("BRIEFING_3");
  EncolarPausaCamara(3000);
  EncolarColocarYMirarPunto("BRIEFING_4");
  EncolarPausaCamara(3000);
  EncolarColocarYMirarPunto("BRIEFING_5");
  EncolarPausaCamara(3000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("18N1", "LTEXT_MISION18_LOCUCION_01_TXT", 6000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("18N2", "LTEXT_MISION18_LOCUCION_02_TXT", 5000, 600, 100);
  IntroducirPuntoSincronia();        
 
  EncolarColocarYMirarPunto("BRIEFING_6");
  EncolarPausaCamara(3000);
  EncolarColocarYMirarPunto("BRIEFING_7");
  EncolarPausaCamara(3000);
  EncolarColocarYMirarPunto("BRIEFING_8");
  EncolarPausaCamara(3000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("18N3", "LTEXT_MISION18_LOCUCION_03_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();        
      
  EncolarColocarYMirarPunto("BRIEFING_9");
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("18N4", "LTEXT_MISION18_LOCUCION_04_TXT", 3000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("18N5", "LTEXT_MISION18_LOCUCION_05_TXT", 3000, 600, 100);
  IntroducirPuntoSincronia();    

  IntroducirPonerModoJuegoCamara(TRUE);

  // si no se ha interrumpido
  if ( !HandleDisparado(hEscape) )
  {

    // Iluminamos lo que hay que iluminar
    IluminarZonaOnOff(122, 2, 78, 15, "pueblo1", TRUE);
    IluminarZonaOnOff(68, 0, 65, 15, "pueblo2", TRUE);
    IluminarZonaOnOff(35, 0, 100, 15, "pueblo3", TRUE);
    IluminarZonaOnOff(22, 2, 24, 15, "malos1", TRUE);
    IluminarZonaOnOff(149, 2, 114, 15, "malos2", TRUE);
    IluminarZonaOnOff(67, 2, 45, 15, "malos3", TRUE); 

    // efectos especiales
    ActivarTrigger("EfectosBriefing");

    // acción
    EjecutarOrdenesCamara();

    // final  
    PonerHandleBoolACamara(hCamaraEnd);
    WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));

    // fuera luces
    IluminarZonaOnOff(122, 2, 78, 15, "pueblo1", FALSE);
    IluminarZonaOnOff(68, 0, 65, 15, "pueblo2", FALSE);
    IluminarZonaOnOff(35, 0, 100, 15, "pueblo3", FALSE);
    IluminarZonaOnOff(22, 2, 24, 15, "malos1", FALSE);
    IluminarZonaOnOff(149, 2, 114, 15, "malos2", FALSE);
    IluminarZonaOnOff(67, 2, 45, 15, "malos3", FALSE); 
    
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


//**************************************************************************
//**************************************************************************
//**************************************************************************


//-----------------------------------
Trigger "ConseguirExplorador" [Inactivo]
(
 	(HanEntradoCivilizacionesEnZona("Z_EXPI","CESAR")) &&
 	(EstaTropaViva("Opus"))
)
Do
{
  MensajeLocucionado("18N6","LTEXT_MISION18_MENSAJE_00_TXT");  
  CambiarBandoPorGrupo("G_EXP1", "CESAR");
  DestruirTrigger("ConseguirExplorador");
}

//---------------------------------
Trigger "PrimerAtaque" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_ATAQUE1","CESAR") ||
 	(GrupoSiendoAtacado("G_2")) 
 	
)
Do
{

  MensajeLocucionado("18N7","LTEXT_MISION18_MENSAJE_01_TXT");
  AvisoCivilizacion("CESAR", 130, 31);  
	
	hG_2 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_2, "G_2");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_2);
	DestruirTrigger("PrimerAtaque");
}

//---------------------------------
Trigger "AtaquePuente" [Inactivo]
(
 	(HanEntradoCivilizacionesEnZona("Z_PUENTE1", "CESAR")) ||
 	(GrupoSiendoAtacado("G_5"))
)
Do
{
  if (DarNumUnidadesEnZona("POMPEYO", "Z_PUENTE1") > 50)
  {
  MensajeLocucionado("18N7","LTEXT_MISION18_MENSAJE_01_TXT");
  AvisoCivilizacion("CESAR", 48, 11);  
  }
	
	hG_5 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_5, "G_5");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_5);
	DestruirTrigger("AtaquePuente");
}


//---------------------------------
Trigger "1ªCondicion" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_AVISO","CESAR") ||
 	DarTropasMuertasDeGrupo("G_INFRANQUEABLE") > 0 ||
 	TropaRecibeDanyo("CentuMaximoNivel")
)
Do
{
  SetParamObjetivo(hG_INFRANQUEABLE, "Tactica", "ActitudBatallon", "Ofensiva"); 
  DestruirTrigger("1ªCondicion");
}

//-----------------------------------
Trigger "1ªCondicionALDEA1" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_ALDEA1","CESAR") ||
 	DarTropasMuertasDeGrupo("G_INFRANQUEABLE") > 0 ||
 	TropaRecibeDanyo("CentuMaximoNivel")
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
  
  // cinemática de moda para informar al jugador
  // handles de final
  hCamaraEnd = CrearHandle("Bool");
  hEscape = CrearHandle("Bool");

  // cazar escape
  PonerHandleInterrupcion(hEscape);
  
  // posición actual
  DarPosicionCamara(&x, &y);

  // Iluminamos lo que hay que iluminar
  IluminarZonaOnOff(122, 2, 78, 15, "cinPueblo1", TRUE);
  IluminarZonaOnOff(95, 2, 72, 15, "cinMalos1", TRUE);
  hTimer = CrearTimer(100);           // actualización de la niebla de guerra
  Wait(hTimer);

  // cine
  ActivarCinemascope(TRUE);
  PararLogica(TRUE);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolaTrayectoriaCamara("ALDEA1_1", TRUE, FALSE, 2, 0);
  EncolarPausaCamara(3000);
  IntroducirLocucion("18I0", "LTEXT_MISION18_EVENT1_00_TXT", 4000, 600, 100);
  IntroducirPuntoSincronia();    
    
  EncolaTrayectoriaCamara("ALDEA1_2", FALSE, TRUE, 0, 2);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("18I1", "LTEXT_MISION18_EVENT1_01_TXT", 4000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("18I2", "LTEXT_MISION18_EVENT1_02_TXT", 5000, 600, 100);
  IntroducirPuntoSincronia();        
 
  IntroducirPonerModoJuegoCamara(TRUE);

  // acción
  EjecutarOrdenesCamara();

  // final  
  PonerHandleBoolACamara(hCamaraEnd);
  WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
        
  VaciarOrdenesCamara();
  VaciarLocuciones();

  // fuera luces
  IluminarZonaOnOff(95, 2, 72, 15, "cinMalos1", FALSE);
  IluminarZonaOnOff(122, 2, 78, 15, "cinPueblo1", FALSE);

  // colocamos la cámara
  if ( HandleDisparado(hEscape) )
  {
    MirarAPunto(x, y);
  }

  // restaurar
  PararLogica(FALSE);
  ActivarCinemascope(FALSE);
  
  // final de cinemática 
  //////////////////////////////////////////////////////////////

  // lo que hay que hacer después
  hEstrategiaCiv1 = CrearEstrategiaScript();
  hCivilizacionCiv1 = DarCivilizacion("ALDEA1");
  AsignarEstrategia(hCivilizacionCiv1, hEstrategiaCiv1);
  StartEstrategia(hEstrategiaCiv1);
  
  hG_ALDEA1 = CrearObjetivo(hEstrategiaCiv1, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_ALDEA1, "G_ALDEA1");
  AnyadirObjetivo(hEstrategiaCiv1, hG_ALDEA1);
  
  CrearAlianzaPorNombre("CESAR", "ALDEA1");
  
  EliminarObjetivoMision(hObjCapturarAldea1);
  AgregarObjetivoMision(hObjDefenderAldea1, "LTEXT_MISION18_OBJETIVO_04_TXT");
  ObjetivosMisionCambiados();
  
  DestruirTrigger("1ªCondicionALDEA1");
}

//-----------------------------------
Trigger "ALDEA1Tuya" [Inactivo]
(
 	(DarTropasVivasDeGrupo("G_INFRANQUEABLE") == 0) ||
 	(!EstaTropaViva("CentuMaximoNivel"))
)
Do
{
 
  // mensajillo
  MensajeLocucionado("18N8","LTEXT_MISION18_MENSAJE_02_TXT");
  AvisoCivilizacion("CESAR", 123 , 78);
  
  // pasamos de bando a esta gente
  CambiarBando("ALDEA1", "CESAR");
  
  DestruirTrigger("ALDEA1Tuya");
  
}

//-----------------------------------
Trigger "2ªCondicionALDEA2" [Inactivo]
(
 	(HanEntradoCivilizacionesEnZona("Z_CONQUISTA","CESAR")) ||
 	bForzado
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
 
  // aliamos al jugador con los mendas
  CrearAlianzaPorNombre("ALDEA2", "CESAR");
 
  // cinemática de moda para informar al jugador
  // handles de final
  hCamaraEnd = CrearHandle("Bool");
  hEscape = CrearHandle("Bool");

  // cazar escape
  PonerHandleInterrupcion(hEscape);
  
  // posición actual
  DarPosicionCamara(&x, &y);

  // Iluminamos lo que hay que iluminar
  IluminarZonaOnOff(68, 0, 65, 15, "cinPueblo2", TRUE);
  IluminarZonaOnOff(67, 2, 45, 15, "cinMalos3", TRUE);
  
  hTimer = CrearTimer(100);           // actualización de la niebla de guerra
  Wait(hTimer);

  // cine
  ActivarCinemascope(TRUE);
  PararLogica(TRUE);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolaTrayectoriaCamara("ALDEA2_1", TRUE, FALSE, 2, 0);
  EncolarPausaCamara(3000);
  IntroducirLocucion("18J0", "LTEXT_MISION18_EVENT2_00_TXT", 3000, 600, 100);
  IntroducirPuntoSincronia();    
    
  EncolaTrayectoriaCamara("ALDEA2_2", FALSE, TRUE, 0, 2);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("18J1", "LTEXT_MISION18_EVENT2_01_TXT", 4000, 600, 100);
  IntroducirPuntoSincronia();        
 
  IntroducirPonerModoJuegoCamara(TRUE);

  // acción
  EjecutarOrdenesCamara();

  // final  
  PonerHandleBoolACamara(hCamaraEnd);
  WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
        
  VaciarOrdenesCamara();
  VaciarLocuciones();

  // fuera luces
  IluminarZonaOnOff(68, 0, 65, 15, "cinPueblo2", FALSE);
  IluminarZonaOnOff(67, 2, 45, 15, "cinMalos3", FALSE); 
  
  // colocamos la cámara
  if ( HandleDisparado(hEscape) )
  {
    MirarAPunto(x, y);
  }

  // restaurar
  PararLogica(FALSE);
  ActivarCinemascope(FALSE);
  
  // final de cinemática 
  //////////////////////////////////////////////////////////////
  
  hG_CONQUISTA = CrearObjetivo(hEstrategiaPompeyo, "ConquistaPueblo2", "pueblo2");
  AnyadirGrupoAObjetivo(hG_CONQUISTA, "G_CONQUISTA"); 
   
  SetParamObjetivo(hG_CONQUISTA , "NombreGrupoGenerado", "G_CONQUISTA");
  SetValue(hEstrategiaPompeyo , "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  SetParamObjetivo(hG_CONQUISTA , "PuedePedirRefuerzos", FALSE);
  SetParamObjetivo(hG_CONQUISTA, "POTMIN_DEFENSA_PUEBLO", 20000);
  //SetDelayEntrenamientoTropasPueblo(hEstrategiaPompeyo, "pueblo2", 180000);// cada 3 min se ponen a entrenar una tropa
  //SetDelayEntrenamientoTropasPueblo(hEstrategiaPompeyo, "pueblo2", 10000);
  AnyadirObjetivo(hEstrategiaPompeyo,  hG_CONQUISTA );
  
  //La estrategia del pueblo aliado del jugador
  hEstrategiaCiv2 = CrearEstrategiaScript();
  hCivilizacionCiv2 = DarCivilizacion("ALDEA2");
  AsignarEstrategia(hCivilizacionCiv2, hEstrategiaCiv2);
  StartEstrategia(hEstrategiaCiv2);
  
  //Los aliados defienden su pueblo
  hG_DEFENSA = CrearObjetivo(hEstrategiaCiv2, "ConquistaPueblo2", "pueblo2");
  AnyadirGrupoAObjetivo(hG_DEFENSA, "G_DEFENSA"); 
   
  SetParamObjetivo(hG_DEFENSA , "NombreGrupoGenerado", "G_DEFENSA");
  SetValue(hEstrategiaCiv2 , "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  SetParamObjetivo(hG_DEFENSA , "PuedePedirRefuerzos", FALSE);
  SetParamObjetivo(hG_DEFENSA, "POTMIN_DEFENSA_PUEBLO", 20000);
  //SetDelayEntrenamientoTropasPueblo(hEstrategiaCiv2, "pueblo2", 180000);// cada 3 min se ponen a entrenar una tropa
  //SetDelayEntrenamientoTropasPueblo(hEstrategiaPompeyo, "pueblo2", 10000);
  AnyadirObjetivo(hEstrategiaCiv2,  hG_DEFENSA );
  
  EliminarObjetivoMision(hObjCapturarAldea2);
  AgregarObjetivoMision(hObjDefenderAldea2, "LTEXT_MISION18_OBJETIVO_05_TXT");
  ObjetivosMisionCambiados();

  DestruirTrigger("ConquistaALDEA2Forzada");
  DestruirTrigger("2ªCondicionALDEA2");
}

//-----------------------------------
Trigger "ConquistaALDEA2Forzada" [Inactivo]
(
 	(DarTropasMuertasDeGrupo("G_CONQUISTA") == 1)// o antes, con solo atacarlas...
)
Do
{
  bForzado = TRUE;
    
  DestruirTrigger("ConquistaALDEA2Forzada");
}

//-----------------------------------
Trigger "ALDEA2Tuya" [Inactivo]
(
 	(DarTropasMuertasDeGrupo("G_CONQUISTA") == 10)
)
Do
{
  
  DestruirTrigger("GAMEOVERAldea2");
  
  MensajeLocucionado("18N9","LTEXT_MISION18_MENSAJE_03_TXT");
  AvisoCivilizacion("CESAR", 60, 63);
  
  CambiarBando("ALDEA2", "CESAR");
      
  DestruirTrigger("ALDEA2Tuya");
}

//-----------------------------------
Trigger "ActivacionHunt" [Inactivo]
(
 	(HanEntradoCivilizacionesEnZona("Z_HUNT","CESAR")) ||
 	(GrupoSiendoAtacado("G_POMPSHUNT"))
)
Do
{
  if (DarNumUnidadesEnZona("POMPEYO", "Z_HUNT") > 75)
  {
  MensajeLocucionado("18N7","LTEXT_MISION18_MENSAJE_01_TXT");
  AvisoCivilizacion("CESAR", 21, 23);
  }
  
  SetParamObjetivo(hG_HUNT, "Tactica", "ActitudBatallon", "Ofensiva");
    
  DestruirTrigger("ActivacionHunt");
}

//-----------------------------------
Trigger "ActivacionHuntII" [Inactivo]
(
 	(HanEntradoCivilizacionesEnZona("Z_HUNTII","CESAR")) ||
 	(GrupoSiendoAtacado("G_POMPSHUNTII"))
)
Do
{
  if (DarNumUnidadesEnZona("POMPEYO", "Z_HUNTII") > 75)
  {
  MensajeLocucionado("18N7","LTEXT_MISION18_MENSAJE_01_TXT");
  AvisoCivilizacion("CESAR", 144, 115);
  }
  
  SetParamObjetivo(hG_HUNTII, "Tactica", "ActitudBatallon", "Ofensiva");
    
  DestruirTrigger("ActivacionHuntII");
}

//-----------------------------------
Trigger "PuentesALDEA3Tuya" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_FINAL","CESAR") ||
 	HanEntradoCivilizacionesEnZona("Z_FINALII","CESAR")
)
Var
{
  handle hTimer;
  float x, y;
  handle hCamaraEnd;
  handle hEscape;
}
Do
{
  hTimer = CrearTimer(15000);
	Wait(hTimer);
	
	DestruirTrigger("GAMEOVERAldea3");
	DestruirTrigger("ALDEA3Tuya");
	
	
	// cinemática de moda para informar al jugador
  // handles de final
  hCamaraEnd = CrearHandle("Bool");
  hEscape = CrearHandle("Bool");

  // cazar escape
  PonerHandleInterrupcion(hEscape);
  
  // posición actual
  DarPosicionCamara(&x, &y);

  // Iluminamos lo que hay que iluminar
  IluminarZonaOnOff(35, 0, 100, 15, "pueblo3", TRUE);  
  
  hTimer = CrearTimer(100);           // actualización de la niebla de guerra
  Wait(hTimer);

  // cine
  ActivarCinemascope(TRUE);
  PararLogica(TRUE);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolaTrayectoriaCamara("ALDEA3_1", TRUE, FALSE, 2, 0);
  IntroducirLocucion("18K0", "LTEXT_MISION18_EVENT3_00_TXT", 4000, 600, 100);
  IntroducirPuntoSincronia();    
    
  EncolarPausaCamara(5000);
  EncolaTrayectoriaCamara("ALDEA3_2", FALSE, TRUE, 0, 2);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("18K1", "LTEXT_MISION18_EVENT3_01_TXT", 4000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("18K2", "LTEXT_MISION18_EVENT3_02_TXT", 3000, 600, 100);
  IntroducirPuntoSincronia();        
 
  IntroducirPonerModoJuegoCamara(TRUE);

  // acción
  EjecutarOrdenesCamara();

  // final  
  PonerHandleBoolACamara(hCamaraEnd);
  WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
        
  VaciarOrdenesCamara();
  VaciarLocuciones();

  // fuera luces
  IluminarZonaOnOff(35, 0, 100, 15, "pueblo3", FALSE);  
  
  // colocamos la cámara
  if ( HandleDisparado(hEscape) )
  {
    MirarAPunto(x, y);
  }

  // restaurar
  PararLogica(FALSE);
  ActivarCinemascope(FALSE);
  
  // final de cinemática 
  //////////////////////////////////////////////////////////////
    
  DisposeHandle(&hG_HUNT);
  DisposeHandle(&hG_HUNTII);
  DisposeHandle(&hG_ALFA);
  DisposeHandle(&hG_BETA);
  
  //El ultimo grupo de ataque, todos se emiezan a mover ahora...
  hG_HUNT = CrearObjetivo(hEstrategiaPompeyo, "PuentesRhin", "puenteNO");
  AnyadirGrupoAObjetivo(hG_HUNT, "G_POMPSHUNT");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_HUNT);

  hG_HUNTII = CrearObjetivo(hEstrategiaPompeyo, "PuentesRhin", "puenteNE");
  AnyadirGrupoAObjetivo(hG_HUNTII, "G_POMPSHUNTII");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_HUNTII);
  
  //Para que las tropas que construyen los puentes no se escabullan...
  SetParamObjetivo(hG_HUNT, "VentajaEnemigaHuir", 7);
  SetParamObjetivo(hG_HUNTII, "VentajaEnemigaHuir", 7);
  
  hG_ALFA = CrearObjetivo(hEstrategiaPompeyo, "ConquistaPueblo2", "pueblo3");
  AnyadirGrupoAObjetivo(hG_ALFA, "G_ALFA"); 
  AnyadirGrupoAObjetivo(hG_ALFA, "G_BETA");
  AnyadirGrupoAObjetivo(hG_ALFA, "G_GAMMA");
   
  SetParamObjetivo(hG_ALFA , "NombreGrupoGenerado", "G_ALFA");
  //SetValue(hEstrategiaPompeyo , "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  SetParamObjetivo(hG_ALFA , "PuedePedirRefuerzos", FALSE);
  SetParamObjetivo(hG_ALFA, "POTMIN_DEFENSA_PUEBLO", 20000);
  //SetDelayEntrenamientoTropasPueblo(hEstrategiaPompeyo, "pueblo3", 180000);// cada 3 min se ponen a entrenar una tropa
  //SetDelayEntrenamientoTropasPueblo(hEstrategiaPompeyo, "pueblo3", 10000);
  AnyadirObjetivo(hEstrategiaPompeyo,  hG_ALFA );
  
  hG_PATV = CrearObjetivo(hEstrategiaPompeyo, "PatrullaOleadasPeriodicas", 9000, 9000, 10, 10);
  AnyadirGrupoAObjetivo(hG_PATV, "G_PATV");
  SetParamObjetivo(hG_PATV, "ParametrosTacticas", "AtacarCorriendo", TRUE);	
	SetParamObjetivo(hG_PATV, "FACTOR_POTENCIA_TROPAS", 1);
  SetParamObjetivo(hG_PATV, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hG_PATV, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hG_PATV, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hG_PATV, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hG_PATV, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hG_PATV, "MaxNumOleadas", 1);
  
  SetParamObjetivo(hG_PATV, "RectanguloPermitido", 40, 4, 138, 122);
  
  AnyadirObjetivo(hEstrategiaPompeyo, hG_PATV);
    
  MensajeLocucionado("18NA","LTEXT_MISION18_MENSAJE_04_TXT");
  AvisoCivilizacion("CESAR", 31, 107);
  CambiarBando("ALDEA3", "CESAR");//En lugar de aliados que los lleve el jugador...
  
  bEspera = TRUE;
  
  EliminarObjetivoMision(hObjCapturarAldea3);
  AgregarObjetivoMision(hObjDefenderAldea3, "LTEXT_MISION18_OBJETIVO_06_TXT");
  ObjetivosMisionCambiados();
  
  // vigilamos el aniquilamiento de los malos para dar por bueno el tema y que pompeyo no nos joda 
  ActivarTrigger("Aldea3DefensaDefinitiva");
  ActivarTrigger("Aldea3Tomada");
  
  DestruirTrigger("PuentesALDEA3Tuya");
}


//-----------------------------------
Trigger "PuenteNOConstruido" [Inactivo]
(
 	EstaPuenteConstruido("puenteNO", "POMPEYO") &&
 	bEspera
)
Do
{
  DisposeHandle(&hG_HUNT);

  //hG_HUNT = CrearObjetivo(hEstrategiaPompeyo, "ConquistaPueblo2", "pueblo3");
  AnyadirGrupoAObjetivo(hG_ALFA, "G_POMPSHUNT");//
    /*
  SetParamObjetivo(hG_HUNT , "NombreGrupoGenerado", "G_POMPSHUNT");
  //SetValue(hEstrategiaPompeyo , "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  SetParamObjetivo(hG_HUNT , "PuedePedirRefuerzos", FALSE);
  SetParamObjetivo(hG_HUNT, "POTMIN_DEFENSA_PUEBLO", 20000);
  //SetDelayEntrenamientoTropasPueblo(hEstrategiaPompeyo, "pueblo3", 180000);// cada 3 min se ponen a entrenar una tropa
  //SetDelayEntrenamientoTropasPueblo(hEstrategiaPompeyo, "pueblo3", 10000);
  AnyadirObjetivo(hEstrategiaPompeyo,  hG_HUNT ); 
    */
  DestruirTrigger("PuenteNOConstruido");
}

//-----------------------------------
Trigger "PuenteNEConstruido" [Inactivo]
(
 	EstaPuenteConstruido("puenteNE", "POMPEYO") &&
 	bEspera
)
Do
{
  
  DisposeHandle(&hG_HUNTII);

  //hG_HUNTII = CrearObjetivo(hEstrategiaPompeyo, "ConquistaPueblo2", "pueblo3");
  AnyadirGrupoAObjetivo(hG_ALFA, "G_POMPSHUNTII"); //
    /*
  SetParamObjetivo(hG_HUNTII , "NombreGrupoGenerado", "G_POMPSHUNTII");
  //SetValue(hEstrategiaPompeyo , "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  SetParamObjetivo(hG_HUNTII , "PuedePedirRefuerzos", FALSE);
  SetParamObjetivo(hG_HUNTII, "POTMIN_DEFENSA_PUEBLO", 20000);
  //SetDelayEntrenamientoTropasPueblo(hEstrategiaPompeyo, "pueblo3", 180000);// cada 3 min se ponen a entrenar una tropa
  //SetDelayEntrenamientoTropasPueblo(hEstrategiaPompeyo, "pueblo3", 10000);
  AnyadirObjetivo(hEstrategiaPompeyo,  hG_HUNTII ); 
    */
  DestruirTrigger("PuenteNEConstruido");
}

//-----------------------------------
Trigger "AtaqueAldea3" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_ATAQUEAL3","CESAR")
 	&&
 	!EstaPuebloConquistado("CESAR", "pueblo3")
)
Do
{
  
  MensajeLocucionado("18NC","LTEXT_MISION18_MENSAJE_06_TXT");
  AvisoCivilizacion("CESAR", 88, 52);
  
  CrearAlianzaPorNombre("POMPEYO", "ALDEA3");
  
  hEstrategiaCiv3 = CrearEstrategiaScript();
  hCivilizacionCiv3 = DarCivilizacion("ALDEA3");
  AsignarEstrategia(hCivilizacionCiv3, hEstrategiaCiv3);
  StartEstrategia(hEstrategiaCiv3);
  
  hG_CABALLOS = CrearObjetivo(hEstrategiaCiv3, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_CABALLOS, "G_CABALLOS");
  AnyadirObjetivo(hEstrategiaCiv3, hG_CABALLOS);
    
  DestruirTrigger("AtaqueAldea3");
}

//-----------------------------------
Trigger "RendicionAldea3" [Inactivo]
(
 	(DarTropasMuertasDeGrupo("G_CABALLOS") > 1)
)
Do
{
  
  MensajeLocucionado("18NB","LTEXT_MISION18_MENSAJE_05_TXT");
  
  RomperAlianzaPorNombre("ALDEA3", "POMPEYO");
  CrearAlianzaPorNombre("ALDEA3", "CESAR");
     
  DestruirTrigger("RendicionAldea3");
}

//------------------------------
Trigger "GAMEOVER" [ Inactivo ]  
(
  !EstaTropaViva("CRASTINO")
  ||
  EstructuraDestruida("pueblo1")
  ||
  EstructuraDestruida("pueblo2")
  ||
  EstructuraDestruida("pueblo3")
)
Do
{
  
  if ( !EstaTropaViva("CRASTINO") )
  {
    IndicarObjetivoFracasado(hObjCrastinoVivo);  
  }
  
  if ( EstructuraDestruida("pueblo1") )
  {
    IndicarObjetivoFracasado(hObjDefenderAldea1);  
  }

  if ( EstructuraDestruida("pueblo2") )
  {
    IndicarObjetivoFracasado(hObjDefenderAldea2);  
  }

  if ( EstructuraDestruida("pueblo3") )
  {
    IndicarObjetivoFracasado(hObjDefenderAldea3);  
  }

  FinalizarMision(FALSE);
  DestruirTrigger("GAMEOVER");
  
}


//------------------------------
Trigger "DefensaAldea1" [ Inactivo ]  
(
  EstaPuebloConquistado("CESAR", "pueblo1")
)
Do
{
  bObjDefenderAldea1 = TRUE;
  IndicarObjetivoCumplido(hObjDefenderAldea1);

  ActivarTrigger("Aldea1Tomada");
  DesactivarTrigger("DefensaAldea1");
}

//------------------------------
Trigger "Aldea1Tomada" [ Inactivo ]  
(
  !EstaPuebloConquistado("CESAR", "pueblo1")
)
Do
{
  
  bObjDefenderAldea1 = FALSE;
  IndicarObjetivoPendiente(hObjDefenderAldea1);
  
  ActivarTrigger("DefensaAldea1");
  DesactivarTrigger("Aldea1Tomada");
}

//------------------------------
Trigger "DefensaAldea2" [ Inactivo ]  
(
  EstaPuebloConquistado("CESAR", "pueblo2")
)
Do
{
  bObjDefenderAldea2 = TRUE;
  IndicarObjetivoCumplido(hObjDefenderAldea2);

  ActivarTrigger("Aldea2Tomada");
  DesactivarTrigger("DefensaAldea2");
}

//------------------------------
Trigger "Aldea2Tomada" [ Inactivo ]  
(
  !EstaPuebloConquistado("CESAR", "pueblo2")
)
Do
{
  
  bObjDefenderAldea2 = FALSE;
  IndicarObjetivoPendiente(hObjDefenderAldea2);
  
  ActivarTrigger("DefensaAldea2");
  DesactivarTrigger("Aldea2Tomada");
}

//------------------------------
Trigger "DefensaAldea3" [ Inactivo ]  
(
  EstaPuebloConquistado("CESAR", "pueblo3")
)
Do
{
  
  bObjDefenderAldea3 = TRUE;
  IndicarObjetivoCumplido(hObjDefenderAldea3);

  ActivarTrigger("Aldea3Tomada");
  DesactivarTrigger("DefensaAldea3");
}

//------------------------------
Trigger "Aldea3Tomada" [ Inactivo ]  
(
  !EstaPuebloConquistado("CESAR", "pueblo3")
)
Do
{
  
  bObjDefenderAldea3 = FALSE;
  IndicarObjetivoPendiente(hObjDefenderAldea3);
  
  ActivarTrigger("DefensaAldea3");
  DesactivarTrigger("Aldea3Tomada");
}

//------------------------------
Trigger "Aldea3DefensaDefinitiva" [ Inactivo ]  
(
  (DarTropasVivasDeGrupo("G_POMPSHUNT") == 0) && 
  (DarTropasVivasDeGrupo("G_POMPSHUNTII") == 0) &&
  (DarTropasVivasDeGrupo("G_ALFA") == 0) &&
  (DarTropasVivasDeGrupo("G_BETA") == 0) &&
  (DarTropasVivasDeGrupo("G_GAMMA") == 0)
)
Do
{
  
  bObjDefenderAldea3 = TRUE;
  IndicarObjetivoCumplido(hObjDefenderAldea3);
  

  DesactivarTrigger("Aldea3DefensaDefinitiva");
}

//----------------------------------------
Trigger "EXITO" [ Inactivo ]  
(
  bObjDefenderAldea1        &&
	bObjDefenderAldea2        &&
	bObjDefenderAldea3
)
Do
{
  
  IndicarObjetivoCumplido(hObjCrastinoVivo);
  FinalizarMision(TRUE);
    
  DestruirTrigger("EXITO");  
}

//------------------------------
Trigger "End" [ Activo ]  
(
  TRUE
)
Do
{
}