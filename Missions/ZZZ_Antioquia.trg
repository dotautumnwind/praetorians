Var
{	
	handle hEstrategiaMalos;
	handle hCivilizacionMalos;	
	
	handle hEstrategiaRegulares;
	handle hCivilizacionRegulares;	

  handle hEstrategiaAliados;
	handle hCivilizacionAliados;
	
	handle hG_CAI;	
	handle hG_CAII;
	handle hG_CAIII;
	handle hG_CAIV;
	handle hG_CAV;
	handle hG_ATREGULARES;
	handle hG_ATREGULARESII;
	handle hG_EMBOSCADAFIN;
	handle hG_ARQUERONS;
	handle hG_BARRIER;
	handle hG_PARAPETO;
	handle hG_MOGOLLO;
	
	handle hG_RECONQUISTA;
	
	handle hG_1;
	handle hG_2;
	
	handle hG_ALII;
	
	handle hGestionPueblo1;
	handle hGestionPueblo2;
	
	handle hG_PATI;
	handle hG_PATII;
	
	handle hRutaCaballeria;
	handle hAtaquePuente;
	
	handle hGuia;
	
	//Objetivos
	handle hObjEnemigosMuertos       = NULL;
	handle hObjLlegadaAntioquia      = NULL;
	handle hObjCasioVivo             = NULL;
	
	bool bObjEnemigosMuertos         = FALSE;
	bool bObjLlegadaAntioquia        = FALSE;
	
	// niveles de dificultad
  float fNivelDificultad           = 0;
  
  float fDelayPueblo1;
  float fDelayPueblo2;
  
    // briefing
  float fPuntoSincronia           = 0;
  handle hPuntoSincronia          = NULL;
  bool bBriefingEnded             = FALSE;
  
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
 
  // alianzas
	CrearAlianzaPorNombre("MALOS", "REGULARES");
	CrearAlianzaPorNombre("MALOS", "ALIADOS");
  
  // adelante el briefing
  ActivarTrigger("Briefing");
  
}



//-----------------------------
Trigger "Main2" [ Inactivo ]  
(
  TRUE
)
Var
{		
}
Do
{
  //restricciones de maquinas da asalto
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_BARBARA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_ROMANA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_EGIPCIA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_EGIPCIA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_BARBARA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_ROMANA", "");
  
  //restricciones de la mision
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GLADIADOR", "");
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "PIQUERO_ELITE", "");
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "HONDERO", "");
  
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_GERMANA", "");
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_CAZADOR", "");
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_ESPADON", "");
  
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_CUADRIGA", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_PARTHA", "CESAR");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_ARQUERO", "CESAR");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_PIQUERO", "CESAR");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_ARQUERON", "");
   
  // comprobar el nivel de dificultad
  fNivelDificultad = DarDificultadMision();
  if ( fNivelDificultad == 1 )
  {
    fDelayPueblo1 = 360000;//6 min
    fDelayPueblo2 = 840000;//14 min
    
    //Los enemigos no pueden construir torres de defensa
    //IntroducirRestriccionEstructura("ORDEN_CONSTRUIR", "TORRE_DEFENSA_EGIPCIA", "");
  }
  else
  if ( fNivelDificultad == 2 )
  {
    fDelayPueblo1 = 300000;//5 min
    fDelayPueblo2 = 660000;//11 min
    
    //Los enemigos no pueden construir torres de defensa
    //IntroducirRestriccionEstructura("ORDEN_CONSTRUIR", "TORRE_DEFENSA_EGIPCIA", "");
  }
  else
  if ( fNivelDificultad == 3 )
  {
    fDelayPueblo1 = 240000;//4 min
    fDelayPueblo2 = 480000;//8 min
  }
  else
  {
    fDelayPueblo1 = 120000;
    fDelayPueblo2 = 480000;
    
    MensajeChat("Nivel de dificulatd desconocido, oiga");
   }
  
  //Objetivos
  hObjEnemigosMuertos = CrearHandle("Bool");
  hObjLlegadaAntioquia = CrearHandle("Bool");
  hObjCasioVivo = CrearHandle("Bool");
    
  AgregarObjetivoMision(hObjLlegadaAntioquia, "LTEXT_MISION16_OBJETIVO_00_TXT");
  AgregarObjetivoMision(hObjCasioVivo, "LTEXT_MISION16_OBJETIVO_01_TXT");
  
  //Las estrategias de los enemigos y de los aliados del jugador
	hEstrategiaMalos = CrearEstrategiaEscaramuza();
	hCivilizacionMalos = DarCivilizacion("MALOS");	
	AsignarEstrategia(hCivilizacionMalos, hEstrategiaMalos);
	StartEstrategia(hEstrategiaMalos);				
	
	EjecutarPlanificador(hEstrategiaMalos, FALSE);		
	
	hEstrategiaRegulares = CrearEstrategiaEscaramuza();
	hCivilizacionRegulares = DarCivilizacion("REGULARES");	
	AsignarEstrategia(hCivilizacionRegulares, hEstrategiaRegulares);
	StartEstrategia(hEstrategiaRegulares);
	
	EjecutarPlanificador(hEstrategiaRegulares, FALSE);						
	
	hEstrategiaAliados = CrearEstrategiaScript();
	hCivilizacionAliados = DarCivilizacion("ALIADOS");	
	AsignarEstrategia(hCivilizacionAliados, hEstrategiaAliados);
	StartEstrategia(hEstrategiaAliados);
	
	//CrearAlianzaPorNombre("", "");
	
	//Grupos que mantienen la posicion
	hG_CAI = CrearObjetivo(hEstrategiaMalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_CAI, "G_CAI");
  //SetParamObjetivo(hG_CAI, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaMalos, hG_CAI);
  
  hG_CAII = CrearObjetivo(hEstrategiaMalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_CAII, "G_CAII");
  //SetParamObjetivo(hG_CAII, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaMalos, hG_CAII);
  
  hG_CAIII = CrearObjetivo(hEstrategiaMalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_CAIII, "G_CAIII");
  //SetParamObjetivo(hG_CAIII, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaMalos, hG_CAIII);
  
  hG_CAIV = CrearObjetivo(hEstrategiaMalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_CAIV, "G_CAIV");
  //SetParamObjetivo(hG_CAIV, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaMalos, hG_CAIV);
  
  hG_CAV = CrearObjetivo(hEstrategiaMalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_CAI, "G_CAV");
  //SetParamObjetivo(hG_CAV, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaMalos, hG_CAV);
  
  hG_ATREGULARES = CrearObjetivo(hEstrategiaMalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_ATREGULARES, "G_ATREGULARES");
  //SetParamObjetivo(hG_ATREGULARES, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaMalos, hG_ATREGULARES);
  
  hG_ATREGULARESII = CrearObjetivo(hEstrategiaMalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_ATREGULARESII, "G_ATREGULARESII");
  SetParamObjetivo(hG_ATREGULARESII, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaMalos, hG_ATREGULARESII);
  
  hG_EMBOSCADAFIN = CrearObjetivo(hEstrategiaMalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_EMBOSCADAFIN, "G_EMBOSCADAFIN");
  //SetParamObjetivo(hG_EMBOSCADAFIN, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaMalos, hG_EMBOSCADAFIN);
    
  hG_ARQUERONS = CrearObjetivo(hEstrategiaMalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_ARQUERONS, "G_ARQUERONS");
  //SetParamObjetivo(hG_ARQUERONS, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaMalos, hG_ARQUERONS);
  
  hG_BARRIER = CrearObjetivo(hEstrategiaMalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_BARRIER, "G_BARRIER");
  //SetParamObjetivo(hG_BARRIER, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaMalos, hG_BARRIER);
  
  hG_PARAPETO = CrearObjetivo(hEstrategiaMalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_PARAPETO, "G_PARAPETO");
  SetParamObjetivo(hG_PARAPETO, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaMalos, hG_PARAPETO);
  
  hG_MOGOLLO = CrearObjetivo(hEstrategiaMalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_MOGOLLO, "G_MOGOLLO");
  //SetParamObjetivo(hG_MOGOLLO, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaMalos, hG_MOGOLLO);
  
  hG_1 = CrearObjetivo(hEstrategiaRegulares, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_1, "G_1");
  SetParamObjetivo(hG_1, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaRegulares, hG_1);
  
  hG_RECONQUISTA = CrearObjetivo(hEstrategiaMalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_RECONQUISTA, "G_RECONQUISTA");
  SetParamObjetivo(hG_RECONQUISTA, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaMalos, hG_RECONQUISTA);
    
  hG_ALII = CrearObjetivo(hEstrategiaAliados, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_ALII, "G_ALII");
  SetParamObjetivo(hG_ALII, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaAliados, hG_ALII);
        
  //La gestion de los pueblos enemigos
  hGestionPueblo1 = CrearObjetivo(hEstrategiaMalos, "ConquistaPueblo2", "pueblo1");
  AnyadirGrupoAObjetivo(hGestionPueblo1, "G_PUEBLO1");  
  AnyadirObjetivo(hEstrategiaMalos,  hGestionPueblo1);
  SetParamObjetivo(hGestionPueblo1, "NombreGrupoGenerado", "G_PATRULLAS");
  //SetValue(hEstrategiaMalos, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  //SetValue(hEstrategiaMalos, "GRUPOTROPAS_A_ENTRENAR", "LIGERAS", 70);
  //SetValue(hEstrategiaMalos, "GRUPOTROPAS_A_ENTRENAR", "PESADAS", 0);
  SetDelayEntrenamientoTropasPueblo(hEstrategiaMalos, "pueblo1", fDelayPueblo1);
  SetParamObjetivo(hGestionPueblo1, "PuedePedirRefuerzos", FALSE);
    
  hGestionPueblo2 = CrearObjetivo(hEstrategiaRegulares, "ConquistaPueblo2", "pueblo2");
  AnyadirGrupoAObjetivo(hGestionPueblo2, "G_PUEBLO2");  
  AnyadirObjetivo(hEstrategiaRegulares,  hGestionPueblo2);
  SetParamObjetivo(hGestionPueblo2, "NombreGrupoGenerado", "G_PATRULLASII");
  //SetValue(hEstrategiaRegulares, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  //SetValue(hEstrategiaRegulares, "GRUPOTROPAS_A_ENTRENAR", "LIGERAS", 70);
  //SetValue(hEstrategiaRegulares, "GRUPOTROPAS_A_ENTRENAR", "PESADAS", 0);
  SetDelayEntrenamientoTropasPueblo(hEstrategiaRegulares, "pueblo2", fDelayPueblo2);
  SetParamObjetivo(hGestionPueblo2, "PuedePedirRefuerzos", FALSE);
  
  //Algunas patrullas aleatorias
  hG_PATI = CrearObjetivo(hEstrategiaMalos, "PatrullaOleadasPeriodicas", 7200, 9000, 45, 90);
  AnyadirGrupoAObjetivo(hG_PATI, "G_PATRULLAS");
  SetParamObjetivo(hG_PATI, "ParametrosTacticas", "AtacarCorriendo", TRUE);	
	SetParamObjetivo(hG_PATI, "FACTOR_POTENCIA_TROPAS", 1);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_ENEMIGOS", 0.2);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hG_PATI, "EXPLORAR_FACTOR_PUEBLOS", -100);
  SetParamObjetivo(hG_PATI, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hG_PATI, "MaxNumOleadas", 3);
  AnyadirObjetivo(hEstrategiaMalos, hG_PATI);
  
  hG_PATII = CrearObjetivo(hEstrategiaRegulares, "PatrullaOleadasPeriodicas", 7200, 9000, 45, 90);
  AnyadirGrupoAObjetivo(hG_PATII, "G_PATRULLASII");
  SetParamObjetivo(hG_PATII, "ParametrosTacticas", "AtacarCorriendo", FALSE);	
	SetParamObjetivo(hG_PATII, "FACTOR_POTENCIA_TROPAS", 4);
  SetParamObjetivo(hG_PATII, "EXPLORAR_FACTOR_ENEMIGOS", -0.2);
  SetParamObjetivo(hG_PATII, "EXPLORAR_FACTOR_VISTA_YA",- 10);
  SetParamObjetivo(hG_PATII, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hG_PATII, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hG_PATII, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hG_PATII, "MaxNumOleadas", 2);
  AnyadirObjetivo(hEstrategiaRegulares, hG_PATII);
		
	//Activacion de triggers
	//ActivarTrigger("");
  ActivarTrigger("MalosDescubiertos");
	ActivarTrigger("RutaCaballitos");
	ActivarTrigger("EsperaParaCaballeria");
	//ActivarTrigger("AliadosVistos");
	ActivarTrigger("AliadosCercanos");
	ActivarTrigger("ConseguirRefuerzos");
	ActivarTrigger("ReaccionI");
	ActivarTrigger("RolloGuia");
	ActivarTrigger("PararProduccionMalos");
	ActivarTrigger("PararProduccionRegulares");
	ActivarTrigger("AlisPrimerosTuyos");
	ActivarTrigger("EXITO");
	ActivarTrigger("EXITOdefinitivo");
	ActivarTrigger("ReconquistaEnemiga");
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

  //La zona a la que hay que huir la dejamos iluminada
  IluminarZonaOnOff(1, 0, 89, 26, "Antioquia", TRUE);

  // que llueva, que llueva
  ModificarLluvia(100.0, 50.0, 100.0, 120);

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
  ActivarPresentacion(TRUE, "LTEXT_MISION16_PRESENTACION_TITULO",
                            "LTEXT_MISION16_PRESENTACION_LUGAR", hPresentacion);
                            
  // camara a donde debe empezar
  EncolarColocarYMirarPunto("BRIEFING_1");
  EjecutarOrdenesCamara();
  
  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));
 
  ActivarPresentacion(FALSE, "", "", NULL);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);
  
  EncolarColocarYMirarPunto("BRIEFING_1");
  EncolarPausaCamara(4000);
  EncolaTrayectoriaCamara("BRIEFING_3", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  IntroducirLocucion("16N0", "LTEXT_MISION16_LOCUCION_00_TXT", 8000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirPuntoSincronia();
  
  EncolarColocarYMirarPunto("BRIEFING_1");
  EncolarPausaCamara(2000);
  IntroducirLocucion("16N1", "LTEXT_MISION16_LOCUCION_01_TXT", 4000, 600, 100);
  IntroducirPuntoSincronia();        

  EncolaTrayectoriaCamara("BRIEFING_2", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  IntroducirLocucion("", "", 100, 0, 0);  
  IntroducirLocucion("16N2", "LTEXT_MISION16_LOCUCION_02_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();        

  EncolarColocarYMirarPunto("BRIEFING_4");
  EncolarPausaCamara(2000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("16N3", "LTEXT_MISION16_LOCUCION_03_TXT", 7000, 600, 100);
  IntroducirPuntoSincronia();        

  EncolaTrayectoriaCamara("BRIEFING_5", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(4000);
  IntroducirLocucion("", "", 100, 0, 0);  
  IntroducirLocucion("16N4", "LTEXT_MISION16_LOCUCION_04_TXT", 2000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("16N5", "LTEXT_MISION16_LOCUCION_05_TXT", 5000, 600, 100);
  IntroducirPuntoSincronia();        

  EncolarColocarYMirarPunto("BRIEFING_6");
  EncolarPausaCamara(3000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("16N6", "LTEXT_MISION16_LOCUCION_06_TXT", 3000, 600, 100);
  IntroducirPuntoSincronia();        

  IntroducirPonerModoJuegoCamara(TRUE);

  // si no se ha interrumpido
  if ( !HandleDisparado(hEscape) )
  {

    // efectos especiales
    ActivarTrigger("EfectosBriefing");
    
    // iluminación
    IluminarZonaOnOff(174, 0, 68, 10, "partos", TRUE);
    IluminarZonaOnOff(67, 2, 37, 10, "nabateos", TRUE);
    
    // acción
    EjecutarOrdenesCamara();

    // final  
    PonerHandleBoolACamara(hCamaraEnd);
    WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
    
    // fuera iluminación
    IluminarZonaOnOff(174, 0, 68, 10, "partos", FALSE);
    IluminarZonaOnOff(67, 2, 37, 10, "nabateos", FALSE);
    
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

  // activamos el main2
  ActivarTrigger("Main2");

  // para que las ciudades se vean iguales
  IluminarZona(67, 2, 37, 10, 200);

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

//---------------------------------------------
Trigger "MalosDescubiertos" [Inactivo]
(
  !EstaPuebloConquistado("MALOS", "pueblo1") && !EstaPuebloConquistado("REGULARES", "pueblo2")
)
Do
{
   HacerVisibleCivilizacion("MALOS", TRUE);
   HacerVisibleCivilizacion("REGULARES", TRUE);
   
   //Dejamos las tropas libres para que el planificador haga lo que quiera con ellas
    if ( fNivelDificultad == 1 )
   {
   DisposeHandle(&hG_CAI); 
	 DisposeHandle(&hG_CAII);
	 DisposeHandle(&hG_CAIII);
	 DisposeHandle(&hG_CAIV);
   DisposeHandle(&hG_CAV);
	 DisposeHandle(&hG_ATREGULARES);
	 DisposeHandle(&hG_EMBOSCADAFIN);
	 DisposeHandle(&hG_ARQUERONS);
	 //DisposeHandle(&hG_BARRIER);
	 DisposeHandle(&hG_1);
	 DisposeHandle(&hG_PARAPETO);
	 //DisposeHandle(&hG_PATI);
	 //DisposeHandle(&hG_PATII);
	 //DisposeHandle(&hRutaCaballeria);
	 DisposeHandle(&hAtaquePuente);
   } 
   
    else
    if (( fNivelDificultad == 2 ) || ( fNivelDificultad == 3 ))
   {
   DisposeHandle(&hG_CAI); 
	 DisposeHandle(&hG_CAII);
	 DisposeHandle(&hG_CAIII);
	 DisposeHandle(&hG_CAIV);
   DisposeHandle(&hG_CAV);
	 DisposeHandle(&hG_ATREGULARES);
	 DisposeHandle(&hG_EMBOSCADAFIN);
	 DisposeHandle(&hG_ARQUERONS);
	 DisposeHandle(&hG_BARRIER);
	 DisposeHandle(&hG_1);
	 DisposeHandle(&hG_PARAPETO);
	 DisposeHandle(&hG_PATI);
	 DisposeHandle(&hG_PATII);
	 DisposeHandle(&hRutaCaballeria);
	 DisposeHandle(&hAtaquePuente);
   }
   	
	 EjecutarPlanificador(hEstrategiaMalos, TRUE);		
	 EjecutarPlanificador(hEstrategiaRegulares, TRUE);	
   
   ActivarTrigger("MalosEscondidos"); 
   
   DesactivarTrigger("MalosDescubiertos"); 
}

//---------------------------------------------
Trigger "MalosEscondidos" [Inactivo]
(
  EstaPuebloConquistado("MALOS", "pueblo1") || EstaPuebloConquistado("REGULARES", "pueblo2")
)
Do
{
   HacerVisibleCivilizacion("MALOS", FALSE);
   HacerVisibleCivilizacion("REGULARES", FALSE);
   
   ActivarTrigger("MalosDescubiertos"); 
   
   DesactivarTrigger("MalosEscondidos"); 
}

//---------------------------------------------
Trigger "EXITO" [Inactivo]
(
  CivilizacionEstaKO("MALOS") && CivilizacionEstaKO("REGULARES") && bObjLlegadaAntioquia
)
Do
{
  
   IndicarObjetivoCumplido(hObjEnemigosMuertos);
   bObjEnemigosMuertos = TRUE; 
   
   DestruirTrigger("EXITO"); 
}

//-----------------------------------------------
Trigger "EXITOdefinitivo" [Inactivo]
(
   bObjEnemigosMuertos && bObjLlegadaAntioquia 
)
Do
{
 
  IndicarObjetivoCumplido(hObjCasioVivo);  
  FinalizarMision(TRUE); 
  
  DestruirTrigger("GameOver");
  DestruirTrigger("EXITOdefinitivo"); 
   
}

//---------------------------------------------
Trigger "GameOver" [Inactivo]
(
  !EstaTropaViva("CASIO")
  || (bObjLlegadaAntioquia && CivilizacionEstaKO("CESAR"))
)
Do
{
  
   if ( !EstaTropaViva("CASIO") )
   {
    IndicarObjetivoFracasado(hObjCasioVivo);
   }
  
   if ( !bObjLlegadaAntioquia )
   {
    IndicarObjetivoFracasado(hObjLlegadaAntioquia);
   }
   else
   {
    IndicarObjetivoFracasado(hObjEnemigosMuertos);
   }
   
   FinalizarMision(FALSE); 
   
   DestruirTrigger("EXITOdefinitivo"); 
   DestruirTrigger("GameOver"); 
}

//----------------------------------------------------
Trigger "EsperaParaCaballeria" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{
  hRutaCaballeria = CrearObjetivo(hEstrategiaMalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hRutaCaballeria, "G_CABALLERIA");  
  AnyadirObjetivo(hEstrategiaMalos,  hRutaCaballeria);
  
  hTimer = CrearTimer(DarNumeroAleatorio(30000, 50000)); //**
  Wait(hTimer);
  
  CambiarObjetivo(hRutaCaballeria, "AtacarPunto", 169, 27);
    
  ActivarTrigger("RutaCaballitosII");
  
  DestruirTrigger("EsperaParaCaballeria"); 
}

//---------------------------
Trigger "RutaCaballitos" [ Inactivo ]  
(
  !EstaPuenteConstruido("puente1", "MALOS")
)
Do
{
  CambiarObjetivo(hRutaCaballeria, "AtacarPunto", 140, 29);
 
  //GrupoTropasSeguirRutaPredefinida("G_CABALLERIA", "R_CABALLERIA");//que puedan correr
  
  DesactivarTrigger("RutaCaballitos");
  ActivarTrigger("RutaCaballitosII");
}

//---------------------------
Trigger "RutaCaballitosII" [ Inactivo ]  
(
  EstaPuenteConstruido("puente1", "MALOS")
)
Do
{
  CambiarObjetivo(hRutaCaballeria, "AtacarPunto", 159, 27);
    
  //GrupoTropasSeguirRutaPredefinida("G_CABALLERIA", "R_CABALLERIAII");//que puedan correr

  ActivarTrigger("RutaCaballitos");  
  DesactivarTrigger("RutaCaballitosII");
}
/*
//---------------------------
Trigger "AliadosVistos" [ Inactivo ]  
(
  VisibleTropaDeOtraCiv("CESAR", "ALIADOS")
)
Do
{
  
  RomperAlianzaPorNombre("ALIADOS", "MALOS");
  CrearAlianzaPorNombre("ALIADOS", "CESAR");

  DestruirTrigger("AliadosVistos");
  
}
*/

//-------------------------------
Trigger "AliadosCercanos" [ Inactivo ]
(
  HanEntradoCivilizacionesEnZona("ALIADOS_CERCANOS", "CESAR") ||
  (!EstaPuebloConquistado("MALOS", "pueblo1") || !EstaPuebloConquistado("REGULARES", "pueblo2"))
)
Do
{
  
  MensajeLocucionado("16N7","LTEXT_MISION16_MENSAJE_00_TXT"); 
  AvisoCivilizacion("CESAR", 94, 22);
  
  RomperAlianzaPorNombre("ALIADOS", "MALOS");
  CrearAlianzaPorNombre("ALIADOS", "CESAR");
      
  DestruirTrigger("AliadosCercanos"); 
  
}


//---------------------------------
Trigger "ConseguirRefuerzos" [Inactivo]
(
 	(HaEntradoTropaEnZona("Z_REFUERZOS","CASIO")) ||
 	(HaEntradoTropaEnZona("Z_REFUERZOSII","CASIO"))
)
Var
{
  float x, y;
  handle hCamaraEnd;
  handle hEscape;
}
Do
{	  

  // esto ya no va a ocurrir, no hacen falta mensajes
	DesactivarTrigger("AliadosCercanos");
	DesactivarTrigger("AlisPrimerosTuyos");
  
  /////////////////////////////////////////////////////
  // aquí vendría la charla de longino:
  //   chequear que es correcto

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

  EncolarMirarEnteCamara("CASIO");
  EncolarPausaCamara(5000);
  IntroducirLocucion("16D0", "LTEXT_MISION16_EVENT1_00_TXT", 3000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("16D1", "LTEXT_MISION16_EVENT1_01_TXT", 5000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("16D2", "LTEXT_MISION16_EVENT1_02_TXT", 3000, 600, 100);
  IntroducirPuntoSincronia();        
  
  IntroducirPonerModoJuegoCamara(TRUE);

  // acción
  EjecutarOrdenesCamara();

  // final  
  PonerHandleBoolACamara(hCamaraEnd);
  WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));

  // fuera órdenes de cámara
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
  
  /////////////////////////////////////////////////////
    
	CambiarBando("ALIADOS", "CESAR");
	
	AgregarObjetivoMision(hObjEnemigosMuertos , "LTEXT_MISION16_OBJETIVO_02_TXT");
	ObjetivosMisionCambiados();
	
	// Los enemigos se ponen a maniobrar con Skirmish
	
	//Eliminamos los objetivos creados para que la CPU haga lo que quiera con las tropas
	//DisposeHandle(&hG_CAI); 
	//DisposeHandle(&hG_CAII);
	//DisposeHandle(&hG_CAIII);
	//DisposeHandle(&hG_CAIV);
  //DisposeHandle(&hG_CAV);
	//DisposeHandle(&hG_ATREGULARES);
	//DisposeHandle(&hG_EMBOSCADAFIN);
	//DisposeHandle(&hG_ARQUERONS);
	//DisposeHandle(&hG_BARRIER);
	//DisposeHandle(&hG_1);
	//DisposeHandle(&hG_PARAPETO);
	//DisposeHandle(&hG_PATI);
	//DisposeHandle(&hG_PATII);
	//DisposeHandle(&hRutaCaballeria);
	//DisposeHandle(&hAtaquePuente);
	
	SetParamObjetivo(hG_PARAPETO, "Tactica", "ActitudBatallon", "Ofensiva");
  SetParamObjetivo(hG_1, "Tactica", "ActitudBatallon", "Ofensiva");
  	
	EjecutarPlanificador(hEstrategiaMalos, TRUE);		
	EjecutarPlanificador(hEstrategiaRegulares, TRUE);						
	
	IndicarObjetivoCumplido(hObjLlegadaAntioquia);
	bObjLlegadaAntioquia = TRUE;
	  
	DestruirTrigger("ConseguirRefuerzos");
	
}   

//---------------------------------
Trigger "ReaccionI" [Inactivo]
(
 	(HanEntradoCivilizacionesEnZona("Z_REACCIONI","CESAR")) 
)
Do
{	  
	SetParamObjetivo(hG_PARAPETO, "Tactica", "ActitudBatallon", "Ofensiva");
	SetParamObjetivo(hG_ATREGULARESII, "Tactica", "ActitudBatallon", "Ofensiva");
	DestruirTrigger("ReaccionI");
}   

//---------------------------------
Trigger "RolloGuia" [Inactivo]
(
 	(HanEntradoCivilizacionesEnZona("Z_GUIA","CESAR")) 
)
Do
{	  
  hAtaquePuente = CrearObjetivo(hEstrategiaMalos, "AtacarPunto", 52, 6);//49, 9);
  AnyadirGrupoAObjetivo(hAtaquePuente, "G_ATAQUEPUENTE");  
  AnyadirObjetivo(hEstrategiaMalos,  hAtaquePuente);
  
  CambiarObjetivo(hG_BARRIER, "AtacarPunto", 79, 18);
	
	//GrupoTropasSeguirRutaPredefinida("G_ATAQUEPUENTE", "R_ATAQUEPUENTE");
	  
	DestruirTrigger("RolloGuia");
} 
  
/*
//---------------------------------
Trigger "GuiaCamina" [Inactivo]
(
 	EstaPuenteConstruido("puente2", "ALIADOS")
)
Do
{	  
	
	hGuia = CrearObjetivo(hEstrategiaAliados, "MostrarRuta", "R_GUIA", "CESAR");
  AnyadirTropaAObjetivo(hGuia, "GUIA");  
  AnyadirObjetivo(hEstrategiaAliados,  hGuia);
		
	DestruirTrigger("GuiaCamina");
} 
*/

//Reguladores de la produccion de los enemigos 
//--------------------------------------
Trigger "PararProduccionMalos" [ Inactivo ]
(
  DarPotenciaCivilizacion("MALOS") > 200000
)
Do
{
  SetEntrenamientoPueblo(hEstrategiaMalos, "pueblo1", FALSE);
  DesactivarTrigger("PararProduccionMalos");
  ActivarTrigger("ActivarProduccionMalos");
}

//---------------------------------------
Trigger "ActivarProduccionMalos" [ Inactivo ]
(
  DarPotenciaCivilizacion("MALOS") < 190000
)
Do
{
  SetEntrenamientoPueblo(hEstrategiaMalos, "pueblo1", TRUE);
  DesactivarTrigger("ActivarProduccionMalos");
  ActivarTrigger("PararProduccionMalos");
}

//--------------------------------------
Trigger "PararProduccionRegulares" [ Inactivo ]
(
  DarPotenciaCivilizacion("REGULARES") > 50000
)
Do
{
  SetEntrenamientoPueblo(hEstrategiaRegulares, "pueblo2", FALSE);
  DesactivarTrigger("PararProduccionRegulares");
  ActivarTrigger("ActivarProduccionRegulares");
}

//---------------------------------------
Trigger "ActivarProduccionRegulares" [ Inactivo ]
(
  DarPotenciaCivilizacion("REGULARES") < 45000
)
Do
{
  SetEntrenamientoPueblo(hEstrategiaRegulares, "pueblo2", TRUE);
  DesactivarTrigger("ActivarProduccionRegulares");
  ActivarTrigger("PararProduccionRegulares");
}

//El primer cambio de bando de los aliados
//---------------------------------------
Trigger "AlisPrimerosTuyos" [ Inactivo ]
(
  (DarTropasMuertasDeGrupo("G_ATREGULARES") == 4) &&
  (DarTropasMuertasDeGrupo("G_ATREGULARESII") == 1)
)
Do
{
  
  MensajeLocucionado("16N8","LTEXT_MISION16_MENSAJE_01_TXT");
  
  CambiarBandoPorGrupo("G_ALII", "CESAR");
  DestruirTrigger("AlisPrimerosTuyos");
}

//---------------------------------------
Trigger "ReconquistaEnemiga" [ Inactivo ]
(
  !EstaPuebloConquistado("MALOS", "pueblo1") || !EstaPuebloConquistado("REGULARES", "pueblo2")
)
Do
{
  if ( !EstaPuebloConquistado("MALOS", "pueblo1") )
   {
     CambiarObjetivo(hG_RECONQUISTA, "AsaltarCampamento", "pueblo1", "G_RECONQUISTA");
          
     SetParamObjetivo (hG_RECONQUISTA, "PotenciaAtaque", 10400); 
     SetParamObjetivo (hG_RECONQUISTA, "TiempoParaAtaque", 100);
   }
   
  else
  if ( !EstaPuebloConquistado("REGULARES", "pueblo2") )
   {
     CambiarObjetivo(hG_RECONQUISTA, "AsaltarCampamento", "pueblo2", "G_RECONQUISTA");
          
     SetParamObjetivo (hG_RECONQUISTA, "PotenciaAtaque", 10400);
     SetParamObjetivo (hG_RECONQUISTA, "TiempoParaAtaque", 100);
   }
  
  DestruirTrigger("ReconquistaEnemiga");
}

//-----------------------------
Trigger "End" [ Activo ]  
(
  TRUE
)
Do
{
}