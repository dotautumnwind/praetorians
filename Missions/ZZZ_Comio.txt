Var
{
	handle hEstrategiaBrit;
	handle hCivilizacionBrit;
	
	handle hEstrategiaBritII;
	handle hCivilizacionBritII;
	
	handle hEstrategiaAtrebates;
	handle hCivilizacionAtrebates;
	
	handle hEstrategiaComio;
	handle hCivilizacionComio;
	
	handle hEstrategiaMensajero;
	handle hCivilizacionMensajero;
	
	handle hG_BALLESTAS;
	handle hG_ARQUEROI;
	handle hG_ARQUEROII;
	handle hG_ARQUEROIII;
	handle hG_ARQUEROIV;
	handle hG_PAQUETE;
	handle hG_LADILLA;
	handle hG_PRADERA;
	handle hG_PESADO;
	handle hG_CABALLERIA;
	handle hG_AVANZADILLA;
	handle hG_ASALTOPUEBLO;
	handle hG_FORTALEZA;
  handle hG_PLAYA;
  
  handle hG_REFUERZOS;
  
  handle hG_1;
  handle hG_2;
  handle hG_3;
  handle hG_4;
  handle hG_5;
    
  handle hDefensaAtrebates;
  handle hAtaqueAtrebates;
  handle hDefensaCantiacos;
  
  handle hDefensaFortaleza;
  
  handle hG_PATI;
  
  handle hGuia;
			
	// Objetivos
	handle hRescateComio;
	handle hEscoltaComio;
	handle hObjQuintoVivo;
	handle hObjCrastinoVivo;
	
  // briefings  
  float fPuntoSincronia             = 0;
  handle hPuntoSincronia            = NULL;
  bool bBriefingEnded               = FALSE;
  
  bool bComioAcabado                = FALSE;
  
  // Dificultad
	float fNivelDificultad;
	float fEntrenamientoGalo;
	float fEntrenamientoAliado;
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
 
  // Neutralizamos la civilizacion del mensajero atrébate
  NeutralizarCivilizacion("MENSAJERO", TRUE);

  //La situacion de Comio
  IluminarZonaOnOff(75.5,0,188.6,10, "ShiningComio", TRUE);
  
  //Alianza de los enemigos
  CrearAlianzaPorNombre("Catuvelaunos", "Cantiacos");

  ActivarTrigger("Briefing");
  DestruirTrigger("Main");
  
}


Trigger "Main2" [ Inactivo ]  
(
  TRUE
)
Do
{ 
  // Restricciones de la mision
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GLADIADOR", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "PIQUERO_ELITE", "");
  
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_GERMANA", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_ESPADON", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_CAZADOR", "Romanos");
  
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "BALLESTA_MOVIL_BARBARA", "Catuvelaunos");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "CATAPULTA_BARBARA", "Catuvelaunos");
  
  // Comprobar el nivel de dificultad
  fNivelDificultad = DarDificultadMision();
  if ( fNivelDificultad == 1 )
  { 
    //Regulado del ritmo de produccion enemigo   
    fEntrenamientoGalo = 900000;// 13 min   
    
    //Regulado del ritmo de produccion aliado   
    fEntrenamientoAliado = 10000;// 10 sec
  }
  else
  if ( fNivelDificultad == 2 )
  {    
    //Regulado del ritmo de produccion enemigo   
    fEntrenamientoGalo = 720000;// 12 min
    
    //Regulado del ritmo de produccion aliado   
    fEntrenamientoAliado = 60000;// 1 min
  }
  else
  if ( fNivelDificultad == 3 )
  {
    //Regulado del ritmo de produccion enemigo   
    fEntrenamientoGalo = 0;//600000;// 10 min //**
    
    //Regulado del ritmo de produccion aliado   
    fEntrenamientoAliado = 120000;// 2 min
  }
  else
  {
    //Regulado del ritmo de produccion enemigo   
    fEntrenamientoGalo = 420000;// 7 min
    
    MensajeChat("Nivel de dificulatd desconocido, oiga");
  }
  
  // Objetivos
  hRescateComio = CrearHandle("Bool");
  hEscoltaComio = CrearHandle ("Bool");
	hObjQuintoVivo = CrearHandle("Bool");
	hObjCrastinoVivo = CrearHandle("Bool");

  AgregarObjetivoMision(hRescateComio, "LTEXT_MISION10_OBJETIVO_00_TXT");
  AgregarObjetivoMision(hObjQuintoVivo, "LTEXT_MISION10_OBJETIVO_01_TXT");
  AgregarObjetivoMision(hObjCrastinoVivo, "LTEXT_MISION10_OBJETIVO_02_TXT");
      
  //La primera torre de defensa
  InteractuarTropaConEnte("Porculeros", "Tporculeros");
    
  //Esrategia de la CPU
	hEstrategiaBrit = CrearEstrategiaScript();
  hCivilizacionBrit = DarCivilizacion("Catuvelaunos");
  AsignarEstrategia(hCivilizacionBrit, hEstrategiaBrit);		
  StartEstrategia(hEstrategiaBrit);
  
  hEstrategiaBritII = CrearEstrategiaScript();
  hCivilizacionBritII = DarCivilizacion("Cantiacos");
  AsignarEstrategia(hCivilizacionBritII, hEstrategiaBritII);		
  StartEstrategia(hEstrategiaBritII);
  
  hEstrategiaMensajero = CrearEstrategiaScript();
	hCivilizacionMensajero = DarCivilizacion("MENSAJERO");
	AsignarEstrategia(hCivilizacionMensajero, hEstrategiaMensajero);
	StartEstrategia(hEstrategiaMensajero);
    
  /*
  hEstrategiaComio = CrearEstrategiaScript();
  hCivilizacionComio = DarCivilizacion("COMIO");
  AsignarEstrategia(hCivilizacionComio, hEstrategiaComio);		
  StartEstrategia(hEstrategiaComio);
  */
    
  //La gestion del pueblo enemigo
  hDefensaCantiacos = CrearObjetivo(hEstrategiaBritII, "ConquistaPueblo2", "Durolitum");
  AnyadirGrupoAObjetivo(hDefensaCantiacos, "G_DEF");  
  AnyadirObjetivo(hEstrategiaBritII,  hDefensaCantiacos);
  SetParamObjetivo(hDefensaCantiacos, "NombreGrupoGenerado", "G_PATRULLAS");
  SetValue(hEstrategiaBritII, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 5);
  //SetValue(hEstrategiaBritII, "GRUPOTROPAS_A_ENTRENAR", "LIGERAS", 70);
  //SetValue(hEstrategiaBritII, "GRUPOTROPAS_A_ENTRENAR", "PESADAS", 0);
  SetDelayEntrenamientoTropasPueblo_DOS(hEstrategiaBritII, "Durolitum", fEntrenamientoGalo);
  SetParamObjetivo(hDefensaCantiacos, "PuedePedirRefuerzos", FALSE);
  
  //La defensa de la fortaleza por parte del enemigo
  hDefensaFortaleza = CrearObjetivo(hEstrategiaBrit, "DefensaFortaleza", "COMIO_FORTRESS");
  AnyadirGrupoAObjetivo(hDefensaFortaleza, "G_FORTALEZA");  
  AnyadirObjetivo(hEstrategiaBrit,  hDefensaFortaleza);
  SetParamObjetivo(hDefensaFortaleza, "NombreGrupoGenerado", "G_FORTALEZA");
  SetValue(hEstrategiaBrit, "GRUPOTROPAS_A_ENTRENAR", "PIQUERO", 0);
  SetValue(hEstrategiaBrit, "GRUPOTROPAS_A_ENTRENAR", "INF_ARQUERO", 15);
  SetValue(hEstrategiaBrit, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  SetDelayEntrenamientoTropasPueblo_DOS(hEstrategiaBrit, "Barracon britano", fEntrenamientoGalo);
  SetParamObjetivo(hDefensaFortaleza, "PuedePedirRefuerzos", FALSE);
  
  //Las patrullas aleatorias
  hG_PATI = CrearObjetivo(hEstrategiaBritII, "PatrullaOleadasPeriodicas", 9000, 9000, 45, 90);
  AnyadirGrupoAObjetivo(hG_PATI, "G_PATRULLAS");
  SetParamObjetivo(hG_PATI, "ParametrosTacticas", "AtacarCorriendo", TRUE);	
	SetParamObjetivo(hG_PATI, "FACTOR_POTENCIA_TROPAS", 1);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_ENEMIGOS", 0.2);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_PUEBLOS", -100);
  SetParamObjetivo(hG_PATI, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hG_PATI, "MaxNumOleadas", 3);
  AnyadirObjetivo(hEstrategiaBritII, hG_PATI);
    
  //Grupos enemigos que mantienen la posicion
  
  hG_AVANZADILLA = CrearObjetivo(hEstrategiaBrit, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_AVANZADILLA, "G_AVANZADILLA");
  //SetParamObjetivo(hG_AVANZADILLA , "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBrit, hG_AVANZADILLA);  
  
  hG_ASALTOPUEBLO = CrearObjetivo(hEstrategiaBrit, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_ASALTOPUEBLO, "G_ASALTOPUEBLO");
  SetParamObjetivo(hG_ASALTOPUEBLO , "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBrit, hG_ASALTOPUEBLO);  
  
  hG_BALLESTAS = CrearObjetivo(hEstrategiaBrit, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_BALLESTAS, "G_BALLESTAS");
  //SetParamObjetivo(hG_BALLESTAS, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBrit, hG_BALLESTAS);
  
  hG_ARQUEROI = CrearObjetivo(hEstrategiaBrit, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_ARQUEROI, "G_ARQUEROI");
  SetParamObjetivo(hG_ARQUEROI, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBrit, hG_ARQUEROI);
  
  hG_ARQUEROII = CrearObjetivo(hEstrategiaBrit, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_ARQUEROII, "G_ARQUEROII");
  //SetParamObjetivo(hG_ARQUEROII, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBrit, hG_ARQUEROII);
  
  hG_ARQUEROIII = CrearObjetivo(hEstrategiaBrit, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_ARQUEROIII, "G_ARQUEROIII");
  //SetParamObjetivo(hG_ARQUEROIII, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBrit, hG_ARQUEROIII);
  
  hG_ARQUEROIV = CrearObjetivo(hEstrategiaBrit, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_ARQUEROIV, "G_ARQUEROIV");
  //SetParamObjetivo(hG_ARQUEROIV, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBrit, hG_ARQUEROIV);
      
  hG_PAQUETE = CrearObjetivo(hEstrategiaBrit, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_PAQUETE, "G_PAQUETE");
  //SetParamObjetivo(hG_PAQUETE, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBrit, hG_PAQUETE);
  
  hG_LADILLA = CrearObjetivo(hEstrategiaBrit, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_LADILLA, "G_LADILLA");
  SetParamObjetivo(hG_LADILLA, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBrit, hG_LADILLA);
  
  hG_PRADERA = CrearObjetivo(hEstrategiaBrit, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_PRADERA, "G_PRADERA");
  SetParamObjetivo(hG_PRADERA, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBrit, hG_PRADERA);
  
  hG_PESADO = CrearObjetivo(hEstrategiaBrit, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_PESADO, "G_PESADO");
  //SetParamObjetivo(hG_PESADO, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBrit, hG_PESADO);
  
  hG_CABALLERIA = CrearObjetivo(hEstrategiaBrit, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_CABALLERIA, "G_CABALLERIA");
  SetParamObjetivo(hG_CABALLERIA, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBrit, hG_CABALLERIA); 
  
  hG_PLAYA = CrearObjetivo(hEstrategiaBrit, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_PLAYA, "G_PLAYA");
  SetParamObjetivo(hG_PLAYA , "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBrit, hG_PLAYA);
  
  //Los grupos de despedida mantienen la posicion hasta el momento oportuno
  hG_1 = CrearObjetivo(hEstrategiaBritII, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_1, "G_1");
  SetParamObjetivo(hG_1 , "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBritII, hG_1);
  
  hG_2 = CrearObjetivo(hEstrategiaBritII, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_2, "G_2");
  SetParamObjetivo(hG_2 , "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBritII, hG_2);
  
  hG_3 = CrearObjetivo(hEstrategiaBritII, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_3, "G_3");
  SetParamObjetivo(hG_3 , "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBritII, hG_3);
  
  hG_4 = CrearObjetivo(hEstrategiaBritII, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_4, "G_4");
  SetParamObjetivo(hG_4 , "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBritII, hG_4);
  
  hG_5 = CrearObjetivo(hEstrategiaBritII, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_5, "G_5");
  SetParamObjetivo(hG_5 , "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBritII, hG_5);
     
  /*    
  //Comio no será atacado en primer lugar
  SetParamEstrategia(hEstrategiaComio, "ResetTropaRestringida");
  SetParamEstrategia(hEstrategiaComio, "TropaRestringida", "Comio");
  */
    
  //Activacion de triggers
  ActivarTrigger("RescateExpAliado");
  ActivarTrigger("G_LADILLAup");
  ActivarTrigger("G_PRADERAup");
  ActivarTrigger("G_PLAYAup");
  ActivarTrigger("G_CABALLERIAup");
  ActivarTrigger("G_3-4-5up");
  ActivarTrigger("G_1-2up");
  ActivarTrigger("AtaqueAliado");
  ActivarTrigger("ActivacionHuida");
  ActivarTrigger("GameOver");
  ActivarTrigger("AtrebatesTuyos");
  ActivarTrigger("AtrebatesRebeldes");
    
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
  ActivarPresentacion(TRUE, "LTEXT_MISION10_PRESENTACION_TITULO",
                            "LTEXT_MISION10_PRESENTACION_LUGAR", hPresentacion);
 
  // camara a donde debe empezar
  EncolarColocarYMirarPunto("TOMA_0");
  EjecutarOrdenesCamara();
  
  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));
 
  ActivarPresentacion(FALSE, "", "", NULL);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);
  
  EncolarColocarYMirarPunto("TOMA_0");
  EncolarPausaCamara(2000);
  EncolaTrayectoriaCamara("RECORRIDO_1", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  IntroducirLocucion("10N0", "LTEXT_MISION10_LOCUCION_00_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia(); // 1
  
  EncolarColocarYMirarPunto("TOMA_1");
  EncolarPausaCamara(1000);
  EncolaTrayectoriaCamara("RECORRIDO_2", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("10N1", "LTEXT_MISION10_LOCUCION_01_TXT", 8000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);    
  IntroducirLocucion("10N2", "LTEXT_MISION10_LOCUCION_02_TXT", 5000, 600, 100);
  IntroducirPuntoSincronia(); // 2
  
  EncolaTrayectoriaCamara("RECORRIDO_3", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  IntroducirLocucion("", "", 100, 0, 0);    
  IntroducirLocucion("10N3", "LTEXT_MISION10_LOCUCION_03_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia(); // 3

  EncolaTrayectoriaCamara("RECORRIDO_4", FALSE, FALSE, 0, 0);
  IntroducirLocucion("", "", 100, 0, 0);    
  IntroducirLocucion("10N4", "LTEXT_MISION10_LOCUCION_04_TXT", 5000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);    
  IntroducirLocucion("10N5", "LTEXT_MISION10_LOCUCION_05_TXT", 3000, 600, 100);
  IntroducirPuntoSincronia(); // 4
     
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
  
  // Iluminacion
  IluminarZona(138, 2, 172, 10, 60000);
  IluminarZona(138, 2, 154, 10, 60000);
  IluminarZona(160, 0, 138, 10, 60000);
  IluminarZona(142, 0, 123, 10, 60000);
  
  IluminarZonaOnOff(83, 0, 146, 20, "lago", TRUE);
  
  WaitBool( (fPuntoSincronia == 4) || bBriefingEnded );
  
  IluminarZonaOnOff(83, 0, 146, 20, "lago", FALSE);
    
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


// -------------------------------- 
 Trigger "RescateExpAliado" [Inactivo]
(
  (EstaTropaViva("Coleguita") && DarTropasVivasDeGrupo("G_PLAYA") < 2) ||
  (DarPorcentajeTropasEnZona("Romanos", "Z_CONALI") < 85) ||
  (!EstaTropaViva("Coleguita") && DarTropasVivasDeGrupo("G_PLAYA") < 3)
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
  
  //iluminamos al mensajero
  HacerVisibleTropa("GUIA", TRUE);
  
  hTimer = CrearTimer(200);
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
    
  EncolaTrayectoriaCamara("MENSAJERO_1", TRUE, FALSE, 2, 0);
  IntroducirLocucion("1080", "LTEXT_MISION10_EVENTO1_00_TXT", 5000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("1081", "LTEXT_MISION10_EVENTO1_01_TXT", 5000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("1082", "LTEXT_MISION10_EVENTO1_02_TXT", 4000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirPuntoSincronia(); // 1
  
  EncolaTrayectoriaCamara("MENSAJERO_1", FALSE, TRUE, 0, 2);
  IntroducirPuntoSincronia(); // 2
       
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
  //////////////////////////////////////////////////////////////

  CrearAlianzaPorNombre("Romanos", "Atrebates");
  
  //GrupoTropasSeguirRutaPredefinida("G_AVANZADILLA", "R_AVANZADILLA");
  
  DisposeHandle(&hG_AVANZADILLA);
  
  hG_AVANZADILLA = CrearObjetivo(hEstrategiaBrit, "DefenderPosicion", 52, 20);
  AnyadirGrupoAObjetivo(hG_AVANZADILLA, "G_AVANZADILLA");
  SetParamObjetivo(hG_AVANZADILLA , "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaBrit, hG_AVANZADILLA);
        
  //Estrategia de los Atrebates
  hEstrategiaAtrebates = CrearEstrategiaScript();
  hCivilizacionAtrebates = DarCivilizacion("Atrebates");
  AsignarEstrategia(hCivilizacionAtrebates, hEstrategiaAtrebates);		
  StartEstrategia(hEstrategiaAtrebates);
  
  //regulación del máximo de tropas que puede llevar el jugador
  ActivarTrigger("PararProduccionAlis");
  
  //El grupo de aliados de la fortaleza mantiene defensivamente se posicion
  hG_REFUERZOS = CrearObjetivo(hEstrategiaAtrebates, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_REFUERZOS, "G_REFUERZOS");
  SetParamObjetivo(hG_REFUERZOS , "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaAtrebates, hG_REFUERZOS);
  
  //La ruta del explorador aliado
  hGuia = CrearObjetivo(hEstrategiaMensajero, "MostrarRuta", "R_MejorCamino", "Romanos");
  AnyadirTropaAObjetivo(hGuia, "GUIA");  
  AnyadirObjetivo(hEstrategiaMensajero,  hGuia);
  
  //La defensa del pueblo aliado por parte de sus propias tropas  
  hDefensaAtrebates = CrearObjetivo(hEstrategiaAtrebates, "ConquistaPueblo2", "Durobrivae");
  AnyadirGrupoAObjetivo(hDefensaAtrebates, "G_ATREBATES");  
  AnyadirObjetivo(hEstrategiaAtrebates,  hDefensaAtrebates);
  SetParamObjetivo(hDefensaAtrebates, "NombreGrupoGenerado", "G_ATREBATES");
  //SetValue(hEstrategiaAtrebates, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  //SetValue(hEstrategiaAtrebates, "GRUPOTROPAS_A_ENTRENAR", "LIGERAS", 70);
  //SetValue(hEstrategiaAtrebates, "GRUPOTROPAS_A_ENTRENAR", "PESADAS", 0);
  SetDelayEntrenamientoTropasPueblo_DOS(hEstrategiaAtrebates, "Durobrivae", 120000); // 2 min
  SetParamObjetivo(hDefensaAtrebates, "PuedePedirRefuerzos", FALSE);
    
  //El explorador no será atacado a la primera
  SetParamEstrategia(hEstrategiaAtrebates, "ResetTropaRestringida");
  SetParamEstrategia(hEstrategiaAtrebates, "TropaRestringida", "GUIA");
  
  ActivarTrigger("MensajeroRetomar");    	
  DestruirTrigger("RescateExpAliado");
}
 
Trigger "MensajeroRetomar" [Inactivo]
(
  (DarTropasVivasDeGrupo("G_ASALTOPUEBLO") == 0) && (DarTropasVivasDeGrupo("G_AVANZADILLA") < 2) 
  
)
Do
{  
  DisposeHandle(&hGuia);
  
  SetMoverFisicoTropa("GUIA", TRUE);    
  TropaSigueRutaPredefinida("GUIA", "R_Mensaka");
  
  ActivarTrigger("MensajeroRetoma");
  
  DestruirTrigger("MensajeroRetomar");
}

Trigger "MensajeroRetoma" [Inactivo]
(
  (HaEntradoTropaEnZona("Z_Mensaka", "GUIA")) &&
  (EstanAliadas("Romanos", "Atrebates"))
)
Var
{
  float x, y;
  handle hCamaraEnd;
  handle hEscape;
}
Do
{  
  if (DarNumUnidadesEnZona("Romanos", "Z_DETECCION") > 30)
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
    
  EncolarMirarEnteCamara("GUIA");
  IntroducirLocucion("1083", "LTEXT_MISION10_EVENTO2_00_TXT", 3000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("1084", "LTEXT_MISION10_EVENTO2_01_TXT", 6000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirPuntoSincronia(); // 1
  
  EncolaTrayectoriaCamara("MENSAJERO_1", FALSE, TRUE, 0, 2);
  IntroducirPuntoSincronia(); // 2
       
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
  //////////////////////////////////////////////////////////////
  }

  //La ruta del explorador aliado
  //DisposeHandle(&hGuia);
  SetMoverFisicoTropa("GUIA", FALSE);
  hGuia = CrearObjetivo(hEstrategiaMensajero, "MostrarRuta", "R_MejorCamino2", "Romanos");
  AnyadirTropaAObjetivo(hGuia, "GUIA");  
  AnyadirObjetivo(hEstrategiaMensajero,  hGuia);

  DestruirTrigger("MensajeroRetoma");
  
}

// *********************************** 
Trigger "PararProduccionAlis" [ Inactivo ]
(
  DarPotenciaCivilizacion("Atrebates") > 70000
)
Do
{
  SetEntrenamientoPueblo(hEstrategiaAtrebates, "Durobrivae", FALSE);
  ActivarTrigger("ActivarProduccionAlis");
  DesactivarTrigger("PararProduccionAlis");
}

// ***********************************
Trigger "ActivarProduccionAlis" [ Inactivo ]
(
  DarPotenciaCivilizacion("Atrebates") < 50000 
)
Do
{
  SetEntrenamientoPueblo(hEstrategiaAtrebates, "Durobrivae", TRUE);
  ActivarTrigger("PararProduccionAlis");
  DesactivarTrigger("ActivarProduccionAlis");
}
 
//---------------------------------
Trigger "G_LADILLAup" [Inactivo]
(
 	(HanEntradoCivilizacionesEnZona("Z_LADILLA","Romanos")) ||
 	(DarTropasMuertasDeGrupo("G_LADILLA") > 0)
)
Do
{
	
	SetParamObjetivo(hG_LADILLA, "Tactica", "ActitudBatallon", "Ofensiva");
	
	DestruirTrigger("G_LADILLAup");
} 
  
//---------------------------------
Trigger "G_PRADERAup" [Inactivo]
(
 	(HanEntradoCivilizacionesEnZona("Z_PRADERA","Romanos")) ||
 	(DarTropasMuertasDeGrupo("G_PRADERA") > 0)
)
Do
{
	
	SetParamObjetivo(hG_PRADERA, "Tactica", "ActitudBatallon", "Ofensiva");
	
	DestruirTrigger("G_PRADERAup");
}   
  
//---------------------------------
Trigger "G_PLAYAup" [Inactivo]
(
	(DarTropasMuertasDeGrupo("G_PLAYA") > 0)
)
Do
{
	
	SetParamObjetivo(hG_PLAYA, "Tactica", "ActitudBatallon", "Ofensiva");
	
	DestruirTrigger("G_PLAYAup");
}   

//---------------------------------
Trigger "G_CABALLERIAup" [Inactivo]
(
	(DarTropasMuertasDeGrupo("G_CABALLERIA") == 1) || 
	HanEntradoCivilizacionesEnZona("Z_Activacion","Romanos")
)
Do
{
	
	SetParamObjetivo(hG_CABALLERIA, "Tactica", "ActitudBatallon", "Ofensiva");
	
	DestruirTrigger("G_CABALLERIAup");
}   
  
//---------------------------------
Trigger "G_3-4-5up" [Inactivo]
(
	HanEntradoCivilizacionesEnZona("Z_Activacion","Romanos")
)
Do
{
	
	SetParamObjetivo(hG_3, "Tactica", "ActitudBatallon", "Ofensiva");
	SetParamObjetivo(hG_4, "Tactica", "ActitudBatallon", "Ofensiva");
	SetParamObjetivo(hG_5, "Tactica", "ActitudBatallon", "Ofensiva");
	
	DestruirTrigger("G_3-4-5up");
}     
  
//---------------------------------
Trigger "G_1-2up" [Inactivo]
(
	HanEntradoCivilizacionesEnZona("Z_ActivacionII","Romanos")
)
Do
{
	
	SetParamObjetivo(hG_1, "Tactica", "ActitudBatallon", "Ofensiva");
	SetParamObjetivo(hG_2, "Tactica", "ActitudBatallon", "Ofensiva");
		
	DestruirTrigger("G_1-2up");
}     
  
//---------------------------------
Trigger "AtaqueAliado" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_AtaqueAliado", "Catuvelaunos")
)
Var
{		
  handle hTimer;
}
Do
{	
  hTimer = CrearTimer(225000);// 3 min y 45 seg
  WaitBool( HandleDisparado(hTimer) || HanEntradoCivilizacionesEnZona("Z_DETECCION", "Romanos"));

  hTimer = CrearTimer(15000);// 15 segundos de reposicionamiento
  Wait(hTimer);

  DisposeHandle(&hG_AVANZADILLA);
  DisposeHandle(&hG_ASALTOPUEBLO);

  hAtaqueAtrebates = CrearObjetivo(hEstrategiaBrit, "ConquistaPueblo2", "Durobrivae");
  AnyadirGrupoAObjetivo(hAtaqueAtrebates , "G_ASALTOPUEBLO");
  AnyadirGrupoAObjetivo(hAtaqueAtrebates , "G_AVANZADILLA");  
  AnyadirObjetivo(hEstrategiaBrit,  hAtaqueAtrebates );
  SetParamObjetivo(hAtaqueAtrebates, "NombreGrupoGenerado", "G_AVANZADILLA");
  //SetValue(hEstrategiaBrit, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  //SetValue(hEstrategiaBrit, "GRUPOTROPAS_A_ENTRENAR", "LIGERAS", 70);
  //SetValue(hEstrategiaBrit, "GRUPOTROPAS_A_ENTRENAR", "PESADAS", 0);
  SetDelayEntrenamientoTropasPueblo(hEstrategiaBrit, "Durobrivae", 60000);// cada 3 min se ponen a entrenar una tropa
  SetParamObjetivo(hAtaqueAtrebates , "PuedePedirRefuerzos", FALSE);
	
	DestruirTrigger("AtaqueAliado");
}   
  
//---------------------------------
Trigger "ActivacionHuida" [Inactivo]
(
  (DarTropasVivasDeGrupo("G_FORTALEZA") == 0) 
)
Var
{
  float x, y;
  handle hCamaraEnd;
  handle hEscape;
}
Do
{
  
	// objetivo completado
	IndicarObjetivoCumplido(hRescateComio);

  // neutralizamos a todo el mundo para que no se peguen
  NeutralizarCivilizacion("Catuvelaunos", TRUE);
  NeutralizarCivilizacion("Cantiacos", TRUE);
  
  // handle de final y presentacion
  hCamaraEnd = CrearHandle("Bool");
  hEscape = CrearHandle("Bool");

  // cazar escape
  PonerHandleInterrupcion(hEscape);
  
  // posición actual
  DarPosicionCamara(&x, &y);

  // contamos puntos de sincronia
  fPuntoSincronia = 0;
  PonerHandleEsperaSincronizacion(hPuntoSincronia);

  // Activar efectos
  ActivarTrigger("EfectosComio");

  // cine
  ActivarCinemascope(TRUE);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);
    
  EncolaTrayectoriaCamara("COMIO_1", TRUE, FALSE, 2, 0);
  EncolarPausaCamara(1000);
  IntroducirPuntoSincronia(); // 1
  
  IntroducirLocucion("", "", 2000, 0, 0);
  IntroducirLocucion("10G0", "LTEXT_MISION10_EVENTO3_00_TXT", 5000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("10G1", "LTEXT_MISION10_EVENTO3_01_TXT", 2000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirPuntoSincronia(); // 2
  
  EncolaTrayectoriaCamara("COMIO_1", FALSE, TRUE, 0, 2);  
  IntroducirPuntoSincronia(); // 3
       
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
  ActivarCinemascope(FALSE);

  // desneutralizamos  
  NeutralizarCivilizacion("Catuvelaunos", FALSE);
  NeutralizarCivilizacion("Cantiacos", FALSE);

  bComioAcabado = TRUE;
  
  //////////////////////////////////////////////////////////////
	
	AgregarObjetivoMision(hEscoltaComio, "LTEXT_MISION10_OBJETIVO_03_TXT");
	ObjetivosMisionCambiados();
	
	IluminarZonaOnOff(75.5,0,188.6,10, "ShiningComio", FALSE);
	
	SetParamObjetivo(hG_PATI, "FACTOR_POTENCIA_TROPAS", 10);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_ENEMIGOS", 1);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_VISTA_YA", 100);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_PUEBLOS", 100);
  
  CambiarObjetivo(hG_1, "AtacarPunto", 179, 35);
  CambiarObjetivo(hG_2, "AtacarPunto", 166, 26);
  CambiarObjetivo(hG_3, "AtacarPunto", 45, 108);
  CambiarObjetivo(hG_4, "AtacarPunto", 69, 53);
  CambiarObjetivo(hG_5, "AtacarPunto", 115, 48);
  	
	ActivarTrigger("ZonaDeLlegada");
	DestruirTrigger("ActivacionHuida");
}   
  



Trigger "EfectosComio" [Inactivo]
(
  TRUE
)
Do
{
  
  WaitBool(bComioAcabado || fPuntoSincronia == 1);
  
  //Convertimos a Comio en persona humana
  LiberarUnidad("ComioU", "HEROE_COMIO", "Romanos");

  DestruirTrigger("EfectosComio");
  
}


//---------------------------------
Trigger "AtrebatesTuyos" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_ALIADA","Romanos")
)
Do
{
  if (EstanAliadas("Romanos", "Atrebates"))
	{
	// informamos del asunto
	MensajeLocucionado("10N6","LTEXT_MISION10_MENSAJE1_00_TXT");
	AvisoCivilizacion("Romanos", 10, 195);
	
	// y canbiamos de bando
	CambiarBando("Atrebates", "Romanos");
  }
	// Y unos arqueros te empiezan a disparar
	SetParamObjetivo(hG_ARQUEROI, "Tactica", "ActitudBatallon", "Ofensiva");
	
	DestruirTrigger("AtrebatesTuyos");
}      









//---------------------------------
Trigger "AtrebatesRebeldes" [Inactivo]
(
 	EsEstructuraAtacada("guarnicion1", "Romanos")
)
Do
{
  
  MensajeLocucionado("10N7","LTEXT_MISION10_MENSAJE2_00_TXT");
	
	RomperAlianzaPorNombre("Atrebates", "Romanos"); 
	//CrearAlianzaPorNombre("Atrebates", "Catuvelaunos");// Asi se pegan entre los malos
	
	DisposeHandle(&hDefensaAtrebates);
	  
  hDefensaAtrebates = CrearObjetivo(hEstrategiaAtrebates, "ConquistaPueblo2", "Durobrivae");
  AnyadirGrupoAObjetivo(hDefensaAtrebates, "G_ATREBATES");  
  AnyadirObjetivo(hEstrategiaAtrebates,  hDefensaAtrebates);
  SetParamObjetivo(hDefensaAtrebates, "NombreGrupoGenerado", "G_ATREBATES");
  //SetValue(hEstrategiaAtrebates, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  //SetValue(hEstrategiaAtrebates, "GRUPOTROPAS_A_ENTRENAR", "LIGERAS", 70);
  //SetValue(hEstrategiaAtrebates, "GRUPOTROPAS_A_ENTRENAR", "PESADAS", 0);
  SetDelayEntrenamientoTropasPueblo(hEstrategiaAtrebates, "Durobrivae", fEntrenamientoAliado);
  SetParamObjetivo(hDefensaAtrebates, "PuedePedirRefuerzos", FALSE);
	
	DestruirTrigger("AtrebatesTuyos");				
	DestruirTrigger("AtrebatesRebeldes");
}      

Trigger "GameOver" [Inactivo]
// ---------------------------
(
  !EstaTropaViva("QUINTO")
  ||
  !EstaTropaViva("CRASTINO")
  ||
  !EstaTropaViva("Comio")
)
Do
{
  
  if ( !EstaTropaViva("QUINTO") )
  {
    IndicarObjetivoFracasado(hObjQuintoVivo); 
  }
  
  if ( !EstaTropaViva("CRASTINO") )
  {
    IndicarObjetivoFracasado(hObjCrastinoVivo); 
  }

  if ( !EstaTropaViva("Comio") )
  {
    IndicarObjetivoFracasado(hEscoltaComio);
  }
  
  FinalizarMision(FALSE);
  
  DestruirTrigger("GameOver");
}


//---------------------------------
Trigger "ZonaDeLlegada" [Inactivo]
(
 	HaEntradoTropaEnZona("Z_LLEGADA","Comio")
)
Do
{
  
	IndicarObjetivoCumplido(hEscoltaComio);		
	IndicarObjetivoCumplido(hObjCrastinoVivo);
	IndicarObjetivoCumplido(hObjQuintoVivo);
	
	FinalizarMision(TRUE);
				
	DestruirTrigger("ZonaDeLlegada");
}
  
//------------------------------------------
Trigger "End" [ Activo ]  
(
  TRUE
)
Do
{
}