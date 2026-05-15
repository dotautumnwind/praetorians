
/************************************************************************/
/* Tutorial 2: Una Aldea en las Montañas                                */
/* Autor: JuanD                                                         */
/* Fecha: 30 Abril 2002                                                 */
/* Documento de diseño de escenario: Tutorial2.doc                      */
/************************************************************************/ 
/* Objetivos del tutorial:                                              */
/* a) Habilidades del centurión                                         */
/* b) Habilidades del médico                                            */
/* c) Mostrar la toma de pueblos                                        */
/* d) Manejo de los pueblos                                             */
/* e) Construcción de estructuras de defensa                            */
/* f) Asalto de estructuras de defensa                                  */
/************************************************************************/
/* Condiciones de victoria:                                             */
/* a) Aniquilar a todas las tropas galas                                */
/* d) Que no mueran ni el explorador, ni el médico, ni el centurión     */
/************************************************************************/

Var
{
	
  handle skiptutorial, nextstep, accion, hCamaraEnd;  // handles del tutorial
  float fcontador                 = 0;                // lección actual
  bool mostrarTrayectoria         = FALSE;            // auxiliar para trayectorias
  
  // variables de estado auxiliares
  string aux;                                         // para parámetros con &
  handle hEntrenamientoAcabado;                       // para vigilar el entrenamiento de tropas
  float tropasFabricadas          = 0;                // nº de tropas reclutado en total
  handle hTimerAux;                                   // temporizador auxiliar
  bool ataqueUnoHecho             = FALSE;            // auxiliar
  bool adelanteAtaquePueblo       = FALSE;            // ataque al pueblo
  handle hTimerAtaque;
  
  // estrategias y tacticas
  handle hCivGalos, hEstGalos, hObjetivoAtacar1, hObjetivoAtacar2;
  
  // objetivos
  handle hObjTomarTalagatta;
  handle hObjMataMata;
  handle hObjCneoVivo;
  handle hObjCayoVivo;
  handle hObjAgradoVivo;
  
  bool tomarTalagatta             = FALSE;
  bool enemigoDestruido           = FALSE;
  
}


#include "Funscript.h"

// fcontador
// 00 - Comienzo
// 01 - Centurion
// 02 - Medico
// 03 - Pueblo a la vista
// 04 - Contruir guarnicion
// 05 - Fabricar tropas
// 06 - Construir torre defensa
// 07 - Ataque al pueblo
// 08 - Ataque a torres enemigas
// 09 - Final del tutorial



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
  ActivarPresentacion(TRUE, "LTEXT_TUTORIAL2_PRESENTACION_TITULO",
                            "LTEXT_TUTORIAL2_PRESENTACION_LUGAR", hPresentacion);
  
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
  //restricciones de maquinas da asalto
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_BARBARA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_ROMANA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_EGIPCIA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_EGIPCIA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_BARBARA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "TORRE_ASALTO_ROMANA", "");
  
  // fuera el curar automático del médico
  SetHabilidadAutomatica("MEDICO", "CURACION_RAPIDA", FALSE);
  
  // objetivos
  hObjTomarTalagatta  = CrearHandle("Bool");
  hObjMataMata        = CrearHandle("Bool");
  hObjCneoVivo        = CrearHandle("Bool");
  hObjCayoVivo        = CrearHandle("Bool");
  hObjAgradoVivo      = CrearHandle("Bool");
  
  // objetivos
  AgregarObjetivoMision(hObjTomarTalagatta, "LTEXT_TUTORIAL2_OBJETIVO_00_TXT");
  AgregarObjetivoMision(hObjMataMata,       "LTEXT_TUTORIAL2_OBJETIVO_01_TXT");
  AgregarObjetivoMision(hObjCneoVivo,       "LTEXT_TUTORIAL2_OBJETIVO_02_TXT");
  AgregarObjetivoMision(hObjCayoVivo,       "LTEXT_TUTORIAL2_OBJETIVO_03_TXT");
  AgregarObjetivoMision(hObjAgradoVivo,     "LTEXT_TUTORIAL2_OBJETIVO_04_TXT");
  
  // RESTRICCIONES DE ESCENARIO
  IntroducirRestriccionUnidad("ORDEN_TRANSFORMAR_A_CENTURION", "", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "INFANTERIA_LIGERA", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "PIQUERO", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "ARQUERO", "");
    
  // RESTRICCIONES QUE PUEDEN CAMBIAR DURANTE EL ESCENARIO
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "", "");
  IntroducirRestriccionUnidad("ORDEN_TRANSFORMAR_A_LIGERA", "", "");

  // inicializamos los handles que necesitamos	
  skiptutorial = CrearHandle("Bool");
  nextstep = CrearHandle("Bool");
  accion = CrearHandle("Bool");
  hCamaraEnd = CrearHandle("Bool");
  hEntrenamientoAcabado = CrearHandle("Bool");
  
  // inicializamos los triggers de la misión
  ActivarTrigger("CuentaTropas");
  ActivarTrigger("DefensaPueblo");
  ActivarTrigger("AtaqueDos");
  ActivarTrigger("TalagattaMia");
  ActivarTrigger("EnemigoDestruido");
  ActivarTrigger("CayoTitoHabla");
  ActivarTrigger("InicioTutorial");
  ActivarTrigger("Skip");
  
  // metemos a cada uno en su casa y a dios en la de todos
  InteractuarTropaConEnte("GAL_ARQ_TOR_1", "TORRE_1");
  InteractuarTropaConEnte("GAL_ARQ_TOR_2", "TORRE_1");
  InteractuarTropaConEnte("JEFE_GALO", "Talagatta");

  // Estrategia de los galos, en principio vacia
  hCivGalos = DarCivilizacion("Galos");     // incializamos la estrategia
  hEstGalos = CrearEstrategiaScript();       // de la civilizacion gala
  AsignarEstrategia(hCivGalos, hEstGalos);
  StartEstrategia(hEstGalos);
  
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
  handle hCamaraEnd;
  handle hEscape;
  float x, y;
  
}
Do
{

  // inicializamos el panel de tutorial	
  fcontador = 0;
  hTimer = CrearTimer(1000);			// para que aparezca a los 2 segundos
  Wait(hTimer);

  // creamos
  CrearPanelTutorial(skiptutorial,nextstep);
  
  
  ///////////////////////////////////////////////////////////////////////////
  // LECCIONES:
  
  // Lección 0: Ataque inicial
  IntroducirPasoTutorial("LTEXT_TUTORIAL2_LECCION_00_TXT", "LTEXT_TUTORIAL2_LECCION_00_OBJ");
                         
  // Lección 1: Centurión
  IntroducirPasoTutorial("LTEXT_TUTORIAL2_LECCION_01_TXT", "LTEXT_TUTORIAL2_LECCION_01_OBJ");

  // Lección 2: Médico
  IntroducirPasoTutorial("LTEXT_TUTORIAL2_LECCION_02_TXT", "LTEXT_TUTORIAL2_LECCION_02_OBJ");                         
                         
  // Lección 3: Pueblo
  IntroducirPasoTutorial("LTEXT_TUTORIAL2_LECCION_03_TXT", "LTEXT_TUTORIAL2_LECCION_03_OBJ");                         
                         
  // Lección 4: Construir guarnición
  IntroducirPasoTutorial("LTEXT_TUTORIAL2_LECCION_04_TXT", "LTEXT_TUTORIAL2_LECCION_04_OBJ");
                         
  // Lección 5: Reclutar tropa
  IntroducirPasoTutorial("LTEXT_TUTORIAL2_LECCION_05_TXT", "LTEXT_TUTORIAL2_LECCION_05_OBJ");
                           
  // Lección 6: Contruir torre
  IntroducirPasoTutorial("LTEXT_TUTORIAL2_LECCION_06_TXT", "LTEXT_TUTORIAL2_LECCION_06_OBJ");  
                         
  // Lección 7: defender el pueblo
  IntroducirPasoTutorial("LTEXT_TUTORIAL2_LECCION_07_TXT", "LTEXT_TUTORIAL2_LECCION_07_OBJ");
                           
  // Lección 8: ataque
  IntroducirPasoTutorial("LTEXT_TUTORIAL2_LECCION_08_TXT", "LTEXT_TUTORIAL2_LECCION_08_OBJ");
  
  // Lección 9: final del tutorial
  IntroducirPasoTutorial("LTEXT_TUTORIAL2_LECCION_09_TXT", "LTEXT_TUTORIAL2_LECCION_09_OBJ");
                         
  ///////////////////////////////////////////////////////////////////////////                       


  // Pasamos al primer paso del tutorial
  AvanzarPasoTutorial(fcontador);			// poner el panel ahí
  ActivarTrigger("AtaqueInicialCompletado");		// condicón de terminación
  
  
  // Movimiento de cámara del principio
  
  // Pone a las tropas en movimiento
  TropaSigueRutaPredefinida("EXPLORADOR", "EXPLORADOR");
  GrupoTropasSeguirRutaPredefinida("ATAQUE_INICIAL", "ATAQUE_1");

  ////////////////////////////////////////////
  // Mensaje del explorador
  ////////////////////////////////////////////

  // handles de terminación  
  hCamaraEnd = CrearHandle("Bool");
  hEscape = CrearHandle("Bool");
  
    // cazar escape
  PonerHandleInterrupcion(hEscape);

  // recordar posición inicial
  DarPosicionCamara(&x, &y);

  // cine
  ActivarCinemascope(TRUE);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);
  
  EncolaTrayectoriaCamara("RECORRIDO_1", TRUE, FALSE, 1, 0);
  IntroducirLocucion("", "", 500, 0, 0);
  IntroducirLocucion("0210", "LTEXT_TUTORIAL2_EVENTO1_00_TXT", 4000, 600, 100);
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
  
  // Activar triggers necesarios para el tutorial
  ActivarTrigger("Accion");
  ActivarTrigger("Next");

  // Eliminar este trigger
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
Var
{
  handle hEscape;
  handle hCamaraEnd;
  float x,y;
  
}
Do
{
  fcontador = fcontador + 1;		// siguiente
  AvanzarPasoTutorial(fcontador);	// actualizar el panel en consecuencia
  DesactivarHandleBool(nextstep);
  QuitarVigilanciaHandleBool(accion);	// para evitar problemas por salto de paso
   
  if ( mostrarTrayectoria )               // exito de paso de tutorial
  {
    LanzarSonido("IATU");
  }
   
  if ( fcontador == 1 )			// centurion
  {
  	
    DesactivarTrigger("AtaqueInicialCompletado");
    DestruirTrigger("AtaqueInicialCompletado");
    
    // vigilar la selección del centurión
    aux = "HEROE_CAYO_TITO";
    VigilarInterfazSeleccion(NULL, &aux, accion);
    ActivarTrigger("Accion");
      	
  }
  else
  if ( fcontador == 2 )			// medico
  {
    ActivarTrigger("MedicoCura");
  }
  else
  if ( fcontador == 3 )			// pueblo
  {
    
    DesactivarTrigger("MedicoCura");
    DestruirTrigger("MedicoCura");

    if ( mostrarTrayectoria )
    {
   	
   	  // Iluminamos el pueblo
      IluminarZona(23,0,28,7,15000);
  
      // handles de terminación  
      hCamaraEnd = CrearHandle("Bool");
      hEscape = CrearHandle("Bool");
  
      // cazar escape
      PonerHandleInterrupcion(hEscape);

      // recordar posición inicial
      DarPosicionCamara(&x, &y);

      // cine
      ActivarCinemascope(TRUE);
      PararLogica(TRUE);

      // cámaras
      IntroducirPonerModoJuegoCamara(FALSE);
  
      EncolaTrayectoriaCamara("PUEBLO", TRUE, FALSE, 2, 0);
      EncolarPausaCamara(4000);
      EncolaTrayectoriaCamara("PUEBLO", FALSE, TRUE, 0, 2);
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

    }
   
    ActivarTrigger("GuarnicionGalaDestruida");
  
  }
  else
  if ( fcontador == 4 )			// contruir guarnicion
  {
    
    // habilitamos degradar
    QuitarRestriccionUnidad("ORDEN_TRANSFORMAR_A_LIGERA", "", "");
  
    // desactivamos el trigger del paso anterior
    DesactivarTrigger("GuarnicionGalaDestruida");
    DestruirTrigger("GuarnicionGalaDestruida");
    
    ActivarTrigger("ConstruirGuarnicion");
  	
  }
  else
  if ( fcontador == 5 )			// reclutar tropa
  {
  	
    // desactivamos el trigger del paso anterior
    DesactivarTrigger("ConstruirGuarnicion");
    DestruirTrigger("ConstruirGuarnicion");
  
    ActivarTrigger("VigilarFabricacionTropas");  
	
  }
  else
  if ( fcontador == 6 )			// contruir torre
  {
    
    // habilitamos las torres de defensa y reparar
    QuitarRestriccionEstructura("ORDEN_CONSTRUIR", "TORRE_DEFENSA_ROMANA", "");
  	
    // desactivamos los triggers del paso anterior
    DesactivarTrigger("VigilarFabricacionTropas");
    DestruirTrigger("VigilarFabricacionTropas");

    aux = "TORRE_DEFENSA_ROMANA";
    VigilarConstruccionAcabada(NULL, &aux, accion);
    ActivarTrigger("Accion");
  	
  }
  else
  if ( fcontador == 7 )			// defender el pueblo
  {
      ActivarTrigger("AtaqueUno");
      ActivarTrigger("TimerAtaqueUno");
      ActivarTrigger("VigilarFinAtaque2");
  }
  else
  if ( fcontador == 8 )			// localizar y detruir las torres enemigas
  {

    //desactivamos el trigger del paso anterior
    DesactivarTrigger("VigilarFinAtaque2");
    DestruirTrigger("VigilarFinAtaque2");

    if ( mostrarTrayectoria )
    {
    
      // Ilumino la torre
      IluminarZona(87,2,88,7,16000);
  
      // handles de terminación  
      hCamaraEnd = CrearHandle("Bool");
      hEscape = CrearHandle("Bool");
  
      // cazar escape
      PonerHandleInterrupcion(hEscape);

      // recordar posición inicial
      DarPosicionCamara(&x, &y);

      // cine
      ActivarCinemascope(TRUE);
      PararLogica(TRUE);

      // cámaras
      IntroducirPonerModoJuegoCamara(FALSE);
  
      EncolaTrayectoriaCamara("TORRE", TRUE, TRUE, 2, 2);
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
      
    }

    //a esperar la destruccion de las torres enemigas
    ActivarTrigger("VigilarTomaTorres");
    
  }
  else
  {
    
    DesactivarTrigger("VigilarTomaTorres");
    DestruirTrigger("VigilarTomaTorres");
    
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
// Trigger que controla el final del ataque inicial
//////////////////////////////////////////////////////////
Trigger "AtaqueInicialCompletado" [Inactivo]
(
  DarTropasVivasDeGrupo("ATAQUE_INICIAL") == 0
)
Var
{
  handle hTimerExp;
  handle hCamaraEnd;
  handle hEscape;
  float x, y;
}
Do
{

  DesactivarTrigger("AtaqueInicialCompletado");

  // handles de terminación	
  hCamaraEnd = CrearHandle("Bool");
  hEscape = CrearHandle("Bool");
	
  // cazar escape
  PonerHandleInterrupcion(hEscape);

  // recordar posición inicial
  DarPosicionCamara(&x, &y);

  // cine
  ActivarCinemascope(TRUE);
  PararLogica(TRUE);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);
  
  EncolarMirarEnteCamara("EXPLORADOR");
  IntroducirLocucion("0211", "LTEXT_TUTORIAL2_EVENTO2_00_TXT", 5000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("0212", "LTEXT_TUTORIAL2_EVENTO2_01_TXT", 5000, 600, 100);
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
  
  mostrarTrayectoria = TRUE;  
  ActivarHandleBool(nextstep);		// avanzar el paso del tutorial
 
}
//////////////////////////////////////////////////////////




//////////////////////////////////////////////////////////
// Trigger que espera a que el jugador cure a su gente
//////////////////////////////////////////////////////////
Trigger "MedicoCura" [Inactivo]
(
  EstaCivilizacionCurada("Romanos")
)
Do
{

  DestruirTrigger("MedicoCura");
	
  mostrarTrayectoria = TRUE;  
  ActivarHandleBool(nextstep);		
 
}
//////////////////////////////////////////////////////////




//////////////////////////////////////////////////////////
// Trigger que controla la destruccion de la guarnicion
// gala
//////////////////////////////////////////////////////////
Trigger "GuarnicionGalaDestruida" [Inactivo]
(
  !EstaEnteVivo("Talagatta Garrison")
)
Do
{
	
  DesactivarTrigger("GuarnicionGalaDestruida");
	
  mostrarTrayectoria = TRUE;	
  ActivarHandleBool(nextstep);		// avanzar el paso del tutorial
}
//////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////
// Trigger que controla la construcción de la guarnicion
//////////////////////////////////////////////////////////
Trigger "ConstruirGuarnicion" [Inactivo]
(
  EstaPuebloConquistado("Romanos", "Talagatta")
)
Do
{
	
  DesactivarTrigger("ConstruirGuarnicion");
	
  mostrarTrayectoria = TRUE;
  ActivarHandleBool(nextstep);		// avanzar el paso del tutorial
}
//////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////
// Vigila la construcción de tropas
//////////////////////////////////////////////////////////
Trigger "VigilarFabricacionTropas" [Inactivo]
(
  (tropasFabricadas >= 1)
)
Do
{
	
  DesactivarTrigger("VigilarFabricacionTropas");	

  mostrarTrayectoria = TRUE;
  ActivarHandleBool(nextstep);		// avanzar el paso del tutorial
}
//////////////////////////////////////////////////////////


Trigger "CuentaTropas" [Inactivo]
(
  TRUE
)
Do
{
  VigilarEntrenamientoAcabado(NULL, NULL, hEntrenamientoAcabado);
  Wait(hEntrenamientoAcabado);
  tropasFabricadas = tropasFabricadas + 1;
}


//////////////////////////////////////////////////////////
// Comienza el ataque al pueblo con un timer
//////////////////////////////////////////////////////////
Trigger "TimerAtaqueUno" [Inactivo]
(
  EstaPuebloConquistado("Romanos", "Talagatta")
)
Var
{
//handle hTimerAtaque;
}
Do
{
  
  hTimerAtaque = CrearTimer(120000);
  Wait(hTimerAtaque);

  adelanteAtaquePueblo = TRUE;

  DesactivarTrigger("TimerAtaqueUno");
  DestruirTrigger("TimerAtaqueUno");
  
}




//////////////////////////////////////////////////////////
// Vigila el final del segundo ataque
//////////////////////////////////////////////////////////
Trigger "VigilarFinAtaque2" [Inactivo]
(
  ((DarTropasVivasDeGrupo("ATAQUE_2_1")+DarTropasVivasDeGrupo("ATAQUE_2_2")) == 0)
)
Var
{
  float trapi; 
}
Do
{

  DesactivarTrigger("VigilarFinAtaque2");
  
  // Dios me castigará por esto
  trapi = fcontador;
 
  // esperamos un poquito
  hTimerAux = CrearTimer(2000);
  Wait(hTimerAux);
	
	if ( trapi == fcontador )
  {
    mostrarTrayectoria = TRUE;
    ActivarHandleBool(nextstep);		// avanzar el paso del tutorial
  }
  
}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Vigila la destruccion de las torres enemigas
//////////////////////////////////////////////////////////
Trigger "VigilarTomaTorres" [Inactivo]
(
  !EstaTropaViva("GAL_ARQ_TOR_1") && !EstaTropaViva("GAL_ARQ_TOR_2")
)
Do
{
	
  DesactivarTrigger("VigilarTomaTorres");
	
  mostrarTrayectoria = TRUE;
  ActivarHandleBool(nextstep);		// avanzar el paso del tutorial
}
//////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////
// DEFENSA DEL PUEBLO
//////////////////////////////////////////////////////////

Trigger "DefensaPueblo" [Inactivo]
(
  TropaRecibeDanyo("DEFENSA_1") ||
  TropaRecibeDanyo("DEFENSA_2") ||
  TropaRecibeDanyo("DEFENSA_3")
)
Do
{

  DesactivarTrigger("DefensaPueblo");
  DestruirTrigger("DefensaPueblo");

  // lanzamos el ataque	
  GrupoTropasSeguirRutaPredefinida("DEFENSA_PUEBLO", "DEFENSA_PUEBLO_1");
  GrupoTropasSeguirRutaPredefinida("PUEBLO_2", "DEFENSA_PUEBLO_2");
	
}



//////////////////////////////////////////////////////////
// AtaqueUno: primer ataque al poblado. Se activa cuando
// el jugador ha construido otras 120 tropas
//////////////////////////////////////////////////////////
Trigger "AtaqueUno" [Inactivo]
(
  (tropasFabricadas >= 4) || adelanteAtaquePueblo
)
Do
{

  // lanzamos la primera oleada	
  hObjetivoAtacar1 = CrearObjetivo(hEstGalos, "AtacarPunto",32,31);
  AnyadirGrupoAObjetivo(hObjetivoAtacar1, "ATAQUE_2_1");
  AnyadirObjetivo(hEstGalos, hObjetivoAtacar1);
  
  // esperamos a que no quede ni cristo del primer ataque
  WaitBool(DarTropasVivasDeGrupo("ATAQUE_2_1") == 0);

  // lanzamos la segunda oleada
  hObjetivoAtacar2 = CrearObjetivo(hEstGalos, "AtacarPunto",32,31);
  AnyadirGrupoAObjetivo(hObjetivoAtacar2, "ATAQUE_2_2");
  AnyadirObjetivo(hEstGalos, hObjetivoAtacar2);

  DesactivarTrigger("AtaqueUno");
  DestruirTrigger("AtaqueUno");

}




//////////////////////////////////////////////////////////
// AtaqueDos: ataque cuando el jugador ha tomado la
// torre de defensa, aniquilando a las tropas de dentro
//////////////////////////////////////////////////////////
Trigger "AtaqueDos" [Inactivo]
(
  !EstaTropaViva("GAL_ARQ_TOR_1") && !EstaTropaViva("GAL_ARQ_TOR_2")
)
Do
{

  DesactivarTrigger("AtaqueDos");
  DestruirTrigger("AtaqueDos");

  ActivarTrigger("EvitarLimpiar");
  
}


//////////////////////////////////////////////////////////
// Este se encarga de cerrar todo, as¡ que cuando queramos
// chapar tiramos abajo el handle skiptutorial
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

  // triggers de pasos
  DesactivarTrigger("AtaqueIncialCompletado");
  DesactivarTrigger("GuarnicionGalaDestruida");
  DesactivarTrigger("ConstruirGuarnicion");
  DesactivarTrigger("VigilarFabricacionTropas");
  DesactivarTrigger("VigilarFinAtaque2");
  DesactivarTrigger("VigilarTomaTorres");
  DestruirTrigger("AtaqueIncialCompletado");
  DestruirTrigger("GuarnicionGalaDestruida");
  DestruirTrigger("ConstruirGuarnicion");
  DestruirTrigger("VigilarFabricacionTropas");
  DestruirTrigger("VigilarFinAtaque2");
  DestruirTrigger("VigilarTomaTorres");
  
  // y cerramos el panel del tutorial
  DestruirPanelTutorial();
  
  // Ataque al pueblo
  if ( !ataqueUnoHecho ) {
    ActivarTrigger("AtaqueUno");
  }

  // habilitamos lo que haya que habilitar    
  QuitarRestriccionEstructura("ORDEN_CONSTRUIR", "TORRE_DEFENSA_ROMANA", "");
  QuitarRestriccionUnidad("ORDEN_TRANSFORMAR_A_LIGERA", "", "");
  
}
//////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////
// Anti-limpiar tropas para evitar un final aburrido
//////////////////////////////////////////////////////////
Trigger "EvitarLimpiar" [Inactivo]
(
  TRUE
)
Do
{

  TodosAlAtaque("Galos");

/*
  VisualizarGrupoMiniMapa("TODOS", TRUE);
  
  hFinalLimpiar = CrearTactica(hEstGalos, "AtacarPunto",31,31);
  AnyadirGrupoATactica(hFinalLimpiar, "TODOS");
  AnyadirTactica(hEstGalos, hFinalLimpiar);
*/

  DesactivarTrigger("EvitarLimpiar");
  DestruirTrigger("EvitarLimpiar");
  
}







//////////////////////////////////////////////////////////
// Trigger de condiciones de victoria
//////////////////////////////////////////////////////////
Trigger "CondicionesDeVictoria" [Activo]
(
  !EstaTropaViva("EXPLORADOR")      ||
  !EstaTropaViva("CENTURION")       ||
  !EstaTropaViva("MEDICO")          ||
  EstructuraDestruida("Talagatta")  ||
  ((DarUnidadesVivas("Galos") == 0) && tomarTalagatta )
)
Var
{
  handle hCamaraEnd;
  handle hEscape;
}
Do
{
	
  if (DarUnidadesVivas("Galos") == 0) {
    
    IndicarObjetivoCumplido(hObjMataMata);
    IndicarObjetivoCumplido(hObjCneoVivo);
    IndicarObjetivoCumplido(hObjCayoVivo);
    IndicarObjetivoCumplido(hObjAgradoVivo);
    
    NeutralizarCivilizacion("Galos", TRUE);
    NeutralizarCivilizacion("Romanos", TRUE);
 
    // clavamos al explorador en el suelo
    OrdenarTropaMantenerPosicion("EXPLORADOR", TRUE);
 
    // handle de final y presentacion
    hCamaraEnd = CrearHandle("Bool");
    hEscape = CrearHandle("Bool");

    // cazar escape
    PonerHandleInterrupcion(hEscape);
  
    // cine
    ActivarCinemascope(TRUE);
    
    // efectos especiales
    ActivarTrigger("EfectosBriefing");

    // cámaras
    IntroducirPonerModoJuegoCamara(FALSE);

    EncolarMirarEnteCamara("EXPLORADOR");
    IntroducirLocucion("0213", "LTEXT_TUTORIAL2_EVENTO4_00_TXT", 1000, 600, 100);
    IntroducirLocucion("", "", 100, 0, 0);
    IntroducirLocucion("0214", "LTEXT_TUTORIAL2_EVENTO4_01_TXT", 4000, 600, 100);
    IntroducirLocucion("", "", 100, 0, 0);
    IntroducirLocucion("0215", "LTEXT_TUTORIAL2_EVENTO4_02_TXT", 5000, 600, 100);
    IntroducirPuntoSincronia();   // 1
  
    IntroducirPonerModoJuegoCamara(TRUE);

    // acción
    EjecutarOrdenesCamara();

    // final  
    PonerHandleBoolACamara(hCamaraEnd);
    WaitBool(HandleDisparado(hCamaraEnd) || HandleDisparado(hEscape));
   
    VaciarOrdenesCamara();
    VaciarLocuciones();

    // restaurar
    ActivarCinemascope(FALSE);
     
    FinalizarMision(TRUE);
    
  }
  else {
    
    if ( EstructuraDestruida("Talagatta") ) {
      IndicarObjetivoFracasado(hObjTomarTalagatta);
    }
    
    if ( !EstaTropaViva("EXPLORADOR") ) {
      IndicarObjetivoFracasado(hObjAgradoVivo);
    }
    
    if ( !EstaTropaViva("CENTURION") ) {
      IndicarObjetivoFracasado(hObjCayoVivo);
    }
    
    if ( !EstaTropaViva("MEDICO") ) {
      IndicarObjetivoFracasado(hObjCneoVivo);
    }
        
    FinalizarMision(FALSE);
    
  }
  
  DesactivarTrigger("CondicionesDeVictoria");
  DestruirTrigger("CondicionesDeVictoria");

}
//////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////
// triggers de objetvo
//////////////////////////////////////////////////////////

Trigger "TalagattaMia" [Inactivo]
(
    EstaPuebloConquistado("Romanos", "Talagatta")
)
Do
{
  
  IndicarObjetivoCumplido(hObjTomarTalagatta);
  tomarTalagatta = TRUE;
  
  DesactivarTrigger("TalagattaMia");
  DestruirTrigger("TalagattaMia");
  
}

Trigger "EnemigoDestruido" [Inactivo]
(
  DarUnidadesVivas("Galos") == 0
)
Do
{
  IndicarObjetivoCumplido(hObjMataMata);
  enemigoDestruido = TRUE;
  
  DesactivarTrigger("EnemigoDestruido");
  DestruirTrigger("EnemigoDestruido");
  
}


//////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////
// Trigger que controla la destruccion de la guarnicion
// gala para las palabras de cayo tito
//////////////////////////////////////////////////////////
Trigger "CayoTitoHabla" [Inactivo]
(
  !EstaEnteVivo("Talagatta Garrison")
)
Var
{
  float x, y;
  handle hCamaraEnd;
  handle hEscape;
}
Do
{
 
  // clavamos al centurión en el suelo
  OrdenarTropaMantenerPosicion("CENTURION", TRUE);
 
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
    
  // efectos especiales
  ActivarTrigger("EfectosBriefing");

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolarMirarEnteCamara("CENTURION");
  IntroducirLocucion("0220", "LTEXT_TUTORIAL2_EVENTO3_00_TXT", 3000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("0221", "LTEXT_TUTORIAL2_EVENTO3_01_TXT", 5000, 600, 100);
  IntroducirPuntoSincronia();   // 1
  
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

  OrdenarTropaMantenerPosicion("CENTURION", FALSE);
	
  DesactivarTrigger("CayoTitoHabla");
  
}
//////////////////////////////////////////////////////////





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