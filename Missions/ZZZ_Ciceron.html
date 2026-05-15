Var
{
	handle hEstrategiaCiceron;
	handle hEstrategiaFuerte;
	handle hEstrategiaMedia;
	handle hEstrategiaDebil;
		
	handle hCivilizacionCiceron;
	handle hCivilizacionFuerte;
	handle hCivilizacionMedia;
	handle hCivilizacionDebil;
		
  handle hObjetivoDefensaDebil;
  handle hObjetivoDefensaMedia;
  handle hObjetivoDefensaFuerte;
  
  handle hObjetivoDefensaFortaleza;
  handle hObjetivoAsaltoDePega;  
  handle hAsaltoFortaleza;
  handle hAsaltoFortalezaII;
  handle hAsaltoFortalezaIII;
  
  handle hG_Alis1;
  handle hG_Alis2;
  handle hG_Alis3;
  handle hG_Alis4;

  handle hG_Atajo;  
  handle hG_1;
  handle hG_2;
  handle hG_3;
  handle hG_4;
  handle hG_5;
  handle hG_6;
  handle hG_7;
  handle hG_8;
  handle hG_9;
  handle hG_A;
  handle hG_B;
  handle hG_Z;
  handle hG_OH;
  
  handle hG_EXCURSION;
  handle hG_PUTEO;
  
  handle hGuia;
  
  bool bQuinto = FALSE;
  bool bMeet = FALSE;
  
  float fWaitRecon;
  
  // niveles de dificultad
  float fNivelDificultad = 0;
  
  // objetivos
  handle hObjGoToFortress;
  handle hQuintusMustSurvive;
  handle hLabienoMustSurvive;
  handle hObjDestroy23Towns;
  handle hObjDefenseFortress;
    
  bool bObjGoToFortress    = FALSE;
  bool bQuintusMustSurvive = FALSE;
  bool bLabienoMustSurvive = FALSE;
  bool bObjDestroy23Towns  = FALSE;
  bool bObjDefenseFortress = FALSE;
  
  // briefing
  float fPuntoSincronia           = 0;
  handle hPuntoSincronia          = NULL;
  bool bBriefingEnded             = NULL;
  
}

#include "FunScript.h"

//////////////////////////////////////////////////////////////////////////////
// MAIN
//////////////////////////////////////////////////////////////////////////////

Trigger "Main" [ Activo ]  
(
  TRUE
)
Do
{

  // iluminamos los pueblos para que se vea el color  
  IluminarZonaOnOff(177, 2, 157, 20, "pueblo1", TRUE);
  IluminarZonaOnOff(244, 2, 31, 20, "pueblo2", TRUE);
  IluminarZonaOnOff(48, 2, 38, 20, "pueblo3", TRUE);
  IluminarZonaOnOff(57, 4, 142, 20, "fortaleza", TRUE);

  IluminarZonaOnOff(177, 2, 157, 20, "pueblo1", FALSE);
  IluminarZonaOnOff(244, 2, 31, 20, "pueblo2", FALSE);
  IluminarZonaOnOff(48, 2, 38, 20, "pueblo3", FALSE);
  IluminarZonaOnOff(57, 4, 142, 20, "fortaleza", FALSE);
  
 
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
  CrearAlianzaPorNombre("Nervios", "Eburones");
  CrearAlianzaPorNombre("Treveros", "Eburones");
  
  ActivarTrigger("Briefing");
  
}



Trigger "Main2" [ Inactivo ]
(
  TRUE
)
Var
{
    float fHig;
    float fMedium; 
    float fLow;
}
Do
{
  
  // Objetivos de la mision  
  hObjGoToFortress = CrearHandle("Bool");
  hQuintusMustSurvive = CrearHandle("Bool");
  hObjDestroy23Towns = CrearHandle("Bool");
  hObjDefenseFortress = CrearHandle("Bool");
  hLabienoMustSurvive = CrearHandle("Bool");
  
  AgregarObjetivoMision(hObjGoToFortress, "LTEXT_MISION13_OBJETIVO_00_TXT");
  AgregarObjetivoMision(hQuintusMustSurvive, "LTEXT_MISION13_OBJETIVO_02_TXT");
  AgregarObjetivoMision(hLabienoMustSurvive, "LTEXT_MISION13_OBJETIVO_01_TXT");
  
  // Restricciones de la mision
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GLADIADOR", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "PIQUERO_ELITE", "");
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "HONDERO", "");
  
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_GERMANA", "");
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_CAZADOR", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_ESPADON", "");
  
  
  // comprobar el nivel de dificultad
  fNivelDificultad = DarDificultadMision();
  if ( fNivelDificultad == 1 )
  {    
    fHig = 240000;// 4 min
    fMedium = 300000;// 5 min
    fLow = 360000;// 6 min
    
    //Lo que tardan los enemigos en reconquistar su pueblo
    fWaitRecon = 180000;// 3 min
    
    //Los enemigos no pueden construir torres de defensa
    IntroducirRestriccionEstructura("ORDEN_CONSTRUIR", "TORRE_DEFENSA_BARBARA", "");
  }
  else
  if ( fNivelDificultad == 2 )
  {    
    fHig = 120000;// 2 min
    fMedium = 180000;// 3 min
    fLow = 240000;// 4 min 
    
    //Lo que tardan los enemigos en reconquistar su pueblo
    fWaitRecon = 120000;// 2 min
    
    //Los enemigos no pueden construir torres de defensa
    //IntroducirRestriccionEstructura("ORDEN_CONSTRUIR", "TORRE_DEFENSA_BARBARA", "");
  }
  else
  if ( fNivelDificultad == 3 )
  {
    fHig = 60000;// 1 min
    fMedium = 120000;// 2 min
    fLow = 180000;// 3 min 
    
    //Lo que tardan los enemigos en reconquistar su pueblo
    fWaitRecon = 60000;// 1 min
  }
  else
  {
    fHig = 60000;// 1 min
    fMedium = 120000;// 2 min
    fLow = 180000;// 3 min 
    
    //Lo que tardan los enemigos en reconquistar su pueblo
    fWaitRecon = 60000;// 1 min
    
    fNivelDificultad = 2;
    MensajeChat("Nivel de dificulatd desconocido, oiga");
  }
    
  // Estrategias del enemigo y del aliado
	hEstrategiaDebil = CrearEstrategiaScript();
  hCivilizacionDebil = DarCivilizacion("Nervios");
  AsignarEstrategia(hCivilizacionDebil, hEstrategiaDebil);
  StartEstrategia(hEstrategiaDebil);
  
  hEstrategiaMedia = CrearEstrategiaScript();
  hCivilizacionMedia = DarCivilizacion("Treveros");
  AsignarEstrategia(hCivilizacionMedia, hEstrategiaMedia);
  StartEstrategia(hEstrategiaMedia);
  
  hEstrategiaFuerte = CrearEstrategiaScript();
  hCivilizacionFuerte = DarCivilizacion("Eburones");
  AsignarEstrategia(hCivilizacionFuerte, hEstrategiaFuerte);
  StartEstrategia(hEstrategiaFuerte);
  
  hEstrategiaCiceron = CrearEstrategiaScript();
  hCivilizacionCiceron = DarCivilizacion("IX Legion");
  AsignarEstrategia(hCivilizacionCiceron, hEstrategiaCiceron);
  StartEstrategia(hEstrategiaCiceron);


  SetParamEstrategia(hEstrategiaDebil, "ResetTropaRestringida");
  SetParamEstrategia(hEstrategiaDebil, "TropaRestringida", "Ciceron");

  SetParamEstrategia(hEstrategiaMedia, "ResetTropaRestringida");
  SetParamEstrategia(hEstrategiaMedia, "TropaRestringida", "Ciceron");

  SetParamEstrategia(hEstrategiaFuerte, "ResetTropaRestringida");
  SetParamEstrategia(hEstrategiaFuerte, "TropaRestringida", "Ciceron");
   

  // -- Pueblo DEBIL
  hObjetivoDefensaDebil = CrearObjetivo(hEstrategiaDebil, "ConquistaPueblo2", "Ariola");
  AnyadirGrupoAObjetivo(hObjetivoDefensaDebil, "G_DEFENSA_DEBIL"); 
  AnyadirGrupoAObjetivo(hObjetivoDefensaDebil, "G_ASALTO_DEBIL"); 
   
  SetParamObjetivo(hObjetivoDefensaDebil , "NombreGrupoGenerado", "G_ASALTO_DEBIL");
  SetParamObjetivo(hObjetivoDefensaDebil , "PuedePedirRefuerzos", FALSE);
  SetParamObjetivo(hObjetivoDefensaDebil, "POTMIN_DEFENSA_PUEBLO", 20000);

  ResetGruposTropasAEntrenar(hEstrategiaDebil); // Entrenamos principalmente caballeria
  SetValue(hEstrategiaDebil, "GRUPOTROPAS_A_ENTRENAR", "CABALLERIA_PESADA", 40);
  SetValue(hEstrategiaDebil, "GRUPOTROPAS_A_ENTRENAR", "CABALLERIA_ARQUERA", 30);
  SetValue(hEstrategiaDebil, "GRUPOTROPAS_A_ENTRENAR", "LIGERAS", 10);
  SetValue(hEstrategiaDebil, "GRUPOTROPAS_A_ENTRENAR", "INF_ARQUERO", 10);
  SetValue(hEstrategiaDebil, "GRUPOTROPAS_A_ENTRENAR", "PIQUERO", 10);
  
  SetDelayEntrenamientoTropasPueblo(hEstrategiaDebil, "Ariola", fLow);

  AnyadirObjetivo(hEstrategiaDebil,  hObjetivoDefensaDebil );

 
  // -- Pueblo MEDIO
  hObjetivoDefensaMedia = CrearObjetivo(hEstrategiaMedia, "ConquistaPueblo2", "Nastum");
  AnyadirGrupoAObjetivo(hObjetivoDefensaMedia, "G_DEFENSA_MEDIA"); 
  AnyadirGrupoAObjetivo(hObjetivoDefensaMedia, "G_ASALTO_MEDIO"); 
   
  SetParamObjetivo(hObjetivoDefensaMedia, "NombreGrupoGenerado", "G_ASALTO_MEDIO");
  SetParamObjetivo(hObjetivoDefensaMedia, "PuedePedirRefuerzos", FALSE);
  SetParamObjetivo(hObjetivoDefensaMedia, "POTMIN_DEFENSA_PUEBLO", 20000);

  ResetGruposTropasAEntrenar(hEstrategiaMedia); // Entrenamos principalmente infanteria
  SetValue(hEstrategiaMedia, "GRUPOTROPAS_A_ENTRENAR", "LIGERAS", 20);
  SetValue(hEstrategiaMedia, "GRUPOTROPAS_A_ENTRENAR", "INF_PESADA", 40);
  SetValue(hEstrategiaMedia, "GRUPOTROPAS_A_ENTRENAR", "PIQUERO", 20);
  SetValue(hEstrategiaMedia, "GRUPOTROPAS_A_ENTRENAR", "INF_ARQUERO", 20);

  SetDelayEntrenamientoTropasPueblo(hEstrategiaMedia, "Nastum", fMedium);

  AnyadirObjetivo(hEstrategiaMedia,  hObjetivoDefensaMedia );
  
  // -- Pueblo FUERTE
  hObjetivoDefensaFuerte = CrearObjetivo(hEstrategiaFuerte, "ConquistaPueblo2", "Basilia");
  AnyadirGrupoAObjetivo(hObjetivoDefensaFuerte, "G_DEFENSA_FUERTE"); 
  AnyadirGrupoAObjetivo(hObjetivoDefensaFuerte, "G_ASALTO_FUERTE"); 

  SetParamObjetivo(hObjetivoDefensaFuerte , "NombreGrupoGenerado", "G_ASALTO_FUERTE");
  SetParamObjetivo(hObjetivoDefensaFuerte , "PuedePedirRefuerzos", FALSE);
  SetParamObjetivo(hObjetivoDefensaFuerte, "POTMIN_DEFENSA_PUEBLO", 20000);

  ResetGruposTropasAEntrenar(hEstrategiaFuerte);  // Entrenamos princip. maquinas
  SetValue(hEstrategiaFuerte, "GRUPOTROPAS_A_ENTRENAR", "ESCALA", 20);
  SetValue(hEstrategiaFuerte, "GRUPOTROPAS_A_ENTRENAR", "ARIETE", 20);
  SetValue(hEstrategiaFuerte, "GRUPOTROPAS_A_ENTRENAR", "MAQUINAS_ATAQUE", 20);
  SetValue(hEstrategiaFuerte, "GRUPOTROPAS_A_ENTRENAR", "INF_ARQUERO", 20);
  SetValue(hEstrategiaFuerte, "GRUPOTROPAS_A_ENTRENAR", "INF_PESADA", 20);

  SetDelayEntrenamientoTropasPueblo(hEstrategiaFuerte, "Basilia", fHig);

  AnyadirObjetivo(hEstrategiaFuerte,  hObjetivoDefensaFuerte );
  
  
  // -- Asalto inicial, para molestar a los aliados
  hObjetivoAsaltoDePega = CrearObjetivo(hEstrategiaFuerte, "OleadasFortaleza", "CiceronFortress");
  AnyadirGrupoAObjetivo(hObjetivoAsaltoDePega, "G_ASEDIO"); 
  
  SetParamObjetivo(hObjetivoAsaltoDePega, "Secuencial", TRUE);

  SetParamObjetivo(hObjetivoAsaltoDePega, "MantenerDefensivo", TRUE);

  // La primera sale al minuto de partida, las otras cada 3 minutos
  SetParamObjetivo(hObjetivoAsaltoDePega, "OleadaScriptada", "G_ASEDIO1", 60, 60, 56, 138);
  SetParamObjetivo(hObjetivoAsaltoDePega, "OleadaScriptada", "G_ASEDIO2", 150, 150, 60, 212);
  SetParamObjetivo(hObjetivoAsaltoDePega, "OleadaScriptada", "G_ASEDIO3", 150, 150, 30, 168);
  SetParamObjetivo(hObjetivoAsaltoDePega, "OleadaScriptada", "G_ASEDIO4", 150, 150, 94, 197);
  SetParamObjetivo(hObjetivoAsaltoDePega, "OleadaScriptada", "G_ASEDIO5", 150, 150, 56, 138);

  AnyadirObjetivo(hEstrategiaFuerte, hObjetivoAsaltoDePega);



  // NOTA: Los asaltos pata negra se disparan cuando toque


  
  
  // -- Objetivo de la defensa de la fortaleza
  hObjetivoDefensaFortaleza = CrearObjetivo(hEstrategiaCiceron, "DefensaFortaleza", "CiceronFortress");
  AnyadirGrupoAObjetivo(hObjetivoDefensaFortaleza, "G_DEFENSA_QUINTO"); 
  AnyadirObjetivo(hEstrategiaCiceron, hObjetivoDefensaFortaleza);
  
  // -- Los grupos de aliados mantienen la posicion hasta que los conozcas
  hG_Alis1 = CrearObjetivo(hEstrategiaCiceron, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_Alis1, "G_VIGIAI");
  SetParamObjetivo(hG_Alis1, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaCiceron, hG_Alis1);
  
  hG_Alis2 = CrearObjetivo(hEstrategiaCiceron, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_Alis2, "G_VIGIAII");
  SetParamObjetivo(hG_Alis2, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaCiceron, hG_Alis2);
  
  hG_Alis3 = CrearObjetivo(hEstrategiaCiceron, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_Alis3, "G_VIGIAIII");
  SetParamObjetivo(hG_Alis3, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaCiceron, hG_Alis3);
  
  hG_Alis4 = CrearObjetivo(hEstrategiaCiceron, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_Alis4, "G_VIGIAIV");
  SetParamObjetivo(hG_Alis4, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaCiceron, hG_Alis4);
      
  // -- Grupos que defienden la posicion
  hG_Atajo = CrearObjetivo(hEstrategiaFuerte, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_Atajo, "G_DEF_ATAJO");
  SetParamObjetivo(hG_Atajo, "Tactica", "AtaqueStand", TRUE); // No se moveran para atacar, hasta que empieces tu
  SetParamObjetivo(hG_Atajo, "Tactica", "AtacarZona", "Atajo");
  SetParamObjetivo(hG_Atajo, "Tactica", "AtacarCorriendo", TRUE);
  AnyadirObjetivo(hEstrategiaFuerte, hG_Atajo);  
  
  hG_1 = CrearObjetivo(hEstrategiaFuerte, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_1, "G_1");
  AnyadirObjetivo(hEstrategiaFuerte, hG_1);
  
  hG_2 = CrearObjetivo(hEstrategiaFuerte, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_2, "G_2");
  AnyadirObjetivo(hEstrategiaFuerte, hG_2);
  
  hG_3 = CrearObjetivo(hEstrategiaFuerte, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_3, "G_3");
  AnyadirObjetivo(hEstrategiaFuerte, hG_3);
  
  hG_4 = CrearObjetivo(hEstrategiaFuerte, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_4, "G_4");
  AnyadirObjetivo(hEstrategiaFuerte, hG_4);
  
  hG_5 = CrearObjetivo(hEstrategiaFuerte, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_5, "G_5");
  AnyadirObjetivo(hEstrategiaFuerte, hG_5);
  
  hG_6 = CrearObjetivo(hEstrategiaFuerte, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_6, "G_6");
  AnyadirObjetivo(hEstrategiaFuerte, hG_6);
  
  hG_7 = CrearObjetivo(hEstrategiaFuerte, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_7, "G_7");
  AnyadirObjetivo(hEstrategiaFuerte, hG_7);
  
  hG_8 = CrearObjetivo(hEstrategiaFuerte, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_8, "G_8");
  AnyadirObjetivo(hEstrategiaFuerte, hG_8);
  
  hG_9 = CrearObjetivo(hEstrategiaFuerte, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_9, "G_9");
  AnyadirObjetivo(hEstrategiaFuerte, hG_9);
  
  hG_A = CrearObjetivo(hEstrategiaFuerte, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_A, "G_A");  
  AnyadirObjetivo(hEstrategiaFuerte,  hG_A);
  
  hG_B = CrearObjetivo(hEstrategiaFuerte, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_B, "G_B");  
  AnyadirObjetivo(hEstrategiaFuerte,  hG_B);
    
  hG_Z = CrearObjetivo(hEstrategiaFuerte, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_Z, "G_Z");
  AnyadirObjetivo(hEstrategiaFuerte, hG_Z);
  
  hG_OH = CrearObjetivo(hEstrategiaFuerte, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_OH, "G_OH");
  AnyadirObjetivo(hEstrategiaFuerte, hG_OH);
  
  hG_EXCURSION = CrearObjetivo(hEstrategiaFuerte, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_EXCURSION, "G_EXCURSION");
  AnyadirObjetivo(hEstrategiaFuerte, hG_EXCURSION);
  
  hG_PUTEO = CrearObjetivo(hEstrategiaDebil, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_PUTEO, "G_PUTEO");
  AnyadirObjetivo(hEstrategiaDebil, hG_PUTEO);
             
  //Activacion de triggers
  ActivarTrigger("ProduccionIntensa");
  ActivarTrigger("TomarAQuinto");
  ActivarTrigger("IntroduccionCiceron");
  ActivarTrigger("EntrarEnZVigiaI");
  ActivarTrigger("EntrarEnZVigiaII");
  ActivarTrigger("EntrarEnZVigiaIII");
  ActivarTrigger("EntrarEnZVigiaIV");
  ActivarTrigger("EXITO");
  ActivarTrigger("PueblosDestruidos");   
  ActivarTrigger("GameOver");  
  ActivarTrigger("GameOverII");  
  ActivarTrigger("GameOverIII"); 
  ActivarTrigger("PasarAsaltoDePegaAOfensivo"); 
  ActivarTrigger("PuebloDestruido");
  
  // sacabó
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
  ActivarPresentacion(TRUE, "LTEXT_MISION13_PRESENTACION_TITULO",
                            "LTEXT_MISION13_PRESENTACION_LUGAR", hPresentacion);
                            
  // camara a donde debe empezar
  EncolarColocarYMirarPunto("BRIEFING_1");
  EjecutarOrdenesCamara();
  
  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));
 
  ActivarPresentacion(FALSE, "", "", NULL);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);
    
  EncolarColocarYMirarPunto("BRIEFING_1");
  IntroducirLocucion("13N0", "LTEXT_MISION13_LOCUCION_00_TXT", 6000, 600, 100);
  IntroducirPuntoSincronia();
  
  EncolaTrayectoriaCamara("BRIEFING_2", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(4000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("13N1", "LTEXT_MISION13_LOCUCION_01_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();
      
  EncolarColocarYMirarPunto("BRIEFING_3");
  EncolarPausaCamara(2000);
  EncolarColocarYMirarPunto("BRIEFING_4");
  EncolarPausaCamara(2000);
  EncolarColocarYMirarPunto("BRIEFING_5");
  EncolarPausaCamara(3000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("13N2", "LTEXT_MISION13_LOCUCION_02_TXT", 6000, 600, 100);
  IntroducirPuntoSincronia();
  
  EncolarColocarYMirarPunto("BRIEFING_6");
  EncolarPausaCamara(1000);
  EncolaTrayectoriaCamara("BRIEFING_7", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(5000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("13N3", "LTEXT_MISION13_LOCUCION_03_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();
  
  EncolarColocarYMirarPunto("BRIEFING_8");
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("13N4", "LTEXT_MISION13_LOCUCION_04_TXT", 3000, 600, 100);
  IntroducirPuntoSincronia();
  
  IntroducirPonerModoJuegoCamara(TRUE);

  // si no se ha interrumpido
  if ( !HandleDisparado(hEscape) )
  {

    // efectos especiales
    ActivarTrigger("EfectosBriefing");
    
    // iluminación
    IluminarZonaOnOff(177, 2, 157, 20, "pueblo1", TRUE);
    IluminarZonaOnOff(244, 2, 31, 20, "pueblo2", TRUE);
    IluminarZonaOnOff(48, 2, 38, 20, "pueblo3", TRUE);
    IluminarZonaOnOff(57, 4, 142, 20, "fortaleza", TRUE);

    // acción
    EjecutarOrdenesCamara();

    // final  
    PonerHandleBoolACamara(hCamaraEnd);
    WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));

    // fuera luces
    IluminarZonaOnOff(177, 2, 157, 20, "pueblo1", FALSE);
    IluminarZonaOnOff(244, 2, 31, 20, "pueblo2", FALSE);
    IluminarZonaOnOff(48, 2, 38, 20, "pueblo3", FALSE);
    IluminarZonaOnOff(57, 4, 142, 20, "fortaleza", FALSE);
    
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

  LanzarRelampago();
  TropaSigueRutaPredefinida("Labieno", "BRIEFING_1");
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

//---------------------------------
Trigger "ProduccionIntensa" [Inactivo]
(
  HanEntradoCivilizacionesEnZona("CercaFortaleza", "Romanos")
)
Var 
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(1200000); // 20 min
  Wait(hTimer);
  
  SetDelayEntrenamientoTropasPueblo(hEstrategiaDebil, "Ariola", 0);  
  SetDelayEntrenamientoTropasPueblo(hEstrategiaMedia, "Nastum", 0);
  SetDelayEntrenamientoTropasPueblo(hEstrategiaFuerte, "Basilia", 0);
  
  DestruirTrigger("ProduccionIntensa");
}

//---------------------------------
Trigger "AsaltosPataNegra" [Inactivo]
(
  TRUE
)
Var
{
  float fDescanso;
  float fNumTropas;
  
  float fDescansoII;
  float fNumTropasII;
  
  float fDescansoIII;
  float fNumTropasIII;
}
Do
{
  if ( fNivelDificultad == 1 )
  {
    fDescanso = 240; // 4 minutos
    fNumTropas = 5;
    
    fDescansoII = 300; // 5 minutos
    fNumTropasII = 4;
        
    fDescansoIII = 330; // 5 minutos y 1/2
    fNumTropasIII = 5;
  }
  else if ( fNivelDificultad == 3 )
  {
    fDescanso = 120; // 2 minutos (suicidio)
    fNumTropas = 7;
    
    fDescansoII = 150; // 2 minutos y 1/2
    fNumTropasII = 6;
        
    fDescansoIII = 180; // 3 minutos
    fNumTropasIII = 6;
  }
  else
  {
    fDescanso = 180; // 3 minutos
    fNumTropas = 6;
    
    fDescansoII = 210; // 3 minutos y 1/2
    fNumTropasII = 6;
        
    fDescansoIII = 240; // 4 minutos
    fNumTropasIII = 5;
  }
  
  
  // ## Fuertes: Tienen maquinas. Atacan por el alto que hay cerca de la puerta y por el lateral
  //             No pueden usar torres de asalto por culpa de las rampas.
  
  hAsaltoFortaleza = CrearObjetivo(hEstrategiaFuerte, "OleadasFortaleza", "CiceronFortress");
  SetParamObjetivo(hAsaltoFortaleza, "ObjetivoAtracable", hObjetivoDefensaFuerte);
  SetParamObjetivo(hAsaltoFortaleza, "RobarTropasEducadamente", FALSE); // Para no dejar el pueblo vacio
  SetParamObjetivo(hAsaltoFortaleza, "Secuencial", FALSE); // Oleadas aleatorias

  SetParamObjetivo(hAsaltoFortaleza, "ResetComposicion", "AsaltoMuralla");
  SetParamObjetivo(hAsaltoFortaleza, "AddComposicion", "AsaltoMuralla", "FORT_ESCALAS", 2, TRUE);
  SetParamObjetivo(hAsaltoFortaleza, "AddComposicion", "AsaltoMuralla", "FORT_MELEE_PESADA", 3, FALSE);
  SetParamObjetivo(hAsaltoFortaleza, "AddComposicion", "AsaltoMuralla", "FORT_DISTANCIA", 1, FALSE);
  
  SetParamObjetivo(hAsaltoFortaleza, "ResetComposicion", "BarridoMuralla");
  SetParamObjetivo(hAsaltoFortaleza, "AddComposicion", "BarridoMuralla", "FORT_CATAPULTAS", 3, TRUE);
  SetParamObjetivo(hAsaltoFortaleza, "AddComposicion", "BarridoMuralla", "FORT_DISTANCIA", 3, FALSE);
  
  SetParamObjetivo(hAsaltoFortaleza, "ResetComposicion", "AtaquePuerta");
  SetParamObjetivo(hAsaltoFortaleza, "AddComposicion", "AtaquePuerta", "FORT_ARIETE", 1, TRUE);
  SetParamObjetivo(hAsaltoFortaleza, "AddComposicion", "AtaquePuerta", "FORT_BALLESTAS", 2, TRUE); 
  SetParamObjetivo(hAsaltoFortaleza, "AddComposicion", "AtaquePuerta", "FORT_MELEE_PESADA", 1, FALSE);
  SetParamObjetivo(hAsaltoFortaleza, "AddComposicion", "AtaquePuerta", "FORT_DISTANCIA", 2, FALSE);

  SetParamObjetivo(hAsaltoFortaleza, "Oleada", "AsaltoMuralla",  fNumTropas, fNumTropas, fDescanso, fDescanso, FALSE, 94, 183);
  SetParamObjetivo(hAsaltoFortaleza, "Oleada", "AsaltoMuralla",  fNumTropas, fNumTropas, fDescanso, fDescanso, FALSE, 84, 142);
  SetParamObjetivo(hAsaltoFortaleza, "Oleada", "BarridoMuralla", fNumTropas, fNumTropas, fDescanso, fDescanso, FALSE, 94, 183);
  SetParamObjetivo(hAsaltoFortaleza, "Oleada", "BarridoMuralla", fNumTropas, fNumTropas, fDescanso, fDescanso, FALSE, 84, 142);
  SetParamObjetivo(hAsaltoFortaleza, "Oleada", "AtaquePuerta",   fNumTropas, fNumTropas, fDescanso, fDescanso, FALSE, 84, 142);
  SetParamObjetivo(hAsaltoFortaleza, "Oleada", "AtaquePuerta",   fNumTropas, fNumTropas, fDescanso, fDescanso, FALSE, 94, 183);
  
  AnyadirObjetivo(hEstrategiaFuerte, hAsaltoFortaleza);
  
  
  
  // ## Debil: tienen caballeria. Ataques a la puerta frontal
  
  hAsaltoFortalezaII  = CrearObjetivo(hEstrategiaDebil, "OleadasFortaleza", "CiceronFortress");
  SetParamObjetivo(hAsaltoFortalezaII, "ObjetivoAtracable", hObjetivoDefensaDebil);
  SetParamObjetivo(hAsaltoFortalezaII, "RobarTropasEducadamente", FALSE); // Para no dejar el pueblo vacio
  SetParamObjetivo(hAsaltoFortalezaII, "Secuencial", FALSE); // Oleadas aleatorias
  
  SetParamObjetivo(hAsaltoFortalezaII, "ResetComposicion", "AtaquePuerta");
  SetParamObjetivo(hAsaltoFortalezaII, "AddComposicion", "AtaquePuerta", "FORT_ARIETE", 1, TRUE);
  SetParamObjetivo(hAsaltoFortalezaII, "AddComposicion", "AtaquePuerta", "FORT_CABALLERIA_PESADA", 3, FALSE); 
  SetParamObjetivo(hAsaltoFortalezaII, "AddComposicion", "AtaquePuerta", "FORT_CABALLERIA_ARQUERA", 1, FALSE);
  SetParamObjetivo(hAsaltoFortalezaII, "AddComposicion", "AtaquePuerta", "FORT_PIQUEROS", 1, FALSE);

  SetParamObjetivo(hAsaltoFortalezaII, "ResetComposicion", "BarridoRaso");
  SetParamObjetivo(hAsaltoFortalezaII, "AddComposicion", "BarridoRaso", "FORT_CABALLERIA_PESADA", 2, FALSE); 
  SetParamObjetivo(hAsaltoFortalezaII, "AddComposicion", "BarridoRaso", "FORT_CABALLERIA_ARQUERA", 2, FALSE);
  SetParamObjetivo(hAsaltoFortalezaII, "AddComposicion", "BarridoRaso", "FORT_PIQUEROS", 2, FALSE);

  SetParamObjetivo(hAsaltoFortalezaII, "Oleada", "AtaquePuerta", fNumTropasII, fNumTropasII, fDescansoII, fDescansoII, FALSE, 60, 132);
  SetParamObjetivo(hAsaltoFortalezaII, "Oleada", "BarridoRaso",  fNumTropasII, fNumTropasII, fDescansoII, fDescansoII, FALSE, 60, 132);
  
  AnyadirObjetivo(hEstrategiaDebil, hAsaltoFortalezaII);
  
  
  
  // ## Medios: tienen infanteria. Ataques a la puerta y a la muralla de la izquierda
  
  hAsaltoFortalezaIII = CrearObjetivo(hEstrategiaMedia, "OleadasFortaleza", "CiceronFortress");
  SetParamObjetivo(hAsaltoFortalezaIII, "ObjetivoAtracable", hObjetivoDefensaMedia);
  SetParamObjetivo(hAsaltoFortalezaIII, "RobarTropasEducadamente", FALSE); // Para no dejar el pueblo vacio
  SetParamObjetivo(hAsaltoFortalezaIII, "Secuencial", FALSE); // Oleadas aleatorias
  
  SetParamObjetivo(hAsaltoFortalezaIII, "ResetComposicion", "AsaltoMuralla");
  SetParamObjetivo(hAsaltoFortalezaIII, "AddComposicion", "AsaltoMuralla", "FORT_TORRE_ASALTO", 2, TRUE);
  SetParamObjetivo(hAsaltoFortalezaIII, "AddComposicion", "AsaltoMuralla", "FORT_MELEE_PESADA", 3, FALSE);
  SetParamObjetivo(hAsaltoFortalezaIII, "AddComposicion", "AsaltoMuralla", "FORT_DISTANCIA", 1, FALSE);
  
  SetParamObjetivo(hAsaltoFortalezaIII, "ResetComposicion", "BarridoMuralla");
  SetParamObjetivo(hAsaltoFortalezaIII, "AddComposicion", "BarridoMuralla", "FORT_TORRE_ASALTO", 1, TRUE);
  SetParamObjetivo(hAsaltoFortalezaIII, "AddComposicion", "BarridoMuralla", "FORT_MELEE_PESADA", 1, FALSE);
  SetParamObjetivo(hAsaltoFortalezaIII, "AddComposicion", "BarridoMuralla", "FORT_PIQUEROS", 1, FALSE);
  SetParamObjetivo(hAsaltoFortalezaIII, "AddComposicion", "BarridoMuralla", "FORT_DISTANCIA", 3, FALSE);
  
  SetParamObjetivo(hAsaltoFortalezaIII, "ResetComposicion", "AtaquePuerta");
  SetParamObjetivo(hAsaltoFortalezaIII, "AddComposicion", "AtaquePuerta", "FORT_ARIETE", 1, TRUE);
  SetParamObjetivo(hAsaltoFortalezaIII, "AddComposicion", "AtaquePuerta", "FORT_MELEE_PESADA", 2, FALSE);
  SetParamObjetivo(hAsaltoFortalezaIII, "AddComposicion", "AtaquePuerta", "FORT_PIQUEROS", 2, FALSE);
  SetParamObjetivo(hAsaltoFortalezaIII, "AddComposicion", "AtaquePuerta", "FORT_DISTANCIA", 1, FALSE);

  SetParamObjetivo(hAsaltoFortalezaIII, "ResetComposicion", "BarridoRaso");
  SetParamObjetivo(hAsaltoFortalezaIII, "AddComposicion", "BarridoRaso", "FORT_MELEE_PESADA", 2, FALSE); 
  SetParamObjetivo(hAsaltoFortalezaIII, "AddComposicion", "BarridoRaso", "FORT_PIQUEROS", 2, FALSE);
  SetParamObjetivo(hAsaltoFortalezaIII, "AddComposicion", "BarridoRaso", "FORT_DISTANCIA", 2, FALSE);

  SetParamObjetivo(hAsaltoFortalezaIII, "Oleada", "AsaltoMuralla",  fNumTropasIII, fNumTropasIII, fDescansoIII, fDescansoIII, FALSE, 27, 140);
  SetParamObjetivo(hAsaltoFortalezaIII, "Oleada", "BarridoMuralla", fNumTropasIII, fNumTropasIII, fDescansoIII, fDescansoIII, FALSE, 27, 140);
  SetParamObjetivo(hAsaltoFortalezaIII, "Oleada", "AsaltoMuralla",  fNumTropasIII, fNumTropasIII, fDescansoIII, fDescansoIII, FALSE, 46, 132);
  SetParamObjetivo(hAsaltoFortalezaIII, "Oleada", "BarridoMuralla", fNumTropasIII, fNumTropasIII, fDescansoIII, fDescansoIII, FALSE, 46, 132);
  SetParamObjetivo(hAsaltoFortalezaIII, "Oleada", "AtaquePuerta",   fNumTropasIII, fNumTropasIII, fDescansoIII, fDescansoIII, FALSE, 46, 132);
  SetParamObjetivo(hAsaltoFortalezaIII, "Oleada", "BarridoRaso",    fNumTropasIII, fNumTropasIII, fDescansoIII, fDescansoIII, FALSE, 46, 132);

  AnyadirObjetivo(hEstrategiaMedia, hAsaltoFortalezaIII);
  
  
  // ## Arrancamos las oleadas
  SetParamObjetivo(hAsaltoFortaleza,    "RetardoSiguiente", 0);
  SetParamObjetivo(hAsaltoFortalezaII,  "RetardoSiguiente", 90);
  SetParamObjetivo(hAsaltoFortalezaIII, "RetardoSiguiente", 180);
  
  DestruirTrigger("AsaltosPataNegra");
}



//---------------------------------
Trigger "TomarAQuinto" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("ZonaQuinto","Romanos")
)
Var
{
  float x, y;
  handle hCamaraEnd;
  handle hEscape;
}
Do
{

  // cinemática: habla quinto
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
      
  EncolarTrayectoriaMirarEnteCamara("Ciceron", TRUE, FALSE, 2, 0);
  IntroducirLocucion("13C0", "LTEXT_MISION13_EVENTO2_00_TXT", 5000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("13C1", "LTEXT_MISION13_EVENTO2_01_TXT", 6000, 600, 100);
  IntroducirPuntoSincronia();
  
  EncolarTrayectoriaMirarEnteCamara("Ciceron",FALSE, TRUE, 0, 2);  
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

  bQuinto = TRUE; 
  bMeet = TRUE;
  
  IndicarObjetivoCumplido(hObjGoToFortress);
  bObjGoToFortress = TRUE;
  
  AgregarObjetivoMision(hObjDefenseFortress, "LTEXT_MISION13_OBJETIVO_03_TXT");
  AgregarObjetivoMision(hObjDestroy23Towns, "LTEXT_MISION13_OBJETIVO_04_TXT");
  ObjetivosMisionCambiados();
  
  //DisposeHandle(&hObjetivoDefensaFortaleza);
	
	// Le doy las tropas de la fortaleza y el barracon
	CambiarBandoPorGrupo("G_DEFENSA_QUINTO", "Romanos");
	CambiarBandoFortaleza("CiceronFortress", "Romanos");
	
	SetActitudAgresivaGrupo("G_DEFENSA_QUINTO", TRUE);
	
	DestruirTrigger("TomarAQuinto");
	
	ActivarTrigger("AsaltosPataNegra");
}



//---------------------------------
Trigger "PasarAsaltoDePegaAOfensivo" [Inactivo]
(
  HanEntradoCivilizacionesEnZona("CercaFortaleza", "Romanos")
)
Do
{
  SetParamObjetivo(hObjetivoAsaltoDePega, "MantenerDefensivo", FALSE);
  DestruirTrigger("PasarAsaltoDePegaAOfensivo");
}


//---------------------------------
Trigger "IntroduccionCiceron" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("ZonaBandidos","Romanos")
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

  // aliamos
  CrearAlianzaPorNombre("IX Legion", "Romanos");

	// les ponemos a andar
  SetMoverFisicoTropa("LANCEROS1", TRUE);	
  SetMoverFisicoTropa("LANCEROS2", TRUE);
  TropaSigueRutaPredefinida("LANCEROS1", "EVENTO1_1");
  TropaSigueRutaPredefinida("LANCEROS2", "EVENTO1_2");
  TropaSigueRutaPredefinida("LANCEROS3", "EVENTO1_3");

  // breve pausa
  hTimer = CrearTimer(500);
  Wait(hTimer);
  
  // ahora a labieno
  OrdenarTropaMantenerPosicion("Labieno", TRUE);
  OrdenarTropaMantenerPosicion("Labieno", FALSE);
  SetMoverFisicoTropa("Labieno", TRUE);
  TropaSigueRutaPredefinida("Labieno", "EVENTO1_4");

	// evento
  // handle de final
  hCamaraEnd = CrearHandle("Bool");
  hEscape = CrearHandle("Bool");

  // cazar escape
  PonerHandleInterrupcion(hEscape);
  
  // posición actual
  DarPosicionCamara(&x, &y);

  // cine
  ActivarCinemascope(TRUE);
    
  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolaTrayectoriaCamara("EVENTO1_1", TRUE, FALSE, 2, 0);
  EncolarPausaCamara(4000);
  IntroducirLocucion("13B0", "LTEXT_MISION13_EVENTO1_00_TXT", 7000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("13B1", "LTEXT_MISION13_EVENTO1_01_TXT", 3000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirPuntoSincronia();
  
  EncolaTrayectoriaCamara("EVENTO1_2", FALSE, FALSE, 0, 0);
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
  ActivarCinemascope(FALSE);
	
  // visto
  bMeet = TRUE;	
	
	// comportamiento
  ActivarTrigger("G_RECLUTAMIENTOllego");  
  //hGuia = CrearObjetivo(hEstrategiaCiceron, "MostrarRuta", "CaminoAconsejable", "Romanos");
  hGuia = CrearObjetivo(hEstrategiaCiceron, "RutaCiceron", "CaminoAconsejable", "Romanos");
  AnyadirGrupoAObjetivo(hGuia, "G_RECLUTAMIENTO");
  SetParamObjetivo(hGuia, "RangoDeteccionTropas", 20);
  SetParamObjetivo(hGuia, "RangoEsperaTropas", 12);
  SetParamObjetivo(hGuia, "PuedeHuir", FALSE);
  SetParamObjetivo(hGuia, "EsperarATodosParaContinuar", FALSE);
  AnyadirObjetivo(hEstrategiaCiceron,  hGuia);
  
  // fuera correr automática  
  SetMoverFisicoTropa("LANCEROS1", FALSE);	
  SetMoverFisicoTropa("LANCEROS2", FALSE);
  SetMoverFisicoTropa("Labieno", FALSE);
    
  DestruirTrigger("IntroduccionCiceron");

}






//---------------------------------
Trigger "EntrarEnZVigiaI" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_VIGIAI","Romanos")
 	&&
 	(DarTropasVivasDeGrupo("G_VIGIAI") != 0) 	
)
Var
{
  handle hRefuerzo;
}
Do
{
  
  MensajeLocucionado("13N5","LTEXT_MISION13_MENSAJE_00_TXT");
  
  if (bQuinto)
  {
    
    CambiarBandoPorGrupo("G_VIGIAI", "Romanos"); 
  }
  else
  {
    DisposeHandle(&hG_Alis1);
    
    hRefuerzo = CrearObjetivo(hEstrategiaCiceron, "Refuerzo", hObjetivoDefensaFortaleza);
    AnyadirGrupoAObjetivo(hRefuerzo , "G_VIGIAI");
    AnyadirObjetivo(hEstrategiaCiceron, hRefuerzo);
    DarObjetivo2CPU(hRefuerzo, TRUE);
    ActivarTrigger("G_VIGIAIllego"); 
  }
  
  bMeet = TRUE;
  
  DestruirTrigger("EntrarEnZVigiaI"); 
  
}

//---------------------------------
Trigger "EntrarEnZVigiaII" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_VIGIAII","Romanos")
 	&&
 	(DarTropasVivasDeGrupo("G_VIGIAII") != 0)
)
Var
{
  handle hRefuerzo;
}
Do
{
  
  MensajeLocucionado("13N5","LTEXT_MISION13_MENSAJE_00_TXT");
  
  if (bQuinto)
  {
    CambiarBandoPorGrupo("G_VIGIAII", "Romanos"); 
  }
  else
  {
    DisposeHandle(&hG_Alis2);

    hRefuerzo = CrearObjetivo(hEstrategiaCiceron, "Refuerzo", hObjetivoDefensaFortaleza);
    AnyadirGrupoAObjetivo(hRefuerzo , "G_VIGIAII");
    AnyadirObjetivo(hEstrategiaCiceron, hRefuerzo);
    DarObjetivo2CPU(hRefuerzo, TRUE);

    ActivarTrigger("G_VIGIAIIllego");
  }
  bMeet = TRUE;
  DestruirTrigger("EntrarEnZVigiaII"); 
}

//---------------------------------
Trigger "EntrarEnZVigiaIII" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_VIGIAIII","Romanos")
 	&&
 	(DarTropasVivasDeGrupo("G_VIGIAIII") != 0)
)
Var
{
  handle hRefuerzo;
}
Do
{
  
  MensajeLocucionado("13N5","LTEXT_MISION13_MENSAJE_00_TXT");
  
  if (bQuinto)
  {
    CambiarBandoPorGrupo("G_VIGIAIII", "Romanos"); 
  }
  else
  {
    DisposeHandle(&hG_Alis3);

    hRefuerzo = CrearObjetivo(hEstrategiaCiceron, "Refuerzo", hObjetivoDefensaFortaleza);
    AnyadirGrupoAObjetivo(hRefuerzo , "G_VIGIAIII");
    AnyadirObjetivo(hEstrategiaCiceron, hRefuerzo);
    DarObjetivo2CPU(hRefuerzo, TRUE);

    ActivarTrigger("G_VIGIAIIIllego");
  }
  
  bMeet = TRUE;
  
  DestruirTrigger("EntrarEnZVigiaIII"); 
  
}

//---------------------------------
Trigger "EntrarEnZVigiaIV" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_VIGIAIV","Romanos")
 	&&
 	(DarTropasVivasDeGrupo("G_VIGIAIV") != 0)
)
Var
{
  handle hRefuerzo;
}
Do
{
  
  
  MensajeLocucionado("13N5","LTEXT_MISION13_MENSAJE_00_TXT");
  
  if (bQuinto)
  {
    CambiarBandoPorGrupo("G_VIGIAIV", "Romanos");
  }
  else
  {
    DisposeHandle(&hG_Alis4);
    
    hRefuerzo = CrearObjetivo(hEstrategiaCiceron, "Refuerzo", hObjetivoDefensaFortaleza);
    AnyadirGrupoAObjetivo(hRefuerzo , "G_VIGIAIV");
    AnyadirObjetivo(hEstrategiaCiceron, hRefuerzo);
    DarObjetivo2CPU(hRefuerzo, TRUE);

    ActivarTrigger("G_VIGIAIVllego"); 
  }
  
  bMeet = TRUE; 
  
  DestruirTrigger("EntrarEnZVigiaIV");  
  
}






//---------------------------------
Trigger "G_VIGIAIllego" [Inactivo]
(
  bQuinto
 	&& DarNumUnidadesEnZona("IX Legion", "ZonaQuinto") > 1
)
Do
{
  CambiarBandoPorGrupo("G_VIGIAI", "Romanos");
  DestruirTrigger("G_VIGIAIllego");  
}

//---------------------------------
Trigger "G_VIGIAIIllego" [Inactivo]
(
  bQuinto
 	&& DarNumUnidadesEnZona("IX Legion", "ZonaQuinto") > 1
)
Do
{
  CambiarBandoPorGrupo("G_VIGIAII", "Romanos");
  DestruirTrigger("G_VIGIAIIllego");  
}

//---------------------------------
Trigger "G_VIGIAIIIllego" [Inactivo]
(
  bQuinto
 	&& DarNumUnidadesEnZona("IX Legion", "ZonaQuinto") > 1
)
Do
{
  CambiarBandoPorGrupo("G_VIGIAIII", "Romanos");
  DestruirTrigger("G_VIGIAIIIllego");  
}

//---------------------------------
Trigger "G_VIGIAIVllego" [Inactivo]
(
  bQuinto
 	&& DarNumUnidadesEnZona("IX Legion", "ZonaQuinto") > 1
)
Do
{
  CambiarBandoPorGrupo("G_VIGIAIV", "Romanos");
  DestruirTrigger("G_VIGIAIVllego");  
}

//---------------------------------
Trigger "G_RECLUTAMIENTOllego" [Inactivo]
(
  bQuinto
 	&& DarNumUnidadesEnZona("IX Legion", "ZonaQuinto") > 1
)
Do
{
  CambiarBandoPorGrupo("G_RECLUTAMIENTO", "Romanos");
  DestruirTrigger("G_RECLUTAMIENTOllego");  
}


//---------------------------------
Trigger "GameOver" [Inactivo]
(
 	!EstaTropaViva("Ciceron")
 	||
 	!EstaTropaViva("Labieno")
)
Do
{
  
  if ( !EstaTropaViva("Ciceron") )
  {
    IndicarObjetivoFracasado(hQuintusMustSurvive);
  }
  
  if ( !EstaTropaViva("Labieno") )
  {
    IndicarObjetivoFracasado(hLabienoMustSurvive);
  }
  
  FinalizarMision(FALSE);
  
  DestruirTrigger("GameOver");  
}

//----------------------------------
Trigger "GameOverII" [Inactivo]
(
 	EstructuraDestruida("BarraconCiceron")
)
Do
{

  if (bQuinto)  
  {
    IndicarObjetivoFracasado(hObjDefenseFortress);
  }
  else
  {
    IndicarObjetivoFracasado(hObjGoToFortress);
  }
   
  FinalizarMision(FALSE);
  
  DestruirTrigger("GameOverII");  
}

//----------------------------------
Trigger "GameOverIII" [Inactivo]
(
  CivilizacionEstaKO("Romanos")
)
Do
{
    
  FinalizarMision(FALSE);
  
  DestruirTrigger("GameOverIII");  
}

//----------------------------------
Trigger "EXITO" [Inactivo]
(
 	bObjGoToFortress &&
  bQuintusMustSurvive	&&
  bObjDestroy23Towns &&
  bObjDefenseFortress
)
Do
{
  DestruirTrigger("GameOverI");
  DestruirTrigger("GameOverII");
  DestruirTrigger("GameOverIII");
 
  IndicarObjetivoCumplido(hObjDestroy23Towns);  
  IndicarObjetivoCumplido (hQuintusMustSurvive);
  IndicarObjetivoCumplido (hLabienoMustSurvive);
  IndicarObjetivoCumplido (hObjDefenseFortress);
  FinalizarMision(TRUE);
  
  DestruirTrigger("EXITO");  
}

//----------------------------------
Trigger "PueblosDestruidos" [Inactivo]
(
  DarNumPueblosConqDestr("Romanos", "Nastum", "Ariola", "Basilia") == 2
)
Do
{  
  bQuintusMustSurvive = TRUE;
  bLabienoMustSurvive = TRUE;
  bObjDestroy23Towns = TRUE;
  bObjDefenseFortress = TRUE;
    
  DestruirTrigger("PueblosDestruidos");
  
}

// Un movimiento de tropas cuando petas un pueblo 
//----------------------------------
Trigger "PuebloDestruido" [Inactivo]
(
  DarNumPueblosConqDestr("Romanos", "Nastum", "Ariola", "Basilia") == 1
)
Do
{     
  CambiarObjetivo(hG_B, "AtacarPunto", 75, 45);
  
  CambiarObjetivo(hG_A, "AtacarPunto", 202, 69);
        
  DestruirTrigger("PuebloDestruido");
}

// ---------------------------
Trigger "End" [ Activo ]  
(
  TRUE
)
Do
{
}