
/************************************************************************/
/* Tutorial 3: Una demostración de fuerza                               */
/* Autor: JuanD                                                         */
/* Fecha: 8 Mayo 2002                                                   */
/* Documento de diseño de escenario: Tutorial3.doc                      */
/************************************************************************/ 
/* Objetivos del tutorial:                                              */
// a) Construcción de escalas y catapultas                              */
/* b) Uso de escalas y catapultas para tomar una fortaleza              */
/* c) Funcionamiento de la defensa y ataque a fortalezas                */
/************************************************************************/
/* Condiciones de victoria:                                             */
/* - El centurión y el médico siguen con vida                           */
/* - Tomar Matisco                                                      */
/* - Acabar con todas las tropas galas                                  */
/************************************************************************/

Var
{
	
  handle skiptutorial, nextstep, accion, hCamaraEnd;        // handles del tutorial
  float fcontador                     = 0;                  // lección actual
  bool mostrarTrayectoria             = FALSE;              // auxiliar para trayectorias
  
  // variables de estado auxiliares
  string aux, aux2;                                         // para parámetros con &
  float numEscalas                    = 0;
  float numCatapultas                 = 0;                  // contar el número de
  handle hContandoEscalas, hContandoCatapultas;             // vigilar la fabricación de
  string escala                       = "ESCALA_ROMANA";    // auxiliares
  string catapulta                    = "CATAPULTA_ROMANA";
  bool yaSeAcerco                     = FALSE;
  
  // estrategias y tal y tal
  handle hCivGalos, hEstGalos, hObjDefensa;
  handle hTacticaAtacar;
  
  // objetivos
  handle hObjCayoVivo;
  handle hObjCneoVivo;
  handle hObjAgradoVivo;
  handle hObjTomarMatisco;
  handle hObjMataMata;
  
  bool matiscoTomada                  = FALSE;
  bool enemigoDestruido               = FALSE;
  
  float numeroDefensores              = 0;
  
}


#include "Funscript.h"

// fcontador
// 00 - Introducción
// 01 - Infantería pesada
// 02 - Explorador Lobo
// 03 - Tomar Matisco
// 04 - Avanzar hasta la fortaleza
// 05 - Fabricar una escala
// 06 - Fabricar una catapulta
// 07 - Construir 3 escalas y 3 catapultas más
// 08 - ¡Al asalto!
// 09 - Dentro del patio

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
  ActivarPresentacion(TRUE, "LTEXT_TUTORIAL3_PRESENTACION_TITULO",
                            "LTEXT_TUTORIAL3_PRESENTACION_LUGAR", hPresentacion);
  
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
  
  // para la secuencia de resistencia final
  numeroDefensores = DarTropasVivasDeGrupo("FORTALEZA_GROUP");

  // objetivos    
  hObjCayoVivo      = CrearHandle("Bool");
  hObjCneoVivo      = CrearHandle("Bool");
  hObjAgradoVivo    = CrearHandle("Bool");
  hObjTomarMatisco  = CrearHandle("Bool");
  hObjMataMata      = CrearHandle("Bool");
  
  AgregarObjetivoMision(hObjTomarMatisco, "LTEXT_TUTORIAL3_OBJETIVO_00_TXT");
  AgregarObjetivoMision(hObjMataMata, "LTEXT_TUTORIAL3_OBJETIVO_01_TXT");
  AgregarObjetivoMision(hObjCayoVivo, "LTEXT_TUTORIAL3_OBJETIVO_02_TXT");
  AgregarObjetivoMision(hObjCneoVivo, "LTEXT_TUTORIAL3_OBJETIVO_03_TXT");
  AgregarObjetivoMision(hObjAgradoVivo, "LTEXT_TUTORIAL3_OBJETIVO_04_TXT");
  
  // RESTRICCIONES DE ESCENARIO
  IntroducirRestriccionUnidad("ORDEN_TRANSFORMAR_A_CENTURION", "", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "INFANTERIA_LIGERA", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "INFANTERIA_PESADA", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "PIQUERO", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "ARQUERO", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EXPLORADOR_LOBO", "");
  QuitarRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EXPLORADOR_HALCON", "");
    
  // RESTRICCIONES QUE PUEDEN CAMBIAR DURANTE EL ESCENARIO
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "", "");
  QuitarRestriccionEstructura("ORDEN_CONSTRUIR", "TORRE_DEFENSA_ROMANA", "");
   
   
  // inicializamos los handles que necesitamos	
  skiptutorial = CrearHandle("Bool");
  nextstep = CrearHandle("Bool");
  accion = CrearHandle("Bool");
  hCamaraEnd = CrearHandle("Bool");
  
  // inicializamos los triggers de la misión
  ActivarTrigger("Ataque1");                  // ataque inicial tras la conquista del pueblo
  ActivarTrigger("Acercado");
  ActivarTrigger("MatiscoTomada");
  ActivarTrigger("EnemigoDestruido");
  ActivarTrigger("InicioTutorial");
  ActivarTrigger("Skip");
  ActivarTrigger("AtaqueBosque");
  ActivarTrigger("SalidaCaballeriaCercania");

  
  // Organizar la defensa de la fortaleza
  hCivGalos = DarCivilizacion("Galos");     // incializamos la estrategia
  hEstGalos = CrearEstrategiaScript();       // de la civilizacion gala
  AsignarEstrategia(hCivGalos, hEstGalos);
  StartEstrategia(hEstGalos);
  
  // Objetivo: ¡defender!
  hObjDefensa = CrearObjetivo(hEstGalos, "DefensaFortaleza", "Fortaleza de Dubalix");
  AnyadirGrupoAObjetivo(hObjDefensa, "FORTALEZA");
  AnyadirObjetivo(hEstGalos, hObjDefensa);
  
  SetEntrenamientoPueblo(hEstGalos, "Barracks", FALSE); 
 
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

  // Lección 0: Introducción
  IntroducirPasoTutorial("LTEXT_TUTORIAL3_LECCION_00_TXT","LTEXT_TUTORIAL3_LECCION_00_OBJ");

  // Lección 1: Infantería pesada
  IntroducirPasoTutorial("LTEXT_TUTORIAL3_LECCION_01_TXT","LTEXT_TUTORIAL3_LECCION_01_OBJ");

  // Lección 2: Explorador Lobo
  IntroducirPasoTutorial("LTEXT_TUTORIAL3_LECCION_02_TXT","LTEXT_TUTORIAL3_LECCION_02_OBJ");

  // Lección 3: Capturar Matisco
  IntroducirPasoTutorial("LTEXT_TUTORIAL3_LECCION_03_TXT","LTEXT_TUTORIAL3_LECCION_03_OBJ");

  // Lección 4: Avanzar hacia la fortaleza
  IntroducirPasoTutorial("LTEXT_TUTORIAL3_LECCION_04_TXT","LTEXT_TUTORIAL3_LECCION_04_OBJ");
  
  // Lección 5: Construir una escala
  IntroducirPasoTutorial("LTEXT_TUTORIAL3_LECCION_05_TXT","LTEXT_TUTORIAL3_LECCION_05_OBJ");
                         
  // Lección 6: Construir una catapulta
  IntroducirPasoTutorial("LTEXT_TUTORIAL3_LECCION_06_TXT","LTEXT_TUTORIAL3_LECCION_06_OBJ");
                         
  // Lección 7: Construir 3 escalas y 3 catapultas más
  IntroducirPasoTutorial("LTEXT_TUTORIAL3_LECCION_07_TXT","LTEXT_TUTORIAL3_LECCION_07_OBJ");
                         
  // Lección 8: ¡Al asalto!
  IntroducirPasoTutorial("LTEXT_TUTORIAL3_LECCION_08_TXT","LTEXT_TUTORIAL3_LECCION_08_OBJ");
                         
  // Lección 9: La lucha en el patio
  IntroducirPasoTutorial("LTEXT_TUTORIAL3_LECCION_09_TXT","LTEXT_TUTORIAL3_LECCION_09_OBJ");
                         
  //                       
  ////////////////////////////////////////////////////////////////////////////////////

  // Pasamos al primer paso del tutorial
  AvanzarPasoTutorial(fcontador);			          // poner el panel ahí
  
  // vigilar la selección de la infantería pesada
  aux = "INFANTERIA_PESADA";
  VigilarInterfazSeleccion(NULL, &aux, accion);
  ActivarTrigger("Accion");

  
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

  if ( fcontador == 1 )
  {
    
    // vigilar la selección del explorador lobo
    aux = "EXPLORADOR_LOBO";
    VigilarInterfazSeleccion(NULL, &aux, accion);
    ActivarTrigger("Accion");
    
  }
  else
  if ( fcontador == 2 )     // explorador lobo
  {
    
    // vigilar el uso del familiar
    aux = "EXPLORADOR_LOBO";
    aux2 = "SOLTAR_FAMILIAR_LOBO";
    VigilarOrdenHabilidadEspecial(&aux, &aux2, accion);
    ActivarTrigger("Accion");
    
  }
  else
  if ( fcontador == 3 )     // capturar matisco
  {
    ActivarTrigger("PuebloConquistado");
  }
  else
  if ( fcontador == 4 )			// localizar la fortaleza
  {
    DesactivarTrigger("PuebloConquistado");
    DestruirTrigger("PuebloConquistado");  	
    
    ActivarTrigger("FortalezaALaVista");
      	
  }
  else
  if ( fcontador == 5 )			// construir una escala
  {
  
    // habilitar   
    QuitarRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_ROMANA", "");
    
    DesactivarTrigger("FortalezaALaVista");
    DestruirTrigger("FortalezaALaVista");
    
    ActivarTrigger("ContandoMaquinas");
    ActivarTrigger("UnaEscala");
  	
  }
  else
  if ( fcontador == 6 )			// construir una catapulta
  {
   
   // habilitamos 
   QuitarRestriccionUnidad("ORDEN_CONSTRUIR", "CATAPULTA_ROMANA", "");

   DesactivarTrigger("UnaEscala");
   DestruirTrigger("UnaEscala");
   
   ActivarTrigger("UnaCatapulta");
  
  }
  else
  if ( fcontador == 7 )			// contruir 3 de cada más
  {
  
    DesactivarTrigger("UnaCatapulta");
    DestruirTrigger("UnaCatapulta");
    
    ActivarTrigger("TresMasDeCada");
    
  }
  else
  if ( fcontador == 8 )			// ¡Al Asalto!
  {
    
    ActivarTrigger("SalidaCaballeria");
  	
    DesactivarTrigger("TresMasDeCada");
    DestruirTrigger("TresMasDeCada");
    
    ActivarTrigger("EntrarEnPatio");
  	
  }
  else                      // Final
  {
    DesactivarTrigger("EntrarEnPatio");
    DestruirTrigger("EntrarEnPatio");
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
// PuebloConquistado: usado en el paso 1 del tutorial
//////////////////////////////////////////////////////////
Trigger "PuebloConquistado" [Inactivo]
(
  EstaPuebloConquistado("Romanos","Matisco")
)
Do
{

  DesactivarTrigger("PuebloConquistado");
  
  ActivarHandleBool(nextstep);		// avanzar el paso del tutorial
  mostrarTrayectoria = TRUE;
  
}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Estamos cerca de la fortaleza, paso 2 del tutorial
//////////////////////////////////////////////////////////
Trigger "FortalezaALaVista" [Inactivo]
(
  yaSeAcerco
)
Do
{
  
  DesactivarTrigger("FortalezaALaVista");
  
  ActivarHandleBool(nextstep);
  mostrarTrayectoria = TRUE;
  
}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Vigilar la construccion de 1 escala
//////////////////////////////////////////////////////////
Trigger "UnaEscala" [Inactivo]
(
  (numEscalas >= 1)
)
Do
{
  
  DesactivarTrigger("UnaEscala");
  
  ActivarHandleBool(nextstep);
  mostrarTrayectoria = TRUE;
  
}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Vigilar la construccion de 1 catapulta
//////////////////////////////////////////////////////////
Trigger "UnaCatapulta" [Inactivo]
(
  (numCatapultas >= 1)
)
Do
{
  
  DesactivarTrigger("UnaCatapulta");
  
  ActivarHandleBool(nextstep);
  mostrarTrayectoria = TRUE;
  
}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// 4 escalas y 4 catapultas, 3 más de cada
//////////////////////////////////////////////////////////
Trigger "TresMasDeCada" [Inactivo]
(
  (numEscalas >= 3) && (numCatapultas >= 3)
)
Do
{
  
  DesactivarTrigger("TresMasDeCada");
  
  ActivarHandleBool(nextstep);
  mostrarTrayectoria = TRUE;
  
}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// El jugador ha entrado en el patio de la fortaleza
//////////////////////////////////////////////////////////
Trigger "EntrarEnPatio" [Inactivo]
(
  HanEntradoCivilizacionesEnZona("PATIO", "Romanos")
  ||
  !EstaTropaViva("GAL_CENTURION")
)
Do
{
  
  DesactivarTrigger("EntrarEnPatio");
  
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

  // triggers de pasos
  DesactivarTrigger("EntrarEnPatio");
  DesactivarTrigger("TresMasDeCada");
  DesactivarTrigger("UnaCatapulta");
  DesactivarTrigger("UnaEscala");
  DesactivarTrigger("FortalezaALaVista");
  DesactivarTrigger("PuebloConquistado");
  DestruirTrigger("EntrarEnPatio");
  DestruirTrigger("TresMasDeCada");
  DestruirTrigger("UnaCatapulta");
  DestruirTrigger("UnaEscala");
  DestruirTrigger("FortalezaALaVista");
  DestruirTrigger("PuebloConquistado");

 
  // y cerramos el panel del tutorial
  DestruirPanelTutorial();
  
  // Activamos los ataques
  ActivarTrigger("SalidaCaballeria");
  
  // habilitamos lo que haya que habilitar
  QuitarRestriccionUnidad("ORDEN_CONSTRUIR", "CATAPULTA_ROMANA", "");
  QuitarRestriccionUnidad("ORDEN_CONSTRUIR", "ESCALA_ROMANA", "");

  
}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Ataque desde bosque
//////////////////////////////////////////////////////////
Trigger "AtaqueBosque" [Inactivo]
(
  HanEntradoCivilizacionesEnZona("Z_ATAQUEBOSQUE", "Romanos")
)
Do
{
  
  if ( DarTropasVivasDeGrupo("ATAQUE_1_BOSQUE") > 0 )
  {
    GrupoTropasSeguirRutaPredefinida("ATAQUE_1_BOSQUE", "ATAQUE_1_1");
  }

  DestruirTrigger("AtaqueBosque");
  
}



//////////////////////////////////////////////////////////
// Ataque al pueblo al principio
//////////////////////////////////////////////////////////
Trigger "Ataque1" [Inactivo]
(
  EstaPuebloConquistado("Romanos","Matisco") ||
  HanEntradoCivilizacionesEnZona("ATAQUE_1", "Romanos")
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
	
	// echamos a andar
  ModificarLluvia(50.0, 50.0, 50.0, 99999.0);

 hTimer = CrearTimer(2000);
  Wait(hTimer);

  // las ponemos a andar    
  GrupoTropasSeguirRutaPredefinida("ATAQUE_1_PUENTE", "ATAQUE_1_2");
   
  if ( (DarTropasVivasDeGrupo("ATAQUE_1_PUENTE") > 0) &&
       (DarPorcentajeTropasEnZona("Romanos", "ATAQUE_1") == 0) )
  {

    // esperamos un poco
    hTimer = CrearTimer(2000);
    Wait(hTimer);
    
    // luces
    HacerVisibleTropa("PUENTE_1", TRUE);
    HacerVisibleTropa("PUENTE_2", TRUE);
    HacerVisibleTropa("PUENTE_3", TRUE);
    HacerVisibleTropa("PUENTE_4", TRUE);
    IluminarZona(47, 1, 14, 10, 10000);

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
  
    EncolaTrayectoriaCamara("ATAQUE_1", TRUE, TRUE, 2, 3);
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
    
    HacerVisibleTropa("PUENTE_1", FALSE);
    HacerVisibleTropa("PUENTE_2", FALSE);
    HacerVisibleTropa("PUENTE_3", FALSE);
    HacerVisibleTropa("PUENTE_4", FALSE);
 
	}

	
  DesactivarTrigger("Ataque1");
  DestruirTrigger("Ataque1");
  
  ActivarTrigger("DejaDeLlover");
    
}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Que deje de llover cuando aniquiles al ataque1
//////////////////////////////////////////////////////////
Trigger "DejaDeLlover" [Inactivo]
(
  (DarTropasVivasDeGrupo("ATAQUE_1_BOSQUE") == 0) &&
  (DarTropasVivasDeGrupo("ATAQUE_1_PUENTE") == 0)
)
Do
{
  
  ModificarLluvia(0.0, 0.0, 25.0, 99999.0);
  
  DesactivarTrigger("DejaDeLlover");
  DestruirTrigger("DejaDeLlover"); 
}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Trigger para controlar en número de escalas y
// catapultas fabricadas
//////////////////////////////////////////////////////////
Trigger "ContandoMaquinas" [Inactivo]
(
  TRUE
)
Do
{

  numCatapultas = 0;
  numEscalas = 0;
  
  hContandoEscalas = CrearHandle("Bool");
  hContandoCatapultas = CrearHandle("Bool");
  
  VigilarConstruccionMaquinaAcabada(NULL, &catapulta, hContandoCatapultas);
  VigilarConstruccionMaquinaAcabada(NULL, &escala, hContandoEscalas);

  ActivarTrigger("ContandoCatapultas");
  ActivarTrigger("ContandoEscalas");

  DesactivarTrigger("ContandoMaquinas");
  DestruirTrigger("ContandoMaquinas");
  
}

Trigger "ContandoCatapultas" [Inactivo]
(
  Wait(hContandoCatapultas)
)
Do
{
  numCatapultas = numCatapultas + 1;
  VigilarConstruccionMaquinaAcabada(NULL, &catapulta, hContandoCatapultas);
}

Trigger "ContandoEscalas" [Inactivo]
(
  Wait(hContandoEscalas)
)
Do
{
  numEscalas = numEscalas + 1;
  VigilarConstruccionMaquinaAcabada(NULL, &escala, hContandoEscalas);
}


//////////////////////////////////////////////////////////
// Salida de la caballería a por catapultas
//////////////////////////////////////////////////////////

Trigger "SalidaCaballeria" [Inactivo]
(
  HayTipoUnidadEnZona("CATAPULTA_ROMANA","CATAPULTA_1") ||
  HayTipoUnidadEnZona("CATAPULTA_ROMANA","CATAPULTA_2") ||
  HayTipoUnidadEnZona("CATAPULTA_ROMANA","CATAPULTA_3")
)
Var
{
  handle hTimerCaballeria;
  handle hEscape;
  handle hCamaraEnd;
  float x, y;
}
Do
{
  
  DestruirTrigger("SalidaCaballeriaCercania");
  
  hTimerCaballeria = CrearTimer(10000);
  Wait(hTimerCaballeria);
  
  // Ponemos en marcha el CATAPULTA_ROMANA
  if (HayTipoUnidadEnZona("CATAPULTA_ROMANA","CATAPULTA_1"))
  {
    hTacticaAtacar = CrearTactica(hEstGalos, "AtacarPunto",17,46);
  }
  else
  if (HayTipoUnidadEnZona("CATAPULTA_ROMANA","CATAPULTA_2"))
  {
    hTacticaAtacar = CrearTactica(hEstGalos, "AtacarPunto",42,45);
  }
  else
  {
    hTacticaAtacar = CrearTactica(hEstGalos, "AtacarPunto",70,75);
  }
  
  AnyadirGrupoATactica(hTacticaAtacar, "CABALLERIA");
  AnyadirTactica(hEstGalos, hTacticaAtacar);
  SetParamTactica(hTacticaAtacar, "Correr", TRUE);
  
  // mensajito al canto
  MensajeLocucionado("03N0","LTEXT_TUTORIAL3_MENSAJE1_00_TXT");
  AvisoCivilizacion("Romanos", 26, 60);
  
  DesactivarTrigger("SalidaCaballeria");
  DestruirTrigger("SalidaCaballeria");
  
}


//////////////////////////////////////////////////////////
// Salida de la caballería por cercanía
//////////////////////////////////////////////////////////

Trigger "SalidaCaballeriaCercania" [Inactivo]
(
  HanEntradoCivilizacionesEnZona("Z_MUYCERCA", "Romanos")
)
Do
{
  
  DestruirTrigger("SalidaCaballeria");
  
  hTacticaAtacar = CrearTactica(hEstGalos, "AtacarPunto",25,52);
  AnyadirGrupoATactica(hTacticaAtacar, "CABALLERIA");
  AnyadirTactica(hEstGalos, hTacticaAtacar);
  SetParamTactica(hTacticaAtacar, "Correr", TRUE);
  
  // mensajito al canto
  MensajeLocucionado("03N0","LTEXT_TUTORIAL3_MENSAJE1_00_TXT");
  AvisoCivilizacion("Romanos", 26, 60);
  
  DestruirTrigger("SalidaCaballeriaCercania");
  
}




//////////////////////////////////////////////////////////
// Trigger para detectar que se acercó a la fortaleza
//////////////////////////////////////////////////////////
Trigger "Acercado" [Inactivo]
(
  HanEntradoCivilizacionesEnZona("LLANURA", "Romanos")
)
Var
{
  handle hEscape;
  handle hCamaraEnd;
  float x, y;
}
Do
{
  
  // discurso del jefe galo
  HacerVisibleTropa("GAL_CENTURION", TRUE);
  
  // por si las moscas
  NeutralizarCivilizacion("Galos", TRUE);
  
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
  
  EncolaTrayectoriaCamara("EVENTO_1", TRUE, FALSE, 2, 0);
  IntroducirLocucion("0330", "LTEXT_TUTORIAL3_EVENTO1_00_TXT", 5000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("0331", "LTEXT_TUTORIAL3_EVENTO1_01_TXT", 5000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("0332", "LTEXT_TUTORIAL3_EVENTO1_02_TXT", 3000, 600, 100);
  IntroducirPuntoSincronia();
  
  IntroducirLocucion("", "", 100, 0, 0);
  EncolaTrayectoriaCamara("EVENTO_2", FALSE, TRUE, 0, 3);
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

  HacerVisibleTropa("GAL_CENTURION", FALSE);

  yaSeAcerco = TRUE;
 
  // adelante la guerra
  NeutralizarCivilizacion("Galos", FALSE);
 
  // ponemos a esa gente a defender
  AnyadirGrupoAObjetivo(hObjDefensa, "RESISTENCIA_FINAL");
  
  DesactivarTrigger("Acercado");
  DestruirTrigger("Acercado"); 
  
}

//////////////////////////////////////////////////////////
// Trigger de condiciones de victoria
//////////////////////////////////////////////////////////
Trigger "CondicionesDeVictoria" [Activo]
(
  !EstaTropaViva("CENTURION")         ||
  !EstaTropaViva("MEDICO")            ||
  !EstaTropaViva("EXPLORADOR_HALCON") ||
  EstructuraDestruida("Matisco")      ||
  ((DarUnidadesVivas("Galos") == 0) && matiscoTomada )
)
Do
{

  if (DarUnidadesVivas("Galos") == 0) {
    
    IndicarObjetivoCumplido(hObjCayoVivo);
    IndicarObjetivoCumplido(hObjCneoVivo);
    IndicarObjetivoCumplido(hObjAgradoVivo);
    IndicarObjetivoCumplido(hObjMataMata);
        
    FinalizarMision(TRUE);
    
  }
  else {
    
    if ( EstructuraDestruida("Matisco") ) {
      IndicarObjetivoFracasado(hObjTomarMatisco);
    }
    
    if ( !EstaTropaViva("EXPLORADOR_HALCON") ) {
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



Trigger "MatiscoTomada" [Inactivo]
(
  EstaPuebloConquistado("Romanos", "Matisco")
)
Do
{
 
 matiscoTomada = TRUE;
 IndicarObjetivoCumplido(hObjTomarMatisco);
 
 DesactivarTrigger("MatiscoTomada");
 DestruirTrigger("MatiscoTomada");
   
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