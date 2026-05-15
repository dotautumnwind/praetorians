
/************************************************************************/
/* Tutorial 4: El Campo de Batalla                                      */
/* Autor: JuanD                                                         */
/* Fecha: 28 Mayo 2002                                                  */
/* Documento de diseño de escenario: Tutorial4.doc                      */
/************************************************************************/ 
/* Objetivos del tutorial:                                              */
/* a) Caballería                                                        */
/* b) Flanqueo ofensivo                                                 */
/* c) Defenderse de un flanqueo, piqueros plantados                     */
/* d) Construir un puente                                               */
/* e) Arqueros plantados                                                */
/* f) Batalla campal                                                    */
/* g) Asalto a las alturas                                              */
/* h) Final: batalla contra pueblos                                     */
/************************************************************************/
/* Condiciones de victoria:                                             */
/* a) Ágrado, Cayo Tito, Cneo Gabino                                    */
/* b) Dubalix debe morir                                                */
/* c) Balia, Lancre y Carilocus deben ser destruidas u ocupadas         */
/************************************************************************/

Var
{
	
  handle skiptutorial, nextstep, accion, hCamaraEnd;        // handles del tutorial
  float fcontador                     = 0;                  // lección actual
  bool mostrarTrayectoria             = FALSE;              // auxiliar para trayectorias
  
  
  // estrategias
  handle hCivGalos                    = NULL;
  handle hEstGalos                    = NULL;
  handle hTacAtaPun1                  = NULL;
  handle hTacAtaPun2                  = NULL;
  handle hTacAtaPun3                  = NULL;
  handle hTacManPos                   = NULL;
  
  handle hObjSkiConPue1               = NULL;
  handle hObjSkiConPue2               = NULL;
  handle hObjSkiConPue3               = NULL;
  
  handle hObjMP                       = NULL;
  handle hObjMP2                      = NULL;

  // objetivos
  handle hObjCayoVivo                 = NULL;
  handle hObjCneoVivo                 = NULL;
  handle hObjAgradoVivo               = NULL;
  
  handle hObjDubalixMuerto            = NULL;
//handle hObjTomarBalia               = NULL;
//handle hObjTomarLancre              = NULL;
//handle hObjTomarCarilocus           = NULL;

  bool baliaNeutralizado              = FALSE;
  bool lancreNeutralizado             = FALSE;
  bool carilocusNeutralizado          = FALSE;
  bool dubalixNeutralizado            = FALSE;

  // otros
  string aux                          = "";
  
  // cinemáticas  
  float fPuntoSincronia               = 0;
  handle hPuntoSincronia              = NULL;
  
  bool bSaludoDubalixAcabado          = FALSE;
  bool bPuenteQuemado                 = FALSE;
  bool bRefuerzos                     = FALSE;
  bool bFinalDubalix                  = FALSE;
  bool bAdelanteSkirmish              = FALSE;
  
}


#include "Funscript.h"

// fcontador
// 00 - Introducción: caballería
// 01 - Flanqueo ofensivo
// 02 - Defenderse de un flanqueo, piqueros plantados
// 03 - Arqueros plantados
// 04 - Construir un puente
// 05 - Batalla campal
// 06 - Asalto a las alturas
// 07 - Final: batalla contra pueblos


//////////////////////////////////////////////////////////
// Main: presentacion
//////////////////////////////////////////////////////////

Trigger "Main" [Activo]
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
  
  ActivarTrigger("Presentacion");
}


Trigger "Presentacion" [Inactivo]
(
  TRUE
)
Var
{
  handle hPresentacion;
  handle hEscape;
}
Do
{
  
  hPresentacion = CrearHandle("Bool");
  hEscape = CrearHandle("Bool");

  // cazar escape
  PonerHandleInterrupcion(hEscape);

  // cine
  ActivarCinemascope(TRUE);
    
  // Presentacion
  ActivarPresentacion(TRUE, "LTEXT_TUTORIAL4_PRESENTACION_TITULO",
                            "LTEXT_TUTORIAL4_PRESENTACION_LUGAR", hPresentacion);
  
  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));
 
  ActivarPresentacion(FALSE, "", "", NULL);

  ActivarCinemascope(FALSE);
  
  ActivarTrigger("Main2");
  DestruirTrigger("Presentacion"); 

}




//////////////////////////////////////////////////////////
// Trigger main2: inicialización del tutorial
//////////////////////////////////////////////////////////
Trigger "Main2" [Inactivo]
(
  TRUE
)
Var
{
}
Do
{

  // objetivos    
  hObjCayoVivo       = CrearHandle("Bool");
  hObjCneoVivo       = CrearHandle("Bool");
  hObjAgradoVivo     = CrearHandle("Bool");
  hObjDubalixMuerto  = CrearHandle("Bool");
//hObjTomarBalia     = CrearHandle("Bool");
//hObjTomarLancre    = CrearHandle("Bool");
//hObjTomarCarilocus = CrearHandle("Bool");

  AgregarObjetivoMision(hObjDubalixMuerto, "LTEXT_TUTORIAL4_OBJETIVO_00_TXT");
//AgregarObjetivoMision(hObjTomarBalia, "LTEXT_TUTORIAL4_OBJETIVO_01_TXT");
//AgregarObjetivoMision(hObjTomarLancre, "LTEXT_TUTORIAL4_OBJETIVO_02_TXT");
//AgregarObjetivoMision(hObjTomarCarilocus, "LTEXT_TUTORIAL4_OBJETIVO_03_TXT");
  AgregarObjetivoMision(hObjCayoVivo, "LTEXT_TUTORIAL4_OBJETIVO_04_TXT");
  AgregarObjetivoMision(hObjCneoVivo, "LTEXT_TUTORIAL4_OBJETIVO_05_TXT");
   
  //restricciones de maquinas da asalto
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_BARBARA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_ROMANA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_EGIPCIA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_EGIPCIA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_BARBARA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_ROMANA", "");
  
  // RESTRICCIONES DE ESCENARIO
  IntroducirRestriccionUnidad("ORDEN_TRANSFORMAR_A_CENTURION", "", "Romanos");
  
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "INFANTERIA_LIGERA", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "INFANTERIA_PESADA", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "PIQUERO", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "ARQUERO", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_PESADA", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "MEDICO", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EXPLORADOR_LOBO", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EXPLORADOR_HALCON", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_LIGERA", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_PESADA", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_PIQUERO", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_ARQUERO", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_CABALLERIA_PESADA", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_MEDICO", "");

  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "", "");
  QuitarRestriccionEstructura("ORDEN_CONSTRUIR", "TORRE_DEFENSA_BARBARA", "Galos");
  QuitarRestriccionEstructura("ORDEN_CONSTRUIR", "TORRE_DEFENSA_ROMANA", "Romanos");
  QuitarRestriccionUnidad("ORDEN_CONSTRUIR", "CATAPULTA_ROMANA", "Romanos");
  
   
  // inicializamos los handles que necesitamos	
  skiptutorial = CrearHandle("Bool");
  nextstep = CrearHandle("Bool");
  accion = CrearHandle("Bool");
  hCamaraEnd = CrearHandle("Bool");
  
  // inicializamos estrategias
  hCivGalos = DarCivilizacion("Galos");
  hEstGalos = CrearEstrategiaScript();
  AsignarEstrategia(hCivGalos, hEstGalos);
  StartEstrategia(hEstGalos);
  
  // defensa de las posiciones
  hTacManPos = CrearTactica(hEstGalos, "MantenerPosicion");
  AnyadirGrupoATactica(hTacManPos, "DEFENSA_1");
  AnyadirTactica(hEstGalos, hTacManPos);
  SetParamTactica(hTacManPos, "AtaqueStand", TRUE);
  
  SetParamEstrategia(hEstGalos, "CaballosListos", FALSE); 
  
  // metemos a los arqueros en la torre
  InteractuarTropaConEnte("ARQUEROS_TORRE_ALTA", "TORRE_ALTA");
  
  // inicializamos los triggers de la misión
  ActivarTrigger("InicioTutorial");
  ActivarTrigger("FlanqueoGalo");
  ActivarTrigger("BatallaCampal");
  ActivarTrigger("Refuerzos");
  ActivarTrigger("ComienzoSkirmish");
  ActivarTrigger("CondicionesDeVictoria");
  
//ActivarTrigger("BaliaNeutralizada");
//ActivarTrigger("LancreNeutralizada");
//ActivarTrigger("CarilocusNeutralizada");
  
  ActivarTrigger("DubalixNeutralizado");
  ActivarTrigger("Skip");
  
  // primera aparición de dubalix
  ActivarTrigger("SaludoDubalix");
  
  DestruirTrigger("Main2");
     
}
//////////////////////////////////////////////////////////




//////////////////////////////////////////////////////////
// Inicialización del tutorial
//////////////////////////////////////////////////////////
Trigger "InicioTutorial" [Inactivo]
(
  TRUE	
)
Var
{
  handle hTimer;
}
Do
{

  // inicializamos el panel de tutorial	
  fcontador = 0;
  hTimer = CrearTimer(2000);			// para que aparezca a los 2 segundos
  Wait(hTimer);

  // creamos
  CrearPanelTutorial(skiptutorial,nextstep);
  
  ///////////////////////////////////////////////////////////////////////////
  // LECCIONES:

  // Lección 0: Caballería
  IntroducirPasoTutorial("LTEXT_TUTORIAL4_LECCION_00_TXT","LTEXT_TUTORIAL4_LECCION_00_OBJ");

  // Lección 1: Flanqueo ofensivo
  IntroducirPasoTutorial("LTEXT_TUTORIAL4_LECCION_01_TXT","LTEXT_TUTORIAL4_LECCION_01_OBJ");

  // Lección 2: Defender un flanqueo
  IntroducirPasoTutorial("LTEXT_TUTORIAL4_LECCION_02_TXT","LTEXT_TUTORIAL4_LECCION_02_OBJ");

  // Lección 3: Construir puentes
  IntroducirPasoTutorial("LTEXT_TUTORIAL4_LECCION_03_TXT","LTEXT_TUTORIAL4_LECCION_03_OBJ");

  // Lección 4: Arqueros plantados
  IntroducirPasoTutorial("LTEXT_TUTORIAL4_LECCION_04_TXT","LTEXT_TUTORIAL4_LECCION_04_OBJ");
  
  // Lección 5: Batalla campal
  IntroducirPasoTutorial("LTEXT_TUTORIAL4_LECCION_05_TXT","LTEXT_TUTORIAL4_LECCION_05_OBJ");
                         
  // Lección 6: Asalto a posición elevada
  IntroducirPasoTutorial("LTEXT_TUTORIAL4_LECCION_06_TXT","LTEXT_TUTORIAL4_LECCION_06_OBJ");
                         
  // Lección 7: Final
  IntroducirPasoTutorial("LTEXT_TUTORIAL4_LECCION_07_TXT","LTEXT_TUTORIAL4_LECCION_07_OBJ");
  
  //                       
  ////////////////////////////////////////////////////////////////////////////////////

  // Pasamos al primer paso del tutorial
  AvanzarPasoTutorial(fcontador);			          // poner el panel ahí

  // Condicion de paso del tutorial
  aux = "CABALLERIA_PESADA";
  VigilarInterfazSeleccion(NULL, &aux, accion);
  
  // Activar triggers necesarios para el tutorial
  ActivarTrigger("Accion");
  ActivarTrigger("Next");

  // Eliminar este trigger
  DisposeHandle(&hTimer);
  DestruirTrigger("InicioTutorial");
	
}
//////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////
// Pasar al siguiente paso del tutorial
//////////////////////////////////////////////////////////
Trigger "Next" [Inactivo]
(
  Wait(nextstep)
)
Do
{
  fcontador = fcontador + 1;                // siguiente
  AvanzarPasoTutorial(fcontador);           // actualizar el panel en consecuencia
  DesactivarHandleBool(nextstep);           // nextstep a FALSE
  QuitarVigilanciaHandleBool(accion);       // para evitar problemas por salto de paso

  if ( mostrarTrayectoria )               // exito de paso de tutorial
  {
    LanzarSonido("IATU");
  }


  if ( fcontador == 1 )     // flanqueo ofensivo
  {
    
    ActivarTrigger("FlanqueoOfensivo");
    
  }
  else
  if ( fcontador == 2 )     // defender flanqueo
  {
    
    DestruirTrigger("FlanqueoOfensivo");
    ActivarTrigger("DefenderFlanqueo");
        
  }
  else
  if ( fcontador == 3 )     // destruir catapultas
  {

    // iluminémoslas pues
    IluminarZonaOnOff(86,0,36,10,"catapultas", TRUE);

    DestruirTrigger("DefenderFlanqueo");
    ActivarTrigger("CatapultasDestruidas");    

  }
  else
  if ( fcontador == 4 )			// construir puente
  {
    
    // fuera luces de catapultas
    IluminarZonaOnOff(86,0,36,10,"catapultas", FALSE);

    aux = "PUENTE_CONSTRUIBLE";
    VigilarConstruccionAcabada(NULL, &aux, accion);
    ActivarTrigger("Accion");
    DestruirTrigger("CatapultasDestruidas");  
      	
  }
  else
  if ( fcontador == 5 )			// batalla campal
  {

    ActivarTrigger("BatallaCampalGanada");
  	
  }
  else
  if ( fcontador == 6 )			// asaltar las alturas
  {

    DestruirTrigger("BatallaCampalGanada");  
    ActivarTrigger("DefensaEliminada");
  
  }
  else                      // Final
  {
    
    DestruirTrigger("DefensaEliminada");  
    
  }


  // reseteamos mostrarTrayectoria
  mostrarTrayectoria = FALSE;

}


//////////////////////////////////////////////////////////
// Capturar el resultado de vigilar una orden
//////////////////////////////////////////////////////////
Trigger "Accion" [Inactivo]
(
  Wait(accion)
)
Do
{
  ActivarHandleBool(nextstep);		// avanzar el paso del tutorial
  DesactivarHandleBool(accion);
  mostrarTrayectoria = TRUE;
  DesactivarTrigger("Accion");		// desactivar el trigger mientras no vigilemos otra accion
}
//////////////////////////////////////////////////////////




//////////////////////////////////////////////////////////
// Vigilar que se acabe con los enemigos del paso 1
//////////////////////////////////////////////////////////
Trigger "FlanqueoOfensivo" [Inactivo]
(
  DarTropasVivasDeGrupo("ARQUEROS_1") == 0
)
Do
{

  DesactivarTrigger("FlanqueoOfensivo");
  
  ActivarHandleBool(nextstep);
  mostrarTrayectoria = TRUE;
    
}
//////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////
// Vigilar que se acabe con los enemigos del paso 2
//////////////////////////////////////////////////////////
Trigger "DefenderFlanqueo" [Inactivo]
(
  (DarTropasVivasDeGrupo("ATAQUE_1_1") == 0)
  &&
  (DarTropasVivasDeGrupo("ATAQUE_1_2") == 0)
)
Do
{

  DesactivarTrigger("DefenderFlanqueo");
  
  ActivarHandleBool(nextstep);
  mostrarTrayectoria = TRUE;
    
}
//////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////
// Vigilar que se destruyan las catapultas
//////////////////////////////////////////////////////////
Trigger "CatapultasDestruidas" [Inactivo]
(
  !EstaEnteVivo("CATAPULTA_1")
  &&
  !EstaEnteVivo("CATAPULTA_2")
  &&
  !EstaEnteVivo("CATAPULTA_3")
)
Do
{
  
  DesactivarTrigger("CatapultasDestruidas");
  
  ActivarHandleBool(nextstep);
  mostrarTrayectoria = TRUE;

}
//////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////
// Vigilar que se venza la batalla campal
//////////////////////////////////////////////////////////
Trigger "BatallaCampalGanada" [Inactivo]
(
  (DarTropasVivasDeGrupo("ATAQUE_2_1") == 0)
)
Do
{
  
  DesactivarTrigger("BatallaCampalGanada");
  
  ActivarHandleBool(nextstep);
  mostrarTrayectoria = TRUE;

}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Vigilar que se elimine la defensa de las alturas
//////////////////////////////////////////////////////////
Trigger "DefensaEliminada" [Inactivo]
(
  (DarTropasVivasDeGrupo("DEFENSA_1") == 0)
)
Do
{
  
  DesactivarTrigger("DefensaEliminada");
  
  ActivarHandleBool(nextstep);
  mostrarTrayectoria = TRUE;

}
//////////////////////////////////////////////////////////



Trigger "Skip" [Inactivo]
(
  Wait(skiptutorial)
)
Do
{

  // desactivamos y eliminamos todos los triggers que ya no son necesarios
  DesactivarTrigger("Next");
  DesactivarTrigger("Skip");
  DesactivarTrigger("Accion");
  DestruirTrigger("Skip");
  DestruirTrigger("Next");
  DestruirTrigger("Accion");

  // fuera luces de catapultas
  IluminarZonaOnOff(86,0,36,10,"catapultas", FALSE);

  // triggers de pasos

 
  // y cerramos el panel del tutorial
  DestruirPanelTutorial();
  
  // habilitamos lo que haya que habilitar
  
}
//////////////////////////////////////////////////////////




Trigger "FlanqueoGalo" [Inactivo]
(
  HanEntradoCivilizacionesEnZona("BATALLA_1", "Romanos") ||
  HanEntradoCivilizacionesEnZona("BATALLA_2", "Romanos")
)
Do
{

  hTacAtaPun1 = CrearTactica(hEstGalos, "AtacarPunto", 19, 70);
  AnyadirGrupoATactica(hTacAtaPun1, "ATAQUE_1_1");
  AnyadirTactica(hEstGalos, hTacAtaPun1);

  hTacAtaPun2 = CrearTactica(hEstGalos, "AtacarPunto", 20, 82);
  SetMoverFisicoGrupoTropas("ATAQUE_1_2", TRUE);
  AnyadirGrupoATactica(hTacAtaPun2, "ATAQUE_1_2");
  AnyadirTactica(hEstGalos, hTacAtaPun2);
  
  DestruirTrigger("FlanqueoGalo");
  
}


Trigger "BatallaCampal" [Inactivo]
(
  HanEntradoCivilizacionesEnZona("BATALLA_3", "Romanos")
)
Do
{
  
  hTacAtaPun3 = CrearTactica(hEstGalos, "AtacarPunto", 93, 19);
  AnyadirGrupoATactica(hTacAtaPun3, "ATAQUE_2_1");
  AnyadirTactica(hEstGalos, hTacAtaPun3);

  DestruirTrigger("BatallaCampal"); 
  
}





Trigger "ComienzoSkirmish" [Inactivo]
(
  bAdelanteSkirmish
)
Do
{

  // afueeeeeera la antigua estrategia de los galos
  DisposeHandle(&hTacAtaPun1);
  DisposeHandle(&hTacAtaPun2);
  DisposeHandle(&hTacAtaPun3);
  DisposeHandle(&hTacManPos);
  DisposeHandle(&hEstGalos);

  // estrategia skirmish
  hEstGalos = CrearEstrategiaEscaramuza();
  AsignarEstrategia(hCivGalos, hEstGalos);
  
  // *** OJO!! Hay que ponerlo ANTES del StartEstrategia
  SetParamEstrategia(hEstGalos, "NoObjFallback", TRUE);
  // ***
  
  StartEstrategia(hEstGalos);
  
  SetValue(hEstGalos, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  SetValue(hEstGalos, "GRUPOTROPAS_A_ENTRENAR", "MAQUINAS_ATAQUE", 0);
  SetValue(hEstGalos, "GRUPOTROPAS_A_ENTRENAR", "MAQUINAS_DEFENSA", 0);
  
  hObjSkiConPue1 = CrearObjetivo(hEstGalos, "ConquistaPueblo2", "Balia");
  hObjSkiConPue2 = CrearObjetivo(hEstGalos, "ConquistaPueblo2", "Lancre");
  hObjSkiConPue3 = CrearObjetivo(hEstGalos, "ConquistaPueblo2", "Carilocus");
  
  AnyadirGrupoAObjetivo(hObjSkiConPue1, "PUEBLO1");
  AnyadirGrupoAObjetivo(hObjSkiConPue2, "PUEBLO2");
  AnyadirGrupoAObjetivo(hObjSkiConPue3, "PUEBLO3");
  
  AnyadirObjetivo(hEstGalos, hObjSkiConPue1);
  AnyadirObjetivo(hEstGalos, hObjSkiConPue2);
  AnyadirObjetivo(hEstGalos, hObjSkiConPue3);
  
//SetParamObjetivo(hObjSkiConPue1, "PuedePedirRefuerzos", FALSE);
//SetParamObjetivo(hObjSkiConPue2, "PuedePedirRefuerzos", FALSE);
//SetParamObjetivo(hObjSkiConPue3, "PuedePedirRefuerzos", FALSE);

  // que no me muevan a los que quiero sueltos
  SetParamEstrategia(hEstGalos, "ResetGrupoNoLibres");
  SetParamEstrategia(hEstGalos, "GrupoNoLibre", "NO_REFORZAR");

  InteractuarTropaConEnte("ARQ_FINAL1", "TORRE_1");
  InteractuarTropaConEnte("ARQ_FINAL2", "TORRE_2");

  hObjMP = CrearObjetivo(hEstGalos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hObjMP, "ARQUEROS1");
  AnyadirObjetivo(hEstGalos, hObjMP);

  hObjMP2 = CrearObjetivo(hEstGalos, "DefenderPosicion", 65, 109);
  AnyadirGrupoAObjetivo(hObjMP2, "GRUPO_DUBALIX");
  AnyadirObjetivo(hEstGalos, hObjMP2);

  DestruirTrigger("ComienzoSkirmish"); 
  
}




//////////////////////////////////////////////////////////
// Trigger de condiciones de victoria
//////////////////////////////////////////////////////////
Trigger "CondicionesDeVictoria" [Inactivo]
(
  dubalixNeutralizado
  ||
  !EstaTropaViva("CAYO_TITO")
  ||
  !EstaTropaViva("CNEO_GABINO")
  ||
  !EstaTropaViva("AGRADO")
)
Do
{

  if (dubalixNeutralizado)
  {
   
   IndicarObjetivoCumplido(hObjCayoVivo);
   IndicarObjetivoCumplido(hObjCneoVivo);
   IndicarObjetivoCumplido(hObjAgradoVivo);
   
   FinalizarMision(TRUE);
    
  }
  else
  {
    
    if ( !EstaTropaViva("CAYO_TITO") )
    {
      IndicarObjetivoFracasado(hObjCayoVivo);
    }
    
    if ( !EstaTropaViva("CNEO_GABINO") )
    {
      IndicarObjetivoFracasado(hObjCneoVivo);
    }

    if ( !EstaTropaViva("AGRADO") )
    {
      IndicarObjetivoFracasado(hObjAgradoVivo);
    }
    
    FinalizarMision(FALSE);
    
  }
    
  DesactivarTrigger("CondicionesDeVictoria");
  DestruirTrigger("CondicionesDeVictoria");

}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
// Triggers de control de los pueblos
//////////////////////////////////////////////////////////

/*
Trigger "BaliaNeutralizada" [Inactivo]
(
  EstaPuebloConquistado("Romanos", "Balia") || EstructuraDestruida("Balia")
)
Do
{
  
  baliaNeutralizado = TRUE;
  IndicarObjetivoCumplido(hObjTomarBalia);
  
  if ( !EstructuraDestruida("Balia") )
  {
    ActivarTrigger("BaliaRecapturada");
  }
   
   DesactivarTrigger("BaliaNeutralizada");
    
}


Trigger "BaliaRecapturada" [Inactivo]
(
  EstaPuebloConquistado("Galos", "Balia")
)
Do
{
  
  baliaNeutralizado = FALSE;
  IndicarObjetivoPendiente(hObjTomarBalia);
  ActivarTrigger("BaliaNeutralizada");
  DesactivarTrigger("BaliaRecapturada");  
  
}

Trigger "LancreNeutralizada" [Inactivo]
(
  EstaPuebloConquistado("Romanos", "Lancre") || EstructuraDestruida("Lancre")
)
Do
{
  
  lancreNeutralizado = TRUE;
  IndicarObjetivoCumplido(hObjTomarLancre);
  
  if ( !EstructuraDestruida("Lancre") )
  {
    ActivarTrigger("LancreRecapturada");
  }
   
  DesactivarTrigger("LancreNeutralizada");
  
}


Trigger "LancreRecapturada" [Inactivo]
(
  EstaPuebloConquistado("Galos", "Lancre")
)
Do
{
  lancreNeutralizado = FALSE;
  IndicarObjetivoPendiente(hObjTomarLancre);
  ActivarTrigger("LancreNeutralizada");
  DesactivarTrigger("LancreRecapturada");  
}

Trigger "CarilocusNeutralizada" [Inactivo]
(
  EstaPuebloConquistado("Romanos", "Carilocus") || EstructuraDestruida("Carilocus")
)
Do
{
  carilocusNeutralizado = TRUE;
  IndicarObjetivoCumplido(hObjTomarCarilocus);
  
  if ( !EstructuraDestruida("Carilocus") )
  {
    ActivarTrigger("CarilocusRecapturada");
  }
   
  DesactivarTrigger("CarilocusNeutralizada");
  
}


Trigger "CarilocusRecapturada" [Inactivo]
(
  EstaPuebloConquistado("Galos", "Carilocus")
)
Do
{
  carilocusNeutralizado = FALSE;
  IndicarObjetivoPendiente(hObjTomarCarilocus);
  ActivarTrigger("CarilocusNeutralizada");
  DesactivarTrigger("CarilocusRecapturada");  
}
*/

//////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////
// Trigger para saber si Dubalix sigue vivo
//////////////////////////////////////////////////////////

Trigger "DubalixNeutralizado" [Inactivo]
(
  !EstaTropaViva("DUBALIX")
)
Do
{
  
  dubalixNeutralizado = TRUE;
  IndicarObjetivoCumplido(hObjDubalixMuerto);
  
  DestruirTrigger("DubalixNeutralizado");
  
}



//////////////////////////////////////////////////////////
// Triggers de cinemáticas
//////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////
// Saludo del dubalix nada más empezar
Trigger "SaludoDubalix" [Inactivo]
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
 
  hTimer = CrearTimer(2000);
  Wait(hTimer);
 
  // handle de final y presentacion
  hCamaraEnd = CrearHandle("Bool");
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
    
  // efectos especiales
  ActivarTrigger("EfectosSaludoDubalix");

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolaTrayectoriaCamara("DUBALIX_1", TRUE, FALSE, 1, 0);
  IntroducirLocucion("", "", 2000, 0, 0);
  IntroducirLocucion("0440", "LTEXT_TUTORIAL4_EVENTO1_00_TXT", 2000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("0441", "LTEXT_TUTORIAL4_EVENTO1_01_TXT", 3000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("0442", "LTEXT_TUTORIAL4_EVENTO1_02_TXT", 4000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirPuntoSincronia();   // 1

  EncolarColocarYMirarPunto("DUBALIX_2");
  EncolarPausaCamara(1000);
  EncolaTrayectoriaCamara("DUBALIX_3", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(4000);
  IntroducirLocucion("", "", 1000, 0, 0);
  IntroducirLocucion("0443", "LTEXT_TUTORIAL4_EVENTO1_03_TXT", 4000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirPuntoSincronia();   // 2
    
  IntroducirPonerModoJuegoCamara(TRUE);

  // acción
  EjecutarOrdenesCamara();

  // final  
  PonerHandleBoolACamara(hCamaraEnd);
  WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
   
  VaciarOrdenesCamara();
  VaciarLocuciones();
    
  bSaludoDubalixAcabado = TRUE;

  MirarAPunto(x, y);

  // restaurar
  ActivarCinemascope(FALSE);
  
  // segunda aparicion
  ActivarTrigger("QuemaPuente");

  // fuera
  DestruirTrigger("SaludoDubalix");

}


/////////////////////////////////////////////
// Efectos del saludo de dubalix
Trigger "EfectosSaludoDubalix" [Inactivo]
(
  TRUE
)
Var
{
  handle hTimer; 
}
Do
{

  // luces!
  IluminarZonaOnOff(40, 4, 50, 20, "GARGANTA", TRUE);
  HacerVisibleGrupoTropas("GRUPO_DUBALIX", TRUE);

  // esperamos al momento adecuado  
  WaitBool( (fPuntoSincronia == 1) || bSaludoDubalixAcabado );

  // corred! corred!
  SetMoverFisicoGrupoTropas("GRUPO_DUBALIX", TRUE);
  
  TropaSigueRutaPredefinida("DUBALIX", "DUBALIX1");
  
  if ( !bSaludoDubalixAcabado )
  {
    hTimer = CrearTimer(2000);
    Wait(hTimer);
  }
  
  TropaSigueRutaPredefinida("ESCOLTA1", "ESCOLTA1_1");
  TropaSigueRutaPredefinida("ESCOLTA2", "ESCOLTA2_1");
  
  WaitBool( (fPuntoSincronia == 2) || bSaludoDubalixAcabado );
  
  // fuera luces
  HacerVisibleGrupoTropas("GRUPO_DUBALIX", FALSE);
  IluminarZonaOnOff(40, 4, 50, 20, "GARGANTA", FALSE);
  
  DestruirTrigger("EfectosSaludoDubalix");  

}






/////////////////////////////////////////////////////////////////
// La quema del puente
Trigger "QuemaPuente" [Inactivo]
(
  ( (DarTropasVivasDeGrupo("ATAQUE_1_1") == 0)
    &&
    (DarTropasVivasDeGrupo("ATAQUE_1_2") == 0)
  )
  ||
  HanEntradoCivilizacionesEnZona("DUBALIX_2", "Romanos")
)
Var
{
  float x, y;
  handle hCamaraEnd;
  handle hEscape;
}
Do
{
 
  // handle de final y presentacion
  hCamaraEnd = CrearHandle("Bool");
  hEscape = CrearHandle("Bool");

  // contamos los puntos de sincronia
  fPuntoSincronia = 0;
  hPuntoSincronia = CrearHandle("Bool");
  PonerHandleEsperaSincronizacion(hPuntoSincronia);
  ActivarTrigger("ContarPuntosSincronia");

  // cazar escape
  PonerHandleInterrupcion(hEscape);
  
  // posición actual
  DarPosicionCamara(&x, &y);

  // cine
  ActivarCinemascope(TRUE);
    
  // efectos especiales
  ActivarTrigger("EfectosQuemaPuente");

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolarColocarYMirarPunto("DUBALIX_4");
  EncolarPausaCamara(4000);
  IntroducirPuntoSincronia();   // 1

  EncolaTrayectoriaCamara("DUBALIX_5", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(2000);
  IntroducirLocucion("0444", "LTEXT_TUTORIAL4_EVENTO2_00_TXT", 1000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("0445", "LTEXT_TUTORIAL4_EVENTO2_01_TXT", 2000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirPuntoSincronia();   // 2

  EncolaTrayectoriaCamara("DUBALIX_6", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(6000);
  IntroducirPuntoSincronia();   // 3
    
  IntroducirPonerModoJuegoCamara(TRUE);

  // acción
  EjecutarOrdenesCamara();

  // final  
  PonerHandleBoolACamara(hCamaraEnd);
  WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
   
  VaciarOrdenesCamara();
  VaciarLocuciones();
    
  bPuenteQuemado = TRUE;

  MirarAPunto(x, y);

  // restaurar
  ActivarCinemascope(FALSE);

  DestruirTrigger("QuemaPuente");

}


/////////////////////////////////////////////
// Efectos de la quema del puente
Trigger "EfectosQuemaPuente" [Inactivo]
(
  TRUE
)
Var
{
  handle hTimer; 
}
Do
{

  // iluminar el puente un rato
  IluminarZona(78,1,25, 5, 40000);

  // luces!
  HacerVisibleGrupoTropas("GRUPO_DUBALIX", TRUE);
  HacerVisibleTropa("ARQUEROS1", TRUE);
  HacerVisibleTropa("ARQUEROS2", TRUE);
  
  // hacia el puente!
  SetMoverFisicoTropa("ARQUEROS1", TRUE);
  SetMoverFisicoTropa("ARQUEROS2", TRUE);
  TropaSigueRutaPredefinida("ARQUEROS1", "ARQUEROS1_2");
  TropaSigueRutaPredefinida("ARQUEROS2", "ARQUEROS2_2");

  SetMoverFisicoGrupoTropas("GRUPO_DUBALIX", TRUE);
  TropaSigueRutaPredefinida("DUBALIX", "DUBALIX3");
  TropaSigueRutaPredefinida("ESCOLTA1", "ESCOLTA1_3");
  TropaSigueRutaPredefinida("ESCOLTA2", "ESCOLTA2_3");

  // esperamos al momento adecuado  
  WaitBool( (fPuntoSincronia == 1) || bPuenteQuemado );
  
  if ( bPuenteQuemado )
  {
    
    // fuera luces
    HacerVisibleGrupoTropas("GRUPO_DUBALIX", FALSE);
    HacerVisibleTropa("ARQUEROS1", FALSE);
    HacerVisibleTropa("ARQUEROS2", FALSE);
    
    hTimer = CrearTimer(2000);
    Wait(hTimer);
    
  }

  // atacamos el puente
  AtacarEnte("ARQUEROS1", "PUENTE");
  AtacarEnte("ARQUEROS2", "PUENTE");

  // esperamos
  WaitBool( (fPuntoSincronia == 2) || bPuenteQuemado );

  // corred! corred!
  TropaSigueRutaPredefinida("DUBALIX", "DUBALIX2");
  
  if ( bPuenteQuemado )
  {
    hTimer = CrearTimer(3000);
    Wait(hTimer);
  }
  
  PonerFuegoEnte("PUENTE", 15000);
  
  hTimer = CrearTimer(1000);
  Wait(hTimer);
  
  if ( bPuenteQuemado )
  {
    // fuera luces
    HacerVisibleGrupoTropas("GRUPO_DUBALIX", FALSE);
    HacerVisibleTropa("ARQUEROS1", FALSE);
    HacerVisibleTropa("ARQUEROS2", FALSE);
  }
  
  TropaSigueRutaPredefinida("ESCOLTA1", "ESCOLTA1_2");
  TropaSigueRutaPredefinida("ESCOLTA2", "ESCOLTA2_2");
  
  PonerVidaEnte("PUENTE", 10000);

  hTimer = CrearTimer(1000);
  Wait(hTimer);

  if ( bPuenteQuemado )
  {
    // fuera luces
    HacerVisibleGrupoTropas("GRUPO_DUBALIX", FALSE);
    HacerVisibleTropa("ARQUEROS1", FALSE);
    HacerVisibleTropa("ARQUEROS2", FALSE);
  }

  TropaSigueRutaPredefinida("ARQUEROS1", "ARQUEROS1");
  TropaSigueRutaPredefinida("ARQUEROS2", "ARQUEROS2");
    
  // esperamos
  WaitBool( (fPuntoSincronia == 3) || bPuenteQuemado );
    
  // fuera luces
  HacerVisibleGrupoTropas("GRUPO_DUBALIX", FALSE);
  HacerVisibleTropa("ARQUEROS1", FALSE);
  HacerVisibleTropa("ARQUEROS2", FALSE);
    
  DestruirTrigger("EfectosQuemaPuente");  

}


//////////////////////////////////////////////////////////
// Llegada de refuerzos
Trigger "Refuerzos" [Inactivo]
(
  (DarTropasVivasDeGrupo("ATAQUE_2_1") == 0) ||
  HanEntradoCivilizacionesEnZona("REFUERZOS", "Romanos")
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

  
  // cinemática de moda
  // handle de final y presentacion
  hCamaraEnd = CrearHandle("Bool");
  hEscape = CrearHandle("Bool");

  // para el tema de las luces
  CrearAlianzaPorNombre("REFUERZOS", "Romanos"); 

  // contamos los puntos de sincronia
  fPuntoSincronia = 0;
  hPuntoSincronia = CrearHandle("Bool");
  PonerHandleEsperaSincronizacion(hPuntoSincronia);
  ActivarTrigger("ContarPuntosSincronia");

  // posición actual
  DarPosicionCamara(&x, &y);

  // cazar escape
  PonerHandleInterrupcion(hEscape);

  // efectos especiales
  ActivarTrigger("EfectosRefuerzos");

  //necesitamos una pequeña pausa para empezar a mover a los refuerzos
  hTimer = CrearTimer(1500);
  Wait(hTimer);

  // cine
  ActivarCinemascope(TRUE);
  
  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolarColocarYMirarPunto("REFUERZOS_1");
  EncolarPausaCamara(1000);
  IntroducirPuntoSincronia();   // 1
  
  EncolaTrayectoriaCamara("REFUERZOS_2", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(2000);
  IntroducirLocucion("0410", "LTEXT_TUTORIAL4_EVENTO3_00_TXT", 2000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("0411", "LTEXT_TUTORIAL4_EVENTO3_01_TXT", 3000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirPuntoSincronia();   // 2
  
  EncolaTrayectoriaCamara("REFUERZOS_3", FALSE, FALSE, 0, 0);
  IntroducirPuntoSincronia();   // 3

  IntroducirPonerModoJuegoCamara(TRUE);

  // acción
  EjecutarOrdenesCamara();

  // final  
  PonerHandleBoolACamara(hCamaraEnd);
  WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
  
  VaciarOrdenesCamara();
  VaciarLocuciones();
    
  bRefuerzos = TRUE;

  if ( HandleDisparado(hEscape) )
  {
    MirarAPunto(x, y);
  } 

  // restaurar
  ActivarCinemascope(FALSE);
  
  // cambiamos el bando de la banda
  CambiarBandoPorGrupo("REFUERZOS", "Romanos");
  
  RomperAlianzaPorNombre("REFUERZOS", "Romanos");
  
  // nuevo objetivo: mantener a agrado con vida
  AgregarObjetivoMision(hObjAgradoVivo, "LTEXT_TUTORIAL4_OBJETIVO_06_TXT");
  ObjetivosMisionCambiados();

  ActivarTrigger("FinalDubalix");
  DestruirTrigger("Refuerzos");

}
/////////////////////////////////////////////
// Efectos de la quema del puente
Trigger "EfectosRefuerzos" [Inactivo]
(
  TRUE
)
Var
{
  handle hTimer; 
}
Do
{


  // a moverse todos
  TropaSigueRutaPredefinida("REFUERZO1", "REFUERZO1");
  TropaSigueRutaPredefinida("REFUERZO2", "REFUERZO2");
  TropaSigueRutaPredefinida("REFUERZO3", "REFUERZO3");
  TropaSigueRutaPredefinida("REFUERZO4", "REFUERZO4");
  
  hTimer = CrearTimer(1500);
  Wait(hTimer);
  
  TropaSigueRutaPredefinida("REFUERZO5", "REFUERZO5");
  TropaSigueRutaPredefinida("REFUERZO6", "REFUERZO6");
  TropaSigueRutaPredefinida("AGRADO", "REFUERZO7");
    
  // esperamos al momento adecuado  
//WaitBool( (fPuntoSincronia == 1) || bRefuerzos );

  DestruirTrigger("EfectosRefuerzos");  

}

//////////////////////////////////////////////////////////
// Llegada de refuerzos
Trigger "FinalDubalix" [Inactivo]
(
  (DarNumUnidadesEnZona("Galos", "FINAL") == 0)
    ||
  HanEntradoCivilizacionesEnZona("SKIRMISH_1", "Romanos")
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

  // CHUSCO
  NeutralizarCivilizacion("Romanos", TRUE);
  NeutralizarCivilizacion("Galos", TRUE);

  // luces!
  IluminarZonaOnOff(79, 1, 109, 20, "pueblo", TRUE);

  // cinemática de moda
  // handle de final y presentacion
  hCamaraEnd = CrearHandle("Bool");
  hEscape = CrearHandle("Bool");

  // contamos los puntos de sincronia
  fPuntoSincronia = 0;
  hPuntoSincronia = CrearHandle("Bool");
  PonerHandleEsperaSincronizacion(hPuntoSincronia);
  ActivarTrigger("ContarPuntosSincronia");

  // posición actual
  DarPosicionCamara(&x, &y);

  // cazar escape
  PonerHandleInterrupcion(hEscape);

  // efectos especiales
  ActivarTrigger("EfectosFinal");

  // cine
  ActivarCinemascope(TRUE);
  
  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolarColocarYMirarPunto("DUBALIX_7");
  EncolarPausaCamara(3000);
  IntroducirPuntoSincronia();   // 1
  
  EncolaTrayectoriaCamara("DUBALIX_8", FALSE, FALSE, 0, 0);
  IntroducirLocucion("0446", "LTEXT_TUTORIAL4_EVENTO4_00_TXT", 3000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("0447", "LTEXT_TUTORIAL4_EVENTO4_01_TXT", 3000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("0448", "LTEXT_TUTORIAL4_EVENTO4_02_TXT", 3000, 600, 100);
  IntroducirPuntoSincronia();   // 2
  
  EncolarColocarYMirarPunto("DUBALIX_11");
  IntroducirLocucion("0449", "LTEXT_TUTORIAL4_EVENTO4_03_TXT",3000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirPuntoSincronia();   // 4
  
  EncolarColocarYMirarPunto("DUBALIX_12");
  IntroducirLocucion("044A", "LTEXT_TUTORIAL4_EVENTO4_04_TXT",2000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirPuntoSincronia();   // 6

  IntroducirPonerModoJuegoCamara(TRUE);

  // acción
  EjecutarOrdenesCamara();

  // final  
  PonerHandleBoolACamara(hCamaraEnd);
  WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
  
  VaciarOrdenesCamara();
  VaciarLocuciones();
    
  bFinalDubalix = TRUE;

  MirarAPunto(x, y);

  // restaurar
  ActivarCinemascope(FALSE);
  
  // CHUSCO
  NeutralizarCivilizacion("Romanos", FALSE);
  NeutralizarCivilizacion("Galos", FALSE);
  
  // luces!
  IluminarZonaOnOff(79, 1, 109, 20, "pueblo", FALSE);
  
  bAdelanteSkirmish = TRUE;

  DestruirTrigger("FinalDubalix");
  
}


/////////////////////////////////////////////
// Efectos del final
Trigger "EfectosFinal" [Inactivo]
(
  TRUE
)
Var
{
  handle hTimer; 
}
Do
{

  // a moverse todos
// SetMoverFisicoTropa("ESCOLTA1", FALSE);
//SetMoverFisicoTropa("ESCOLTA2", FALSE);
  
  TropaSigueRutaPredefinida("DUBALIX", "DUBALIX4");
  TropaSigueRutaPredefinida("ESCOLTA1", "ESCOLTA2_4");
  TropaSigueRutaPredefinida("ESCOLTA2", "ESCOLTA1_4");

  WaitBool( (fPuntoSincronia == 1) || bFinalDubalix );
 
  DestruirTrigger("EfectosFinal");  

}




///////////////////////////////////////////////////////////////////////
// Contamos los puntos de sincronia
///////////////////////////////////////////////////////////////////////
Trigger "ContarPuntosSincronia" [Inactivo]
(
  Wait(hPuntoSincronia)
)
Do
{
  fPuntoSincronia = fPuntoSincronia + 1;
  PonerHandleEsperaSincronizacion(hPuntoSincronia);
}



//////////////////////////////////////////////////////////
// trigger de final
//////////////////////////////////////////////////////////
Trigger "End" [Activo]
(
  TRUE
)
Do
{
}
//////////////////////////////////////////////////////////