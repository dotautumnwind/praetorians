Var
{
  // -- Boios
  handle hBoios;
  handle hEstrategiaBoios;
  handle hPuebloBoios;
  handle hPatrullaBoios;
  
  // -- Tulingos
  handle hTulingos;
  handle hEstrategiaTulingos;
  handle hPuebloTulingos;
  handle hPatrullaTulingos;
  
  // -- Helvecios
  handle hHelvecios;
  handle hEstrategiaHelvecios;
  handle hPatrullaHelvecios;
  handle hCazaHelvecios;
  handle hTacticaMantener;
  handle hFijos;
  handle hFijosII;
  handle hFijosIII;
  handle hFijosIV;
  handle hFijosV;
  handle hFijosVI;
  handle hFijosVII;
  
  float idPeticion;
  
  float fMuchoTiempo;
  
  // objetivos
  handle hObjTitoVivo;
  handle hObjCrastinoVivo;
  handle hObjLlegarBribacte;
  
  // otros
  bool bBriefingEnded               = FALSE;
  float fPuntoSincronia             = 0;
  handle hPuntoSincronia            = NULL;
  
  // niveles de dificultad
  float fNivelDificultad            = 0;
  
  float fStopProdBoios;
  float fRestartProdBoios;
  
  float fStopProdTulingos;
  float fRestartProdTulingos;
  
}

#include "Funscript.h"


// --------------------------------------------------------------------------------
// Nombre      : Main
// Descripcion : 
// --------------------------------------------------------------------------------
Trigger "Main" [Activo]
(
  TRUE
)
Var
{
}
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
  
	//alianzas de los enemigos
	CrearAlianzaPorNombre("BOIOS","TULINGOS");
	CrearAlianzaPorNombre("BOIOS","HELVECIOS");
	CrearAlianzaPorNombre("TULINGOS", "HELVECIOS");
  
  ActivarTrigger("Briefing");
  DestruirTrigger("Main");

}


Trigger "Main2" [Inactivo]
(
  TRUE
)
Var
{
  handle hTimerMain;
  
  float fEntrenamientoBoxum;
  float fEntrenamientoSidolaucum;
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
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "PIQUERO_ELITE", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "HONDERO", "");
  
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_GERMANA", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_CAZADOR", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_ESPADON", "");
  
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "BALLESTA_MOVIL_BARBARA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "CATAPULTA_BARBARA", "");
    
  //Dificultad
  fNivelDificultad = DarDificultadMision();
  if ( fNivelDificultad == 1 )
  {
    //Regular la produccion
    fStopProdBoios = 24000;
    fRestartProdBoios = 17000;
    
    fStopProdTulingos = 26000;
    fRestartProdTulingos = 20000;
    
    //Regular el ritmo de produccion
    fEntrenamientoBoxum = 60000;
    fEntrenamientoSidolaucum = 90000;
    
    //Los enemigos no pueden construir torres de defensa
    IntroducirRestriccionEstructura("ORDEN_CONSTRUIR", "TORRE_DEFENSA_BARBARA", "");
  }
  else
  if ( fNivelDificultad == 2 )
  {
    //Regular la produccion
    fStopProdBoios = 30000;
    fRestartProdBoios = 25000;
    
    fStopProdTulingos = 32000;
    fRestartProdTulingos = 26000;
    
    //Regular el ritmo de produccion
    fEntrenamientoBoxum = 30000;
    fEntrenamientoSidolaucum = 60000;
    
    //Los enemigos no pueden construir torres de defensa
    IntroducirRestriccionEstructura("ORDEN_CONSTRUIR", "TORRE_DEFENSA_BARBARA", "");
  }
  else
  if ( fNivelDificultad == 3 )
  {
    //Regular la produccion
    fStopProdBoios = 40000;
    fRestartProdBoios = 35000;
    
    fStopProdTulingos = 45000;
    fRestartProdTulingos = 40000;
    
    //Regular el ritmo de produccion
    fEntrenamientoBoxum = 10000;
    fEntrenamientoSidolaucum = 30000;
  }
  else
  {
    //Regular la produccion
    fStopProdBoios = 40000;
    fRestartProdBoios = 35000;
    
    fStopProdTulingos = 45000;
    fRestartProdTulingos = 40000;
    
    //Regular el ritmo de produccion
    fEntrenamientoBoxum = 10000;
    fEntrenamientoSidolaucum = 30000;
    
    MensajeChat("Nivel de dificulatd desconocido, oiga");
   }
  
  // objetivos
  hObjTitoVivo = CrearHandle("Bool");
  hObjCrastinoVivo = CrearHandle("Bool");
  hObjLlegarBribacte = CrearHandle("Bool");
  
  AgregarObjetivoMision(hObjTitoVivo, "LTEXT_MISION6_OBJETIVO_00_TXT");
  AgregarObjetivoMision(hObjCrastinoVivo, "LTEXT_MISION6_OBJETIVO_01_TXT");
  AgregarObjetivoMision(hObjLlegarBribacte, "LTEXT_MISION6_OBJETIVO_02_TXT");
  
  ActivarTrigger("CondicionesVictoria");
  
  fMuchoTiempo = 600000; // Esto se usa para evitar que las patrullas salgan hasta que se active el trigger que las inicia
  
  //======================
  // Boios
  //======================
  
  hBoios = DarCivilizacion("BOIOS");
  hEstrategiaBoios = CrearEstrategiaScript();
  AsignarEstrategia(hBoios, hEstrategiaBoios);
  StartEstrategia(hEstrategiaBoios);
  
  // El trapi: le digo que quiero que genere exploradores halcon.
  // Ver ActitudIA.dat, para el resto de tropas que va a entrenar
  SetValue(hEstrategiaBoios, "GRUPOTROPAS_A_ENTRENAR", "EXPLORADOR_HALCON", 5);
  SetValue(hEstrategiaBoios, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  SetValue(hEstrategiaBoios, "GRUPOTROPAS_A_ENTRENAR", "MAQUINAS_ATAQUE", 0);
  SetValue(hEstrategiaBoios, "GRUPOTROPAS_A_ENTRENAR", "MAQUINAS_DEFENSA", 0);
      
  hPuebloBoios = CrearObjetivo(hEstrategiaBoios, "ConquistaPueblo2", "BOXUM", "DEF_PUEBLO1");
  SetParamObjetivo(hPuebloBoios, "Vigias", FALSE);
  AnyadirGrupoAObjetivo(hPuebloBoios, "DEF_PUEBLO1");
  AnyadirObjetivo(hEstrategiaBoios, hPuebloBoios);
  
  // Como vamos a robarle tropas al pueblo, hacemos que no pueda pedir refuerzos
  SetParamObjetivo(hPuebloBoios, "PuedePedirRefuerzos", FALSE);
  // Ajustar con:
  // SetParamObjetivo(hPuebloBoios, "POTMIN_DEFENSA_PUEBLO", 10000);
  // SetParamObjetivo(hPuebloBoios, "VENTAJA_MINIMA_DEFENSA_PUEBLO", 1.0);
  // SetParamObjetivo(hPuebloBoios, "PEDIR_REFUERZOS_DEF_PUEBLO", 0.5);
  
  // Estos valores funcionan para TODA la civilizacion, siempre que se combata a través de la inteligencia
  SetParamEstrategia(hEstrategiaBoios, "ResetTropaRestringida");
  SetParamEstrategia(hEstrategiaBoios, "TropaRestringida", "CENTURION_A");
  SetParamEstrategia(hEstrategiaBoios, "TropaRestringida", "CENTURION_B");
  // Otros:
  // - ProtegerEnte
  // - ProtegerGrupo
  // - ProtegerTipo
  // - AtacarEnte
  // - AtacarGrupo
  // - AtacarTipo
  // - AtacarZona
  // - AtaqueConjunto
  // - Correr
  // - AtaqueStand
  // - AtacarFortaleza
  

  // -- Creamos el objetivo de patrulla
  
  hPatrullaBoios = CrearObjetivo(hEstrategiaBoios, "PatrullaOleadasPeriodicas", 3000, 3000, 30, 60);//6000
  // NOTA: Si se cambia el periodo, revisar el tiempo de la primera oleada en el Trigger 'EjecucionDePatrullas'



  // Aqui le podemos dar tropas iniciales si queremos:
  //AnyadirGrupoAObjetivo(hPuebloBoios, "WHATEVER");

//	SetParamObjetivo(hPatrullaBoios, "PotenciaMinima", 5000);
//	SetParamObjetivo(hPatrullaBoios, "PotenciaMaxima", 5000);

//	SetParamObjetivo(hPatrullaBoios, "PeriodoMin", 30);
//	SetParamObjetivo(hPatrullaBoios, "PeriodoMax", 60);
//	SetParamObjetivo(hPatrullaBoios, "RetardoSiguiente", 120);

  // Aqui se pueden cambiar los parametros del algoritmo de patrulla/exploracion.
  SetParamObjetivo(hPatrullaBoios, "EXPLORAR_FACTOR_ENEMIGOS", -100);
  // Otros (ver Parametros.html)
  // - EXPLORAR_RESOLUCION
  // - EXPLORAR_MAX_TIEMPO_VISIBLE
  // - EXPLORAR_FACTOR_DISTANCIA
  // - EXPLORAR_FACTOR_DIST_OTROS
  // - EXPLORAR_FACTOR_CUADROS_LIBRES
  // - EXPLORAR_FACTOR_ESTRUCTURAS
  // - EXPLORAR_FACTOR_PUEBLOS
  // - EXPLORAR_FACTOR_VISIBILIDAD
  // - EXPLORAR_FACTOR_RANDOM
  // - EXPLORAR_FACTOR_POS_INICIO
  SetParamObjetivo(hPatrullaBoios, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hPatrullaBoios, "EXPLORAR_FACTOR_PUEBLOS", -20);
  SetParamObjetivo(hPatrullaBoios, "EXPLORAR_FACTOR_VISTA_YA", -1);

  // Por defecto:
  // - Num. oleadas ilimitado
  // - Composicion indefinida, solo limita por potencia, y escoge al azar
  // - No se fuerza la pertenencia a ningún grupo (propiedad) en particular
  // - No se pueden robar tropas a ningun objetivo
  // Ver Objetivos_disponibles.html
  
  // Aqui podemos cambiar parametros del objetivo, y poner algunos que no van en la creación:
  //SetParamObjetivo(hPatrullaBoios, "PotenciaMinima", 10000);
  //SetParamObjetivo(hPatrullaBoios, "PotenciaMaxima", 10000);
  //SetParamObjetivo(hPatrullaBoios, "PeriodoMin", 10);
  //SetParamObjetivo(hPatrullaBoios, "PeriodoMax", 10);
  SetParamObjetivo(hPatrullaBoios, "MaxNumOleadas", 3);
  
  SetParamObjetivo(hPatrullaBoios, "IntentarTenerUnaDefUnidad", "EXPLORADOR_HALCON");
  
  AnyadirGrupoAObjetivo(hPatrullaBoios, "EXPLORADOR_BOIOS");
  
  SetParamObjetivo(hPatrullaBoios, "ComposicionEstricta", FALSE);
  
  SetParamObjetivo(hPatrullaBoios, "FACTOR_POTENCIA_TROPAS", 2);
    
//  SetParamObjetivo(hPatrullaBoios, "NivelTraza", 1);
  
  //SetParamObjetivo(hPatrullaBoios, "GrupoTendraDefUnidad", "GALO_ARQUERO", 50); // ARQUERO es una Definicion de Unidad (DefUnidades.dat)  
  //SetParamObjetivo(hPatrullaBoios, "GrupoTendraTipoTropa", "BOSQUE_DISTANCIA", 33); // (DefTipoTropa.dat)
  //SetParamObjetivo(hPatrullaBoios, "GrupoTendraTipoTropa", "BOSQUE_MELEE", 33); //(DefTipoTropa.dat)
  //SetParamObjetivo(hPatrullaBoios, "GrupoTendraTipoTropa", "BOSQUE_MELEE_BLINDADA", 33); //(DefTipoTropa.dat)
  //SetParamObjetivo(hPatrullaBoios, "GrupoTendraTipoTropa", "TODOS_COMBATE", 50);
  // Con este pequeño truco consigo que la mitad de la potencia del grupo sea caballería y la otra mitad lo que sea
  // (puede ser también caballería, o algo totalmente distinto)
  // Aunque los grupos se solapen no hay problema porque se ordenan por peso, lo cual quiere decir que al principio se
  // rellenará el más restrictivo, que tiene 50 de peso, y luego el más abierto, que tiene 49.
  
  // etc...
  // Para resetear:
  //SetParamObjetivo(hPatrullaBoios, "LimpiarGrupoTendra");
  SetParamObjetivo(hPatrullaBoios, "ObjetivoAtracable", hPuebloBoios); // Saca las tropas del pueblo
  
  // Si queremos que coja (independientemente de lo que estén haciendo) tropas de un grupo particular:
  //SetParamObjetivo(hPatrullaBoios, "GrupoFuente", "UN_GRUPO_QUE_MARCA_LAS_TROPAS_QUE_PODEMOS_COGER");
  
  // Otra: se puede forzar a que las tropas que coja para las oleadas pertenezcan a uno o más grupos (propiedad) determinados
  //SetParamObjetivo(hPatrullaBoios, "GrupoDebePertenecer", "GENERADAS_PUEBLO");
  //SetParamObjetivo(hPatrullaBoios, "GrupoDebePertenecer", "OTRO_GRUPO");
  // Para limpiarlo (da igual en que grupo esten las tropas, cogerá cualquiera)
  //SetParamObjetivo(hPatrullaBoios, "LimpiarGruposPertenecer");
  
  
  // Permite especificar que la CPU debe esperar un tiempo antes de hacer peticiones al pueblo
  // El tiempo es en milisegundos
  SetDelayEntrenamientoTropasPueblo(hEstrategiaBoios, "BOXUM", fEntrenamientoBoxum);


  // -- CONFIGURACION CEREBRO
  // Funciona automáticamente, lanzando un dado cada vez que tiene un encuentro.
  // Para forzar un comportamiento concreto:
  //SetParamObjetivo(hPatrullaBoios, "ForzarAccion", "PEDIR_AYUDA");
  // Otras posibilidades son "OCULTARSE", "PARARSE", "ATACAR" y "CONTINUAR". Cualquier otro valor quita el forzado y vuelve al random.


  SetParamObjetivo(hPatrullaBoios, "RetardoSiguiente", fMuchoTiempo);

  AnyadirObjetivo(hEstrategiaBoios, hPatrullaBoios);
  
  hTimerMain = CrearTimer(1000);
  Wait(hTimerMain);


  //======================
  // Tulingos
  //======================
  
  hTulingos = DarCivilizacion("TULINGOS");
  hEstrategiaTulingos = CrearEstrategiaScript();
  AsignarEstrategia(hTulingos, hEstrategiaTulingos);
  StartEstrategia(hEstrategiaTulingos);

  // Ver arriba
  SetValue(hEstrategiaTulingos, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  SetValue(hEstrategiaTulingos, "GRUPOTROPAS_A_ENTRENAR", "EXPLORADOR_HALCON", 5);
  SetValue(hEstrategiaTulingos, "GRUPOTROPAS_A_ENTRENAR", "MAQUINAS_ATAQUE", 0);
  SetValue(hEstrategiaTulingos, "GRUPOTROPAS_A_ENTRENAR", "MAQUINAS_DEFENSA", 0);

  SetParamEstrategia(hEstrategiaTulingos, "ResetTropaRestringida");
  SetParamEstrategia(hEstrategiaTulingos, "TropaRestringida", "CENTURION_A");
  SetParamEstrategia(hEstrategiaTulingos, "TropaRestringida", "CENTURION_B");

  SetDelayEntrenamientoTropasPueblo(hEstrategiaTulingos, "SIDOLAUCUM", fEntrenamientoSidolaucum);

  // El pueblo de los tulingos  
  hPuebloTulingos = CrearObjetivo(hEstrategiaTulingos, "ConquistaPueblo2", "SIDOLAUCUM", "DEF_PUEBLO2");
  SetParamObjetivo(hPuebloTulingos, "Vigias", FALSE);
  AnyadirGrupoAObjetivo(hPuebloTulingos, "DEF_PUEBLO2");
  SetParamObjetivo(hPuebloTulingos, "PuedePedirRefuerzos", FALSE);
  AnyadirObjetivo(hEstrategiaTulingos, hPuebloTulingos);
  
  hPatrullaTulingos = CrearObjetivo(hEstrategiaTulingos, "PatrullaOleadasPeriodicas", 4000, 4000, 30, 60);
  
  SetParamObjetivo(hPatrullaTulingos, "MaxNumOleadas", 3);
  SetParamObjetivo(hPatrullaTulingos, "ComposicionEstricta", FALSE);
  
  SetParamObjetivo(hPatrullaTulingos, "FACTOR_POTENCIA_TROPAS", 2);
  
  SetParamObjetivo(hPatrullaTulingos, "ObjetivoAtracable", hPuebloTulingos);

  SetParamObjetivo(hPatrullaTulingos, "EXPLORAR_FACTOR_ENEMIGOS", -10);
  SetParamObjetivo(hPatrullaTulingos, "EXPLORAR_FACTOR_VISTA_YA", -1);
  SetParamObjetivo(hPatrullaTulingos, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hPatrullaTulingos, "EXPLORAR_FACTOR_PUEBLOS", -100);
//  SetParamObjetivo(hPatrullaTulingos, "NivelTraza", 1);
  
  SetParamObjetivo(hPatrullaTulingos, "IntentarTenerUnaDefTipoTropa", "EXPLORADOR_HALCON");
  
  AnyadirGrupoAObjetivo(hPatrullaTulingos, "EXPLORADOR_TULINGOS");

  // Definir composicion de los grupos (si se desea)

  SetParamObjetivo(hPatrullaTulingos, "RetardoSiguiente", fMuchoTiempo);
  AnyadirObjetivo(hEstrategiaTulingos, hPatrullaTulingos);

  hTimerMain = CrearTimer(1000);
  Wait(hTimerMain);
  
  //======================
  // Helvecios
  //======================
  
  hHelvecios = DarCivilizacion("HELVECIOS");
  hEstrategiaHelvecios = CrearEstrategiaScript();
  AsignarEstrategia(hHelvecios, hEstrategiaHelvecios);
  StartEstrategia(hEstrategiaHelvecios);

  // Ver arriba
  SetValue(hEstrategiaHelvecios, "GRUPOTROPAS_A_ENTRENAR", "EXPLORADOR_HALCON", 5);
  
  SetParamEstrategia(hEstrategiaHelvecios, "ResetTropaRestringida");
  SetParamEstrategia(hEstrategiaHelvecios, "TropaRestringida", "CENTURION_A");
  SetParamEstrategia(hEstrategiaHelvecios, "TropaRestringida", "CENTURION_B");

  hPatrullaHelvecios = CrearObjetivo(hEstrategiaHelvecios, "PatrullaOleadasPeriodicas", 7000, 7000, 10, 20);
  AnyadirGrupoAObjetivo(hPatrullaHelvecios, "OLEADA1");
  AnyadirGrupoAObjetivo(hPatrullaHelvecios, "OLEADA2");
  AnyadirGrupoAObjetivo(hPatrullaHelvecios, "OLEADA3");
  AnyadirGrupoAObjetivo(hPatrullaHelvecios, "OLEADA4");
  // No pongo maximo numero de oleadas, ni objetivos de los que robar tropas
  SetParamObjetivo(hPatrullaHelvecios, "ComposicionEstricta", FALSE);

	SetParamObjetivo(hPatrullaHelvecios, "ParametrosTacticas", "AtacarCorriendo", TRUE);
	
	SetParamObjetivo(hPatrullaHelvecios, "FACTOR_POTENCIA_TROPAS", 7);

  SetParamObjetivo(hPatrullaHelvecios, "EXPLORAR_FACTOR_ENEMIGOS", 100);
  SetParamObjetivo(hPatrullaHelvecios, "EXPLORAR_FACTOR_VISTA_YA", 0.5);
  SetParamObjetivo(hPatrullaHelvecios, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hPatrullaHelvecios, "EXPLORAR_FACTOR_PUEBLOS", 0);
  //SetParamObjetivo(hPatrullaHelvecios, "NivelTraza", 1);

  SetParamObjetivo(hPatrullaHelvecios, "IntentarTenerUnaDefUnidad", "EXPLORADOR_HALCON");
  
  AnyadirGrupoAObjetivo(hPatrullaHelvecios, "EXPLORADOR_HELVECIOS");
  
	//La primera patrulla de los helvecios se activa junto con las demás (esto es para que reaccionen si te ven)
	SetParamObjetivo(hPatrullaHelvecios, "RetardoSiguiente", fMuchoTiempo);
  
  AnyadirObjetivo(hEstrategiaHelvecios, hPatrullaHelvecios);


  hTimerMain = CrearTimer(1000);
  Wait(hTimerMain);
  
  
/*  
  hTacticaMantener = CrearTactica(hEstrategiaHelvecios, "MantenerPosicion");
  AnyadirGrupoATactica(hTacticaMantener, "DEF_PUENTE");
  AnyadirTactica(hEstrategiaHelvecios, hTacticaMantener);
*/

	hTacticaMantener  = CrearObjetivo(hEstrategiaHelvecios, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hTacticaMantener, "DEF_PUENTE");
  AnyadirObjetivo(hEstrategiaHelvecios, hTacticaMantener);
  
  //el grupo de helvecios que se mantiene en la posicion 
//  hFijos = CrearTactica(hEstrategiaHelvecios, "MantenerPosicion");
//  AnyadirGrupoATactica(hFijos, "G_FIJOS");
//  AnyadirTactica(hEstrategiaHelvecios, hFijos);
	hFijos = CrearObjetivo(hEstrategiaHelvecios, "DefensaSemiCoordinada");
	AnyadirGrupoAObjetivo(hFijos, "G_FIJOS");
	AnyadirObjetivo(hEstrategiaHelvecios, hFijos);

	hFijosII = CrearObjetivo(hEstrategiaHelvecios, "DefensaSemiCoordinada");
	AnyadirGrupoAObjetivo(hFijosII, "G_FIJOSII");
	AnyadirObjetivo(hEstrategiaHelvecios, hFijosII);
	
	hFijosIII = CrearObjetivo(hEstrategiaHelvecios, "DefensaSemiCoordinada");
	AnyadirGrupoAObjetivo(hFijosIII, "G_FIJOSIII");
	AnyadirObjetivo(hEstrategiaHelvecios, hFijosIII);
	
	hFijosIV = CrearObjetivo(hEstrategiaHelvecios, "DefensaSemiCoordinada");
	AnyadirGrupoAObjetivo(hFijosIV, "G_FIJOSIV");
	AnyadirObjetivo(hEstrategiaHelvecios, hFijosIV);
	
	hFijosV = CrearObjetivo(hEstrategiaHelvecios, "DefensaSemiCoordinada");
	AnyadirGrupoAObjetivo(hFijosV, "G_FIJOSV");
	AnyadirObjetivo(hEstrategiaHelvecios, hFijosV);
	
	hFijosVI = CrearObjetivo(hEstrategiaHelvecios, "DefensaSemiCoordinada");
	AnyadirGrupoAObjetivo(hFijosVI, "G_FIJOSVI");
	AnyadirObjetivo(hEstrategiaHelvecios, hFijosVI);
	
	hFijosVII = CrearObjetivo(hEstrategiaHelvecios, "DefensaSemiCoordinada");
	AnyadirGrupoAObjetivo(hFijosVII, "G_FIJOSVII");
	AnyadirObjetivo(hEstrategiaHelvecios, hFijosVII);
	
	
	ActivarTrigger("AcondicionamientoDelJugador");
	ActivarTrigger("ActivarPatrullas");
	ActivarTrigger("PararProduccion_Boios");
	ActivarTrigger("PararProduccion_Tulingos");
	ActivarTrigger("ReconquistaPueblo_Boios");
	ActivarTrigger("ReconquistaPueblo_Tulingos");
	ActivarTrigger("RespetarPuebloBoios");
	
	DesactivarTrigger("Main2");
	
}


///////////////////////////////////////////////////////////////////////////////
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

  // recordar posición inicial
  DarPosicionCamara(&x, &y);

  // cine
  ActivarCinemascope(TRUE);

  // iluminacion
  IluminarZona(165, 0 ,17 ,20 , 45000);
  IluminarZona(125, 0, 75, 10, 45000);
  IluminarZona(25, 0, 15, 10, 45000);

  // Presentacion
  ActivarPresentacion(TRUE, "LTEXT_MISION6_PRESENTACION_TITULO",
                            "LTEXT_MISION6_PRESENTACION_LUGAR", hPresentacion);

  // camara a donde debe empezar
  EncolarColocarYMirarPunto("TOMA_0");
  EjecutarOrdenesCamara();

  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));
  
  ActivarPresentacion(FALSE, "", "", NULL);
  
      
    // cámaras
    IntroducirPonerModoJuegoCamara(FALSE);

    EncolarPausaCamara(1000);
    EncolaTrayectoriaCamara("BRIEFING_1", FALSE, FALSE, 0, 0);
    EncolarPausaCamara(1000);
    EncolarColocarYMirarPunto("TOMA_1");
    EncolarPausaCamara(3000);
    IntroducirLocucion("06N0", "LTEXT_MISION6_LOCUCION_00_TXT", 12000, 600, 100);
    IntroducirPuntoSincronia();
    
    EncolarColocarYMirarPunto("TOMA_2");
    EncolarPausaCamara(4000);
    EncolarColocarYMirarPunto("TOMA_3");
    EncolarPausaCamara(4000);
    EncolarColocarYMirarPunto("TOMA_4");
    EncolarPausaCamara(4000);
    IntroducirLocucion("", "", 100, 0, 0);
    IntroducirLocucion("06N1", "LTEXT_MISION6_LOCUCION_01_TXT", 12000, 600, 100);    
    IntroducirPuntoSincronia();
    
    
    EncolarColocarYMirarPunto("TOMA_5");
    EncolarPausaCamara(7000);
    IntroducirLocucion("", "", 100, 0, 0);
    IntroducirLocucion("06N2", "LTEXT_MISION6_LOCUCION_02_TXT", 4000, 600, 100);
    IntroducirLocucion("", "", 100, 0, 0);
    IntroducirLocucion("06N3", "LTEXT_MISION6_LOCUCION_03_TXT", 3000, 600, 100);        
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
    
  } //if
  
  VaciarOrdenesCamara();
  VaciarLocuciones();

  // iluminacion
  IluminarZona(165, 0 ,17 ,20 , 45000);
  IluminarZona(125, 0, 75, 10, 45000);
  IluminarZona(25, 0, 15, 10, 45000);

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

Trigger "EfectosBriefing" [Inactivo]
(
  TRUE
)
Do
{
 
 
 DestruirTrigger("EfectosBriefing"); 
  
}

// --------------------------------------------------------------------------------
// Nombre      : AcondicionamientoDelJugador 
// Descripcion : Una (de 2) condición para que se activen las patrullas  
// --------------------------------------------------------------------------------
Trigger "AcondicionamientoDelJugador" [ Inactivo ]
(
  TRUE
)
Var
{
	handle hTimer;
}
Do
{
	hTimer = CrearTimer(60000);// 1 min
	Wait(hTimer);
  ActivarTrigger("EjecucionDePatrullas");
  DestruirTrigger("AcondicionamientoDelJugador");
	DestruirTrigger("ActivarPatrullas");

}


// --------------------------------------------------------------------------------
// Nombre      : ActivarPatrullas 
// Descripcion : La otra condición para que se activen las patrullas 
// --------------------------------------------------------------------------------
Trigger "ActivarPatrullas" [ Inactivo ]
(
  ObjetivoGetParamBOOL(hPatrullaHelvecios, "EstoyCombatiendo") ||
  ObjetivoGetParamBOOL(hPuebloBoios, "EstoyCombatiendo") ||
  ObjetivoGetParamBOOL(hPuebloTulingos, "EstoyCombatiendo") ||
  ObjetivoGetParamBOOL(hFijos, "EstoyCombatiendo") ||
  ObjetivoGetParamBOOL(hFijosII, "EstoyCombatiendo") ||
  ObjetivoGetParamBOOL(hFijosIII, "EstoyCombatiendo") ||
  ObjetivoGetParamBOOL(hFijosVI, "EstoyCombatiendo") ||
  ObjetivoGetParamBOOL(hFijosV, "EstoyCombatiendo") ||
  ObjetivoGetParamBOOL(hFijosVI, "EstoyCombatiendo") ||
  ObjetivoGetParamBOOL(hFijosVII, "EstoyCombatiendo") 
)
Do
{
	
	ActivarTrigger("EjecucionDePatrullas");
  DestruirTrigger("ActivarPatrullas");
  DestruirTrigger("AcondicionamientoDelJugador");
  
}


// --------------------------------------------------------------------------------
// Nombre      : EjecucionDePatrullas 
// Descripcion :  
// --------------------------------------------------------------------------------
Trigger "EjecucionDePatrullas" [ Inactivo ]
(
  TRUE
)
Do
{
  
  // NOTA: De momento no hay que definirle que tropas debe cazar. Irá a por los centuriones que vea.
  // Esto cambiará.
  hCazaHelvecios = CrearObjetivo(hEstrategiaHelvecios, "BusquedaYCaza", "CENTURION_A", "CENTURION_B");
  AnyadirGrupoAObjetivo(hCazaHelvecios, "EXPLORADORES");
  // Parametros que se pueden cambiar: (Inicialmente -> 20000, 30000, 35)
  //SetParamObjetivo(hCazaHelvecios, "POTENCIA_MIN_NECESARIA_POR_ATAQUE", 20000);
  //SetParamObjetivo(hCazaHelvecios, "POTENCIA_MAX_NECESARIA_POR_ATAQUE", 40000);
  SetParamObjetivo(hCazaHelvecios, "RADIO_RECOLECCION_TROPAS_PARA_ATACAR", 110);
  
  AnyadirObjetivo(hEstrategiaHelvecios, hCazaHelvecios);
  //se empiezan las patrullas helvecicas con este parametro 
  SetParamObjetivo(hPatrullaBoios, "RetardoSiguiente", DarNumeroAleatorio(30, 60));
  SetParamObjetivo(hPatrullaTulingos, "RetardoSiguiente", DarNumeroAleatorio(30, 60));
  SetParamObjetivo(hPatrullaHelvecios, "RetardoSiguiente", 0);
  
  DestruirTrigger("EjecucionDePatrullas");
  ActivarTrigger("CambioRitmo_Helvecios");
}

// --------------------------------------------------------------------------------
// Nombre      : PararProduccion_Boios
// Descripcion : 
// --------------------------------------------------------------------------------
Trigger "PararProduccion_Boios" [ Inactivo ]
(
  DarPotenciaCivilizacion("BOIOS") > fStopProdBoios
)
Do
{
  
  SetEntrenamientoPueblo(hEstrategiaBoios, "BOXUM", FALSE);
  DesactivarTrigger("PararProduccion_Boios");
  ActivarTrigger("ActivarProduccion_Boios");

}

// --------------------------------------------------------------------------------
// Nombre      : ActivarProduccion_Boios
// Descripcion : 
// --------------------------------------------------------------------------------
Trigger "ActivarProduccion_Boios" [ Inactivo ]
(
  DarPotenciaCivilizacion("BOIOS") < fRestartProdBoios 
)
Do
{
  
  SetEntrenamientoPueblo(hEstrategiaBoios, "BOXUM", TRUE);
  DesactivarTrigger("ActivarProduccion_Boios");
  ActivarTrigger("PararProduccion_Boios");

}


// --------------------------------------------------------------------------------
// Nombre      : PararProduccion_Tulingos
// Descripcion : 
// --------------------------------------------------------------------------------
Trigger "PararProduccion_Tulingos" [ Inactivo ]
(
  DarPotenciaCivilizacion("TULINGOS") > fStopProdTulingos
)
Do
{
  SetEntrenamientoPueblo(hEstrategiaTulingos, "SIDOLAUCUM", FALSE);
  DesactivarTrigger("PararProduccion_Tulingos");
  ActivarTrigger("ActivarProduccion_Tulingos");

}

// --------------------------------------------------------------------------------
// Nombre      : ActivarProduccion_Tulingos
// Descripcion : 
// --------------------------------------------------------------------------------
Trigger "ActivarProduccion_Tulingos" [ Inactivo ]
(
  DarPotenciaCivilizacion("TULINGOS") < fRestartProdTulingos
)
Do
{
  SetEntrenamientoPueblo(hEstrategiaTulingos, "SIDOLAUCUM", TRUE);
  DesactivarTrigger("ActivarProduccion_Tulingos");
  ActivarTrigger("PararProduccion_Tulingos");

}

// --------------------------------------------------------------------------------
// Nombre      : CambioRitmo_Helvecios
// Descripcion : al principio los helvecios irán a saco a por la colina, después se tranquilizarán
// --------------------------------------------------------------------------------
Trigger "CambioRitmo_Helvecios" [ Inactivo ]
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

  
  SetParamObjetivo(hPatrullaHelvecios, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hPatrullaHelvecios, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hPatrullaHelvecios, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hPatrullaHelvecios, "EXPLORAR_FACTOR_PUEBLOS", 0);
  DestruirTrigger("CambioRitmo_Helvecios"); 
}

// --------------------------------------------------------------------------------
// Nombre      : ReconquistaPueblo_Boios
// Descripcion : 
// --------------------------------------------------------------------------------
Trigger "ReconquistaPueblo_Boios" [ Inactivo ]
(
  EstaPuebloConquistado("cesar", "BOXUM")
)
Var
{
	handle hTimer;
}
Do
{
	hTimer = CrearTimer(10000);  // 1 min 
  Wait(hTimer);

  
  /*
  SetParamObjetivo(hPatrullaBoios, "EXPLORAR_FACTOR_ENEMIGOS", 100);
  SetParamObjetivo(hPatrullaBoios, "EXPLORAR_FACTOR_PUEBLOS", 20);
  SetParamObjetivo(hPatrullaBoios, "EXPLORAR_FACTOR_VISTA_YA", 0.5);
  */
  
  // Vamos a reconstruir el objetivo de conquista de pueblo, con las tropas
  // que estaban patrullando
  
  // Destruimos el objetivo actual
  DisposeHandle(&hPuebloBoios);
  
  hPuebloBoios = CrearObjetivo(hEstrategiaBoios, "ConquistaPueblo2", "BOXUM", "DEF_PUEBLO1");
	AnyadirTropasCivilizacionAObjetivo(hPuebloBoios, "BOIOS");
	AnyadirObjetivo(hEstrategiaBoios, hPuebloBoios);  
  
  DestruirTrigger("ReconquistaPueblo_Boios"); 
}

// --------------------------------------------------------------------------------
// Nombre      : ReconquistaPueblo_Tulingos
// Descripcion : 
// --------------------------------------------------------------------------------
Trigger "ReconquistaPueblo_Tulingos" [ Inactivo ]
(
  EstaPuebloConquistado("cesar", "SIDOLAUCUM")
)
Var
{
	handle hTimer;
}
Do
{
	hTimer = CrearTimer(60000);  // 1 min
  Wait(hTimer);
  
  /*
  SetParamObjetivo(hPatrullaTulingos, "EXPLORAR_FACTOR_ENEMIGOS", 100);
  SetParamObjetivo(hPatrullaTulingos, "EXPLORAR_FACTOR_PUEBLOS", 20);
  SetParamObjetivo(hPatrullaTulingos, "EXPLORAR_FACTOR_VISTA_YA", 0.5);
  */
  
  DisposeHandle(&hPuebloTulingos);
  
  hPuebloTulingos = CrearObjetivo(hEstrategiaTulingos, "ConquistaPueblo2", "SIDOLAUCUM", "DEF_PUEBLO2");
	AnyadirTropasCivilizacionAObjetivo(hPuebloTulingos, "TULINGOS");
	AnyadirObjetivo(hEstrategiaTulingos, hPuebloTulingos); 
  DestruirTrigger("ReconquistaPueblo_Tulingos"); 
}







// --------------------------------------------------------------------------------
// Nombre      : RespetarPuebloBoios
// Descripcion : 
// --------------------------------------------------------------------------------
Trigger "RespetarPuebloBoios" [Inactivo]
(
  ObjetivoGetParamFLOAT(hPuebloBoios, "Potencia") < 7000
)
Do
{
  

  // Este parametro permite detener el lanzamiento de oleadas completamente  
  SetParamObjetivo(hPatrullaBoios, "LanzarOleadas", FALSE);
  ActivarTrigger("SacarTropasPuebloBoios");
  DesactivarTrigger("RespetarPuebloBoios");
}


// --------------------------------------------------------------------------------
// Nombre      : SacarTropasPuebloBoios
// Descripcion : 
// --------------------------------------------------------------------------------
Trigger "SacarTropasPuebloBoios" [Inactivo]
(
  ObjetivoGetParamFLOAT(hPuebloBoios, "Potencia") > 7000
)
Do
{
  

  // Este parametro reaunda el lanzamiento de oleadas
  SetParamObjetivo(hPatrullaBoios, "LanzarOleadas", TRUE);
  ActivarTrigger("RespetarPuebloBoios");
  DesactivarTrigger("SacarTropasPuebloBoios");
}

/*
// --------------------------------------------------------------------------------
// Nombre      : RespetarPuebloTulingos
// Descripcion : 
// --------------------------------------------------------------------------------
Trigger "RespetarPuebloTulingos" [Inactivo]
(
  ObjetivoGetParamFLOAT(hPuebloTulingos, "Potencia") < 5000
)
Do
{
  MensajeChat("Estamos dejando el pueblo Tulingo sin gente");

  // Este parametro permite detener el lanzamiento de oleadas completamente  
  SetParamObjetivo(hPatrullaTulingos, "LanzarOleadas", FALSE);
  ActivarTrigger("SacarTropasPuebloTulingos");
  DesactivarTrigger("RespetarPuebloTulingos");
}


// --------------------------------------------------------------------------------
// Nombre      : SacarTropasPuebloTulingos
// Descripcion : 
// --------------------------------------------------------------------------------
Trigger "SacarTropasPuebloTulingos" [Inactivo]
(
  ObjetivoGetParamFLOAT(hPuebloTulingos, "Potencia") > 7000
)
Do
{
  MensajeChat("Ya podemos volver a lanzar Tulingos por ahi");

  // Este parametro reaunda el lanzamiento de oleadas
  SetParamObjetivo(hPatrullaTulingos, "LanzarOleadas", TRUE);
  ActivarTrigger("RespetarPuebloTulingos");
  DesactivarTrigger("SacarTropasPuebloTulingos");
}

*/


/*

// --------------------------------------------------------------------------------
// Nombre      : GameOverCenturionUnoMuerto
// Descripcion : 
// --------------------------------------------------------------------------------
Trigger "GameOverCenturionUnoMuerto" [ Activo ]
(
  !EstaTropaViva("CENTURION_A")
)
Do
{
  MensajeChat("  Han Matado a un centurión!!!");
  DestruirTrigger("GameOverCenturionUnoMuerto");
  ActivarTrigger("GameOver");
}

// --------------------------------------------------------------------------------
// Nombre      : GameOverCenturionDosMuerto
// Descripcion : 
// --------------------------------------------------------------------------------
Trigger "GameOverCenturionDosMuerto" [ Activo ]
(
  !EstaTropaViva("CENTURION_B")
)
Do
{
  MensajeChat("  Han Matado a un centurión!!!");
  DestruirTrigger("GameOverCenturionDosMuerto");
  ActivarTrigger("GameOver");
}



// --------------------------------------------------------------------------------
// Nombre      : GameOver
// Descripcion : 
// --------------------------------------------------------------------------------
Trigger "GameOver" [ Inactivo ]
(
  TRUE
)
Do
{
  MensajeChat("--------------------------");
  MensajeChat("      GAME OVER");
  MensajeChat("--------------------------");
  FinalizarMision(FALSE);
  DestruirTrigger("GameOverCenturionUnoMuerto");
  DestruirTrigger("GameOverCenturionDosMuerto");
  DestruirTrigger("EXITO");
  DestruirTrigger("GameOver");  
}

*/

// --------------------------------------------------------------------------------
// Nombre      : Condiciones de victoria
// Descripcion : 
// --------------------------------------------------------------------------------
Trigger "CondicionesVictoria" [Inactivo]
(
  (HaEntradoTropaEnZona("Ciudad de Bribacte","CENTURION_B") && HaEntradoTropaEnZona("Ciudad de Bribacte","CENTURION_A"))
  ||
  !EstaTropaViva("CENTURION_B")
  ||
  !EstaTropaViva("CENTURION_A")
)
Var
{
  handle hCamaraEnd;
  handle hEscape;
  handle hTimer;
  float x, y;
}
Do
{
  if ( !EstaTropaViva("CENTURION_A") || !EstaTropaViva("CENTURION_B") )
  {
    
    if ( !EstaTropaViva("CENTURION_A") ) {
      IndicarObjetivoFracasado(hObjTitoVivo);
    }
    
    if ( !EstaTropaViva("CENTURION_B") ) {
      IndicarObjetivoFracasado(hObjCrastinoVivo);
    }
    
    IndicarObjetivoFracasado(hObjLlegarBribacte);
    FinalizarMision(FALSE);
                
  }
  else
  {
     
    IndicarObjetivoCumplido(hObjTitoVivo);
    IndicarObjetivoCumplido(hObjCrastinoVivo);
    IndicarObjetivoCumplido(hObjLlegarBribacte);
    
    NeutralizarCivilizacion("BOIOS", TRUE);
    NeutralizarCivilizacion("TULINGOS", TRUE);
    NeutralizarCivilizacion("HELVECIOS", TRUE);
   
    hTimer = CrearTimer(2000);
    Wait(hTimer);
   
    /////////////////////////////////////////////////////////////////
    // final de misión: encuentro con diviciaco en bibracte
    /////////////////////////////////////////////////////////////////
   
    // recordar posición inicial
    DarPosicionCamara(&x, &y);
   
    // handle de final y presentacion
    hCamaraEnd = CrearHandle("Bool");
    hEscape = CrearHandle("Bool");

    // cazar escape
    PonerHandleInterrupcion(hEscape);

    // cine
    ActivarCinemascope(TRUE);
    
    // colocamos a la gente
    TropaSigueRutaPredefinida("CENTURION_A", "CENT_1");
    TropaSigueRutaPredefinida("CENTURION_B", "CENT_2");

    // cámaras
    IntroducirPonerModoJuegoCamara(FALSE);

    EncolaTrayectoriaCamara("FINAL_1", FALSE, FALSE, 0, 0);
    IntroducirLocucion("0650", "LTEXT_MISION6_EVENTO1_00_TXT", 4000, 600, 100);
    IntroducirLocucion("", "", 100, 0, 0);
    IntroducirLocucion("0651", "LTEXT_MISION6_EVENTO1_01_TXT", 8000, 600, 100);
    IntroducirPuntoSincronia();
      
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

    // colocamos la cámara
    if ( HandleDisparado(hEscape) )
    {
      MirarAPunto(x, y);
    }

    // se acabó la misión      
    FinalizarMision(TRUE);
   
  }
  
  DestruirTrigger("CondicionesVictoria");
  
}

// --------------------------------------------------------------------------------
// Nombre      : End
// Descripcion : 
// --------------------------------------------------------------------------------
Trigger "End" [ Activo ]  
(
  TRUE
)
Do
{
}