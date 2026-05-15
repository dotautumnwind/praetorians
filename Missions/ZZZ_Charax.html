Var
{	
  handle hEstrategia;
  handle hCivilizacionCPU;
   
  handle hEstrategiaPublioArmy;
  handle hCivilizacionCPUPublioArmy;
  
  handle hEstrategiaCrasoArmy;
  handle hCivilizacionCPUCrasoArmy;  

  handle hObjetivoCampamento;  
  handle hObjetivoPublioArmy;  
  handle hObjetivoCrasoArmy;  
  handle hObjetivoRefuerzo;
  
  handle hPersecucion;
  handle hPersecucionI;
  handle hPersecucionII;
  handle hPersecucionIII;
  handle hPersecucionIV;
    
  handle hPatrullaPartos;
  handle hDefensaPueblos;
  
  handle hDefPuebloEsquina;
  
  handle hCatapults;
  handle hCatapultsI;
  handle hCatapultsII;
  handle hCatapultsIII;
  handle hCatapultsIV;
  handle hCatapultsV;
  
  handle hEscoltaCraso;
  handle hEscoltaPublio;
    
  bool bPublioArmyVisto                = FALSE;
  bool bCrasoArmyVisto                 = FALSE;

  
  bool bFirstStep                      = FALSE;
  bool bSecondStep                     = FALSE;
  
  // objetivos
  handle hObjResiste	    						 = NULL;
  handle hObjVisitarEdessa    				 = NULL;
  handle hObjVisitarCharax		    		 = NULL;
  handle hObjPuntoReunion					     = NULL;
  handle hObjHuir									     = NULL;
  handle hObjCatapultas						     = NULL;
  handle hObjCasioVivo                 = NULL;
  handle hObjCrasoVivo                 = NULL;
  
  bool bCarrhaeAbandonado    					 = FALSE;
  bool catapultasFuera			    			 = FALSE;
  bool bAPorCatapultas                 = FALSE;
  
  // niveles de dificultad
  float fNivelDificultad               = 0;
  float fDelayPueblosAliados;
  float fDelayPueblosEnemigos;
  //float fNumCatapultas                 = 0;
  float fEnemigosIniciales             = 0;

  
  // produccion de los partos
  handle hProduccion; 
  handle hProduccionII;
  
  //produccion de PublioArmy y CrasoArmy
  handle hDefPublioArmy;
  handle hDefCrasoArmy;
  handle hComportamientoAliado;
  
  // briefings  
  float fPuntoSincronia                    = 0;
  handle hPuntoSincronia                   = NULL;
  bool bBriefingEnded                      = FALSE;  
    
  // otros
  bool bMuerte1Final                      = FALSE;
  bool bMuerte2Final                      = FALSE;
    
}

#include "FunScript.h"


////////////////////////////////////////////////////////////////
// NOTA IMPORTANTE
//  Hasta nuevo aviso PUBLIO es Marco Craso y CRASO es Publio Craso
//  xq ha cambiado el orden de encuentro con ellos y hay más cosas
//  que dependen en la lógica de quién era quién que textos.
////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////
// MAIN
/////////////////////////////////////////////////////////////////
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
 
  // vosotros quietos
  OrdenarTropaMantenerPosicion("PUBLIO", TRUE);
  OrdenarTropaMantenerPosicion("CRASO", TRUE);

  // algunas alianzas
  CrearAlianzaPorNombre("MUERTE_CRASO", "Jugador");
  CrearAlianzaPorNombre("MUERTE_PUBLIO", "Jugador");

  // siguiente...
  ActivarTrigger("Briefing");

}


//------------------------
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
  
  // activar la actitud agresiva de la catapulta junto a carrhae
  SetActitudAgresiva("CATAPULTA_LADILLA", TRUE);
  
  // comprobar el nivel de dificultad
  fNivelDificultad = DarDificultadMision();
  if ( fNivelDificultad == 1 )
  {
    fDelayPueblosAliados = 180000;//3 min
    fDelayPueblosEnemigos = 300000;//5 min
    
    //fNumCatapultas = 10;// misteriosamente las catapultas son 5 pero el script lee el doble?...
    fEnemigosIniciales = 250; 
    
    //Los enemigos no pueden construir torres de defensa
    IntroducirRestriccionEstructura("ORDEN_CONSTRUIR", "TORRE_DEFENSA_EGIPCIA", "");
  }
  else
  if ( fNivelDificultad == 2 )
  {
    fDelayPueblosAliados = 300000;//5 min
    fDelayPueblosEnemigos = 180000;//3 min
    
    //fNumCatapultas = 12;// misteriosamente las catapultas son 6 pero el script lee el doble?...
    fEnemigosIniciales = 260;
    
    //Los enemigos no pueden construir torres de defensa
    IntroducirRestriccionEstructura("ORDEN_CONSTRUIR", "TORRE_DEFENSA_EGIPCIA", "");
  }
  else
  if ( fNivelDificultad == 3 )
  {
    
    fDelayPueblosAliados = 420000;//7 min
    fDelayPueblosEnemigos = 60000;//1 min
    
    //fNumCatapultas = 14;// misteriosamente las catapultas son 7 pero el script lee el doble?...
    fEnemigosIniciales = 270;

  }
  else
  {
    fDelayPueblosAliados = 540000;//9 min
    fDelayPueblosEnemigos = 240000;//4 min
    
    //fNumCatapultas = 5;
    
    MensajeChat("Nivel de dificulatd desconocido, oiga");
   }
   
  //restricciones de la mision
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GLADIADOR", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "PIQUERO_ELITE", "");
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "HONDERO", "");
  
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_GERMANA", "");
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_CAZADOR", "");
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_ESPADON", "");
  
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_CUADRIGA", "");
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_PARTHA", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_ARQUERON", "");
   
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "BALLESTA_MOVIL_BARBARA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "CATAPULTA_BARBARA", "");
  
	//alianza de los romanos con los partos para que no los ataquen desde el principio
	//CrearAlianzaPorNombre("partos", "romanos");
		
  // a lo mejor hay que poner que los aliados (PublioArmy y CrasoArmy) se ponagn a producir desde el principio
  // objetivos
  hObjResiste = CrearHandle("Bool");
  hObjVisitarEdessa = CrearHandle("Bool");
  hObjVisitarCharax = CrearHandle("Bool");
  hObjHuir = CrearHandle("Bool");
  hObjCatapultas = CrearHandle("Bool");
  hObjCasioVivo = CrearHandle("Bool");
  hObjCrasoVivo = CrearHandle("Bool");
  
  AgregarObjetivoMision(hObjResiste, "LTEXT_MISION14_OBJETIVO_00_TXT");
  AgregarObjetivoMision(hObjCasioVivo,"LTEXT_MISION14_OBJETIVO_01_TXT");
  
  ActivarTrigger("CondicionesVictoria");
	
  hEstrategia = CrearEstrategiaScript();
  hCivilizacionCPU = DarCivilizacion("partos");
  AsignarEstrategia(hCivilizacionCPU, hEstrategia);
  StartEstrategia(hEstrategia);
  
  SetValue(hEstrategia, "MOVER_A_PUEBLO_OFENSIVO", TRUE);
   
  hEstrategiaPublioArmy = CrearEstrategiaScript();
  hCivilizacionCPUPublioArmy= DarCivilizacion("PublioArmy");
  AsignarEstrategia(hCivilizacionCPUPublioArmy, hEstrategiaPublioArmy);
  StartEstrategia(hEstrategiaPublioArmy);
  
  hEstrategiaCrasoArmy = CrearEstrategiaScript();
  hCivilizacionCPUCrasoArmy = DarCivilizacion("CrasoArmy");
  AsignarEstrategia(hCivilizacionCPUCrasoArmy, hEstrategiaCrasoArmy);
  StartEstrategia(hEstrategiaCrasoArmy);
  
  //Lo definitivo para proteger a los centuiones de una vez por todas
   
  SetParamEstrategia(hEstrategia, "ResetTropaRestringida");
  SetParamEstrategia(hEstrategia, "TropaRestringida", "PUBLIO");
  SetParamEstrategia(hEstrategia, "TropaRestringida", "CRASO");
   
  // vosotros quietos
  OrdenarTropaMantenerPosicion("PUBLIO", TRUE);
  OrdenarTropaMantenerPosicion("CRASO", TRUE);
    
  //InteractuarTropaConEnte("PUBLIO", "EDESSA");
  //InteractuarTropaConEnte("CRASO", "CHARAX");
   
  // Ordenes iniciales de tropas.
  // ------------------------------

  // Ponemos en actitud ofensiva y manteniendo posicion a las tropas libres
  //CivilizacionSetMantenerPosicion("partos", TRUE); //?????????????????? 
  
  // Arqueros defensivos de los generales.
  //InteractuarTropaConEnte("AT_CrasoArmy", "CHARAX DEFENSE TOWER");
  //InteractuarTropaConEnte("AT_PublioArmy", "EDESSA DEFENSE TOWER");    
  
  //patrullas de los partos
	hPatrullaPartos = CrearObjetivo(hEstrategia, "PatrullaOleadasPeriodicas", 10000, 12000, 25, 50);
  AnyadirGrupoAObjetivo(hPatrullaPartos, "PATRULLAS");
  SetParamObjetivo(hPatrullaPartos, "FACTOR_POTENCIA_TROPAS", 4);

  SetParamObjetivo(hPatrullaPartos, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hPatrullaPartos, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hPatrullaPartos, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hPatrullaPartos, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hPatrullaPartos, "MaxNumOleadas", 5);
  SetParamObjetivo(hPatrullaPartos, "ComposicionEstricta", FALSE);
 
  AnyadirObjetivo(hEstrategia, hPatrullaPartos);
  
  
  //entrenamiento de los partos
  hProduccion = CrearObjetivo(hEstrategia, "ConquistaPueblo2", "CAMPAMENTO_PARTO");
  AnyadirGrupoAObjetivo(hProduccion, "CENTURIONI");  
  SetParamObjetivo(hProduccion, "PuedePedirRefuerzos", FALSE);
  AnyadirObjetivo(hEstrategia, hProduccion);
  SetDelayEntrenamientoTropasPueblo(hEstrategia, "CAMPAMENTO_PARTO", fDelayPueblosEnemigos);
   
  hProduccionII = CrearObjetivo(hEstrategia, "ConquistaPueblo2", "CAMPAMENTO_PARTOII");
  AnyadirGrupoAObjetivo(hProduccionII, "CENTURIONII");
  SetParamObjetivo(hProduccionII, "PuedePedirRefuerzos", FALSE);
  AnyadirObjetivo(hEstrategia, hProduccionII);
  SetDelayEntrenamientoTropasPueblo(hEstrategia, "CAMPAMENTO_PARTOII", fDelayPueblosEnemigos);
  
  // Los objetivos provisionales de las tropas que atacaran a Publio y a Craso
  hPersecucion= CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hPersecucion, "INTERCEPTOS", 1);
  AnyadirObjetivo(hEstrategia, hPersecucion);
  
  hPersecucionI= CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hPersecucionI, "INTERCEPTOSI", 2);
  AnyadirObjetivo(hEstrategia, hPersecucionI);
  
  hPersecucionII= CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hPersecucionII, "INTERCEPTOSII", 3);
  AnyadirObjetivo(hEstrategia, hPersecucionII);
  
  hPersecucionIII= CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hPersecucionIII, "INTERCEPTOSIII", 1);
  AnyadirObjetivo(hEstrategia, hPersecucionIII);
  
  hPersecucionIV= CrearObjetivo(hEstrategia, "DefensaSemiCoordinada");
  AnyadirGrupoAObjetivo(hPersecucionIV, "INTERCEPTOSIV", 1);
  AnyadirObjetivo(hEstrategia, hPersecucionIV);
  
  //Las escoltas personales de Publio y Craso...
  hEscoltaCraso = CrearObjetivo(hEstrategiaCrasoArmy, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hEscoltaCraso, "G_ESCOLTA_CRASO");
  SetParamObjetivo(hEscoltaCraso, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaCrasoArmy, hEscoltaCraso);
  
  hEscoltaPublio = CrearObjetivo(hEstrategiaPublioArmy, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hEscoltaPublio, "G_ESCOLTA_PUBLIO");
  SetParamObjetivo(hEscoltaPublio, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaPublioArmy, hEscoltaPublio);
    
  //Activacion de triggers
  ActivarTrigger("CambioObjetivo_PublioArmyYCrasoArmy");
  ActivarTrigger("PublioArmyCrasoArmyYSusPueblos");
  ActivarTrigger("ActivarProduccionPartos");
  ActivarTrigger("ErrorFatal");
  ActivarTrigger("PatrullasPartos");
  ActivarTrigger("MandarCenturion");
  ActivarTrigger("EXITO");
  ActivarTrigger("CatapultasMuertasPrimero");
  ActivarTrigger("AtacarPuebloPrimero");
  ActivarTrigger("VemosPuebloPublioArmy");
  ActivarTrigger("VemosPuebloCrasoArmy");
  ActivarTrigger("VemosPuebloAliado");
  ActivarTrigger("VadosEnElRio");
  ActivarTrigger("ComportamientoCatapultas");
  
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
 
  // Neutralizo a los egipcios para que no me den por culo
  NeutralizarCivilizacion("partos", TRUE);
 
  // luces
  IluminarZonaOnOff(12, 2, 6, 20, "enemigos1", TRUE);
  IluminarZonaOnOff(162, 2, 165, 20, "enemigos2", TRUE);
  IluminarZonaOnOff(260, 2, 215, 30, "enemigos3", TRUE);

  // a los mongos del briefing
  SetHabilidadAutomatica("MONGOS", "PILUM", FALSE);
  PonerVidaEnte("MONGOS", 400);
 
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
  ActivarPresentacion(TRUE, "LTEXT_MISION14_PRESENTACION_TITULO",
                            "LTEXT_MISION14_PRESENTACION_LUGAR", hPresentacion);
 
  // camara a donde debe empezar
//EncolarColocarYMirarPunto("BRIEFING_1");
  EncolarColocarYMirarPunto("NBRIEFING_0");
  EjecutarOrdenesCamara();
  
  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));
 
  ActivarPresentacion(FALSE, "", "", NULL);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolarColocarYMirarPunto("NBRIEFING_0");
  EncolarPausaCamara(1000);
  EncolaTrayectoriaCamara("NBRIEFING_1", FALSE, FALSE, 0, 0);
  IntroducirLocucion("14N0", "LTEXT_MISION14_LOCUCION_00_TXT", 7000, 600, 100);
  IntroducirPuntoSincronia(); 

  EncolarColocarYMirarPunto("NBRIEFING_1");
  EncolarPausaCamara(4000);
  EncolarColocarYMirarPunto("NBRIEFING_2");
  EncolarPausaCamara(4000);
  EncolarColocarYMirarPunto("NBRIEFING_3");
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("14N1", "LTEXT_MISION14_LOCUCION_01_TXT", 9000, 600, 100);
  IntroducirPuntoSincronia(); 

  EncolarColocarYMirarPunto("NBRIEFING_1");
  EncolarPausaCamara(1000);
  EncolaTrayectoriaCamara("BRIEFING_3", FALSE, FALSE, 0, 0);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("14N2", "LTEXT_MISION14_LOCUCION_02_TXT", 10000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("14N3", "LTEXT_MISION14_LOCUCION_03_TXT", 4000, 600, 100);
  IntroducirPuntoSincronia();

/*
  EncolarPausaCamara(8000);
  IntroducirLocucion("14N0", "LTEXT_MISION14_LOCUCION_00_TXT", 7000, 600, 100);
  IntroducirPuntoSincronia(); 

  EncolaTrayectoriaCamara("BRIEFING_2", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("14N1", "LTEXT_MISION14_LOCUCION_01_TXT", 9000, 600, 100);
  IntroducirPuntoSincronia();

  EncolaTrayectoriaCamara("BRIEFING_3", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("14N2", "LTEXT_MISION14_LOCUCION_02_TXT", 10000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("14N3", "LTEXT_MISION14_LOCUCION_03_TXT", 4000, 600, 100);
  IntroducirPuntoSincronia();
*/

  IntroducirPonerModoJuegoCamara(TRUE);

  // Desneutralizo
  NeutralizarCivilizacion("partos", FALSE);

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
 
  // luces
  IluminarZonaOnOff(12, 2, 6, 20, "enemigos1", FALSE);
  IluminarZonaOnOff(162, 2, 165, 20, "enemigos2", FALSE);
  IluminarZonaOnOff(260, 2, 215, 30, "enemigos3", FALSE);

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



////////////////////////////////////////////////////////
// TRIGGERS DE MISION
////////////////////////////////////////////////////////


//------------------------------------
Trigger "PublioArmyCrasoArmyYSusPueblos" [ Inactivo ]
(
  TRUE
)
Do
{
  
	hDefPublioArmy = CrearObjetivo(hEstrategiaPublioArmy, "ConquistaPueblo2", "EDESSA", "G_PUBLIO");
  AnyadirGrupoAObjetivo(hDefPublioArmy, "G_PUBLIO");
  SetParamObjetivo(hDefPublioArmy, "PuedePedirRefuerzos", FALSE);
  SetParamObjetivo(hDefPublioArmy, "CenturionProhibidoAyudaCombate", TRUE);
  AnyadirObjetivo(hEstrategiaPublioArmy, hDefPublioArmy);
  
  SetDelayEntrenamientoTropasPueblo(hEstrategiaPublioArmy, "EDESSA", fDelayPueblosAliados);  

	hDefCrasoArmy = CrearObjetivo(hEstrategiaCrasoArmy, "ConquistaPueblo2", "CHARAX", "G_CRASO");
  AnyadirGrupoAObjetivo(hDefCrasoArmy, "G_CRASO");
  SetParamObjetivo(hDefCrasoArmy, "PuedePedirRefuerzos", FALSE);
  SetParamObjetivo(hDefCrasoArmy, "CenturionProhibidoAyudaCombate", TRUE);
  AnyadirObjetivo(hEstrategiaCrasoArmy, hDefCrasoArmy);  
  
  SetDelayEntrenamientoTropasPueblo(hEstrategiaCrasoArmy, "CHARAX", fDelayPueblosAliados);  
  
  DestruirTrigger("PublioArmyCrasoArmyYSusPueblos");
}

//------------------------------------

Trigger "PararProduccionPartos" [ Inactivo ]
(
  DarPotenciaCivilizacion("partos") > 360000
)
Do
{
  SetEntrenamientoPueblo(hEstrategia, "CAMPAMENTO_PARTOII", FALSE);
  SetEntrenamientoPueblo(hEstrategia, "CAMPAMENTO_PARTO", FALSE);
  DesactivarTrigger("PararProduccionPartos");
  ActivarTrigger("ActivarProduccionPartos");
}

//-------------------------------------------
Trigger "ActivarProduccionPartos" [ Inactivo ]
(
  DarPotenciaCivilizacion("partos") < 300000
)
Do
{
  SetEntrenamientoPueblo(hEstrategia, "CAMPAMENTO_PARTOII", TRUE);
  SetEntrenamientoPueblo(hEstrategia, "CAMPAMENTO_PARTO", TRUE);
  DesactivarTrigger("ActivarProduccionPartos");
  ActivarTrigger("PararProduccionPartos");
}

//-------------------------------------------
Trigger "ErrorFatal" [ Inactivo ]
(
  EstaPuebloConquistado("Jugador", "CAMPAMENTO_PARTOII") ||
  EstaPuebloConquistado("Jugador", "CAMPAMENTO_PARTO")
)
Do
{
  
  DisposeHandle(&hPatrullaPartos); 
  hPatrullaPartos = CrearObjetivo(hEstrategia, "CazaYCaptura");
  AnyadirGrupoAObjetivo(hPatrullaPartos, "PATRULLAS");
   
  AnyadirObjetivo(hEstrategia, hPatrullaPartos);
  DestruirTrigger("ErrorFatal");
  
}

//------------------------------------
Trigger "PatrullasPartos" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{

  // Espera un tiempo antes de volver a patrullar normalmente
  hTimer = CrearTimer(180000);  // 3 min
  Wait(hTimer);
  
  SetParamObjetivo(hPatrullaPartos, "ParametrosTacticas", "AtacarCorriendo", TRUE);
	SetParamObjetivo(hPatrullaPartos, "FACTOR_POTENCIA_TROPAS", 4);
  SetParamObjetivo(hPatrullaPartos, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hPatrullaPartos, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hPatrullaPartos, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hPatrullaPartos, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hPatrullaPartos, "MaxNumOleadas", 5);
  SetParamObjetivo(hPatrullaPartos, "ComposicionEstricta", FALSE);
  
  //SetParamObjetivo(hPatrullaPartos, "ObjetivoAtracable", hProduccion);
  //SetParamObjetivo(hPatrullaPartos, "ObjetivoAtracable", hProduccionII);
  //SetParamObjetivo(hPatrullaPartos, "NivelTraza", 1);

  SetParamObjetivo(hPatrullaPartos, "IntentarTenerUnaDefUnidad", "EXPLORADOR_HALCON");
   
  DesactivarTrigger("PatrullasPartos");
  ActivarTrigger("PersecucionesPartos");
  
}

//-------------------------------------
Trigger "PersecucionesPartos" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{
	
  // Espera un tiempo antes de lanzar las patrullas de rastreo
  hTimer = CrearTimer(180000);  // 3 min
  Wait(hTimer);
  
  //SetParamObjetivo(hPatrullaPartos, "ParametrosTacticas", "AtacarCorriendo", TRUE);
	
	SetParamObjetivo(hPatrullaPartos, "FACTOR_POTENCIA_TROPAS", 8);
  SetParamObjetivo(hPatrullaPartos, "EXPLORAR_FACTOR_ENEMIGOS", 100);
  SetParamObjetivo(hPatrullaPartos, "EXPLORAR_FACTOR_VISTA_YA", 0.5);
  SetParamObjetivo(hPatrullaPartos, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hPatrullaPartos, "EXPLORAR_FACTOR_PUEBLOS", 50);
  SetParamObjetivo(hPatrullaPartos, "MaxNumOleadas", 5);
  SetParamObjetivo(hPatrullaPartos, "ComposicionEstricta", FALSE);
  
  //SetParamObjetivo(hPatrullaPartos, "ObjetivoAtracable", hProduccionII);
  //SetParamObjetivo(hPatrullaPartos, "ObjetivoAtracable", hProduccion);
  
  //SetParamObjetivo(hPatrullaPartos, "NivelTraza", 1);

  SetParamObjetivo(hPatrullaPartos, "IntentarTenerUnaDefUnidad", "EXPLORADOR_HALCON");
  
  DesactivarTrigger("PersecucionesPartos");
  ActivarTrigger("PatrullasPartos");
  
}



// ------------------------------------------------------------------------------
// Condiciones de cambio de objetivo -> Abandonar el pueblo y buscar a PublioArmy y CrasoArmy
// La CPU tambien se lanza a por CrasoArmy y PublioArmy
// Ocurre cuando el jugador ha perdido muchas fuerzas o se ha ido de la zona
// ------------------------------------------------------------------------------
// Disparar el ataque inicial contra el jugador.
// Puede despertarse por tiempo o porque el jugador dispare el cambio de objetivo
// de ir a por publio y craso.
// Al lanzar el ataque, una vez conquistado el pueblo, se le da un centurion para
// que se ponga a entrenar.
//---------------------------------------

//------------------------------------
Trigger "AtacarPuebloPrimero" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{
  
  // Espera un tiempo antes de lanzar los ataques, poner el tiempo que se crea conveniente
  hTimer = CrearTimer(10000);  // 10 SEGUNDOS
  Wait(hTimer);  

  hObjetivoCampamento = CrearObjetivo(hEstrategia, "AsaltarCampamento", "CARRHAE");
  
  AnyadirGrupoAObjetivo(hObjetivoCampamento, "ATAQUE0");
  AnyadirObjetivo(hEstrategia,  hObjetivoCampamento);        
  
  // NOTA: Si no se pone esta línea, el objetivo coge algunas de las tropas que hay sueltas por
  // el mapa en cuanto ve que le hacen falta.
  SetParamObjetivo(hObjetivoCampamento, "PuedePedirRefuerzos", FALSE); // Este parametro solo tiene efecto si se llama despues de AnyadirObjetivo
  
  SetParamObjetivo(hObjetivoCampamento, "TiempoParaAtaque", 30);
  SetParamObjetivo(hObjetivoCampamento, "PotenciaAtaque", 3000);//20000
  SetParamObjetivo(hObjetivoCampamento, "NombreGrupoGenerado", "INTERCEPTOS");    
  
  //ActivarTrigger("MandarCenturion");
  DestruirTrigger("AtacarPuebloPrimero");
}


//---------------------------------------------------------
Trigger "CambioObjetivo_PublioArmyYCrasoArmy" [ Inactivo ]
(
  (DarPorcentajeTropasEnZona("Jugador","ZONA_FRONTERA") < 100)  || (DarUnidadesMuertas("partos") > fEnemigosIniciales)  
)
Var
{
  handle hTimerCabeza;
  float x, y;
  handle hCamaraEnd;
  handle hEscape;
}
Do
{
  
  
  // alianzas justas y necesarias
  CrearAlianzaPorNombre("Jugador", "PublioArmy");
  CrearAlianzaPorNombre("Jugador", "CrasoArmy");  
  
  // dejamos carrhae
  bCarrhaeAbandonado = TRUE;
  
  // objetivos nuevos de misión
	EliminarObjetivoMision(hObjResiste);
	AgregarObjetivoMision(hObjVisitarEdessa, "LTEXT_MISION14_OBJETIVO_03_TXT");
 	AgregarObjetivoMision(hObjVisitarCharax, "LTEXT_MISION14_OBJETIVO_02_TXT");
 	ObjetivosMisionCambiados();
  
  //////////////////////////////////////////////////////////////////////////
  // cinemática de moda
  
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
  EncolarPausaCamara(3000);
  IntroducirLocucion("14D0", "LTEXT_MISION14_EVENTO1_00_TXT", 3000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("14D1", "LTEXT_MISION14_EVENTO1_01_TXT", 4000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
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
    
  //////////////////////////////////////////////////////////////////////////
  
  // Ataque masivo al campamento inicial.
  SetParamObjetivo(hObjetivoCampamento, "TiempoParaAtaque", 5);
  SetParamObjetivo(hObjetivoCampamento, "PotenciaAtaque", 200000);
  
  hObjetivoCrasoArmy = CrearObjetivo(hEstrategia, "AsaltarCampamento", "CHARAX", "CMP_CRASO");
  AnyadirGrupoAObjetivo(hObjetivoCrasoArmy, "CMP_CRASO");
  AnyadirObjetivo(hEstrategia,  hObjetivoCrasoArmy);        
  SetParamObjetivo(hObjetivoCrasoArmy, "PuedePedirRefuerzos", FALSE); // Este parametro solo tiene efecto si se llama despues de AnyadirObjetivo
  SetParamObjetivo(hObjetivoCrasoArmy, "TiempoParaAtaque", 60);//
  SetParamObjetivo(hObjetivoCrasoArmy, "PotenciaAtaque",12000);
  
  //Los pueblos que producen partos distribuyen sus tropas entre 3 objetivos diferentes
  SetParamObjetivo(hProduccion, "DistribuirTropas", 25, hPatrullaPartos, 75);
  SetParamObjetivo(hProduccionII, "DistribuirTropas", 15, hPatrullaPartos, 50, hObjetivoCrasoArmy, 35);

  // Habilitar el subobjetivo "haber rescatado a ambos"
  ActivarTrigger("CambioObjetivo_Huir");
      
  if(DarUnidadesMuertas("partos") > fEnemigosIniciales)
  {
  hTimerCabeza = CrearTimer(360000);// 6 minutos para el ataque al campamento de Publio (para que no se lo carguen con tanta facilidad
  Wait(hTimerCabeza);
  }
  
  // El asedio a los campamentos de Publio y Craso 
  hObjetivoPublioArmy = CrearObjetivo(hEstrategia, "AsaltarCampamento", "EDESSA", "CMP_PUBLIO");
  AnyadirGrupoAObjetivo(hObjetivoPublioArmy, "CMP_PUBLIO");
  AnyadirObjetivo(hEstrategia,  hObjetivoPublioArmy);        
  SetParamObjetivo(hObjetivoPublioArmy, "PuedePedirRefuerzos", FALSE); // Este parametro solo tiene efecto si se llama despues de AnyadirObjetivo
  SetParamObjetivo(hObjetivoPublioArmy, "TiempoParaAtaque", 60);//
  SetParamObjetivo(hObjetivoPublioArmy, "PotenciaAtaque", 12000);
  
  SetParamObjetivo(hProduccion, "DistribuirTropas", 15, hPatrullaPartos, 50, hObjetivoPublioArmy, 35);
  
  DestruirTrigger("CambioObjetivo_PublioArmyYCrasoArmy");
}

// ------------------------------------------------------------------------------
// Condiciones de cambio de bando de los generales
// Siempre estan activas, aunque no se haya cambiado de objetivo.
//------------------------------------------------------------------------------
Trigger "VemosPuebloPublioArmy" [ Inactivo ]
(
  HanEntradoCivilizacionesEnZona("ZONA_PUBLIO", "Jugador")
)
Var
{
  float x, y;
  handle hCamaraEnd;
  handle hEscape;
}
Do
{
  //ahora ya se lo pueden cargar si quieren 
  SetParamEstrategia(hEstrategia, "ResetTropaRestringida");
  
  // objetivo cumplido
  IndicarObjetivoCumplido(hObjVisitarEdessa);
  
  // marcamos como hecho
  bPublioArmyVisto = TRUE;
  
  //////////////////////////////////////////////////////////////////////////
  // cinemática de moda: ver a craso
  
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

  EncolarTrayectoriaMirarEnteCamara("PUBLIO", TRUE, FALSE, 2, 0);
  EncolarPausaCamara(4000);
  
  if ( !bCrasoArmyVisto )
  {
    IntroducirLocucion("14E0", "LTEXT_MISION14_EVENTO2_00_TXT", 6000, 600, 100);
    IntroducirLocucion("", "", 100, 0, 0);
    IntroducirLocucion("14E1", "LTEXT_MISION14_EVENTO2_01_TXT", 5000, 600, 100);
    IntroducirLocucion("", "", 100, 0, 0);
  }
  else
  {
    IntroducirLocucion("14E0", "LTEXT_MISION14_EVENTO2_00_TXT", 6000, 600, 100);
    IntroducirLocucion("", "", 100, 0, 0);
  }
  
  IntroducirPuntoSincronia();
  
  EncolarTrayectoriaMirarEnteCamara("PUBLIO", FALSE, TRUE, 0, 2);
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
    
  //////////////////////////////////////////////////////////////////////////
  
  DisposeHandle(&hDefPublioArmy);
    
  // Las tropas del ataque inicial se unen a las patrullas 
  DisposeHandle(&hObjetivoCampamento);
  AnyadirGrupoAObjetivo(hPatrullaPartos, "ATAQUE0");
    
  CambiarBando("PublioArmy", "Jugador");
  
  // nuevo objetivo
  AgregarObjetivoMision(hObjCrasoVivo, "LTEXT_MISION14_OBJETIVO_06_TXT");
  ObjetivosMisionCambiados();
      
  // Creamos el objetivo de asalto a Publio por si no se habia creado hasta ahora y destruimos el trigger pendiente
  DestruirTrigger("CambioObjetivo_PublioArmyYCrasoArmy");
  
  hObjetivoPublioArmy = CrearObjetivo(hEstrategia, "AsaltarCampamento", "EDESSA", "CMP_PUBLIO");
  AnyadirGrupoAObjetivo(hObjetivoPublioArmy, "CMP_PUBLIO");
  AnyadirObjetivo(hEstrategia,  hObjetivoPublioArmy);        
  SetParamObjetivo(hObjetivoPublioArmy, "PuedePedirRefuerzos", FALSE); 
  SetParamObjetivo(hObjetivoPublioArmy, "TiempoParaAtaque", 60);
  SetParamObjetivo(hObjetivoPublioArmy, "PotenciaAtaque", 8000);
  
  SetParamObjetivo(hProduccion, "DistribuirTropas", 15, hPatrullaPartos, 50, hObjetivoPublioArmy, 35);
  
  DestruirTrigger("VemosPuebloPublioArmy");
  
}


//--------------------------------------
Trigger "VemosPuebloCrasoArmy" [ Inactivo ]
(
  HanEntradoCivilizacionesEnZona("ZONA_CRASO", "Jugador")
)
Var
{
  float x, y;
  handle hCamaraEnd;
  handle hEscape;
}
Do
{
  //Dejamos que los enemigos se carguen a Publio
  SetParamEstrategia(hEstrategia, "ResetTropaRestringida");
 
  // marcamos como hecho
  bCrasoArmyVisto = TRUE;
  
  // damos por cumplido el objetivo
  IndicarObjetivoCumplido(hObjVisitarCharax);
  
  //////////////////////////////////////////////////////////////////////////
  // cinemática de moda: a craso se le muere el niño
  
  // trapi
  NeutralizarCivilizacion("partos", TRUE);
  NeutralizarCivilizacion("Jugador", TRUE);
  NeutralizarCivilizacion("CrasoArmy", TRUE);
  
  // clavamos a craso papi al suelo
  OrdenarTropaMantenerPosicion("PUBLIO", TRUE);
  
  // handle de final y presentacion
  hCamaraEnd = CrearHandle("Bool");
  hEscape = CrearHandle("Bool");

  // cazar escape
  PonerHandleInterrupcion(hEscape);
  
  // posición actual
  DarPosicionCamara(&x, &y);

  // cine
  ActivarCinemascope(TRUE);

  ActivarTrigger("EfectosMuertePublio");

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolarTrayectoriaMirarEnteCamara("CRASO", TRUE, FALSE, 2, 0);
  EncolarPausaCamara(4000);
  IntroducirPuntoSincronia();

  EncolarMirarEnteCamara("PUBLIO");
  EncolarPausaCamara(3000);
  IntroducirLocucion("14E2", "LTEXT_MISION14_EVENTO3_00_TXT", 3000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("14E3", "LTEXT_MISION14_EVENTO3_01_TXT", 4000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("14E4", "LTEXT_MISION14_EVENTO3_02_TXT", 4000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
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
    
  // un-trapi
  NeutralizarCivilizacion("partos", FALSE);
  NeutralizarCivilizacion("Jugador", FALSE);
  NeutralizarCivilizacion("CrasoArmy", FALSE);
     
  // colocamos la cámara
  if ( HandleDisparado(hEscape) )
  {
    MirarAPunto(x, y);
  }

  // restaurar
  ActivarCinemascope(FALSE);

  // desclavamos a craso papi al suelo
  OrdenarTropaMantenerPosicion("PUBLIO", FALSE);
    
  //////////////////////////////////////////////////////////////////////////

  // sacabó
  bMuerte1Final = TRUE;

  // esto ya no es necesario
  DisposeHandle(&hDefCrasoArmy); 
    
  CambiarBando("CrasoArmy", "Jugador");
  //SetParamObjetivo(hObjetivoCrasoArmy, "PotenciaAtaque", 10000);
  DestruirTrigger("VemosPuebloCrasoArmy");
  
}


Trigger "EfectosMuertePublio" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{
  
  CambiarBandoPorGrupo("G_CRASO_MUERTE", "MUERTE_CRASO");
  CrearTropa("ASESINOS", "EGIPCIO_ARQUERO", 1, 278, 228, 0, "ASESINO_PUBLIO");
  AtacarEnte("ASESINO_PUBLIO", "CRASO");
  
  DisposeHandle(&hEscoltaCraso);
  DisposeHandle(&hEscoltaPublio);
    
  if ( !bMuerte1Final )
  {
    hTimer = CrearTimer(4500);
    Wait(hTimer);
  }
  
  PonerVidaEnte("CRASO", 0);
    
  SetMoverFisicoTropa("T_1", TRUE);
  SetMoverFisicoTropa("T_2", TRUE);
  
  GrupoTropasSeguirRutaPredefinida("G_ESCOLTA_CRASO", "R_AYUDA");
  
  hTimer = CrearTimer(3000);
  Wait(hTimer);
  
  SetMoverFisicoTropa("T_1", FALSE);
  SetMoverFisicoTropa("T_2", FALSE);
    
  DestruirTrigger("EfectosMuertePublio");
}





// ------------------------------------------------------------------------------
// Cambio de objetivo -> Tras rescatar a ambos generales, hay que huir
//----------------------------------
Trigger "CambioObjetivo_Huir" [ Inactivo ]
(
  bPublioArmyVisto && bCrasoArmyVisto
)
Var
{
  handle hTimer;
}
Do
{ 
  // iluminamos los barcos	
  IluminarZonaOnOff(276.0,6,87.0,12, "BARCO", TRUE);
   
  // Nuevo objetivo
  AgregarObjetivoMision(hObjHuir, "LTEXT_MISION14_OBJETIVO_04_TXT");
  ObjetivosMisionCambiados();
  
  //CambiarObjetivo(hPersecucion, "PatrullaOleadasPeriodicas", 15000, 15000, 10, 20);
  /* 
  SetParamObjetivo(hPersecucion, "EXPLORAR_FACTOR_ENEMIGOS", 100);
  SetParamObjetivo(hPersecucion, "EXPLORAR_FACTOR_VISTA_YA", 100);
  SetParamObjetivo(hPersecucion, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hPersecucion, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hPersecucion, "MaxNumOleadas", 3);
  SetParamObjetivo(hPersecucion, "ComposicionEstricta", FALSE);
  */
  if (!EstaPuebloConquistado("Jugador", "EDESSA"))
  {    
    DisposeHandle(&hObjetivoPublioArmy);
    AnyadirGrupoAObjetivo(hPatrullaPartos, "CMP_PUBLIO");
  }  
 
  if (!EstaPuebloConquistado("Jugador", "CHARAX"))
  {    
    DisposeHandle(&hObjetivoCrasoArmy);
    AnyadirGrupoAObjetivo(hPatrullaPartos, "CMP_CRASO");
  } 
      
  DestruirTrigger("CambioObjetivo_Huir");
  
}



//------------------------------------------------------------------------------
// SUCCESS -> PublioArmy y CrasoArmy han llegado al puerto
//------------------------------------------------------------------------------

Trigger "EXITO" [ Inactivo ]
(
//HaEntradoTropaEnZona("ZONA_REUNION","PUBLIO")
  HayTipoUnidadEnZona("HEROE_MARCO_CRASO", "ZONA_REUNION")
  &&
  HayTipoUnidadEnZona("HEROE_CASIO_LONGINO", "ZONA_REUNION")
  &&
  bMuerte1Final
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
  
  DestruirTrigger("CatapultasMuertasPrimero");
  
  if ( !catapultasFuera )                         // sólo si hace falta
  {
    
    // fichamos la destrucción de las catapultas
    ActivarTrigger("CatapultasMuertas");
    
    // iluminamos las catapultas
    IluminarZonaOnOff(223.1,0,40.0,10, "catapultI", TRUE);
    IluminarZonaOnOff(265.9,1,33.7,10, "catapultII", TRUE);
    IluminarZonaOnOff(274.2,1,33.8,10, "catapultIII", TRUE);
    IluminarZonaOnOff(238.4,1,40.6,10, "catapultIV", TRUE);
    IluminarZonaOnOff(287.5,1,33.9,10, "catapultV", TRUE);
    IluminarZonaOnOff(248.5,1,42.8,10, "catapultVI", TRUE);
    IluminarZonaOnOff(278.6,0,43.7,10, "catapultVII", TRUE);
    
    hTimer = CrearTimer(200);
    Wait(hTimer);
    
    //////////////////////////////////////////////////////////////////////////
    // cinemática de moda: putas catapultas
    
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

    EncolarTrayectoriaMirarEnteCamara("PUBLIO", TRUE, FALSE, 2, 0);
    EncolarPausaCamara(1000);
    EncolaTrayectoriaCamara("CATAPULTA_0", TRUE, FALSE, 2, 0);
    EncolarPausaCamara(1000);
    EncolaTrayectoriaCamara("CATAPULTA_1", FALSE, FALSE, 2, 0);
    EncolarPausaCamara(1000);
    EncolarMirarEnteCamara("PUBLIO");
    IntroducirLocucion("14E5", "LTEXT_MISION14_EVENTO4_01_TXT", 6000, 600, 100);
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
    
    //////////////////////////////////////////////////////////////////////////
    
    AgregarObjetivoMision(hObjCatapultas, "LTEXT_MISION14_OBJETIVO_05_TXT");
    ObjetivosMisionCambiados();
 
  }
  
  // pasamos a craso a neutral
  CambiarBandoPorGrupo("G_PUBLIO_EL", "PublioArmy");
  NeutralizarCivilizacion("PublioArmy", TRUE);
  TropaSigueRutaPredefinida("PUBLIO", "R_CRASO");
  
  // cambio en los objetivos de la misión  
  IndicarObjetivoCumplido(hObjHuir);
  EliminarObjetivoMision(hObjCrasoVivo);
  
  hTimer = CrearTimer(3000);
  Wait(hTimer);
  
  // objetivo nuevo
  bAPorCatapultas  = TRUE;                        // hemos llegado al punto de reunión
 
	DestruirTrigger ("EXITO");
	
}



//-----------------------------------
Trigger "ComportamientoCatapultas" [ Inactivo ]
(
  TRUE
)
Do
{	
  hCatapults = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hCatapults, "CATAPULTS");
  AnyadirObjetivo(hEstrategia, hCatapults);
  
  hCatapultsI = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hCatapultsI, "G_AYUDCAT");
  AnyadirObjetivo(hEstrategia, hCatapultsI);
    
  hCatapultsII = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hCatapultsII, "G_AYUDCATII");
  AnyadirObjetivo(hEstrategia, hCatapultsII);
  
  hCatapultsIII = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hCatapultsIII, "G_AYUDCATIII");
  AnyadirObjetivo(hEstrategia, hCatapultsIII);
  
  hCatapultsIV = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hCatapultsIV, "G_AYUDCATIV");
  AnyadirObjetivo(hEstrategia, hCatapultsIV);
  
  hCatapultsV = CrearObjetivo(hEstrategia, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hCatapultsV, "G_AYUDCATV");
  AnyadirObjetivo(hEstrategia, hCatapultsV);
      
  DestruirTrigger("ComportamientoCatapultas");
  
}



//---------------------------------------------
Trigger "CatapultasMuertasPrimero" [ Inactivo ]
(
  DarTropasVivasGrupoYTipo("CATAPULTS", "CATAPULTA_EGIPCIA") == 0 //fNumCatapultas 
)
Do
{
  
  AgregarObjetivoMision(hObjCatapultas, "LTEXT_MISION14_OBJETIVO_05_TXT");
  ObjetivosMisionCambiados();
  IndicarObjetivoCumplido(hObjCatapultas);
  catapultasFuera = TRUE;  
    
  DestruirTrigger("CatapultasMuertasPrimero");  
  
}


//---------------------------------------
Trigger "CatapultasMuertas" [ Inactivo ]
(
  DarTropasVivasGrupoYTipo("CATAPULTS", "CATAPULTA_EGIPCIA") == 0 //fNumCatapultas
)
Do
{
  
  IndicarObjetivoCumplido(hObjCatapultas);
  catapultasFuera = TRUE;  
  DestruirTrigger("CatapultasMuertas");
  
}



/////////////////////////////////////////////////////
// TRIGGER DE TERMINACION

Trigger "CondicionesVictoria" [Inactivo]
(
  (EstaPuebloConquistado("partos", "CARRHAE") && !bCarrhaeAbandonado)
  ||
  (!EstaTropaViva("CRASO") && !bCrasoArmyVisto)
  ||
  !EstaTropaViva("PUBLIO")
  ||
  !EstaTropaViva("CASIO")
  ||
  (catapultasFuera && bAPorCatapultas)
)
Var
{
  float x, y;
  handle hCamaraEnd;
  handle hEscape;
}
Do
{
  
  // victoria!
  if ( catapultasFuera && bAPorCatapultas && EstaTropaViva("PUBLIO") && EstaTropaViva("CASIO") )
  {
    
    IndicarObjetivoCumplido(hObjCasioVivo);
    
    //////////////////////////////////////////////////////
    // muere craso!
  
    // trapi
    NeutralizarCivilizacion("partos", TRUE);
    NeutralizarCivilizacion("Jugador", TRUE);
    NeutralizarCivilizacion("PublioArmy", FALSE);
    
    OrdenarTropaMantenerPosicion("CASIO", TRUE);
  
    // handle de final y presentacion
    hCamaraEnd = CrearHandle("Bool");
    hEscape = CrearHandle("Bool");

    PonerHandleEsperaSincronizacion(hPuntoSincronia);
    fPuntoSincronia = 0;

    // cazar escape
    PonerHandleInterrupcion(hEscape);
  
    // posición actual
    DarPosicionCamara(&x, &y);

    // cine
    ActivarCinemascope(TRUE);

    ActivarTrigger("EfectosMuerteCraso");

    // cámaras
    IntroducirPonerModoJuegoCamara(FALSE);

    EncolarColocarYMirarPunto("MUERTECRASO_0");
    EncolarPausaCamara(2000);
    EncolaTrayectoriaCamara("MUERTECRASO_1", FALSE, FALSE, 0, 0);
    EncolarPausaCamara(2000);
    IntroducirPuntoSincronia();
    
    EncolaTrayectoriaCamara("MUERTECRASO_2", FALSE, FALSE, 0, 0);
    EncolarPausaCamara(1000);
    IntroducirPuntoSincronia();
    
    EncolaTrayectoriaCamara("MUERTECRASO_3", FALSE, FALSE, 0, 0);
    EncolarPausaCamara(2000);
    IntroducirPuntoSincronia();

    EncolarMirarEnteCamara("CASIO");
    IntroducirLocucion("14D6", "LTEXT_MISION14_EVENTO5_00_TXT", 3000, 600, 100);
    IntroducirLocucion("", "", 100, 0, 0);
    IntroducirLocucion("14D7", "LTEXT_MISION14_EVENTO5_01_TXT", 4000, 600, 100);
    IntroducirLocucion("", "", 100, 0, 0);
    IntroducirLocucion("14D8", "LTEXT_MISION14_EVENTO5_02_TXT", 4000, 600, 100);
    IntroducirLocucion("", "", 100, 0, 0);
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
    
    // un-trapi
    NeutralizarCivilizacion("partos", FALSE);
    NeutralizarCivilizacion("Jugador", FALSE);
     
    // colocamos la cámara
    if ( HandleDisparado(hEscape) )
    {
      MirarAPunto(x, y);
    }

    // restaurar
    ActivarCinemascope(FALSE);
    
    
    
    //////////////////////////////////////////////////////////////////////////
    
    bMuerte2Final = TRUE;
    
    WaitBool(!EstaTropaViva("PUBLIO"));
        
    FinalizarMision(TRUE);
    
  }
  else
  if ( (EstaPuebloConquistado("partos", "CARRHAE") && !bCarrhaeAbandonado) )
  {
    IndicarObjetivoFracasado(hObjResiste);
    FinalizarMision(FALSE);
  }
  else
  if ( (!EstaTropaViva("CRASO") && !bCrasoArmyVisto) )
  {
    IndicarObjetivoFracasado(hObjVisitarCharax);
    FinalizarMision(FALSE);
  }
  else
  if ( !EstaTropaViva("PUBLIO") && !bPublioArmyVisto )
  {
    IndicarObjetivoFracasado(hObjVisitarEdessa);
    FinalizarMision(FALSE);
  }
  else
  if ( !EstaTropaViva("PUBLIO") && !bCrasoArmyVisto )
  {
    IndicarObjetivoFracasado(hObjCrasoVivo);
    FinalizarMision(FALSE);
  }
  else
  if ( !EstaTropaViva("PUBLIO") )
  {
    
    if ( bPublioArmyVisto && !bAPorCatapultas )
    {
      IndicarObjetivoFracasado(hObjCrasoVivo);
    }
    
    IndicarObjetivoFracasado(hObjHuir);
    FinalizarMision(FALSE);
    
  }
  else
  if ( !EstaTropaViva("CASIO") )
  {
    IndicarObjetivoFracasado(hObjCasioVivo);
    FinalizarMision(FALSE);
  }
  else
  {
    MensajeChat("DEBERIA HABER ACABADO LA MISION: MIRAR");
  }
  
  DestruirTrigger("CondicionesVictoria");
  
}


Trigger "EfectosMuerteCraso" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{
  
  TropaSigueRutaPredefinida("PUBLIO", "R_CRASO2");
  
  CrearTropa("ASESINOS", "CABALLERIA_PARTHA", 2, 250, 120, 0, "ASESINO_CRASO");
  
  IluminarZonaOnOff(253, 2, 116, 20, "luz1", TRUE);
  IluminarZonaOnOff(260, 2, 100, 20, "luz2", TRUE);
  
  WaitBool( bMuerte2Final || (fPuntoSincronia == 1));
  
  SetMoverFisicoTropa("ASESINO_CRASO", TRUE);
  TropaSigueRutaPredefinida("ASESINO_CRASO", "R_CRASO3");
  
  WaitBool( bMuerte2Final || (fPuntoSincronia == 2));
  
  AtacarEnte("ASESINO_CRASO", "PUBLIO");
  
  if ( !bMuerte2Final )
  {
    hTimer = CrearTimer(3000);
    Wait(hTimer);
  }
  
  PonerVidaEnte("PUBLIO", 0);
  TropaSigueRutaPredefinida("ASESINO_CRASO", "R_CRASO4");
       
  DestruirTrigger("EfectosMuerteCraso");
  
}





/*
Trigger "CondicionesVictoria" [Inactivo]
(
  noResiste
  ||
  !EstaTropaViva("PUBLIO")
  ||
  !EstaTropaViva("CRASO")
  ||
  !EstaTropaViva("CASIO")
  ||
  hasMuerto
  ||
  catapultasFuera
)
Do
{
  
  if ( !EstaTropaViva("CASIO") )
  {
    IndicarObjetivoFracasado(hObjCasioVivo);
    FinalizarMision(FALSE);
  }
  else
  if ( hasMuerto )
	{
    if ( bCarrhaeAbandonado )
    {
    	if ( bPublioArmyVisto && bCrasoArmyVisto )
    	{
    		IndicarObjetivoFracasado(hObjHuir);
      }
      else
      {
      	if ( !bPublioArmyVisto ) {
      		IndicarObjetivoFracasado(hObjVisitarEdessa);	
      	}
      	if ( !bCrasoArmyVisto ) {
      	  IndicarObjetivoFracasado(hObjVisitarCharax);
      	}
      }
   	}
   	else
    if ( noResiste )
   	{
   		IndicarObjetivoFracasado(hObjResiste);
   	}
    FinalizarMision(FALSE);		
	}
	else
  if ( noResiste )
  {
    IndicarObjetivoFracasado(hObjResiste);
    FinalizarMision(FALSE);  
  }
  else
  if ( catapultasFuera )
  {
     	FinalizarMision(TRUE);	
  }
  else
  {
    FinalizarMision(FALSE); 
  }
  
  DestruirTrigger("CondicionesVictoria");
  
}


Trigger "GameOverCampFronterizo" [ Inactivo ]
(
  EstaPuebloConquistado("partos", "CARRHAE")
)
Do
{
  
  noResiste = TRUE;
  
  DestruirTrigger("GameOverCampFronterizo");
  DestruirTrigger("MandarCenturion");
  
}


//---------------------------------
Trigger "Has_Muerto" [Inactivo]
(
  DarUnidadesVivas("Jugador") == 0
)
Do
{ 
	hasMuerto = TRUE;
	
  ActivarTrigger("GameOver");
  DestruirTrigger("Has_Muerto");
}
*/


//--------------------------------------
Trigger "End" [ Activo ]  
(
  TRUE
)
Do
{
}
