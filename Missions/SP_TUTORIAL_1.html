
/************************************************************************/
/* Tutorial 1: Al Sur de los Alpes                                      */
/* Autor: JuanD                                                         */
/* Fecha: 29 Abril 2002                                                 */
/* Documento de diseño de escenario: Tutorial1.doc                      */
/************************************************************************/ 
/* Objetivos del tutorial:                                              */
/* a) Mostrar tropas básicas                                            */
/* b) Manejo básico de la cámara                                        */
/* c) Selección de tropas, selección y creación de grupos               */
/* d) Centrado en tropas y centrado en cada una de las tropas del grupo */
/* e) Movimiento básico, correr, encaramiento y puntos de ruta          */
/* f) Ataque básico                                                     */
/* g) Tipos de terreno y movilidad de las tropas por ellos              */
/* h) Separación y fusión de tropas                                     */
/* i) Nociones de emboscada y visibilidad                               */
/************************************************************************/
/* Condiciones de victoria:                                             */
/* a) Aniquilar a todas las tropas galas                                */
/* b) Colocar al explorador en la zona de salida                        */
/* d) Que no muera el explorador                                        */
/************************************************************************/

Var
{

  handle skiptutorial, nextstep, accion, hCamaraEnd;    // handles del tutorial
  float fcontador             = 0;                      // lección actual
  bool mostrarTrayectoria     = FALSE;                  // auxiliar para trayectorias
  string aux;                                           // para pasar string*
  
  // bojetivos
  handle hObjReunirse;
  handle hObjExploradorVivo;
  handle hObjLlegadaSalida;
  handle hObjMataMata;
  
  bool llegadaSalida          = FALSE;
  bool enemigoDestruido       = FALSE;
    
  handle hCivGala;
  handle hTacticaCaza;
  handle hEstrategia;
    
}


#include "Funscript.h"

// fcontador
// 00 - Selección de infantería ligera
// 01 - Selección de piqueros
// 02 - Selección de arqueros
// 03 - Seleccion de un grupo
// 04 - Memorizar un grupo
// 05 - Manejo de la cámara
// 06 - Centrado en un grupo, rotación por las tropas de un grupo
// 07 - Movimiento simple
// 08 - Correr
// 09 - Encaramiento
// 10 - Mover con puntos de ruta
// 11 - Tipos de terreno: agua poco profunda
// 12 - Ataque
// 13 - Unión, separación y distribución
// 14 - Bosque espeso
// 15 - Emboscada
// 16 - Alturas
// 17 - Combate Final

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
  ActivarPresentacion(TRUE, "LTEXT_TUTORIAL1_PRESENTACION_TITULO",
                            "LTEXT_TUTORIAL1_PRESENTACION_LUGAR", hPresentacion);
  
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
  
  // impido a estos mongos lanzar las franciscas
  SetHabilidadAutomatica("GAL_INFL_1","FRANCISCAS", FALSE);
  SetHabilidadAutomatica("GAL_INFL_2","FRANCISCAS", FALSE);
  SetHabilidadAutomatica("GAL_INFL_3","FRANCISCAS", FALSE);
  SetHabilidadAutomatica("GAL_INFL_4","FRANCISCAS", FALSE);
  SetHabilidadAutomatica("GAL_INFL_5","FRANCISCAS", FALSE);
  
  // objetivos
  hObjReunirse         = CrearHandle("Bool");
  hObjExploradorVivo   = CrearHandle("Bool");
  hObjLlegadaSalida    = CrearHandle("Bool"); 
  hObjMataMata         = CrearHandle("Bool"); 
  
  // Obetjvos
  AgregarObjetivoMision(hObjReunirse, "LTEXT_TUTORIAL1_OBJETIVO_00_TXT");
  AgregarObjetivoMision(hObjMataMata, "LTEXT_TUTORIAL1_OBJETIVO_01_TXT");

  // RESTRICCIONES DEL ESCENARIO
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "", "");
  IntroducirRestriccionUnidad("ORDEN_REPARAR", "", "");
  IntroducirRestriccionUnidad("ORDEN_TRANSFORMAR_A_LIGERA", "", "");
  IntroducirRestriccionUnidad("ORDEN_TRANSFORMAR_A_CENTURION", "", "");
  
  // RESTRICCIONES QUE PUEDEN CAMBIAR DURANTE EL ESCENARIO
  IntroducirRestriccionUnidad("ORDEN_ROMPER_TROPA", "", "");
  IntroducirRestriccionUnidad("ORDEN_DISTRIBUIR_TROPAS", "", "");
  IntroducirRestriccionUnidad("ORDEN_UNIR_TROPAS", "", "");

  // inicializamos los handles que necesitamos	
  skiptutorial = CrearHandle("Bool");
  nextstep = CrearHandle("Bool");
  accion = CrearHandle("Bool");
  hCamaraEnd = CrearHandle("Bool");
  
  // incializamos los triggers de la misión
  ActivarTrigger("Explorador");
  ActivarTrigger("AtaqueSalida");
  ActivarTrigger("LlegadaSalida");
  ActivarTrigger("EnemigoDestruido");
  ActivarTrigger("CazaFinal");
  ActivarTrigger("TirarPaAlante");
  ActivarTrigger("InicioTutorial");
  ActivarTrigger("Skip");
  
  // apagamos la lluvia
  ModificarLluvia(0.0, 0.0, 100.0, 99999.0);
  
  // Actitudes de los grupos de galos
  SetActitudAgresivaGrupo("GRUPO_ARRIBA", FALSE);
  SetActitudAgresivaGrupo("GRUPO_SALIDA", FALSE);
  
  // estrateias etc
  hCivGala = DarCivilizacion("Galos");
  hEstrategia = CrearEstrategiaScript();
  AsignarEstrategia(hCivGala, hEstrategia);
  StartEstrategia(hEstrategia);
  
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
  
  // Lección 0: infantería ligera
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_00_TXT", "LTEXT_TUTORIAL1_LECCION_00_OBJ");
                         
  // Lección 1: piqueros
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_01_TXT", "LTEXT_TUTORIAL1_LECCION_01_OBJ");                         
  
  // Lección 2: arqueros
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_02_TXT", "LTEXT_TUTORIAL1_LECCION_02_OBJ");                         
  
  // Lección 3: selección de grupos
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_03_TXT", "LTEXT_TUTORIAL1_LECCION_03_OBJ");
                           
  // Lección 4: memorización de grupos
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_04_TXT", "LTEXT_TUTORIAL1_LECCION_04_OBJ");
                           
  // Lección 5: manejo de la cámara
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_05_TXT", "LTEXT_TUTORIAL1_LECCION_05_OBJ");
                           
  // Lección 6: centrado de la cámara
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_06_TXT", "LTEXT_TUTORIAL1_LECCION_06_OBJ");
                           
  // Lección 7: mover tropas
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_07_TXT", "LTEXT_TUTORIAL1_LECCION_07_OBJ");
                           
  // Lección 8: correr
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_08_TXT", "LTEXT_TUTORIAL1_LECCION_08_OBJ");
                           
  // Lección 9: encarar
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_09_TXT", "LTEXT_TUTORIAL1_LECCION_09_OBJ");
  
  // Lección 10: atravesar el valle y puntos de ruta
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_10_TXT", "LTEXT_TUTORIAL1_LECCION_10_OBJ");
                           
  // Lección 11: tipos de terreno, agua poco profunda
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_11_TXT", "LTEXT_TUTORIAL1_LECCION_11_OBJ");
                         
  // Leccion 12: ataque
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_12_TXT", "LTEXT_TUTORIAL1_LECCION_12_OBJ");

  // Leccion 13: fusión y separación de tropas
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_13_TXT", "LTEXT_TUTORIAL1_LECCION_13_OBJ");
                            
  // Lección 14: bosque denso
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_14_TXT", "LTEXT_TUTORIAL1_LECCION_14_OBJ");
                         
  // Leccion 15: emboscada
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_15_TXT", "LTEXT_TUTORIAL1_LECCION_15_OBJ");
                           
  // Leccion 16: alturas
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_16_TXT", "LTEXT_TUTORIAL1_LECCION_16_OBJ");
                           
  // Leccion 17: ataque final
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_17_TXT", "LTEXT_TUTORIAL1_LECCION_17_OBJ");
                         
  // Lección 18: final del tutorial
  IntroducirPasoTutorial("LTEXT_TUTORIAL1_LECCION_18_TXT", "LTEXT_TUTORIAL1_LECCION_18_OBJ");
  
  //////////////////////////////////////////////////////////////////////////


  // Pasamos al primera paso del tutorial
  AvanzarPasoTutorial(fcontador);			              // poner el panel ahí
  aux = "INFANTERIA_LIGERA";
  VigilarInterfazSeleccion(NULL, &aux, accion);    	// condición de paso de la primera lección
  
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
  Wait(nextstep)			// cada vez que nextstep esta a TRUE
)
Var
{
  handle hCamaraEnd;
  handle hEscape;
  float x, y;
  
}
Do
{
  fcontador = fcontador + 1;              // siguiente lección
  AvanzarPasoTutorial(fcontador);         // actualizar el panel en consecuencia
  
  DesactivarHandleBool(nextstep);         // fuera nextstep de momento
  QuitarVigilanciaHandleBool(accion);     // para evitar problemas por salto de paso
  
  if ( mostrarTrayectoria )               // exito de paso de tutorial
  {
    LanzarSonido("IATU");
  }
    
  if ( fcontador == 1 )			// piqueros
  {
    aux = "PIQUERO";				
    VigilarInterfazSeleccion(NULL, &aux, accion);
    ActivarTrigger("Accion");
  }
  else
  if ( fcontador == 2 )			// arqueros
  {
    aux = "ARQUERO";
    VigilarInterfazSeleccion(NULL, &aux, accion);
    ActivarTrigger("Accion");
  }
  else
  if ( fcontador == 3 )			// selección de grupos
  {
    VigilarInterfazCajaSeleccion(NULL, NULL, accion);
    ActivarTrigger("Accion");
  }
  else
  if ( fcontador == 4 )			// memorización de grupos
  {
    VigilarCrearGrupo(NULL, NULL, accion);
    ActivarTrigger("Accion");
  }
  else
  if ( fcontador == 5 )			// manejo de cámara
  {
    VigilarSeleccionarGrupo(NULL, NULL, accion);
    ActivarTrigger("Accion");
  }
  else
  if ( fcontador == 6 )			// centrado de la cámara
  {
    VigilarInterfazSeleccion(NULL, NULL, accion);
    ActivarTrigger("Accion");
  }
  else
  if ( fcontador == 7 )			// movimiento simple
  {
    ActivarTrigger("MoverARampa");
  }
  else
  if ( fcontador == 8 )			// correr
  {
  	
    // desactivamos el trigger del paso anterior
    DesactivarTrigger("MoverARampa");
    DestruirTrigger("MoverARampa");
  	
    VigilarOrdenCorrer(NULL, NULL, accion);
    ActivarTrigger("Accion");
  }
  else
  if ( fcontador == 9 )			// encarar
  {
    
    VigilarOrdenOrientar(NULL, NULL, accion);
    VigilarOrdenMoverOrientar(NULL, NULL, accion);
    ActivarTrigger("Accion");
    
  }
  else
  if ( fcontador == 10 )		// puntos de ruta
  {
  	
    // hacemos que llueva en el valle
    ModificarLluvia(50.0, 50.0, 50.0, 99999.0);
    
    ActivarTrigger("Vado");
  }
  else
  if ( fcontador == 11 )		// tipos de terreno: agua poco profunda
  {
  
    // desactivamos el trigger del paso anterior	
    DesactivarTrigger("Vado");
    DestruirTrigger("Vado");
    
    // hacemos que pare de llover
    ModificarLluvia(0.0, 0.0, 100.0, 99999.0);
  	
    ActivarTrigger("CruzarVado");	
  }
  else
  if ( fcontador == 12 )		// ataque  
  {
  
    // desactivamos el trigger del paso anterior	
    DesactivarTrigger("CruzarVado");
    DestruirTrigger("CruzarVado");

    if ( mostrarTrayectoria && EstaTropaViva("GAL_INFL_1") )		// si hemos llegado sin saltar y lo que enseñamos vive
    {
      
      // hacemos visible a la tropa
      IluminarZona(62, 0, 70, 5, 10000);
    
      // handles de final de evento
      hCamaraEnd = CrearHandle("Bool");
      hEscape = CrearHandle("Bool");
  
      // cazar escape
      PonerHandleInterrupcion(hEscape);

      // recordar posición inicial
      DarPosicionCamara(&x, &y);

      // cine
      ActivarCinemascope(TRUE);

      // camaras
      IntroducirPonerModoJuegoCamara(FALSE);

      EncolaTrayectoriaCamara("PUENTE", TRUE, FALSE, 2, 0);
      EncolarPausaCamara(3000);
      EncolaTrayectoriaCamara("PUENTE", FALSE, TRUE, 0, 1);
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
      
    }    	
    
    // activo el trigger de asegurar el puente
    ActivarTrigger("AsegurarPuente");	
    
  }
  else
  if ( fcontador == 13 )
  {
    
    // habilitamos juntar
    QuitarRestriccionUnidad("ORDEN_UNIR_TROPAS", "", "");
 
    // desactivamos el trigger del paso anterior	
    DesactivarTrigger("AsegurarPuente");
    DestruirTrigger("AsegurarPuente");

    VigilarOrdenUnir(NULL,NULL,accion);	// fusión de tropas
    ActivarTrigger("Accion");
  }
  else
  if ( fcontador == 14 )
  {
    
    // habilitamos dividir y balancear
    QuitarRestriccionUnidad("ORDEN_DISTRIBUIR_TROPAS", "", "");
    QuitarRestriccionUnidad("ORDEN_ROMPER_TROPA", "", "");
    
    ActivarTrigger("Bosque");		// bosque denso
  }
  else
  if ( fcontador == 15 )		// emboscada
  {
 
    if ( mostrarTrayectoria )
    {

      IluminarZona(40,0,14,10,10000);

      // handles de final de evento
      hCamaraEnd = CrearHandle("Bool");
      hEscape = CrearHandle("Bool");
  
      // cazar escape
      PonerHandleInterrupcion(hEscape);

      // recordar posición inicial
      DarPosicionCamara(&x, &y);

      // cine
      ActivarCinemascope(TRUE);

      // camaras
      IntroducirPonerModoJuegoCamara(FALSE);

      EncolaTrayectoriaCamara("BOSQUE_DENSO_1", TRUE, FALSE, 2, 0);
      EncolarPausaCamara(3000);
      EncolaTrayectoriaCamara("BOSQUE_DENSO_2", FALSE, TRUE, 0, 1);
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
      
    }
    
    // desactivamos el trigger del paso anterior
    DesactivarTrigger("Bosque");
    DestruirTrigger("Bosque");
    
    ActivarTrigger("Emboscada");	
	
  }
  else
  if ( fcontador == 16 )		// alturas
  {
  
    // desactivamos el trigger del paso anterior
    DesactivarTrigger("Emboscada");
    DestruirTrigger("Emboscada");
    
    if ( mostrarTrayectoria )
    {

      // handles de final de evento
      hCamaraEnd = CrearHandle("Bool");
      hEscape = CrearHandle("Bool");
  
      // cazar escape
      PonerHandleInterrupcion(hEscape);

      // recordar posición inicial
      DarPosicionCamara(&x, &y);

      // cine
      ActivarCinemascope(TRUE);

      // camaras
      IntroducirPonerModoJuegoCamara(FALSE);

      EncolaTrayectoriaCamara("ARRIBA", TRUE, FALSE, 2, 0);
      EncolarPausaCamara(3000);
      EncolaTrayectoriaCamara("ARRIBA", FALSE, TRUE, 0, 1);
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
      
    }

    ActivarTrigger("ExplorarAlturas");
  	
  }
  else
  if ( fcontador == 17)			// asegurar la salida
  {
    // desactivamos el trigger del paso anterior
    DesactivarTrigger("ExplorarAlturas");
    DestruirTrigger("ExplorarAlturas");
    
    ActivarTrigger("AsegurarSalida");
  	
  }
  else
  {
    DesactivarTrigger("AsegurarSalida");
    DestruirTrigger("AsegurarSalida");
  }
  
  // a false para saltarnos aquellas trayectorias que
  // pertenezcan a pasos saltados
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
  DesactivarTrigger("Accion");		// desactivar el trigger mientras no vigilemos otra accion
  mostrarTrayectoria = TRUE;		// para señalar que el paso se ha realizado y no saltado	
  DesactivarHandleBool(accion);
  ActivarHandleBool(nextstep);		// avanzar el paso del tutorial
}
//////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////
// Trigger mover a rampa: usado en el paso 7 del tutorial
//////////////////////////////////////////////////////////
Trigger "MoverARampa" [Inactivo]
(
  HanEntradoCivilizacionesEnZona("RAMPA","Romanos")
)
Do
{
  DesactivarTrigger("MoverARampa");
  mostrarTrayectoria = TRUE;		// para señalar que el paso se ha realizado y no saltado		
  ActivarHandleBool(nextstep);
}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Trigger llegar al vado: usado en el paso 10
//////////////////////////////////////////////////////////
Trigger "Vado" [Inactivo]
(
  // tropa del jugador en la zona lógica VADO
  HanEntradoCivilizacionesEnZona("VADO","Romanos")
)
Do
{
  DesactivarTrigger("Vado");
  mostrarTrayectoria = TRUE;		// para señalar que el paso se ha realizado y no saltado	
  ActivarHandleBool(nextstep);
}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Trigger cruzar el vado: usado en el paso 11
//////////////////////////////////////////////////////////
Trigger "CruzarVado" [Inactivo]
(
  // tropa del jugador en la zona lógica VADO_2
  HaEntradoTropaEnZona("VADO_2","EXPLORADOR")
)
Do
{
  DesactivarTrigger("CruzarVado");
  mostrarTrayectoria = TRUE;		// para señalar que el paso se ha realizado y no saltado	
  ActivarHandleBool(nextstep);
}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Trigger asegurar puente: usado en el paso 12
//////////////////////////////////////////////////////////
Trigger "AsegurarPuente" [Inactivo]
(
  // las tropas galas que defendían el puente están
  // muertas
  !EstaTropaViva("GAL_INFL_1")
)
Do
{
  DesactivarTrigger("AsegurarPuente");
  mostrarTrayectoria = TRUE;		// para señalar que el paso se ha realizado y no saltado	
  ActivarHandleBool(nextstep);
}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Trigger bosque: usado en el paso 14
//////////////////////////////////////////////////////////
Trigger "Bosque" [Inactivo]
(
  // Tropas del jugador en la zona lógica BOSQUE
  HanEntradoCivilizacionesEnZona("BOSQUE","Romanos")
)
Do
{
  
  // quitamos el trigger de proteción de ignorar pasos de tutorial
  DesactivarTrigger("TirarPaAlante");
  
  DesactivarTrigger("Bosque");
  mostrarTrayectoria = TRUE;
  ActivarHandleBool(nextstep);
  
}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Trigger emboscada: usado en el paso 15
//////////////////////////////////////////////////////////
Trigger "Emboscada" [Inactivo]
(
  // las tropas galas del bosque han sido eliminadas
  !EstaTropaViva("GAL_ARQ_1")
)
Var
{
  float pasoActual = fcontador;
  handle hTimerBosque;
}
Do
{
  DesactivarTrigger("Emboscada");
  
  hTimerBosque = CrearTimer(3000);
  Wait(hTimerBosque);
  
  // Truco siniestro
	if ( pasoActual == fcontador )
  {
    mostrarTrayectoria = TRUE;		// para señalar que el paso se ha realizado y no saltado	
    ActivarHandleBool(nextstep);
  }
  
}
//////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////
// Trigger exploraralturas: usado en el paso 17
//////////////////////////////////////////////////////////
Trigger "ExplorarAlturas" [Inactivo]
(
  // tropas del jugador en la zona logica ARRIBA
  HayTipoUnidadEnZona("HALCON", "ARRIBA")
)
Do
{
  DesactivarTrigger("ExplorarAlturas");
  mostrarTrayectoria = TRUE;		// para señalar que el paso se ha realizado y no saltado	
  ActivarHandleBool(nextstep);
}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Trigger AsegurarSalida: usado en el paso 18
//////////////////////////////////////////////////////////
Trigger "AsegurarSalida" [Inactivo]
(
  // las tropas galas de la salida eliminadas
  !EstaTropaViva("GAL_INFL_2") &&
  !EstaTropaViva("GAL_INFL_3") &&
  !EstaTropaViva("GAL_INFL_4") &&
  !EstaTropaViva("GAL_ARQ_2")
)
Do
{
  DesactivarTrigger("AsegurarSalida");
  mostrarTrayectoria = TRUE;		// para señalar que el paso se ha realizado y no saltado	
  ActivarHandleBool(nextstep);
}
//////////////////////////////////////////////////////////




//////////////////////////////////////////////////////////
// Trigger explorador: pasa el explorador al bando
// del jugador, y realiza el diálogo de explorador
//////////////////////////////////////////////////////////
Trigger "Explorador" [Inactivo]
(
  // Tropas del jugador en la zona lógica EXPLORADOR
  HanEntradoCivilizacionesEnZona("VADO","Romanos")
)
Var
{
  float x, y;
  handle hTimerExp;
  handle hEscape;
  handle hCamaraEnd;
}
Do
{

  // objetivo cumplido
  IndicarObjetivoCumplido(hObjReunirse);

  hTimerExp = CrearTimer(1000);
  Wait(hTimerExp);

  // handles de final de evento
  hCamaraEnd = CrearHandle("Bool");
  hEscape = CrearHandle("Bool");
  
  // cazar escape
  PonerHandleInterrupcion(hEscape);

  // recordar posición inicial
  DarPosicionCamara(&x, &y);

  // cine
  ActivarCinemascope(TRUE);
  PararLogica(TRUE);

  // camaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolaTrayectoriaCamara("EXPLORADOR", TRUE, FALSE, 1, 0);
  IntroducirLocucion("0110", "LTEXT_TUTORIAL1_EVENTO1_00_TXT", 2000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("0111", "LTEXT_TUTORIAL1_EVENTO1_01_TXT", 6000, 600, 100);
  IntroducirPuntoSincronia();
  
  EncolaTrayectoriaCamara("EXPLORADOR_2", FALSE, FALSE, 0, 0);
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

 
  //  cambiar de bando al explorador
  CambiarBandoPorGrupo("EXPLORADOR", "Romanos");

  // Cambio de objetivos
  AgregarObjetivoMision(hObjExploradorVivo, "LTEXT_TUTORIAL1_OBJETIVO_02_TXT");
  AgregarObjetivoMision(hObjLlegadaSalida, "LTEXT_TUTORIAL1_OBJETIVO_03_TXT");
  ObjetivosMisionCambiados();

  // y fuera
  DesactivarTrigger("Explorador");
  DestruirTrigger("Explorador");
    
}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Trigger ataque salida: hace que las tropas
// de la salida ataquen al ser atacadas
//////////////////////////////////////////////////////////
Trigger "AtaqueSalida" [Inactivo]
(
  // Tropas del jugador en la zona lógica EXPLORADOR
  TropaRecibeDanyo("GAL_INFL_2") ||
  TropaRecibeDanyo("GAL_INFL_3") ||
  TropaRecibeDanyo("GAL_INFL_4") ||
  TropaRecibeDanyo("GAL_ARQ_2")
)
Do
{
	
  SetActitudAgresivaGrupo("GRUPO_ARRIBA", TRUE);
  SetActitudAgresivaGrupo("GRUPO_SALIDA", TRUE);
	
  GrupoTropasSeguirRutaPredefinida("GRUPO_SALIDA", "SALIDA");

  DesactivarTrigger("AtaqueSalida");
  DestruirTrigger("AtaqueSalida");
}
//////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////
// Trigger Ignorar pasos: se asegura de pasar el tutorial
// al paso adecuado si se tira para adelante después del
// puente sin seguir el tutorial (pero sin cerrarlo)
//////////////////////////////////////////////////////////
Trigger "TirarPaAlante" [Inactivo]
(
  (fcontador != 14) && (HanEntradoCivilizacionesEnZona("BOSQUE","Romanos"))
)
Do
{
  
  fcontador = 14;               // a la lección del bosque, a piñón
  
  // desactivamos todos los posibles triggers que estorban
  DesactivarTrigger("TirarPaAlante");
  DesactivarTrigger("MoverARampa");
  DesactivarTrigger("Vado");
  DesactivarTrigger("CruzarVado");
  DesactivarTrigger("CruzarVado");
  
  // y habilitamos lo que haya que habilitar
  QuitarRestriccionUnidad("ORDEN_ROMPER_TROPA", "", "");
  QuitarRestriccionUnidad("ORDEN_DISTRIBUIR_TROPAS", "", "");
  QuitarRestriccionUnidad("ORDEN_UNIR_TROPAS", "", "");
  
  // Siguiente....
  mostrarTrayectoria = TRUE;		// para señalar que el paso se ha realizado y no saltado	
  ActivarHandleBool(nextstep);
  
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
  DesactivarTrigger("MoverARampa");
  DesactivarTrigger("Vado");
  DesactivarTrigger("AsegurarPuente");
  DesactivarTrigger("Bosque");
  DesactivarTrigger("Emboscada");
  DesactivarTrigger("ExplorarAlturas");
  DesactivarTrigger("AsegurarSalida");
  DestruirTrigger("MoverARampa");
  DestruirTrigger("Vado");
  DestruirTrigger("AsegurarPuente");
  DestruirTrigger("Bosque");
  DestruirTrigger("Emboscada");
  DestruirTrigger("ExplorarAlturas");
  DestruirTrigger("AsegurarSalida");
 
  // cerramos el panel del tutorial
  DestruirPanelTutorial();

  // y habilitamos lo que haya que habilitar
  QuitarRestriccionUnidad("ORDEN_ROMPER_TROPA", "", "");
  QuitarRestriccionUnidad("ORDEN_DISTRIBUIR_TROPAS", "", "");
  QuitarRestriccionUnidad("ORDEN_UNIR_TROPAS", "", "");
  
}
//////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////
// Trigger de condiciones de victoria
//////////////////////////////////////////////////////////
Trigger "CondicionesDeVictoria" [Activo]
(
  !EstaTropaViva("EXPLORADOR")
  ||
  ((DarUnidadesVivas("Galos") == 0) && llegadaSalida)
  ||
  (DarUnidadesVivas("Romanos") <= 1)
)
Do
{
  
  if ( (DarUnidadesVivas("Romanos") <= 1) && !llegadaSalida && EstaTropaViva("EXPLORADOR") )
  {
    
    IndicarObjetivoFracasado(hObjLlegadaSalida);
    IndicarObjetivoFracasado(hObjMataMata);
    FinalizarMision(FALSE);
    
  }
  else
  if (EstaTropaViva("EXPLORADOR") ) {
    
    IndicarObjetivoCumplido(hObjExploradorVivo);
    IndicarObjetivoCumplido(hObjMataMata);
    
    FinalizarMision(TRUE);
    
  }
  else {
    
    IndicarObjetivoFracasado(hObjExploradorVivo);
    FinalizarMision(FALSE);
    
  }
  
  DesactivarTrigger("CondicionesDeVictoria");
  DestruirTrigger("CondicionesDeVictoria");
  
}
//////////////////////////////////////////////////////////


Trigger "LlegadaSalida" [Inactivo]
(
  HaEntradoTropaEnZona("SALIDA", "EXPLORADOR")
)
Do
{
  
  IndicarObjetivoCumplido(hObjLlegadaSalida);
  llegadaSalida = TRUE;
  
  DesactivarTrigger("LlegadaSalida");
  DestruirTrigger("LlegadaSalida");
  
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
// trigger de caza final
//////////////////////////////////////////////////////////
Trigger "CazaFinal" [Inactivo]
(
  DarTropasVivasDeGrupo("GRUPO_SALIDA") == 0
)
Do
{
  
  hTacticaCaza = CrearTactica(hEstrategia, "CazaYCaptura");
  AnyadirGrupoATactica(hTacticaCaza, "TODOS");
  AnyadirTactica(hEstrategia, hTacticaCaza);
  
  VisualizarGrupoMiniMapa("TODOS", TRUE);
  
  DestruirTrigger("CazaFinal");

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