Var
{
  handle hEstrategia;
	handle hCivilizacion;
	
	handle hEstrategiaAliados;
	handle hCivilizacionAliados;
	
	handle hDefensaCampamento1;
	handle hDefensaCampamento2;
	handle hDefensaCampamento3;
	
	handle hG_A;
	handle hG_B;
	handle hG_C;
	handle hG_D;
	
	handle hMensaka;
	
	handle hG_1;
	handle hG_2;
	handle hG_3;
	handle hG_4;
	handle hG_5;
	handle hG_6;
	handle hG_INI;
	handle hG_RESISTANCE;
	
	handle hAsaltoFuerte;
	
	handle hAtaquePuerto;
	
	bool bCambio                = FALSE;
	bool bTimeUp                = FALSE;
	
	bool bA                     = FALSE;
	bool bB                     = FALSE;
	bool bC                     = FALSE;
	bool bD                     = FALSE;
	
	
	// Dificultad
	float fNivelDificultad;
	
	float fTropas;
  float fTropasFin;
  float fOleadas;
  float fOleadasMax;
  float fOleadasSlow;
  
  float fTimeBurn;
  float fTimeArrive;
  
  float fPuertoMin;
  float fPuertoMax;
  
  // Objetivos
	handle hObjDefensaFortaleza;
	handle hObjIrAlPuerto;
	handle hObjQuemarGaleras;
	
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


//-----------------------------------
Trigger "Main2" [ Inactivo ]  
(
  TRUE
)
Var
{
  handle hTimer; 
}
Do
{

	//Objetivos
	hObjDefensaFortaleza = CrearHandle("Bool");
  AgregarObjetivoMision(hObjDefensaFortaleza, "LTEXT_MISION22_OBJETIVO_00_TXT");
	
	// espera siniestra para evitar jaleos con el briefing
	hTimer = CrearTimer(4000);
	Wait(hTimer);
	
	// Comprobar el nivel de dificultad
  fNivelDificultad = DarDificultadMision();
  if ( fNivelDificultad == 1 )
  { 
    fTropas = 7;
    fTropasFin = 14;
    fOleadas = 100;
    fOleadasMax = 120;
    fOleadasSlow = 80;
    
    fPuertoMin = 15000;
    fPuertoMax = 17000;
    
    fTimeBurn = 720000; // 12 min
    fTimeArrive = 480000; // 8 min
  }
  else
  if ( fNivelDificultad == 2 )
  {    
    fTropas = 8;
    fTropasFin = 16;
    fOleadas = 80;
    fOleadasMax = 100;
    fOleadasSlow = 50;
    
    fPuertoMin = 17000;
    fPuertoMax = 19000;
    
    fTimeBurn = 600000; // 10 min
    fTimeArrive = 420000; // 7 min
  }
  else
  if ( fNivelDificultad == 3 )
  {
    fTropas = 10;
    fTropasFin = 20;
    fOleadas = 60;
    fOleadasMax = 80;
    fOleadasSlow = 30;
    
    fPuertoMin = 19000;
    fPuertoMax = 21000;
    
    fTimeBurn = 480000; // 8 min
    fTimeArrive = 360000; // 6 min
  }
  else
  {
    fTropas = 10;
    fTropasFin = 7;
    fOleadas = 60;
    fOleadasMax = 80;
    fOleadasSlow = 30;
    
    fPuertoMin = 480000;
    fPuertoMax = 360000;
    
    fTimeBurn = 360000; // 6 min
    fTimeArrive = 300000; // 5 min
    
    MensajeChat("Nivel de dificulatd desconocido, oiga");
  }
		
	//La estrategia de la CPU
  hEstrategia = CrearEstrategiaScript();
  hCivilizacion = DarCivilizacion("MALOS");
  AsignarEstrategia(hCivilizacion, hEstrategia);		
  StartEstrategia(hEstrategia);
  
  hEstrategiaAliados = CrearEstrategiaScript();
  hCivilizacionAliados = DarCivilizacion("ALIADOS");
  AsignarEstrategia(hCivilizacionAliados, hEstrategiaAliados);		
  StartEstrategia(hEstrategiaAliados);
    
  InteractuarTropaConEnte("arqueros", "TORRE");
  InteractuarTropaConEnte("nubio1", "torre1");
  InteractuarTropaConEnte("nubio2", "torre2");
  InteractuarTropaConEnte("nubio3", "torre3");
  InteractuarTropaConEnte("nubio4", "torre4");
  InteractuarTropaConEnte("nubio5", "torre5");
  
  
  // El asalto a la fortaleza
  hAsaltoFuerte = CrearObjetivo(hEstrategia, "OleadasFortaleza", "ALEJANDRIA_FORTRESS");
  AnyadirGrupoAObjetivo(hAsaltoFuerte, "G_FORT");
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
  
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AsaltoMuralla",  fTropas, fTropas, fOleadas, fOleadasMax, FALSE, 39, 155);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AtaquePuerta",  fTropas, fTropas, fOleadasSlow, fOleadasSlow, FALSE, 28, 37);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AtaquePuerta",  fTropas, fTropas, fOleadas, fOleadasMax, FALSE, 94, 121);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoMuralla", fTropas, fTropas, fOleadas, fOleadasMax, FALSE, 74, 148);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AsaltoMuralla",  fTropas, fTropas, fOleadasSlow, fOleadasSlow, FALSE, 28, 37);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AtaquePuerta",  fTropas, fTropas, fOleadas, fOleadasMax, FALSE, 94, 121);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoMuralla", fTropas, fTropas, fOleadasSlow, fOleadasSlow, FALSE, 39, 155);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoRaso",  fTropas, fTropas, fOleadasSlow, fOleadasSlow, FALSE, 28, 37);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AsaltoMuralla",  fTropas, fTropas, fOleadas, fOleadasMax, FALSE, 94, 121);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AtaquePuerta",  fTropas, fTropas, fOleadasSlow, fOleadasSlow, FALSE, 39, 155);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AtaquePuerta",  fTropas, fTropas, fOleadas, fOleadasMax, FALSE, 28, 37);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoMuralla", fTropas, fTropas, fOleadas, fOleadasMax, FALSE, 94, 121);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AsaltoMuralla",  fTropas, fTropas, fOleadasSlow, fOleadasSlow, FALSE, 74, 148);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AtaquePuerta",  fTropas, fTropas, fOleadas, fOleadasMax, FALSE, 28, 37);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoMuralla", fTropas, fTropas, fOleadasSlow, fOleadasSlow, FALSE, 94, 121);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoRaso",  fTropas, fTropas, fOleadasSlow, fOleadasSlow, FALSE, 74, 148);
  AnyadirObjetivo(hEstrategia, hAsaltoFuerte);
  
  //El objetivo de ataque al puerto
  hAtaquePuerto = CrearObjetivo(hEstrategia, "AtaqueOleadasPeriodicas", 12000, 12000, 240, 360);
  AnyadirGrupoAObjetivo(hAtaquePuerto, "G_PUERTO"); 
  AnyadirObjetivo(hEstrategia,  hAtaquePuerto);
  SetParamObjetivo(hAtaquePuerto, "PosicionAtaque", 167, 35);
  SetParamObjetivo(hAtaquePuerto, "PosicionSiguiente", 137, 26);
  SetParamObjetivo(hAtaquePuerto, "PosicionSiguiente", 153, 17);
  SetParamObjetivo(hAtaquePuerto, "PosicionSiguiente", 117, 26);
  SetParamObjetivo(hAtaquePuerto, "PosicionSiguiente", 147, 39);
  SetParamObjetivo(hAtaquePuerto, "RetardoSiguiente", 120);
  
  //Quiero que la primera oleada salga inmediatamente. OJO!, siempre poner despues de 'AnyadirObjetivo'
  SetParamObjetivo(hAsaltoFuerte, "RetardoSiguiente", 30);
    
  //Grupos enemigos que mantienen la posicion
  hG_1 = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hG_1, "G_1");
	SetParamObjetivo(hG_1, "Tactica", "ActitudBatallon", "Defensiva");
	AnyadirObjetivo(hEstrategia, hG_1);
	
	hG_2 = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hG_2, "G_2");
	SetParamObjetivo(hG_2, "Tactica", "ActitudBatallon", "Defensiva");
	AnyadirObjetivo(hEstrategia, hG_2);
	
	hG_3 = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hG_3, "G_3");
	SetParamObjetivo(hG_3, "Tactica", "ActitudBatallon", "Defensiva");
	AnyadirObjetivo(hEstrategia, hG_3);
	
	hG_4 = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hG_4, "G_4");
	//SetParamObjetivo(hG_4, "Tactica", "ActitudBatallon", "Defensiva");
	AnyadirObjetivo(hEstrategia, hG_4);
	
	hG_5 = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hG_5, "G_5");
	//SetParamObjetivo(hG_5, "Tactica", "ActitudBatallon", "Defensiva");
	AnyadirObjetivo(hEstrategia, hG_5);
	
	hG_6 = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hG_6, "G_6");
	//SetParamObjetivo(hG_6, "Tactica", "ActitudBatallon", "Defensiva");
	AnyadirObjetivo(hEstrategia, hG_6);
	
	hG_INI = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hG_INI, "G_INI");
	//SetParamObjetivo(hG_INI, "Tactica", "ActitudBatallon", "Defensiva");
	AnyadirObjetivo(hEstrategia, hG_INI);
	
	hG_RESISTANCE = CrearObjetivo(hEstrategia, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hG_RESISTANCE, "G_RESISTANCE");
	//SetParamObjetivo(hG_RESISTANCE, "Tactica", "ActitudBatallon", "Defensiva");
	SetParamObjetivo(hG_RESISTANCE, "Tactica", "AtacarCorriendo", TRUE);
	AnyadirObjetivo(hEstrategia, hG_RESISTANCE);
	
	//Los grupos de aliados que mantienen la posicion
  hG_A = CrearObjetivo(hEstrategiaAliados, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hG_A, "G_A");
	SetParamObjetivo(hG_A, "Tactica", "ActitudBatallon", "Defensiva");
	AnyadirObjetivo(hEstrategiaAliados, hG_A);
	
	hG_B = CrearObjetivo(hEstrategiaAliados, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hG_B, "G_B");
	SetParamObjetivo(hG_B, "Tactica", "ActitudBatallon", "Defensiva");
	AnyadirObjetivo(hEstrategiaAliados, hG_B);
	
	hG_C = CrearObjetivo(hEstrategiaAliados, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hG_C, "G_C");
	SetParamObjetivo(hG_C, "Tactica", "ActitudBatallon", "Defensiva");
	AnyadirObjetivo(hEstrategiaAliados, hG_C);
	
	hG_D= CrearObjetivo(hEstrategiaAliados, "DefenderPosicion");
	AnyadirGrupoAObjetivo(hG_D, "G_D");
	SetParamObjetivo(hG_D, "Tactica", "ActitudBatallon", "Defensiva");
	AnyadirObjetivo(hEstrategiaAliados, hG_D);
	
	//La gestion de los pueblos enemigos
  hDefensaCampamento1= CrearObjetivo(hEstrategia, "ConquistaPueblo2", "campamento1");
  AnyadirGrupoAObjetivo(hDefensaCampamento1, "G_DEFCAMPAMENTO1"); 
  SetParamObjetivo(hDefensaCampamento1, "DistribuirTropas", 30, hAsaltoFuerte, 60, hAtaquePuerto, 10);
  //SetParamObjetivo(hDefensaCampamento1 , "NombreGrupoGenerado", "G_DEFCAMPAMENTO1");
  SetParamObjetivo(hDefensaCampamento1 , "PuedePedirRefuerzos", FALSE);
  SetParamObjetivo(hDefensaCampamento1, "POTMIN_DEFENSA_PUEBLO", 20000);
  AnyadirObjetivo(hEstrategia,  hDefensaCampamento1 );
  //SetDelayEntrenamientoTropasPueblo(hEstrategia, "campamento1", 60);  
  
  
  hDefensaCampamento2= CrearObjetivo(hEstrategia, "ConquistaPueblo2", "campamento2");
  AnyadirGrupoAObjetivo(hDefensaCampamento2, "G_DEFCAMPAMENTO2"); 
  SetParamObjetivo(hDefensaCampamento2, "DistribuirTropas", 30, hAsaltoFuerte, 60, hAtaquePuerto, 10);
  //SetParamObjetivo(hDefensaCampamento2 , "NombreGrupoGenerado", "G_DEFCAMPAMENTO2");
  SetParamObjetivo(hDefensaCampamento2 , "PuedePedirRefuerzos", FALSE);
  SetParamObjetivo(hDefensaCampamento2, "POTMIN_DEFENSA_PUEBLO", 20000);
  AnyadirObjetivo(hEstrategia,  hDefensaCampamento2 );
  //SetDelayEntrenamientoTropasPueblo(hEstrategia, "campamento2", 60);  
  
  
  hDefensaCampamento3= CrearObjetivo(hEstrategia, "ConquistaPueblo2", "campamento3");
  AnyadirGrupoAObjetivo(hDefensaCampamento3, "G_DEFCAMPAMENTO3"); 
  SetParamObjetivo(hDefensaCampamento3, "DistribuirTropas", 30, hAsaltoFuerte, 60, hAtaquePuerto, 10);
  //SetParamObjetivo(hDefensaCampamento3 , "NombreGrupoGenerado", "G_DEFCAMPAMENTO3");
  SetParamObjetivo(hDefensaCampamento3 , "PuedePedirRefuerzos", FALSE);
  SetParamObjetivo(hDefensaCampamento3, "POTMIN_DEFENSA_PUEBLO", 30000);
  AnyadirObjetivo(hEstrategia,  hDefensaCampamento3 );
  //SetDelayEntrenamientoTropasPueblo(hEstrategia, "campamento3", 60);  
  
  // Que el asalto coja tropas de los tres pueblos
  SetParamObjetivo(hAsaltoFuerte, "ObjetivoAtracable", hDefensaCampamento1);
  SetParamObjetivo(hAsaltoFuerte, "ObjetivoAtracable", hDefensaCampamento2);
  SetParamObjetivo(hAsaltoFuerte, "ObjetivoAtracable", hDefensaCampamento3);
  	
	// Activacion de triggers
	ActivarTrigger("LlegadaPuerto");
	ActivarTrigger("AlisEmprendenLaRuta");
	ActivarTrigger("DespertarG_1");
	ActivarTrigger("DespertarG_2");
	ActivarTrigger("DespertarG_3");
	ActivarTrigger("CambioDrastico");
	ActivarTrigger("GameOver");
	ActivarTrigger("NoLasQuemesAntes");
	
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
  handle hTimer;
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

  // efectos especiales: AKI POR MOTIVOS ESPECIALES
  ActivarTrigger("EfectosBriefing");
    
  // Presentacion
  ActivarPresentacion(TRUE, "LTEXT_MISION22_PRESENTACION_TITULO",
                            "LTEXT_MISION22_PRESENTACION_LUGAR", hPresentacion);
                            
  // camara a donde debe empezar
  EncolarColocarYMirarPunto("BRIEFING_1");
  EjecutarOrdenesCamara();
  
  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));

  ActivarPresentacion(FALSE, "", "", NULL);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolarPausaCamara(1000);
  EncolaTrayectoriaCamara("BRIEFING_2", FALSE, FALSE, 0, 0);
  IntroducirLocucion("", "", 100, 0, 0);  
  IntroducirLocucion("22N0", "LTEXT_MISION22_LOCUCION_00_TXT", 5000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("22N1", "LTEXT_MISION22_LOCUCION_01_TXT", 10000, 600, 100);
  EncolarPausaCamara(2000);
  IntroducirPuntoSincronia();    

  EncolarColocarYMirarPunto("BRIEFING_3", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(8000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("22N2", "LTEXT_MISION22_LOCUCION_02_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();
  
  EncolaTrayectoriaCamara("BRIEFING_4", FALSE, FALSE, 0, 0);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("22N3", "LTEXT_MISION22_LOCUCION_03_TXT", 8000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("22N4", "LTEXT_MISION22_LOCUCION_04_TXT", 3000, 600, 100);
  EncolarPausaCamara(1000);
  IntroducirPuntoSincronia();    
    
  IntroducirPonerModoJuegoCamara(TRUE);

  // si no se ha interrumpido
  if ( !HandleDisparado(hEscape) )
  {
    
    // iluminacion
    IluminarZonaOnOff(154, 3, 15, 30, "barcos", TRUE);

    // acción
    EjecutarOrdenesCamara();

    // final  
    PonerHandleBoolACamara(hCamaraEnd);
    WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
        
    IluminarZonaOnOff(154, 3, 15, 30, "barcos", FALSE); 
    
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
 
  hTimer = CrearTimer(8000);
  WaitBool(HandleDisparado(hTimer) || bBriefingEnded); 
    
  
  TropaSigueRutaPredefinida("B_7", "B_7");

  TropaSigueRutaPredefinida("B_1", "B_1");
  TropaSigueRutaPredefinida("B_2", "B_2");
  TropaSigueRutaPredefinida("B_3", "B_3");
  TropaSigueRutaPredefinida("B_4", "B_4");
  TropaSigueRutaPredefinida("B_5", "B_5");
  TropaSigueRutaPredefinida("B_6", "B_6");
 
  hTimer = CrearTimer(5000);
  Wait(hTimer);
  
  SetMoverFisicoTropa("B_7", TRUE);
 
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
// TRIGGERS DE MISION
//**************************************************************************


//---------------------------------
Trigger "LlegadaPuerto" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_THREEWAY","CESAR")
)
Do
{
  
  //bCambio = TRUE;
  CrearAlianzaPorNombre("CESAR", "ALIADOS");
	
	//DestruirTrigger("AlisEmprendenLaRuta");
	DestruirTrigger("LlegadaPuerto");
	
}

//---------------------------------
Trigger "AlisEmprendenLaRuta" [Inactivo]
(
 	TRUE
)
Var
{
  handle hTimer;
}
Do
{

  hTimer = CrearTimer(900000); // 1/4 hora //**
  Wait(hTimer); 
  
  SetMoverFisicoTropa("mensaka", TRUE);    
  TropaSigueRutaPredefinida("mensaka", "R_Alis");    
  
  /*    
  hMensaka = CrearObjetivo(hEstrategiaAliados, "DefensaSemiCoordinada");
  AnyadirTropaAObjetivo(hMensaka, "mensaka", 1, "R_Alis"); 
  AnyadirObjetivo(hEstrategiaAliados, hMensaka);
	*/
	
	ActivarTrigger("Noticias");
	
	DestruirTrigger("LlegadaPuerto");
	
	DestruirTrigger("AlisEmprendenLaRuta");
}

//---------------------------------
Trigger "Noticias" [Inactivo]
(
 	HaEntradoTropaEnZona("Z_NOTICIA", "mensaka")
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
  
  SetMoverFisicoTropa("mensaka", FALSE);
  CambiarBandoPorGrupo("G_ILUMINATED", "CESAR");
  
  hTimer = CrearTimer(100);
  Wait(hTimer);

  bCambio = TRUE;
  CrearAlianzaPorNombre("CESAR", "ALIADOS");

  // cinemática de moda  
  // handle de final 
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
  IntroducirLocucion("22L0", "LTEXT_MISION22_EVENTO1_00_TXT", 7000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("22L1", "LTEXT_MISION22_EVENTO1_01_TXT", 6000, 600, 100);
  IntroducirPuntoSincronia();    
  
  EncolaTrayectoriaCamara("EVENTO_1", FALSE, TRUE, 0, 2);      
  IntroducirPuntoSincronia();        
      
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

  //////////////////////////////////////////////////////////////////  
  
    
  ActivarTrigger("ReclutarAlis");
  
	DestruirTrigger("LlegadaPuerto");
	
	DestruirTrigger("Noticias");
}

//---------------------------
Trigger "ReclutarAlis" [ Inactivo ]
(
  DarNumUnidadesEnZona("CESAR", "Z_THREEWAY") > 0 ||
  DarNumUnidadesEnZona("CESAR", "Z_A") > 0 ||
  DarNumUnidadesEnZona("CESAR", "Z_B") > 0 ||
  (DarNumUnidadesEnZona("CESAR", "Z_G_1") > 0 || DarNumUnidadesEnZona("CESAR", "Z_G_2") > 0)
)
Var
{
  handle hTimer; 
}
Do
 {           
  if (!bA && DarNumUnidadesEnZona("CESAR", "Z_C") > 0)
  {
    
    if ( DarTropasVivasDeGrupo("G_C") > 0 )
    {
      CambiarBandoPorGrupo("G_C", "CESAR");
      MensajeLocucionado("22N6","LTEXT_MISION22_MENSAJE_01_TXT");
      AvisoCivilizacion("CESAR", 103, 80);
    }
    
    bA = TRUE;
  }

  if (!bB && DarNumUnidadesEnZona("CESAR", "Z_A") > 0) 
  {
    
    if (DarTropasVivasDeGrupo("G_A") > 0)
    {
      CambiarBandoPorGrupo("G_A", "CESAR");
      MensajeLocucionado("22N6","LTEXT_MISION22_MENSAJE_01_TXT");    
      AvisoCivilizacion("CESAR", 58, 28);
    }
    
    bB = TRUE;
  }
  
  if (!bC && DarNumUnidadesEnZona("CESAR", "Z_B") > 0)
  {
    
    if (DarTropasVivasDeGrupo("G_B") > 0)
    {
      CambiarBandoPorGrupo("G_B", "CESAR");
      MensajeLocucionado("22N6","LTEXT_MISION22_MENSAJE_01_TXT");    
      AvisoCivilizacion("CESAR", 95, 6);    
    }
      
    bC = TRUE;
  }
  
  if (!bD && (DarNumUnidadesEnZona("CESAR", "Z_G_1") > 0 || DarNumUnidadesEnZona("CESAR", "Z_G_2") > 0))
  {
    
    if (DarTropasVivasDeGrupo("G_D") > 0)
    {
      CambiarBandoPorGrupo("G_D", "CESAR");
      MensajeLocucionado("22N6","LTEXT_MISION22_MENSAJE_01_TXT");
      AvisoCivilizacion("CESAR", 145, 25);        
    }
    
    bD = TRUE;
  }
  
  if (bA && bB && bC && bD) 
  {
    DestruirTrigger("ReclutarAlis");
  }
  
  hTimer = CrearTimer(1000);
  Wait(hTimer);
  
}

//---------------------------------
Trigger "DespertarG_1" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_C","CESAR") ||
 	(DarTropasMuertasDeGrupo("G_1") == 1)  
)
Do
{
	SetParamObjetivo(hG_1, "Tactica", "ActitudBatallon", "Ofensiva");
	
	DestruirTrigger("DespertarG_1");
}

//---------------------------------
Trigger "DespertarG_2" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_C","CESAR") ||
 	(DarTropasMuertasDeGrupo("G_2") == 1)  
)
Do
{
	SetParamObjetivo(hG_2, "Tactica", "ActitudBatallon", "Ofensiva");
	
	DestruirTrigger("DespertarG_2");
}

//---------------------------------
Trigger "DespertarG_3" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_G_3","CESAR") ||
 	(DarTropasMuertasDeGrupo("G_3") == 1)  
)
Do
{
	SetParamObjetivo(hG_3, "Tactica", "ActitudBatallon", "Ofensiva");
	
	DestruirTrigger("DespertarG_3");
}

//---------------------------------
Trigger "CambioDrastico" [Inactivo]
(
 	 bCambio 
)
Do
{
  
  DisposeHandle(&hG_5);  
  DisposeHandle(&hAtaquePuerto);    
      
  //El objetivo de ataque al puerto mas potente
  hAtaquePuerto = CrearObjetivo(hEstrategia, "AtaqueOleadasPeriodicas", fPuertoMin, fPuertoMax, 60, 100);
  AnyadirGrupoAObjetivo(hAtaquePuerto, "G_PUERTO"); 
  AnyadirGrupoAObjetivo(hAtaquePuerto, "G_REFUERZO"); 
  AnyadirGrupoAObjetivo(hAtaquePuerto, "G_5"); 
  AnyadirObjetivo(hEstrategia,  hAtaquePuerto);
  SetParamObjetivo(hAtaquePuerto, "PosicionAtaque", 167, 35);
  SetParamObjetivo(hAtaquePuerto, "PosicionSiguiente", 137, 26);
  SetParamObjetivo(hAtaquePuerto, "PosicionSiguiente", 153, 17);
  SetParamObjetivo(hAtaquePuerto, "PosicionSiguiente", 117, 26);
  SetParamObjetivo(hAtaquePuerto, "PosicionSiguiente", 147, 39);
  SetParamObjetivo(hAtaquePuerto, "RetardoSiguiente", 120);

  //El asalto a la fortaleza se reblandece
  SetParamObjetivo(hAsaltoFuerte, "ResetOleadas");
	SetParamObjetivo(hAsaltoFuerte, "RetardoSiguiente", 100);
	SetParamObjetivo(hAsaltoFuerte, "Oleada", "AsaltoMuralla", 3, 3, fOleadasMax, fOleadasMax, FALSE, 39, 155);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoMuralla", 3, 3, fOleadasMax, fOleadasMax, FALSE, 28, 37);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AtaquePuerta", 3, 3, fOleadasMax, fOleadasMax, FALSE, 94, 121);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoMuralla", 3, 3, fOleadasMax, fOleadasMax, FALSE, 74, 148);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AsaltoMuralla", 3, 3, fOleadasMax, fOleadasMax, FALSE, 39, 155);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoMuralla", 3, 3, fOleadasMax, fOleadasMax, FALSE, 28, 37);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "AtaquePuerta", 3, 3, fOleadasMax, fOleadasMax, FALSE, 94, 121);
  SetParamObjetivo(hAsaltoFuerte, "Oleada", "BarridoMuralla", 3, 3, fOleadasMax, fOleadasMax, FALSE, 39, 155);
  
  SetParamObjetivo(hDefensaCampamento1, "DistribuirTropas", 20, hAsaltoFuerte, 10, hAtaquePuerto, 70);
  SetParamObjetivo(hDefensaCampamento2, "DistribuirTropas", 20, hAsaltoFuerte, 10, hAtaquePuerto, 70);
  SetParamObjetivo(hDefensaCampamento3, "DistribuirTropas", 20, hAsaltoFuerte, 10, hAtaquePuerto, 70);
 
  hObjIrAlPuerto = CrearHandle("Bool");
  AgregarObjetivoMision(hObjIrAlPuerto, "LTEXT_MISION22_OBJETIVO_01_TXT");  
 
  ActivarTrigger("CambioObjetivo"); 	
   	
	DestruirTrigger("CambioDrastico");
}

//---------------------------------
Trigger "CambioObjetivo" [Inactivo]
(
 	 TRUE
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(fTimeArrive); 
  Wait(hTimer); 

  MensajeLocucionado("22N7","LTEXT_MISION22_MENSAJE_02_TXT");
  AvisoCivilizacion("CESAR", 145, 25);
  
  EliminarObjetivoMision(hObjIrAlPuerto);  
  
  hObjQuemarGaleras = CrearHandle("Bool");
  AgregarObjetivoMision(hObjQuemarGaleras, "LTEXT_MISION22_OBJETIVO_02_TXT");  
  ObjetivosMisionCambiados();
  	
  DestruirTrigger("NoLasQuemesAntes");
  
  ActivarTrigger("QuemalasYa");
  
  ActivarTrigger("TiempoParaQuemar");
  	
	DestruirTrigger("CambioObjetivo");
}

//---------------------------------
Trigger "TiempoParaQuemar" [Inactivo]
(
 	 TRUE
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(fTimeBurn);  
  Wait(hTimer); 

  MensajeLocucionado("22N5","LTEXT_MISION22_MENSAJE_00_TXT");
  AvisoCivilizacion("CESAR", 145, 25);
  
  bTimeUp = TRUE;
      	
	DestruirTrigger("TiempoParaQuemar");
}

//---------------------------------
Trigger "GameOver" [Inactivo]
(
 	 (EstructuraDestruida("barracon1") || EstructuraDestruida("barracon2")) || // a lo mejor se pone &&
 	 CivilizacionEstaKO("CESAR") ||
 	 bTimeUp
)
Do
{
  
  if (EstructuraDestruida("barracon1") || EstructuraDestruida("barracon2")) 
  {
    IndicarObjetivoFracasado(hObjDefensaFortaleza);
  }
  if (bTimeUp)
  {
    IndicarObjetivoFracasado(hObjQuemarGaleras);
  }
  
  FinalizarMision(FALSE);
  
  DestruirTrigger("QuemalasYa");
    	
	DestruirTrigger("GameOver");
}

//---------------------------------
Trigger "NoLasQuemesAntes" [Inactivo]
(
 	EstructuraDestruida("barco1") ||
 	EstructuraDestruida("barco2") ||
 	EstructuraDestruida("barco3") ||
 	EstructuraDestruida("barco4")
)
Do
{
  
  if (hObjIrAlPuerto)
  {
    IndicarObjetivoFracasado(hObjIrAlPuerto);
  }	
  
  FinalizarMision(FALSE);
    	
	DestruirTrigger("NoLasQuemesAntes");
}

//----------------------------------------
Trigger "QuemalasYa" [Inactivo]
(
 	EstructuraDestruida("barco1") &&
 	EstructuraDestruida("barco2") &&
 	EstructuraDestruida("barco3") &&
 	EstructuraDestruida("barco4")
)
Do
{
    
  IndicarObjetivoCumplido(hObjQuemarGaleras);
  IndicarObjetivoCumplido(hObjDefensaFortaleza);
    
  FinalizarMision(TRUE);
    	
	DestruirTrigger("QuemalasYa");
}

//-----------------------------------
Trigger "End" [ Activo ]  
(
  TRUE
)
Do
{
}