Var
{	
  handle hEstrategia;
	handle hCivilizacionCPU;
	
	handle hEstrategiaAliados;
	handle hCivilizacionCPUAliados;
	
	handle hObjetivoPuebloEste;
	handle hObjetivoPuebloOeste;
	
	handle hAsaltoFuerte;
	handle hConstruccionPuente;
	handle hAtaqueLateral;
	handle hAlis;
		
	// Dificultad
	float fNivelDificultad;
	
	float fTropas;
	float fTropasFin;
	float fOleadasSlow;
  float fOleadas;
  	
	// Objetivos
	handle hObjDefensaFortaleza;
	handle hObjPetarEnemigos;
	handle hObjPublioVivo;
	handle hObjDumnorixVivo;
  
  bool bObjDefensaFortaleza      = FALSE;
  
  // briefing
  float fPuntoSincronia           = 0;
  handle hPuntoSincronia          = NULL;
  bool bBriefingEnded             = FALSE;
  
  //otros
  handle hTimerMision             = NULL;
  
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
   
  // adelante el briefing
  ActivarTrigger("Briefing");
  
}




//-------------------------------------
Trigger "Main2" [ Inactivo ]
(
  TRUE
)
Do
{  
  //Para que los 2 pueblos se vean del enemigo  
  IluminarZonaOnOff(8, 2, 43, 20, "enemigos", TRUE);
  IluminarZonaOnOff(8, 2, 17, 20, "enemigo", TRUE);
      
  IluminarZonaOnOff(8, 2, 43, 20, "enemigos", FALSE);
  IluminarZonaOnOff(8, 2, 17, 20, "enemigo", FALSE);
    
  // Restricciones de la mision
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GLADIADOR", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "PIQUERO_ELITE", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "HONDERO", "");
  
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_CAZADOR", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_GERMANA", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_ESPADON", "");
 
  
  // Objetivos de misión
  hObjDefensaFortaleza = CrearHandle("Bool");
  hObjPetarEnemigos = CrearHandle("Bool");
  hObjPublioVivo = CrearHandle("Bool");
  hObjDumnorixVivo = CrearHandle("Bool");

  AgregarObjetivoMision(hObjPublioVivo, "LTEXT_MISION7_OBJETIVO_00_TXT");
  AgregarObjetivoMision(hObjDumnorixVivo, "LTEXT_MISION7_OBJETIVO_01_TXT");
  AgregarObjetivoMision(hObjDefensaFortaleza, "LTEXT_MISION7_OBJETIVO_02_TXT");  
  
  // Comprobar el nivel de dificultad
  fNivelDificultad = DarDificultadMision();
  if ( fNivelDificultad == 1 )
  { 
    fTropas = 5;
    fTropasFin = 9;
    fOleadas = 135;
    fOleadasSlow = 85;
  }
  else
  if ( fNivelDificultad == 2 )
  {    
    fTropas = 6;
    fTropasFin = 12;
    fOleadas = 125;
    fOleadasSlow = 75;
  }
  else
  if ( fNivelDificultad == 3 )
  {
    fTropas = 8;
    fTropasFin = 15;
    fOleadas = 115;
    fOleadasSlow = 65;
  }
  else
  {
    fTropas = 10;
    fTropasFin = 7;
    fOleadas = 80;
    fOleadasSlow = 50;
    
    MensajeChat("Nivel de dificulatd desconocido, oiga");
  }
    
  // Estrategia del enemigo y del aliado
  hEstrategia = CrearEstrategiaScript();
  hCivilizacionCPU = DarCivilizacion("Nervios");
  AsignarEstrategia(hCivilizacionCPU, hEstrategia);		
  StartEstrategia(hEstrategia);
  
  //SetParamEstrategia(hEstrategia, "ParamsAIDistancia", "AtacarFortaleza");
  
  hEstrategiaAliados = CrearEstrategiaScript();
  hCivilizacionCPUAliados = DarCivilizacion("Aliados");
  AsignarEstrategia(hCivilizacionCPUAliados, hEstrategiaAliados);		
  StartEstrategia(hEstrategiaAliados);
  
  // La gestion de los pueblos enemigos
  hObjetivoPuebloEste              = CrearObjetivo(hEstrategia, "ConquistaPueblo2", "Campamento nervio este");
  AnyadirGrupoAObjetivo         (hObjetivoPuebloEste, "G_PUEBLO_ESTE");  
  AnyadirObjetivo               (hEstrategia,  hObjetivoPuebloEste);
  SetValue(hEstrategia, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  SetParamObjetivo              (hObjetivoPuebloEste, "NombreGrupoGenerado", "G_1");
  SetParamObjetivo(hObjetivoPuebloEste, "PuedePedirRefuerzos", FALSE);
  SetParamObjetivo(hObjetivoPuebloEste, "CenturionProhibidoAyudaCombate", TRUE);
  //SetDelayEntrenamientoTropasPueblo(hEstrategia, "Campamento nervio este", 120000);  
  
  hObjetivoPuebloOeste              = CrearObjetivo(hEstrategia, "ConquistaPueblo2", "Campamento nervio oeste");
  AnyadirGrupoAObjetivo         (hObjetivoPuebloOeste, "G_PUEBLO_OESTE");  
  AnyadirObjetivo               (hEstrategia,  hObjetivoPuebloOeste);
  //SetValue(hEstrategia, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  SetParamObjetivo              (hObjetivoPuebloOeste, "NombreGrupoGenerado", "G_1");
  SetParamObjetivo(hObjetivoPuebloOeste, "PuedePedirRefuerzos", FALSE);
  SetParamObjetivo(hObjetivoPuebloOeste, "CenturionProhibidoAyudaCombate", TRUE);
  //SetDelayEntrenamientoTropasPueblo(hEstrategia, "Campamento nervio oeste", 120000);  
   



  hAsaltoFuerte = CrearObjetivo(hEstrategia, "OleadasFortaleza", "Fuerte");
  
  // Le damos tropas iniciales
  AnyadirGrupoAObjetivo(hAsaltoFuerte, "G_1");
  
  // Que coja tropas de ambos pueblos
  SetParamObjetivo(hAsaltoFuerte, "ObjetivoAtracable", hObjetivoPuebloEste);
  SetParamObjetivo(hAsaltoFuerte, "ObjetivoAtracable", hObjetivoPuebloOeste);
  
  SetParamObjetivo(hAsaltoFuerte, "RobarTropasEducadamente", FALSE);
  
  SetParamObjetivo(hAsaltoFuerte, "Secuencial", TRUE);
  
  SetParamObjetivo(hAsaltoFuerte, "ResetComposicion", "AsaltoMuralla");
  SetParamObjetivo(hAsaltoFuerte, "AddComposicion", "AsaltoMuralla", "FORT_ESCALAS", 50, TRUE);
  SetParamObjetivo(hAsaltoFuerte, "AddComposicion", "AsaltoMuralla", "FORT_MELEE_PESADA", 10, FALSE);
  SetParamObjetivo(hAsaltoFuerte, "AddComposicion", "AsaltoMuralla", "FORT_PIQUEROS", 10, FALSE);
  SetParamObjetivo(hAsaltoFuerte, "AddComposicion", "AsaltoMuralla", "FORT_DISTANCIA", 30, FALSE);
  
  SetParamObjetivo(hAsaltoFuerte, "ResetComposicion", "AtaquePuerta");
  SetParamObjetivo(hAsaltoFuerte, "AddComposicion", "AtaquePuerta", "FORT_ARIETE", 1, TRUE);
  SetParamObjetivo(hAsaltoFuerte, "AddComposicion", "AtaquePuerta", "FORT_CATAPULTAS", 2, TRUE); 
  SetParamObjetivo(hAsaltoFuerte, "AddComposicion", "AtaquePuerta", "FORT_MELEE_PESADA", 2, FALSE);
  SetParamObjetivo(hAsaltoFuerte, "AddComposicion", "AtaquePuerta", "FORT_DISTANCIA", 3, FALSE);
  
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AsaltoMuralla",  fTropas, fTropas, fOleadas, fOleadas, FALSE, 39, 36);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AtaquePuerta",  fTropas, fTropas, fOleadasSlow, fOleadasSlow, FALSE, 39, 36);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AtaquePuerta",  fTropas, fTropas, fOleadas, fOleadas, FALSE, 36, 12);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoMuralla", fTropas, fTropas, fOleadas, fOleadas, FALSE, 39, 36);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AsaltoMuralla",  fTropas, fTropas, fOleadasSlow, fOleadasSlow, FALSE, 36, 12);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AtaquePuerta",  fTropas, fTropas, fOleadas, fOleadas, FALSE, 36, 12);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoMuralla", fTropas, fTropas, fOleadasSlow, fOleadasSlow, FALSE, 36, 12);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoRaso",  fTropas, fTropas, fOleadasSlow, fOleadasSlow, FALSE, 39, 36);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AsaltoMuralla",  fTropas, fTropas, fOleadas, fOleadas, FALSE, 80, 46); // ojo con esta posicion 
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AtaquePuerta",  fTropas, fTropas, fOleadasSlow, fOleadasSlow, FALSE, 39, 36);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AtaquePuerta",  fTropas, fTropas, fOleadas, fOleadas, FALSE, 36, 12);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoMuralla", fTropas, fTropas, fOleadas, fOleadas, FALSE, 80, 46); // ojo con esta posicion 
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AsaltoMuralla",  fTropas, fTropas, fOleadasSlow, fOleadasSlow, FALSE, 36, 12);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AtaquePuerta",  fTropas, fTropas, fOleadas, fOleadas, FALSE, 36, 12);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoMuralla", fTropas, fTropas, fOleadasSlow, fOleadasSlow, FALSE, 36, 12);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoRaso",  fTropas, fTropas, fOleadasSlow, fOleadasSlow, FALSE, 39, 36);

  AnyadirObjetivo(hEstrategia, hAsaltoFuerte);

  // Quiero que la primera oleada salga inmediatamente. OJO!, siempre poner despues de 'AnyadirObjetivo'
  SetParamObjetivo(hAsaltoFuerte, "RetardoSiguiente", 30);
  
	// Activacion de triggers
	ActivarTrigger("ConstruccionPuente");
	ActivarTrigger("FortalezaDefendida");
	ActivarTrigger("ExitoAlternativo");
	ActivarTrigger("OleadasMortales");
	ActivarTrigger("GameOver");
	ActivarTrigger("MensajesTiempo");
	ActivarTrigger("AtaqueLateral");
	
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
  ActivarPresentacion(TRUE, "LTEXT_MISION7_PRESENTACION_TITULO",
                            "LTEXT_MISION7_PRESENTACION_LUGAR", hPresentacion);

  // camara a donde debe empezar
  EncolarColocarYMirarPunto("BRIEFING_1b");
  EjecutarOrdenesCamara();
  
  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));
 
  ActivarPresentacion(FALSE, "", "", NULL);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);
  EncolarColocarYMirarPunto("BRIEFING_1b");
  EncolarPausaCamara(2000);
  EncolaTrayectoriaCamara("BRIEFING_2b", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  IntroducirLocucion("07N0", "LTEXT_MISION7_LOCUCION_00_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();        

  EncolarColocarYMirarPunto("BRIEFING_3b");
  EncolarPausaCamara(1000);
  EncolaTrayectoriaCamara("BRIEFING_4b", FALSE, FALSE, 0, 0);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("07N1", "LTEXT_MISION7_LOCUCION_01_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();        

  EncolarPausaCamara(3000);
  EncolarColocarYMirarPunto("BRIEFING_5b");
  EncolarPausaCamara(500);
  EncolaTrayectoriaCamara("BRIEFING_6b", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  EncolarColocarYMirarPunto("BRIEFING_7b");
  EncolarPausaCamara(3000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("07N2", "LTEXT_MISION7_LOCUCION_02_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();        

  EncolarColocarYMirarPunto("BRIEFING_8b");
  EncolarPausaCamara(3000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("07N3", "LTEXT_MISION7_LOCUCION_03_TXT", 4000, 600, 100);
  IntroducirPuntoSincronia();        
  
  IntroducirPonerModoJuegoCamara(TRUE);

  // si no se ha interrumpido
  if ( !HandleDisparado(hEscape) )
  {

    // efectos especiales
    ActivarTrigger("EfectosBriefing");
    
    // iluminación
    IluminarZonaOnOff(28, 2, 14, 30, "malos", TRUE);

    // acción
    EjecutarOrdenesCamara();

    // final  
    PonerHandleBoolACamara(hCamaraEnd);
    WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
    
    // fuera iluminación
    IluminarZonaOnOff(28, 2, 14, 30, "malos", FALSE);
    
  }
  
  // fuera órdenes de cámara
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



//-------------------------------------------
Trigger "MensajesTiempo" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{
  // timer de la mision
  hTimerMision = CrearTimer(1173000);// 19 min y 33 sec
   
  MensajeLocucionado("07N5","LTEXT_MISION7_MENSAJE_01_TXT");   // 20 mins
  
  hTimer = CrearTimer(300000);
  Wait(hTimer);

  MensajeLocucionado("07N6","LTEXT_MISION7_MENSAJE_02_TXT");   // 15 mins

  hTimer = CrearTimer(300000);
  Wait(hTimer);

  if ( DarNumUnidadesEnZona("Romanos", "Z_NOJUGADOR") == 0 )
  {
  
    CrearTropa("Nervios", "GALO_CENTURION", 1, 3, 13, 45);// nº unidades, x, y, orientacion respectivamente
    CrearTropa("Nervios", "GALO_PESADA", 16, 3, 13, 45);  
    CrearTropa("Nervios", "ESCALA_BARBARA", 1, 3, 13.2, 45);  
    CrearTropa("Nervios", "ESCALA_BARBARA", 1, 3, 13.4, 45);
    CrearTropa("Nervios", "ESCALA_BARBARA", 1, 3, 13.6, 45);
    CrearTropa("Nervios", "ESCALA_BARBARA", 1, 3, 13.8, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 3, 14, 45);
    CrearTropa("Nervios", "GALO_PESADA", 16, 3, 15, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 3, 16, 45);
    CrearTropa("Nervios", "GALO_PESADA", 16, 3, 17, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 3, 18, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 3, 40, 45);
    CrearTropa("Nervios", "ARIETE_BARBARO", 1, 3, 41, 45);//CrearTropa("Nervios", "GALO_LIGERA", 16, 3, 41, 45);
    CrearTropa("Nervios", "GALO_CABALLERIA_PESADA", 12, 3, 42, 45);
    CrearTropa("Nervios", "GALO_PESADA", 16, 3, 43, 45);
    CrearTropa("Nervios", "GALO_PESADA", 16, 3, 44, 45);
    CrearTropa("Nervios", "GALO_MEDICO", 1, 3, 45, 45);
    
    CrearTropa("Nervios", "GALO_PESADA", 16, 14, 30, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 17, 26, 45);
    CrearTropa("Nervios", "GALO_CABALLERIA_PESADA", 12, 21, 24, 45);
    CrearTropa("Nervios", "GALO_CABALLERIA_PESADA", 16, 26, 23, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 19, 31, 45);
    CrearTropa("Nervios", "GALO_CABALLERIA_PESADA", 12, 15, 34, 45);
    
    AnyadirTropasCivilizacionAObjetivo(hAsaltoFuerte, "Nervios");
  }

  MensajeLocucionado("07N7","LTEXT_MISION7_MENSAJE_03_TXT");   // 10 mins

  hTimer = CrearTimer(300000);
  Wait(hTimer);
      
  MensajeLocucionado("07N8","LTEXT_MISION7_MENSAJE_04_TXT");   // 5 mins
  /*
  if ( (DarNumUnidadesEnZona("Romanos", "Z_NOJUGADOR") == 0))
  {
  
    CrearTropa("Nervios", "GALO_CENTURION", 1, 3, 13, 45);// nº unidades, x, y, orientacion respectivamente
    CrearTropa("Nervios", "GALO_PESADA", 16, 3, 13, 45);  
    CrearTropa("Nervios", "ESCALA_BARBARA", 1, 3, 13.2, 45);  
    CrearTropa("Nervios", "ESCALA_BARBARA", 1, 3, 13.4, 45);
    CrearTropa("Nervios", "ESCALA_BARBARA", 1, 3, 13.6, 45);
    CrearTropa("Nervios", "ESCALA_BARBARA", 1, 3, 13.8, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 3, 14, 45);
    CrearTropa("Nervios", "GALO_PESADA", 16, 3, 15, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 3, 16, 45);
    CrearTropa("Nervios", "GALO_PESADA", 16, 3, 17, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 3, 18, 45);
    CrearTropa("Nervios", "BALLESTA_BARBARA", 1, 3, 40, 45);
    CrearTropa("Nervios", "BALLESTA_BARBARA", 1, 3, 41, 45);
    CrearTropa("Nervios", "GALO_CABALLERIA_PESADA", 12, 3, 42, 45);
    CrearTropa("Nervios", "GALO_CABALLERIA_ARQUERA", 16, 3, 43, 45);
    CrearTropa("Nervios", "GALO_LIGERA", 16, 3, 44, 45);
    CrearTropa("Nervios", "GALO_MEDICO", 1, 3, 45, 45);
    
    CrearTropa("Nervios", "GALO_PESADA", 16, 14, 30, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 17, 26, 45);
    CrearTropa("Nervios", "GALO_CABALLERIA_PESADA", 12, 21, 24, 45);
    CrearTropa("Nervios", "GALO_CABALLERIA_ARQUERA", 16, 26, 23, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 19, 31, 45);
    CrearTropa("Nervios", "GALO_CABALLERIA_PESADA", 12, 15, 34, 45);
    
    AnyadirTropasCivilizacionAObjetivo(hAsaltoFuerte, "Nervios");
  }
  */
  hTimer = CrearTimer(60000);
  Wait(hTimer);
  
  MensajeLocucionado("07N9","LTEXT_MISION7_MENSAJE_05_TXT");   // 4 mins

  hTimer = CrearTimer(60000);
  Wait(hTimer);

  MensajeLocucionado("07NA","LTEXT_MISION7_MENSAJE_06_TXT");   // 3 mins
/*
    if ( (DarNumUnidadesEnZona("Romanos", "Z_NOJUGADOR") == 0) && (fNivelDificultad == 2))  
  {
    CrearTropa("Nervios", "GALO_CENTURION", 1, 3, 13, 45);// nº unidades, x, y, orientacion respectivamente
    CrearTropa("Nervios", "GALO_PESADA", 16, 3, 13, 45);  
    CrearTropa("Nervios", "ESCALA_BARBARA", 1, 3, 13.2, 45);  
    CrearTropa("Nervios", "ESCALA_BARBARA", 1, 3, 13.4, 45);
    CrearTropa("Nervios", "ESCALA_BARBARA", 1, 3, 13.6, 45);
    CrearTropa("Nervios", "ESCALA_BARBARA", 1, 3, 13.8, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 3, 14, 45);
    CrearTropa("Nervios", "GALO_PESADA", 16, 3, 15, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 3, 16, 45);
    CrearTropa("Nervios", "GALO_PESADA", 16, 3, 17, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 3, 18, 45);
    CrearTropa("Nervios", "CATAPULTA_BARBARA", 1, 3, 40, 45);
    CrearTropa("Nervios", "CATAPULTA_BARBARA", 1, 3, 41, 45);
    CrearTropa("Nervios", "GALO_CABALLERIA_PESADA", 12, 3, 42, 45);
    CrearTropa("Nervios", "GALO_CABALLERIA_ARQUERA", 16, 3, 43, 45);
    CrearTropa("Nervios", "ARIETE_BARBARO", 1, 3, 44, 45);
    CrearTropa("Nervios", "GALO_MEDICO", 1, 3, 45, 45);
    
    CrearTropa("Nervios", "GALO_PESADA", 16, 14, 30, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 17, 26, 45);
    CrearTropa("Nervios", "GALO_CABALLERIA_PESADA", 12, 21, 24, 45);
    CrearTropa("Nervios", "GALO_CABALLERIA_ARQUERA", 16, 26, 23, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 19, 31, 45);
    CrearTropa("Nervios", "GALO_CABALLERIA_PESADA", 12, 15, 34, 45);
    
  }
    
    if ( (DarNumUnidadesEnZona("Romanos", "Z_NOJUGADOR") == 0) && (fNivelDificultad == 1))    
  {
    //CrearTropa("Nervios", "GALO_CENTURION", 1, 3, 13, 45);// nº unidades, x, y, orientacion respectivamente
    //CrearTropa("Nervios", "GALO_PESADA", 16, 3, 13, 45);  
    CrearTropa("Nervios", "ESCALA_BARBARA", 1, 3, 13.2, 45);  
    CrearTropa("Nervios", "ESCALA_BARBARA", 1, 3, 13.4, 45);
    CrearTropa("Nervios", "ESCALA_BARBARA", 1, 3, 13.6, 45);
    CrearTropa("Nervios", "ESCALA_BARBARA", 1, 3, 13.8, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 3, 14, 45);
    CrearTropa("Nervios", "GALO_PESADA", 16, 3, 15, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 3, 16, 45);
    CrearTropa("Nervios", "GALO_PESADA", 16, 3, 17, 45);
    //CrearTropa("Nervios", "GALO_ARQUERO", 16, 3, 18, 45);
    CrearTropa("Nervios", "CATAPULTA_BARBARA", 1, 3, 40, 45);
    //CrearTropa("Nervios", "CATAPULTA_BARBARA", 1, 3, 41, 45);
    //CrearTropa("Nervios", "GALO_CABALLERIA_PESADA", 12, 3, 42, 45);
    CrearTropa("Nervios", "GALO_CABALLERIA_ARQUERA", 16, 3, 43, 45);
    CrearTropa("Nervios", "ARIETE_BARBARO", 1, 3, 44, 45);
    CrearTropa("Nervios", "GALO_MEDICO", 1, 3, 45, 45);
    
    //CrearTropa("Nervios", "GALO_PESADA", 16, 14, 30, 45);
    //CrearTropa("Nervios", "GALO_ARQUERO", 16, 17, 26, 45);
    CrearTropa("Nervios", "GALO_CABALLERIA_PESADA", 12, 21, 24, 45);
    //CrearTropa("Nervios", "GALO_CABALLERIA_ARQUERA", 16, 26, 23, 45);
    CrearTropa("Nervios", "GALO_ARQUERO", 16, 19, 31, 45);
    //CrearTropa("Nervios", "GALO_CABALLERIA_PESADA", 12, 15, 34, 45);
  }

  AnyadirTropasCivilizacionAObjetivo(hAsaltoFuerte, "Nervios");
*/
  hTimer = CrearTimer(60000);
  Wait(hTimer);

  MensajeLocucionado("07NB","LTEXT_MISION7_MENSAJE_07_TXT");   // 2 mins

  hTimer = CrearTimer(60000);
  Wait(hTimer);
  
  MensajeLocucionado("07NC","LTEXT_MISION7_MENSAJE_08_TXT");   // 1 min
  
  DestruirTrigger("MensajesTiempo");

}



//------------------------------------------
Trigger "ConstruccionPuente" [Inactivo]
(
	TRUE
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(180000);// 3 min
  Wait(hTimer);

	hConstruccionPuente = CrearObjetivo(hEstrategia, "PuentesRhin", "PuenteCons");
  AnyadirGrupoAObjetivo(hConstruccionPuente, "G_PUENTE");
  //SetParamObjetivo(hConstruccionPuente, "GrupoPrioritario", "G_1");
  AnyadirObjetivo(hEstrategia, hConstruccionPuente);
  
  ActivarTrigger("ReconstruccionPuente");
  ActivarTrigger("ChequeoPuente");
  
	DestruirTrigger("ConstruccionPuente");
}
 
//--------------------------
Trigger "ReconstruccionPuente" [Inactivo]
(
	!EstaPuenteConstruido("PuenteCons")
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(120000);// 2 min
  Wait(hTimer);
	
	DisposeHandle(&hConstruccionPuente);
	
	hConstruccionPuente = CrearObjetivo(hEstrategia, "PuentesRhin", "PuenteCons");
  AnyadirGrupoAObjetivo(hConstruccionPuente, "G_PUENTE");
  SetParamObjetivo(hConstruccionPuente, "GrupoPrioritario", "G_1");
  AnyadirObjetivo(hEstrategia, hConstruccionPuente);
  
  ActivarTrigger("ChequeoPuente");
  
	DesactivarTrigger("ReconstruccionPuente");
}
 
 //---------------------------------
 Trigger "ChequeoPuente" [Inactivo]
(
	EstaPuenteConstruido("PuenteCons")
)
Do
{

	DisposeHandle(&hConstruccionPuente);
	AnyadirGrupoAObjetivo(hAsaltoFuerte, "G_PUENTE");
	
  ActivarTrigger("ReconstruccionPuente");
  
	DesactivarTrigger("ChequeoPuente");
}
 
//------------------------------------------
Trigger "OleadasMortales" [Inactivo]
(
	TRUE 
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(1005000);// 16 min y 45 sec
  Wait(hTimer);
	
	SetParamObjetivo(hAsaltoFuerte, "PuedoConstruir", FALSE);
  	
	//Resetlistaoleadas 
	SetParamObjetivo(hAsaltoFuerte, "ResetOleadas");
	SetParamObjetivo(hAsaltoFuerte, "RetardoSiguiente", 0);
	SetParamObjetivo(hAsaltoFuerte, "Oleada", "AsaltoMuralla",  fTropasFin, fTropasFin, 45, 60, FALSE, 36, 12);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoMuralla",  fTropasFin, fTropasFin, 45, 60, FALSE, 39, 36);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AtaquePuerta",  fTropasFin, fTropasFin, 45, 60, FALSE, 36, 12);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoMuralla", fTropasFin, fTropasFin, 45, 60, FALSE, 39, 36);
    
	DestruirTrigger("OleadasMortales");
}




////////////////////////////////////////////////////////////////////
// Finales de la misión
////////////////////////////////////////////////////////////////////

//------------------------------------------
Trigger "FortalezaDefendida" [Inactivo]
(
	TRUE//(DarPotenciaCivilizacion("Nervios") < 20000) 
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
  
  Wait(hTimerMision);
  
  if ( DarNumUnidadesEnZona("Romanos", "Z_NOJUGADOR") == 0 )
  {
      
    CrearTropa("Aliados", "CENTURION", 1, 3, 13, 45, "CENTU_REFUERZOS", "refuerzos");    // nº unidades, x, y, orientacion respectivamente
    CrearTropa("Aliados", "INFANTERIA_PESADA", 30, 3, 13, 45, "PESADA_1", "refuerzos");  
    CrearTropa("Aliados", "INFANTERIA_PESADA", 30, 3, 14, 45, "PESADA_2", "refuerzos");
    CrearTropa("Aliados", "INFANTERIA_PESADA", 30, 3, 15, 45, "", "refuerzos");
    CrearTropa("Aliados", "ARQUERO", 30, 3, 16, 45, "", "refuerzos");
    CrearTropa("Aliados", "INFANTERIA_PESADA", 30, 3, 17, 45, "", "refuerzos");
    CrearTropa("Aliados", "ARQUERO", 30, 3, 18, 45, "", "refuerzos");
    CrearTropa("Aliados", "CABALLERIA_PESADA", 12, 3, 40, 45, "", "refuerzos");
    CrearTropa("Aliados", "INFANTERIA_PESADA", 16, 3, 41, 45, "", "refuerzos");
    CrearTropa("Aliados", "CABALLERIA_PESADA", 12, 3, 42, 45, "", "refuerzos");
    CrearTropa("Aliados", "INFANTERIA_PESADA", 16, 3, 43, 45, "", "refuerzos");
    CrearTropa("Aliados", "INFANTERIA_PESADA", 12, 3, 44, 45, "", "refuerzos");
    CrearTropa("Aliados", "MEDICO", 1, 3, 45, 45, "", "refuerzos");
  
  	SetMoverFisicoTropa("CENTU_REFUERZOS", TRUE);
  	SetMoverFisicoTropa("PESADA_1", TRUE);
  	SetMoverFisicoTropa("PESADA_2", TRUE);
    
  	TropaSigueRutaPredefinida("CENTU_REFUERZOS", "R_CENTURION");
  	TropaSigueRutaPredefinida("PESADA_1", "R_PESADA1");
  	TropaSigueRutaPredefinida("PESADA_2", "R_PESADA2");
  	
  	hTimer = CrearTimer(15000);
    Wait(hTimer);
  
    ///////////////////////////////////////////////////////////////
    // cinematica de moda
    
    // luces
    IluminarZonaOnOff(7, 0, 26, 15, "centu", TRUE);
    
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
    
    EncolaTrayectoriaCamara("EVENTO_1", TRUE, FALSE, 2, 0);
    IntroducirPuntoSincronia();        
  
    IntroducirLocucion("07H0", "LTEXT_MISION7_EVENTO1_00_TXT", 4000, 600, 100);
    IntroducirLocucion("", "", 100, 0, 0);
    IntroducirPuntoSincronia();        
  
    EncolaTrayectoriaCamara("EVENTO_1", FALSE, TRUE, 0, 2);
    IntroducirPuntoSincronia();        
  
    IntroducirPonerModoJuegoCamara(TRUE);
  
    // acción
    EjecutarOrdenesCamara();
  
    // final  
    PonerHandleBoolACamara(hCamaraEnd);
    WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
      
    // fuera iluminación
    IluminarZonaOnOff(7, 0, 26, 15, "centu", FALSE);
    
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
  
    ////////////////////////////////////////////////////////////////
  
  	SetMoverFisicoTropa("CENTU_REFUERZOS", FALSE);
  	SetMoverFisicoTropa("PESADA_1", FALSE);
  	SetMoverFisicoTropa("PESADA_2", FALSE);
  
    hAlis = CrearObjetivo(hEstrategiaAliados, "DefenderPosicion", 16, 30);
  	AnyadirGrupoAObjetivo(hAlis, "refuerzos");
  	AnyadirObjetivo(hEstrategiaAliados, hAlis);
  	
  	CrearAlianzaPorNombre("Romanos", "Aliados");
  	
  }
  
  ActivarTrigger("FortalezaTotalDefendida"); 
  DestruirTrigger("FortalezaDefendida");
	
}

//------------------------------------------
Trigger "FortalezaTotalDefendida" [Inactivo]
(
	TRUE 
)
Var
{
  handle hTimer;
}
Do
{

  if ((fNivelDificultad == 1 ) || ( fNivelDificultad == 2 ))
  { 
    
    hTimer = CrearTimer(12000);// 12 sec
    Wait(hTimer);
    
    IndicarObjetivoCumplido(hObjDefensaFortaleza);
 	  IndicarObjetivoCumplido(hObjPublioVivo);
  	IndicarObjetivoCumplido(hObjDumnorixVivo);
	  
	  DestruirTrigger("GameOver");
	  
    FinalizarMision(TRUE);
        
  }
  else
  if ( fNivelDificultad == 3 )
  {
    MensajeLocucionado("07N4","LTEXT_MISION7_MENSAJE_00_TXT");
	  AvisoCivilizacion("Romanos", 8, 17);
	  AvisoCivilizacion("Romanos", 9, 44);
	  
	  AgregarObjetivoMision(hObjPetarEnemigos, "LTEXT_MISION7_OBJETIVO_03_TXT");
	  
	}
	else
	{
	  MensajeChat("CHUNGO CON NIVELES DE DIFICULTAD: ACABANDO MISION");
	  FinalizarMision(TRUE);
	}
		
	DestruirTrigger("FortalezaTotalDefendida");
}

//------------------------------------------
Trigger "ExitoAlternativo" [Inactivo]
(
	CivilizacionEstaKO("Nervios") ||
  (DarNumPueblosConqDestr("Nervios", "Campamento nervio este", "Campamento nervio oeste", TRUE, FALSE) == 0)
) 
Do
{
  DestruirTrigger("FortalezaTotalDefendida");
  DestruirTrigger("FortalezaDefendida");
  
	IndicarObjetivoCumplido(hObjDefensaFortaleza);
	IndicarObjetivoCumplido(hObjPublioVivo);
	IndicarObjetivoCumplido(hObjDumnorixVivo);
	
	if ( fNivelDificultad == 3 )
  {
	  IndicarObjetivoCumplido(hObjPetarEnemigos);	
	}
	
  FinalizarMision(TRUE);
		
	DestruirTrigger("ExitoAlternativo");
}

//------------------------------------------
Trigger "GameOver" [Inactivo]
(
	EstructuraDestruida("Barracon Romano") ||
	CivilizacionEstaKO("Romanos") ||
	!EstaTropaViva("PUBLIO") ||
	!EstaTropaViva("DUMNORIX")
) 
Do
{
  
  DestruirTrigger("FortalezaTotalDefendida");
  
	IndicarObjetivoFracasado(hObjDefensaFortaleza);
	
	if ( !EstaTropaViva("PUBLIO") )
	{
	  IndicarObjetivoFracasado(hObjPublioVivo);
	}

	if ( !EstaTropaViva("DUMNORIX") )
	{
	  IndicarObjetivoFracasado(hObjDumnorixVivo);
	}
	
  FinalizarMision(FALSE);
		
	DestruirTrigger("GameOver");
	
}

//Unas caballerias que atacan por el lateral olvidado
//------------------------------------------
Trigger "AtaqueLateral" [Inactivo]
(
	TRUE
) 
Var
{
  handle hTimer; 
}
Do
{
  hTimer = CrearTimer(420000);// 7 min
  Wait(hTimer); 
  
  hAtaqueLateral = CrearObjetivo(hEstrategia, "AtacarPunto", 80, 46);
  AnyadirGrupoAObjetivo(hAtaqueLateral, "G_LATERAL");
  SetParamObjetivo(hAtaqueLateral, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategia, hAtaqueLateral);
  	
	DestruirTrigger("AtaqueLateral");
	
}

//---------------------------
Trigger "End" [ Activo ]  
(
  TRUE
)
Do
{
}