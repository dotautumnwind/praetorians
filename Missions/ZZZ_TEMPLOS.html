
Var
{	
  
  // estrategias y objetivos
  
  // civs
  handle hCivFenicios             = NULL;
  handle hCivSamaritanos          = NULL;
  handle hCivJudios               = NULL;
  handle hCivNabateos             = NULL;
  
  // estrategias
  handle hEstFenicios             = NULL;
  handle hEstSamaritanos          = NULL;
  handle hEstJudios               = NULL;
  handle hEstNabateos             = NULL;

  // defensas de pueblos
  handle hObjDPTiro               = NULL;
  handle hObjDPSamaria            = NULL;
  handle hObjDPJazer              = NULL;
  handle hObjDPGerasa             = NULL;
  handle hObjDPJerusalem          = NULL;
  handle hObjDPPetra              = NULL;
  
  // patrullas
  handle hObjPSamaritanos         = NULL;
  handle hObjPFenicios            = NULL;
  handle hObjPJudios              = NULL;
  handle hObjPNabateos            = NULL;
  
  // mantener posiciones
  handle hObjMPFenicios1          = NULL;
  handle hObjMPNabateos1          = NULL;
  handle hObjMPNabateos2          = NULL;
  
  // ataques
  handle hObjATFenicios1          = NULL;
  handle hObjATNabateos1          = NULL;
  handle hObjATNabateos2          = NULL;
  handle hObjATNabateos3          = NULL;
  
  
  // bandos y diplomacia
  bool bSamaritanosNeutrales      = TRUE;   // empiezan neutrales
  bool bJudiosNeutrales           = TRUE;   // empiezan neutrales

  bool bTiroCapturada             = FALSE;
  bool bSamariaCapturada          = FALSE;
  bool bJerusalemCapturada        = FALSE;
  bool bPetraCapturada            = FALSE;
  
  // briefing
  float fPuntoSincronia           = 0;
  handle hPuntoSincronia          = NULL;
  
  // objetivos de misión
  handle hObjTiro                 = NULL;
  handle hObjSamaria              = NULL;
  handle hObjJerusalem            = NULL;
  handle hObjPetra                = NULL;
  handle hObjPublioVivo           = NULL;
  handle hObjCasioVivo            = NULL;
  
  // niveles de dificultad
  float fNivelDificultad          = 0;
  float fDelayEntrenamiento       = 0;
  float fPotenciaPatrullas1       = 0;
  float fPotenciaPatrullas2       = 0;
  
  // otros
  bool bUsadaReservaNabatea       = FALSE;
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
   
  // adelante el briefing
  ActivarTrigger("Briefing");
  
}



Trigger "Main2" [Inactivo]
(
  TRUE
)
Var
{
  handle  hTimer;
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
  
  // Restricciones de reclutamiento
  
  // Craso: dejamos reclutar honderos baleares
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GLADIADOR", "CRASO");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "PIQUERO_ELITE", "CRASO");
    
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_GERMANA", "CRASO");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_ESPADON", "CRASO");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_CAZADOR", "CRASO");
  
  // Fenicia: dejamos reclutar piqueros, arqueros e inf. ligera
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_PESADA", "FENICIOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_CABALLERIA_PESADA", "FENICIOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_CABALLERIA_ARQUERA", "FENICIOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_PARTHA", "FENICIOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_CUADRIGA", "FENICIOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_ARQUERON", "FENICIOS");
  
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "", "FENICIOS");


  // Samaria: inf. ligera, arqueros y piqueros
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_PESADA", "SAMARITANOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_CABALLERIA_PESADA", "SAMARITANOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_CABALLERIA_ARQUERA", "SAMARITANOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_PARTHA", "SAMARITANOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_CUADRIGA", "SAMARITANOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_ARQUERON", "SAMARITANOS");
  
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "", "SAMARITANOS");
  
  // Judea: inf. pesada, arqueros y inf. ligera
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_PIQUERO", "JUDIOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_CABALLERIA_PESADA", "JUDIOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_CABALLERIA_ARQUERA", "JUDIOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_PARTHA", "JUDIOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_CUADRIGA", "JUDIOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_ARQUERON", "JUDIOS");
  
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "", "JUDIOS");

  // Nabateos: caballerias, inf. ligera y arqueros
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_PIQUERO", "NABATEOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_PESADA", "NABATEOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_PARTHA", "NABATEOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_CUADRIGA", "NABATEOS");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_ARQUERON", "NABATEOS");

  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "", "NABATEOS");
  
  // niveles de dificultad
  fNivelDificultad = DarDificultadMision();
  
  if ( fNivelDificultad == 1 )
  {
    fDelayEntrenamiento = 160000;
    fPotenciaPatrullas1 = 5000;
    fPotenciaPatrullas2 = 3000;
  }
  else
  if ( fNivelDificultad == 2 )
  {
    fDelayEntrenamiento = 120000;
    fPotenciaPatrullas1 = 7000;
    fPotenciaPatrullas2 = 5000;
    QuitarRestriccionUnidad("ORDEN_CONSTRUIR", "CATAPULTA_EGIPCIA", "FENICIOS");
    QuitarRestriccionUnidad("ORDEN_CONSTRUIR", "BALLESTA_MOVIL_EGIPCIA", "FENICIOS");
  }
  else
  if ( fNivelDificultad == 3 )
  {
    fPotenciaPatrullas1 = 10000;
    fPotenciaPatrullas2 = 5000;
    fDelayEntrenamiento = 60000;
    QuitarRestriccionUnidad("ORDEN_CONSTRUIR", "CATAPULTA_EGIPCIA", "FENICIOS");
    QuitarRestriccionUnidad("ORDEN_CONSTRUIR", "BALLESTA_MOVIL_EGIPCIA", "FENICIOS");
  }
  else
  {
    MensajeChat("Nivel de dificultad chungo, oiga: ", fNivelDificultad);
    fDelayEntrenamiento = 120000;
    fNivelDificultad = 2;
    fPotenciaPatrullas1 = 7000;
    fPotenciaPatrullas2 = 5000;
    QuitarRestriccionUnidad("ORDEN_CONSTRUIR", "CATAPULTA_EGIPCIA", "FENICIOS");
    QuitarRestriccionUnidad("ORDEN_CONSTRUIR", "BALLESTA_MOVIL_EGIPCIA", "FENICIOS");
  }
  
  // objetivos: faltan héroes
  hObjTiro        = CrearHandle("Bool");
  hObjSamaria     = CrearHandle("Bool");
  hObjJerusalem   = CrearHandle("Bool");
  hObjPetra       = CrearHandle("Bool");
  hObjPublioVivo  = CrearHandle("Bool");
  hObjCasioVivo   = CrearHandle("Bool");
  
  AgregarObjetivoMision(hObjTiro, "LTEXT_MISION11_OBJETIVO_02_TXT");
  AgregarObjetivoMision(hObjSamaria, "LTEXT_MISION11_OBJETIVO_01_TXT");
  AgregarObjetivoMision(hObjJerusalem, "LTEXT_MISION11_OBJETIVO_00_TXT");
  AgregarObjetivoMision(hObjPetra, "LTEXT_MISION11_OBJETIVO_03_TXT");
  AgregarObjetivoMision(hObjPublioVivo, "LTEXT_MISION11_OBJETIVO_04_TXT");
  AgregarObjetivoMision(hObjCasioVivo, "LTEXT_MISION11_OBJETIVO_05_TXT");

  // inicializamos estrategias
  hCivFenicios = DarCivilizacion("FENICIOS");
  hEstFenicios = CrearEstrategiaScript();
  AsignarEstrategia(hCivFenicios, hEstFenicios);
  StartEstrategia(hEstFenicios);

  hCivSamaritanos = DarCivilizacion("SAMARITANOS");
  hEstSamaritanos = CrearEstrategiaEscaramuza();
  EjecutarPlanificador(hEstSamaritanos, FALSE);  
  ProhibirObjetivo(hEstSamaritanos, "_Todos" , TRUE);
  AsignarEstrategia(hCivSamaritanos, hEstSamaritanos);
  SetParamEstrategia(hEstSamaritanos, "ConquistarPuebloPorAviso", FALSE);
  StartEstrategia(hEstSamaritanos);

  hCivJudios = DarCivilizacion("JUDIOS");
  hEstJudios = CrearEstrategiaEscaramuza();
  EjecutarPlanificador(hEstJudios, FALSE);
  ProhibirObjetivo(hEstJudios, "_Todos" , TRUE);
  AsignarEstrategia(hCivJudios, hEstJudios);
  SetParamEstrategia(hEstJudios, "ConquistarPuebloPorAviso", FALSE);  
  StartEstrategia(hEstJudios);

  hCivNabateos = DarCivilizacion("NABATEOS");
  hEstNabateos = CrearEstrategiaScript();
  AsignarEstrategia(hCivNabateos, hEstNabateos);
  StartEstrategia(hEstNabateos);
  
  // delays y cosas de esas
  SetDelayEntrenamientoTropasPueblo(hEstFenicios, "TIRO",fDelayEntrenamiento);
  SetDelayEntrenamientoTropasPueblo(hEstSamaritanos, "SAMARIA", fDelayEntrenamiento);
  SetDelayEntrenamientoTropasPueblo(hEstSamaritanos, "GERASA", fDelayEntrenamiento);
  SetDelayEntrenamientoTropasPueblo(hEstJudios, "JERUSALEM", fDelayEntrenamiento);
  SetDelayEntrenamientoTropasPueblo(hEstJudios, "JAZER", fDelayEntrenamiento);
  SetDelayEntrenamientoTropasPueblo(hEstNabateos, "PETRA", fDelayEntrenamiento);
 
  
  // objetivos
  
  // pueblos
  hObjDPTiro = CrearObjetivo(hEstFenicios, "ConquistaPueblo2", "TIRO");
  AnyadirGrupoAObjetivo(hObjDPTiro, "FEN_PUEBLO");
  AnyadirObjetivo(hEstFenicios, hObjDPTiro);
  SetParamObjetivo(hObjDPTiro, "PuedePedirRefuerzos", FALSE);

  hObjDPPetra = CrearObjetivo(hEstNabateos, "ConquistaPueblo2", "PETRA");
  AnyadirGrupoAObjetivo(hObjDPPetra, "NAB_PUEBLO");
  AnyadirObjetivo(hEstNabateos, hObjDPPetra);
  SetParamObjetivo(hObjDPPetra, "PuedePedirRefuerzos", FALSE);

  // posiciones
  hObjMPFenicios1 = CrearObjetivo(hEstFenicios, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hObjMPFenicios1, "FEN_GRUPO1");
  AnyadirObjetivo(hEstFenicios, hObjMPFenicios1);
  
  hObjMPNabateos1 = CrearObjetivo(hEstNabateos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hObjMPNabateos1, "NAB_OASIS1");
  AnyadirObjetivo(hEstNabateos, hObjMPNabateos1);

  hObjMPNabateos2 = CrearObjetivo(hEstNabateos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hObjMPNabateos2, "NAB_OASIS2");
  AnyadirObjetivo(hEstNabateos, hObjMPNabateos2);
  
  // oleadas nabateas y fenicias
  hObjPNabateos = CrearObjetivo
        (hEstNabateos, "PatrullaOleadasPeriodicas", fPotenciaPatrullas1, fPotenciaPatrullas1, 120, 480);
  SetParamObjetivo(hObjPNabateos, "ObjetivoAtracable", hObjDPPetra);
  SetParamObjetivo(hObjPNabateos, "ForzarAccion", "ATACAR");
  AnyadirObjetivo(hEstNabateos, hObjPNabateos);
  
  hObjPFenicios = CrearObjetivo
        (hEstFenicios, "PatrullaOleadasPeriodicas", fPotenciaPatrullas2, fPotenciaPatrullas2, 120, 480);
  SetParamObjetivo(hObjPFenicios, "ObjetivoAtracable", hObjDPTiro);
  SetParamObjetivo(hObjPFenicios, "ForzarAccion", "ATACAR");
  AnyadirObjetivo(hEstFenicios, hObjPFenicios);

  
  // composición de las fuerzas reclutadas por el ordenador
  // fenicios
  ResetGruposTropasAEntrenar(hEstFenicios);
  SetValue(hEstFenicios, "GRUPOTROPAS_A_ENTRENAR", "LIGERA", 20);
  SetValue(hEstFenicios, "GRUPOTROPAS_A_ENTRENAR", "PIQUEROS", 40);
  SetValue(hEstFenicios, "GRUPOTROPAS_A_ENTRENAR", "ARQUEROS", 40);

  // samaritanos
  ResetGruposTropasAEntrenar(hEstSamaritanos);
  SetValue(hEstSamaritanos, "GRUPOTROPAS_A_ENTRENAR", "LIGERA", 20);
  SetValue(hEstSamaritanos, "GRUPOTROPAS_A_ENTRENAR", "PIQUEROS", 40);
  SetValue(hEstSamaritanos, "GRUPOTROPAS_A_ENTRENAR", "ARQUEROS", 40);
  
  // judios
  ResetGruposTropasAEntrenar(hEstJudios);
  SetValue(hEstJudios, "GRUPOTROPAS_A_ENTRENAR", "LIGERA", 20);
  SetValue(hEstJudios, "GRUPOTROPAS_A_ENTRENAR", "PIQUEROS", 20);
  SetValue(hEstJudios, "GRUPOTROPAS_A_ENTRENAR", "PESADAS", 60);
  
  // nabateos
  ResetGruposTropasAEntrenar(hEstNabateos);
  SetValue(hEstNabateos, "GRUPOTROPAS_A_ENTRENAR", "CABALLERIA", 80);
  SetValue(hEstNabateos, "GRUPOTROPAS_A_ENTRENAR", "LIGERA", 20);
  

  // Modificaciones por dificultad
  // Y si el nivel de dificultad es el adecuado...
  if ( fNivelDificultad == 3 )
  {
   
  }
 
  // triggers de mision  
  ActivarTrigger("AtaqueTiro");
  ActivarTrigger("AtaqueNabateo1");
  ActivarTrigger("AtaqueNabateo2");
  
  ActivarTrigger("MosqueoSamaritano");
  ActivarTrigger("AliadoSamaritano");
  ActivarTrigger("MosqueoJudio");
  ActivarTrigger("AliadoJudio");
  
  ActivarTrigger("JerusalemConquistada");
  ActivarTrigger("TiroConquistada");
  ActivarTrigger("SamariaConquistada");
  ActivarTrigger("JerusalemConquistada");
  ActivarTrigger("PetraConquistada");

  // esperamos un poco antes de lanzar el mensajero samaritano
  hTimer = CrearTimer(5000);
  Wait(hTimer);

  ActivarTrigger("MensajeroSamaritano");
  ActivarTrigger("MensajeroJudio1");
  ActivarTrigger("MensajeroJudio2");
  
    
  // fueeeeeeera
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
  ActivarPresentacion(TRUE, "LTEXT_MISION11_PRESENTACION_TITULO",
                            "LTEXT_MISION11_PRESENTACION_LUGAR", hPresentacion);
                            
  // camara a donde debe empezar
  EncolarColocarYMirarPunto("TOMA_0");
  EjecutarOrdenesCamara();
  
  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));
 
  ActivarPresentacion(FALSE, "", "", NULL);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);
  
  EncolaTrayectoriaCamara("BRIEFING_1", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(2000);
  IntroducirLocucion("11N0", "LTEXT_MISION11_LOCUCION_00_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();        

  EncolaTrayectoriaCamara("BRIEFING_2", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("11N1", "LTEXT_MISION11_LOCUCION_01_TXT", 4000, 600, 100);
  IntroducirPuntoSincronia();        

  EncolaTrayectoriaCamara("BRIEFING_3", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  IntroducirLocucion("", "", 100, 0, 0);  
  IntroducirLocucion("11N2", "LTEXT_MISION11_LOCUCION_02_TXT", 4000, 600, 100);
  IntroducirPuntoSincronia();        

  EncolaTrayectoriaCamara("BRIEFING_4", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);    
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("11N3", "LTEXT_MISION11_LOCUCION_03_TXT", 4000, 600, 100);
  IntroducirPuntoSincronia();        

  EncolaTrayectoriaCamara("BRIEFING_5", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(2000);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("11N4", "LTEXT_MISION11_LOCUCION_04_TXT", 4000, 600, 100);
  IntroducirPuntoSincronia();        

  EncolaTrayectoriaCamara("BRIEFING_6", FALSE, FALSE, 0, 0);
  IntroducirLocucion("", "", 100, 0, 0);  
  IntroducirLocucion("11N5", "LTEXT_MISION11_LOCUCION_05_TXT", 6000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("11N6", "LTEXT_MISION11_LOCUCION_06_TXT", 2000, 600, 100);
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


////////////////////////////////////////////////////////////////
// MENSAJEROS


// Mensajero Samaritano
Trigger "MensajeroSamaritano" [Inactivo]
(
  TRUE
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
  
  
  // iluminación
  HacerVisibleTropa("SAM_MENSAJERO", TRUE);

  // esperamos a la actualización de la niebla de guerra
  hTimer = CrearTimer(100);
  Wait(hTimer);
  
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
    
  EncolaTrayectoriaCamara("MEN_SAM1", TRUE, FALSE, 2, 0);
  IntroducirLocucion("1190", "LTEXT_MISION11_EVENTO1_01_TXT", 4000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("1191", "LTEXT_MISION11_EVENTO1_02_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();

  EncolarPausaCamara(2000);  
  EncolaTrayectoriaCamara("MEN_SAM2", FALSE, TRUE, 0, 2);
  IntroducirLocucion("", "", 100, 0, 0);  
  IntroducirLocucion("1192", "LTEXT_MISION11_EVENTO1_03_TXT", 4000, 600, 100);
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
    
  // dejamos al paisano iluminao un ratito y le mandamos a su casa
  SetMoverFisicoTropa("SAM_MENSAJERO", TRUE);
  TropaSigueRutaPredefinida("SAM_MENSAJERO", "SAM_MENSAJERO1");  
  
  hTimer = CrearTimer(5000);
  Wait(hTimer);
  
  HacerVisibleTropa("SAM_MENSAJERO", FALSE);

  DestruirTrigger("MensajeroSamaritano");
 
}


// Mensajero judio si el jugador se aproxima por el este
Trigger "MensajeroJudio1" [Inactivo]
(
  HanEntradoCivilizacionesEnZona("ZONA_JUD_MEN1", "CRASO")
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
  
  // que no arranque el otro
  DestruirTrigger("MensajeroJudio2");
 
  // iluminación
  HacerVisibleTropa("JUD_MENSAJERO1", TRUE);

  // esperamos a la actualziación de la niebla de guerra
  hTimer = CrearTimer(100);
  Wait(hTimer);
 
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
    
  EncolaTrayectoriaCamara("MEN_JUD1_1", TRUE, FALSE, 2, 0);
  IntroducirLocucion("11A0", "LTEXT_MISION11_EVENTO2_01_TXT", 4000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("11A1", "LTEXT_MISION11_EVENTO2_02_TXT", 6000, 600, 100);
  IntroducirPuntoSincronia();

  EncolarPausaCamara(1000);  
  EncolaTrayectoriaCamara("MEN_JUD1_2", FALSE, TRUE, 0, 2);
  IntroducirLocucion("", "", 100, 0, 0);  
  IntroducirLocucion("11A2", "LTEXT_MISION11_EVENTO2_03_TXT", 4000, 600, 100);
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
  
  // dejamos al paisano iluminao un ratito y le mandamos a su casa
  SetMoverFisicoTropa("JUD_MENSAJERO1", TRUE);
  TropaSigueRutaPredefinida("JUD_MENSAJERO1", "JUD_MENSAJERO1");  
  
  hTimer = CrearTimer(5000);
  Wait(hTimer);
  
  HacerVisibleTropa("JUD_MENSAJERO1", FALSE);
 
  // sacabó
  DestruirTrigger("MensajeroJudio1");
  
}


// Mensajero judio si en jugador se aproxima por el oeste
Trigger "MensajeroJudio2" [Inactivo]
(
  HanEntradoCivilizacionesEnZona("ZONA_JUD_MEN2", "CRASO")
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

  // que no arranque el otro pues
  DestruirTrigger("MensajeroJudio1");

  // iluminación
  HacerVisibleTropa("JUD_MENSAJERO2", TRUE);

  // esperamos a la actualización de la niebla de guerra
  hTimer = CrearTimer(100);
  Wait(hTimer);
 
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
    
  EncolaTrayectoriaCamara("MEN_JUD2_1", TRUE, FALSE, 2, 0);
  IntroducirLocucion("11A0", "LTEXT_MISION11_EVENTO2_01_TXT", 4000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("11A1", "LTEXT_MISION11_EVENTO2_02_TXT", 6000, 600, 100);
  IntroducirPuntoSincronia();

  EncolarPausaCamara(1000);  
  EncolaTrayectoriaCamara("MEN_JUD2_2", FALSE, TRUE, 0, 2);
  IntroducirLocucion("", "", 100, 0, 0);  
  IntroducirLocucion("11A2", "LTEXT_MISION11_EVENTO2_03_TXT", 4000, 600, 100);
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
  
  // mandamos al otro mensajeiro a casa
  SetMoverFisicoTropa("JUD_MENSAJERO1", TRUE);
  TropaSigueRutaPredefinida("JUD_MENSAJERO1", "JUD_MENSAJERO1");  
  
  // dejamos al paisano iluminao un ratito 
  hTimer = CrearTimer(5000);
  Wait(hTimer);
  
  HacerVisibleTropa("JUD_MENSAJERO2", FALSE); 

  DestruirTrigger("MensajeroJudio2");
  
}



////////////////////////////////////////////////////////////////
// FENICIOS

// fenicios
Trigger "AtaqueTiro" [Inactivo]
(
  HanEntradoCivilizacionesEnZona("ZONA_TIRO1", "CRASO")
  ||
  HanEntradoCivilizacionesEnZona("ZONA_TIRO2", "CRASO")
)
Do
{
  
  // objetivo de ataque lateral
  hObjATFenicios1 = CrearObjetivo(hEstFenicios, "CazaYCaptura");
  AnyadirGrupoAObjetivo(hObjATFenicios1, "FEN_LATERAL");
  AnyadirObjetivo(hEstFenicios, hObjATFenicios1);
    
  // fuera el trigger
  DestruirTrigger("AtaqueTiro");
  
}


// nabateos

// cuando se aproximan tropas a la reserva
Trigger "AtaqueNabateo1" [Inactivo]
(
  HanEntradoCivilizacionesEnZona("ZONA_NAB1", "CRASO")
)
Do
{
  
  // cataquen  
  hObjATNabateos1 = CrearObjetivo(hEstNabateos, "CazaYCaptura");
  AnyadirGrupoAObjetivo(hObjATNabateos1, "NAB_RESERVA1");
  AnyadirObjetivo(hEstNabateos, hObjATNabateos1);
 
  // recordarlo
  bUsadaReservaNabatea = TRUE;
 
  // fueeeera
  DestruirTrigger("AtaqueNabateo1"); 
  
}


// cuando el jugador se aproxima a los nabateos
Trigger "AtaqueNabateo2" [Inactivo]
(
  HanEntradoCivilizacionesEnZona("ZONA_NAB2", "CRASO")
  ||
  HanEntradoCivilizacionesEnZona("ZONA_NAB3", "CRASO")
)
Do
{

  // tropas más próximas
  if ( fNivelDificultad == 3 )
  {
    hObjATNabateos2 = CrearObjetivo(hEstNabateos, "CazaYCaptura");
    AnyadirGrupoAObjetivo(hObjATNabateos2, "NAB_RESERVA2");
    AnyadirObjetivo(hEstNabateos, hObjATNabateos2);
  }
  
  // reserva (si no está usada ya)
  if ( !bUsadaReservaNabatea )
  {
    hObjATNabateos3 = CrearObjetivo(hEstNabateos, "AtacarPunto", 200, 93);
    AnyadirGrupoAObjetivo(hObjATNabateos3, "NAB_RESERVA1");
    AnyadirObjetivo(hEstNabateos, hObjATNabateos3);
  }
  
  
  DestruirTrigger("AtaqueNabateo2");
  DestruirTrigger("AtaqueNabateo1");
  
}



////////////////////////////////////////////////////////////////
// DIPLOMACIA

// SAMARITANOS
Trigger "MosqueoSamaritano" [Inactivo]
(
  EsEstructuraAtacada("GUARNICION_SAMARIA", "CRASO")
  || EsEstructuraAtacada("GUARNICION_GERASA", "CRASO")
  || EsEstructuraAtacada("SAMARIA", "CRASO")
  || EsEstructuraAtacada("GERASA", "CRASO")
  || EstanAliadas("CRASO", "JUDIOS")
)
Do
{
  
  // Mensaje de cabreo
  MensajeLocucionado("11N8","LTEXT_MISION11_MENSAJE_01_TXT");
  
  // Al ataque
  NeutralizarCivilizacion("SAMARITANOS", FALSE);
  
  // objetivos de conquista de pueblos
  hObjDPSamaria = CrearObjetivo(hEstSamaritanos, "ConquistaPueblo2", "SAMARIA");
  AnyadirGrupoAObjetivo(hObjDPSamaria, "SAM_DEF1");
  AnyadirGrupoAObjetivo(hObjDPSamaria, "SAM_PUEBLO1");
  AnyadirObjetivo(hEstSamaritanos, hObjDPSamaria);
  SetParamObjetivo(hObjDPSamaria, "PuedePedirRefuerzos", FALSE);
  
  hObjDPGerasa = CrearObjetivo(hEstSamaritanos, "ConquistaPueblo2", "GERASA");
  AnyadirGrupoAObjetivo(hObjDPGerasa, "SAM_DEF2");
  AnyadirGrupoAObjetivo(hObjDPSamaria, "SAM_PUEBLO2");  
  AnyadirObjetivo(hEstSamaritanos, hObjDPGerasa);
  SetParamObjetivo(hObjDPGerasa, "PuedePedirRefuerzos", FALSE);
  
  EjecutarPlanificador(hEstSamaritanos, TRUE);
  
  // para ponerlo interesante  
  if ( fNivelDificultad == 3 )
  {
    hObjPSamaritanos = CrearObjetivo
          (hEstSamaritanos, "PatrullaOleadasPeriodicas", fPotenciaPatrullas2, fPotenciaPatrullas2, 120, 480);
    SetParamObjetivo(hObjPSamaritanos, "ObjetivoAtracable", hObjDPSamaria);
    SetParamObjetivo(hObjPSamaritanos, "ObjetivoAtracable", hObjDPGerasa);
    SetParamObjetivo(hObjPSamaritanos, "ForzarAccion", "ATACAR");
    AnyadirObjetivo(hEstSamaritanos, hObjPSamaritanos);
  }
  
  
  // sacabó lo de aliarse
  DestruirTrigger("MosqueoSamaritano");
  DestruirTrigger("AliadoSamaritano");
    
}




Trigger "AliadoSamaritano" [Inactivo]
(
  EsEstructuraAtacada("GUARNICION_JERUSALEM", "CRASO")
  || EsEstructuraAtacada("GUARNICION_JAZER", "CRASO")
  || EsEstructuraAtacada("JAZER", "CRASO")
  || EsEstructuraAtacada("JERUSALEM", "CRASO")
)
Do
{
  
  // Mensaje de regocijo
  MensajeLocucionado("11N7","LTEXT_MISION11_MENSAJE_00_TXT");
  AvisoCivilizacion("CRASO", 65, 90);

  // objetivos de conquista de pueblos
  hObjDPSamaria = CrearObjetivo(hEstSamaritanos, "ConquistaPueblo2", "SAMARIA");
  AnyadirGrupoAObjetivo(hObjDPSamaria, "SAM_DEF1");
  AnyadirGrupoAObjetivo(hObjDPSamaria, "SAM_PUEBLO1");
  AnyadirObjetivo(hEstSamaritanos, hObjDPSamaria);
  SetParamObjetivo(hObjDPSamaria, "PuedePedirRefuerzos", FALSE);
  
  hObjDPGerasa = CrearObjetivo(hEstSamaritanos, "ConquistaPueblo2", "GERASA");
  AnyadirGrupoAObjetivo(hObjDPGerasa, "SAM_DEF2");
  AnyadirGrupoAObjetivo(hObjDPSamaria, "SAM_PUEBLO2");
  AnyadirObjetivo(hEstSamaritanos, hObjDPGerasa);
  SetParamObjetivo(hObjDPGerasa, "PuedePedirRefuerzos", FALSE);

  EjecutarPlanificador(hEstSamaritanos, TRUE);

  // permitimos ayudar
  ProhibirObjetivo(hEstSamaritanos, "Apoyo", FALSE);

  // Aliarse
  NeutralizarCivilizacion("SAMARITANOS", FALSE);
  CrearAlianzaPorNombre("CRASO", "SAMARITANOS");
  
  // objetivos y esas cosas
     
  // fueeeeeera
  DestruirTrigger("AliadoSamaritano");
  DestruirTrigger("MosqueoSamaritano");
}


// JUDIOS

Trigger "MosqueoJudio" [Inactivo]
(
  EsEstructuraAtacada("GUARNICION_JERUSALEM", "CRASO")
  || EsEstructuraAtacada("GUARNICION_JAZER", "CRASO")
  || EsEstructuraAtacada("JAZER", "CRASO")
  || EsEstructuraAtacada("JERUSALEM", "CRASO")
)
Do
{
  
  // Mensaje de cabreo
  MensajeLocucionado("11NA","LTEXT_MISION11_MENSAJE_03_TXT");
  
  // Fuera neutralidad
  NeutralizarCivilizacion("JUDIOS", FALSE);
  
  // objetivos de conquista de pueblos
  hObjDPJerusalem = CrearObjetivo(hEstJudios, "ConquistaPueblo2", "JERUSALEM");
  AnyadirGrupoAObjetivo(hObjDPJerusalem, "JUD_DEF1");
  AnyadirGrupoAObjetivo(hObjDPJerusalem, "JUD_PUEBLO1");
  AnyadirObjetivo(hEstJudios, hObjDPJerusalem);
  SetParamObjetivo(hObjDPJerusalem, "PuedePedirRefuerzos", FALSE);
  
  hObjDPJazer = CrearObjetivo(hEstJudios, "ConquistaPueblo2", "JAZER");
  AnyadirGrupoAObjetivo(hObjDPJazer, "JUD_DEF2");
  AnyadirGrupoAObjetivo(hObjDPJerusalem, "JUD_PUEBLO2");
  AnyadirObjetivo(hEstJudios, hObjDPJazer);
  SetParamObjetivo(hObjDPJazer, "PuedePedirRefuerzos", FALSE);
  
  EjecutarPlanificador(hEstJudios, TRUE);
  
  // para ponerlo interesante  
  if ( fNivelDificultad == 3 )
  {
    hObjPJudios = CrearObjetivo
          (hEstJudios, "PatrullaOleadasPeriodicas", fPotenciaPatrullas2, fPotenciaPatrullas2, 120, 480);
    SetParamObjetivo(hObjPJudios, "ObjetivoAtracable", hObjDPJerusalem);
    SetParamObjetivo(hObjPJudios, "ObjetivoAtracable", hObjDPJazer);
    SetParamObjetivo(hObjPJudios, "ForzarAccion", "ATACAR");
    AnyadirObjetivo(hEstJudios, hObjPJudios);
  }

  // sacabó
  DestruirTrigger("AliadoJudio");
  DestruirTrigger("MosqueoJudio");
    
}


Trigger "AliadoJudio" [Inactivo]
(
  !EstaEnteVivo("GUARNICION_PETRA")
)
Do
{
  
  // Mensaje de gozo
  MensajeLocucionado("11N9","LTEXT_MISION11_MENSAJE_02_TXT");
  AvisoCivilizacion("CRASO", 152, 54);
  
  // objetivos de conquista de pueblos
  hObjDPJerusalem = CrearObjetivo(hEstJudios, "ConquistaPueblo2", "JERUSALEM");
  AnyadirGrupoAObjetivo(hObjDPJerusalem, "JUD_DEF1");
  AnyadirGrupoAObjetivo(hObjDPJerusalem, "JUD_PUEBLO1");
  AnyadirObjetivo(hEstJudios, hObjDPJerusalem);
  SetParamObjetivo(hObjDPJerusalem, "PuedePedirRefuerzos", FALSE);
  
  hObjDPJazer = CrearObjetivo(hEstJudios, "ConquistaPueblo2", "JAZER");
  AnyadirGrupoAObjetivo(hObjDPJazer, "JUD_DEF2");
  AnyadirGrupoAObjetivo(hObjDPJerusalem, "JUD_PUEBLO2");
  AnyadirObjetivo(hEstJudios, hObjDPJazer);
  SetParamObjetivo(hObjDPJazer, "PuedePedirRefuerzos", FALSE);
 
  EjecutarPlanificador(hEstJudios, TRUE);
 
  // permitimos ayudar
  ProhibirObjetivo(hEstJudios, "Apoyo", FALSE);
 
  // Alianza
  NeutralizarCivilizacion("JUDIOS", FALSE);
  CrearAlianzaPorNombre("CRASO", "JUDIOS");
  
  DestruirTrigger("MosqueoJudio");
  DestruirTrigger("AliadoJudio");
  
}

////////////////////////////////////////////////////////
// Vigilar los templos en tu poder


// TIRO
Trigger "TiroConquistada" [Inactivo]
(
  EstaPuebloConquistado("CRASO", "TIRO")
)
Do
{
  
  IndicarObjetivoCumplido(hObjTiro);
  bTiroCapturada = TRUE;
  
  ActivarTrigger("TiroPerdida");
  DesactivarTrigger("TiroConquistada"); 
  
}

// SAMARIA: puede conquistarse mediante la diplomacia
Trigger "SamariaConquistada" [Inactivo]
(
  EstaPuebloConquistado("CRASO", "SAMARIA")
  ||
  ( EstanAliadas("CRASO", "SAMARITANOS") && EstaPuebloConquistado("SAMARITANOS", "SAMARIA") )
)
Do
{
  
  IndicarObjetivoCumplido(hObjSamaria);
  bSamariaCapturada = TRUE;
  
  ActivarTrigger("SamariaPerdida");
  DesactivarTrigger("SamariaConquistada");  
  
}

// JERUSALEM: puede conquistar mediante la diplomacia
Trigger "JerusalemConquistada" [Inactivo]
(
  EstaPuebloConquistado("CRASO", "JERUSALEM")
  ||
  ( EstanAliadas("CRASO", "JUDIOS") && EstaPuebloConquistado("JUDIOS", "JERUSALEM") )
)
Do
{
  
  IndicarObjetivoCumplido(hObjJerusalem);
  bJerusalemCapturada = TRUE;
  
  ActivarTrigger("JerusalemPerdida");
  DesactivarTrigger("JerusalemConquistada");  
  
}

// PETRA
Trigger "PetraConquistada" [Inactivo]
(
  EstaPuebloConquistado("CRASO", "PETRA")
)
Do
{
  
  IndicarObjetivoCumplido(hObjPetra);
  bPetraCapturada = TRUE;
  
  ActivarTrigger("PetraPerdida");
  DesactivarTrigger("PetraConquistada"); 

  
}


////////////////////////////////////////////////////////
// Vigilar los templos que pierdes
////////////////////////////////////////////////////////

// SAMARIA
Trigger "SamariaPerdida" [Inactivo]
(
  !EstaPuebloConquistado("CRASO", "SAMARIA")
  &&
  !( EstanAliadas("CRASO", "SAMARITANOS") && EstaPuebloConquistado("SAMARITANOS", "SAMARIA") )
)
Do
{

  bSamariaCapturada = FALSE;
  IndicarObjetivoPendiente(hObjSamaria);
  
  ActivarTrigger("SamariaConquistada");
  DesactivarTrigger("SamariaPerdida");
    
}

// TIRO
Trigger "TiroPerdida" [Inactivo]
(
  !EstaPuebloConquistado("CRASO", "TIRO")
)
Do
{

  bTiroCapturada = FALSE;
  IndicarObjetivoPendiente(hObjTiro);
  
  ActivarTrigger("TiroConquistada");
  DesactivarTrigger("TiroPerdida");
    
}

// JERUSALEM
Trigger "JerusalemPerdida" [Inactivo]
(
  !EstaPuebloConquistado("CRASO", "JERUSALEM")
  &&
  !( EstanAliadas("CRASO", "JUDIOS") && EstaPuebloConquistado("JUDIOS", "JERUSALEM") )
)
Do
{

  bJerusalemCapturada = FALSE;
  IndicarObjetivoPendiente(hObjJerusalem);
  
  ActivarTrigger("JerusalemConquistada");
  DesactivarTrigger("JerusalemPerdida");
    
}

// PETRA
Trigger "PetraPerdida" [Inactivo]
(
  !EstaPuebloConquistado("CRASO", "PETRA")
)
Do
{

  bPetraCapturada = FALSE;
  IndicarObjetivoPendiente(hObjPetra);
  
  ActivarTrigger("PetraConquistada");
  DesactivarTrigger("PetraPerdida");
    
}

////////////////////////////////////////////////////////////////
// CONDICIONES DE TERMINACION DEL ESCENARIO
////////////////////////////////////////////////////////////////

Trigger "CondicionesVictoria" [Activo]
(
  ( bTiroCapturada && bSamariaCapturada && bJerusalemCapturada && bPetraCapturada )
  || EstructuraDestruida("SAMARIA")
  || EstructuraDestruida("JERUSALEM")
  || EstructuraDestruida("TIRO")
  || EstructuraDestruida("PETRA")
  || !EstaTropaViva("PUBLIO")
  || !EstaTropaViva("CASIO")
)
Do
{
  
  if ( !(bTiroCapturada && bSamariaCapturada && bJerusalemCapturada && bPetraCapturada) )
  {
    
    if ( EstructuraDestruida("SAMARIA") )
    {
      IndicarObjetivoFracasado(hObjSamaria);
    }
    
    if ( EstructuraDestruida("JERUSALEM") )
    {
      IndicarObjetivoFracasado(hObjJerusalem);
    }

    if ( EstructuraDestruida("TIRO") )
    {
      IndicarObjetivoFracasado(hObjTiro);
    }

    if ( EstructuraDestruida("PETRA") )
    {
      IndicarObjetivoFracasado(hObjPetra);
    }
    
    if ( !EstaTropaViva("PUBLIO") )
    {
      IndicarObjetivoFracasado(hObjPublioVivo);
    }
    
    if ( !EstaTropaViva("CASIO") )
    {
      IndicarObjetivoFracasado(hObjCasioVivo);
    }
    
    FinalizarMision(FALSE);
        
  }
  else
  {
    
    IndicarObjetivoCumplido(hObjPublioVivo);
    IndicarObjetivoCumplido(hObjCasioVivo);
    
    FinalizarMision(TRUE);
    
  }
  
  
  DesactivarTrigger("CondicionesVictoria");
  DestruirTrigger("CondicionesVictoria");
    
}




////////////////////////////////////////////////////////////////
//---------END----------
////////////////////////////////////////////////////////////////

Trigger "End" [ Activo ]  
(
  TRUE
)
Do
{

}

