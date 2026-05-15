Var
{	
  // Definicion de variables globales
  handle hEstrategiaFaciles;
  handle hCivilizacionFaciles;
  
  handle hEstrategiaBajos;
  handle hCivilizacionBajos;
  
  handle hEstrategiaMedios;
  handle hCivilizacionMedios;
  
  handle hEstrategiaCercados;
  handle hCivilizacionCercados;
  
  handle hEstrategiaPatrullas;
  handle hCivilizacionPatrullas;
  
  handle hEstrategiaExp;
  handle hCivilizacionExp;
  
  // Objetivos que controlan los cuatro pueblos
  handle hObjetivoPueblo1;
  handle hObjetivoPueblo2;
  handle hObjetivoPueblo3;
  handle hObjetivoPueblo4;
  
  // Handles para la huida de los centuriones
  handle hObjetivoHuida1;
  handle hObjetivoHuida2;
  handle hObjetivoHuida3;
  handle hObjetivoHuida4;
  
  handle hGFijo;
  handle hGFijoII;
  handle hGFijoIII;
  handle hGFijoIV;
  handle hGFijoV;
  handle hGFijoVI;
  handle hGFijoVII;
  handle hGFijoVIII;
  handle hGFijoIX;
  handle hGFijoX;
  handle hGFijoXI;
  handle hGFijoXII;
  handle hGFijoXIII;
  
  handle hGFijoMega;
  
  handle hArq;
  handle hArqII;
  handle hArqIII;
  handle hArqIV;
  handle hArqV;
  handle hArqVI;
  
  handle hG_A;
  handle hG_B;
  handle hG_C;
  handle hG_D;
  handle hG_E;
  handle hG_F;
  
  handle hObjetivoPatrullas;
  
  handle hObjetivoExploracion;
  
  // Condiciones victoria
  handle hObj4Pueblos;
  handle hObj3Pueblos;
  handle hObj2Pueblos;
  handle hObj1Pueblo;
  
  handle hObj4Jefes;
  handle hObj3Jefes;
  handle hObj2Jefes;
  handle hObj1Jefe;
  
  handle hObjPublioVivo;
  handle hObjLabienoVivo;
  handle hObjDiviciacoVivo;
  
  float fNPueblos                         = 0;
  float fNJefes                           = 0;

  // briefings  
  float fPuntoSincronia                    = 0;
  handle hPuntoSincronia                   = NULL;
  bool bBriefingEnded                      = FALSE;
  
  // niveles de dificultad
  float fNivelDificultad            = 0;
  
  float fWaitRecon; 
  
}

#include "FunScript.h"


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
 

  // inmovilizo a un jefe galo que necesito quieto.
  OrdenarTropaMantenerPosicion("JefeGaloMedio", TRUE);

  // alianzas
  CrearAlianzaPorNombre("CESAR", "MENAPII");
  
	// Alianzas de los enemigos
	CrearAlianzaPorNombre("SUEVOS", "TANCTERES DEL SUR"); 
	CrearAlianzaPorNombre("SUEVOS", "TANCTERES DEL NORTE");
	CrearAlianzaPorNombre("SUEVOS", "USIPETES DEL NORTE");
	CrearAlianzaPorNombre("SUEVOS", "USIPETES DEL SUR");

  // siguiente...
  ActivarTrigger("Briefing");
  DestruirTrigger("Main");
  
}


Trigger "Main2" [ Inactivo ]  
(
  TRUE
)
Var
{
  handle hTimer;
  float fHig;
  float fLow;
    
}
Do
{

  // que se vean los pueblos  
  IluminarZonaOnOff(188, 0, 190, 10, "p1", TRUE);
  IluminarZonaOnOff(144, 0, 60, 10, "p2", TRUE);
  IluminarZonaOnOff(23, 0, 28, 10, "p3", TRUE);
  IluminarZonaOnOff(40, 0, 144, 10, "p4", TRUE);

  IluminarZonaOnOff(188, 0, 190, 10, "p1", FALSE);
  IluminarZonaOnOff(144, 0, 60, 10, "p2", FALSE);
  IluminarZonaOnOff(23, 0, 28, 10, "p3", FALSE);
  IluminarZonaOnOff(40, 0, 144, 10, "p4", FALSE);

  
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
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_ESPADON", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_CAZADOR", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_PESADA", "CESAR");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_ARQUERO", "CESAR");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_PIQUERO", "CESAR");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_CABALLERIA_ARQUERA", "CESAR");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_MEDICO", "CESAR");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_ARQUERO", "CESAR");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "GALO_ARQUERO", "CESAR");
  
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "BALLESTA_MOVIL_BARBARA", "");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "CATAPULTA_BARBARA", "");
  
  // comprobar el nivel de dificultad
  fNivelDificultad = DarDificultadMision();
  if ( fNivelDificultad == 1 )
  {    
    fHig = 1020000;// 17 min
    fLow = 240000;// 4 min
    
    //Lo que tardan los enemigos en reconquistar su pueblo
    fWaitRecon = 180000;// 3 min
    
    //Los enemigos no pueden construir torres de defensa
    IntroducirRestriccionEstructura("ORDEN_CONSTRUIR", "TORRE_DEFENSA_BARBARA", "");
  }
  else
  if ( fNivelDificultad == 2 )
  {    
    fHig = 840000;// 14 min
    fLow = 120000;// 2 min 
    
    //Lo que tardan los enemigos en reconquistar su pueblo
    fWaitRecon = 120000;// 2 min
    
    //Los enemigos no pueden construir torres de defensa
    IntroducirRestriccionEstructura("ORDEN_CONSTRUIR", "TORRE_DEFENSA_BARBARA", "");
  }
  else
  if ( fNivelDificultad == 3 )
  {
    fHig = 480000;// 8 min
    fLow = 30000;// 1/2 min 
    
    //Lo que tardan los enemigos en reconquistar su pueblo
    fWaitRecon = 60000;// 1 min
  }
  else
  {
    fHig = 480000;// 8 min
    fLow = 30000;// 1/2 min 
    
    //Lo que tardan los enemigos en reconquistar su pueblo
    fWaitRecon = 60000;// 1 min
    
    MensajeChat("Nivel de dificulatd desconocido, oiga");
  }
    
  //OBJETIVOS
  hObj4Pueblos = CrearHandle("Bool");
  hObj3Pueblos = CrearHandle("Bool");
  hObj2Pueblos = CrearHandle("Bool");
  hObj1Pueblo = CrearHandle("Bool");
  
  hObj4Jefes = CrearHandle("Bool");
  hObj3Jefes = CrearHandle("Bool");
  hObj2Jefes = CrearHandle("Bool");
  hObj1Jefe = CrearHandle("Bool");
  
  hObjPublioVivo = CrearHandle("Bool");
  hObjLabienoVivo = CrearHandle("Bool");
  hObjDiviciacoVivo = CrearHandle("Bool");

  AgregarObjetivoMision(hObjPublioVivo, "LTEXT_MISION8_OBJETIVO_08_TXT");
  AgregarObjetivoMision(hObjLabienoVivo, "LTEXT_MISION8_OBJETIVO_09_TXT");
  AgregarObjetivoMision(hObjDiviciacoVivo, "LTEXT_MISION8_OBJETIVO_10_TXT");
  AgregarObjetivoMision(hObj4Pueblos, "LTEXT_MISION8_OBJETIVO_00_TXT");
  AgregarObjetivoMision(hObj4Jefes, "LTEXT_MISION8_OBJETIVO_04_TXT");

  // Creamos la estrategia script para la CPU
  hEstrategiaFaciles = CrearEstrategiaScript();
  hCivilizacionFaciles = DarCivilizacion("USIPETES DEL SUR");
  AsignarEstrategia(hCivilizacionFaciles, hEstrategiaFaciles);
  StartEstrategia(hEstrategiaFaciles);
  
  hEstrategiaBajos = CrearEstrategiaScript();
  hCivilizacionBajos = DarCivilizacion("TANCTERES DEL SUR");
  AsignarEstrategia(hCivilizacionBajos, hEstrategiaBajos);
  StartEstrategia(hEstrategiaBajos);
  
  hEstrategiaMedios = CrearEstrategiaScript();
  hCivilizacionMedios = DarCivilizacion("TANCTERES DEL NORTE");
  AsignarEstrategia(hCivilizacionMedios, hEstrategiaMedios);
  StartEstrategia(hEstrategiaMedios);
  
  hEstrategiaCercados = CrearEstrategiaScript();
  hCivilizacionCercados = DarCivilizacion("USIPETES DEL NORTE");
  AsignarEstrategia(hCivilizacionCercados, hEstrategiaCercados);
  StartEstrategia(hEstrategiaCercados);

  hEstrategiaPatrullas = CrearEstrategiaScript();
  hCivilizacionPatrullas = DarCivilizacion("SUEVOS");
  AsignarEstrategia(hCivilizacionPatrullas, hEstrategiaPatrullas);
  StartEstrategia(hEstrategiaPatrullas);
  
  hEstrategiaExp = CrearEstrategiaScript();
  hCivilizacionExp = DarCivilizacion("MENAPII");
  AsignarEstrategia(hCivilizacionExp, hEstrategiaExp);
  StartEstrategia(hEstrategiaExp);

   /* 
  // El mega grupo se deja estar de patrullas 
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  hGFijoMega = CrearObjetivo(hEstrategiaPatrullas, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hGFijoMega, "G_MEGALIPTIC");
  AnyadirObjetivo(hEstrategiaPatrullas, hGFijoMega);
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   */
    
  // Objetivo de exploracion de los MENAPII halcones 
  hObjetivoExploracion = CrearObjetivo(hEstrategiaExp, "Exploracion", "Acomodada");
  AnyadirGrupoAObjetivo(hObjetivoExploracion, "G_EXP");  
  SetParamObjetivo(hObjetivoExploracion, "PuedePedirRefuerzos", FALSE);
  AnyadirObjetivo(hEstrategiaExp,  hObjetivoExploracion);

  // -- Creamos los objetivos de  los cuatro pueblos
  
  hObjetivoPueblo1 = CrearObjetivo(hEstrategiaFaciles, "ConquistaPueblo2", "GELDUBA");
  AnyadirGrupoAObjetivo(hObjetivoPueblo1, "G_FACILES");  
  AnyadirObjetivo(hEstrategiaFaciles,  hObjetivoPueblo1);
  SetParamObjetivo(hObjetivoPueblo1, "NombreGrupoGenerado", "G_FACILES");
  SetValue(hEstrategiaFaciles, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  SetValue(hEstrategiaFaciles, "GRUPOTROPAS_A_ENTRENAR", "LIGERAS", 70);
  SetValue(hEstrategiaFaciles, "GRUPOTROPAS_A_ENTRENAR", "PESADAS", 0);
  SetParamObjetivo(hObjetivoPueblo1, "PuedePedirRefuerzos", FALSE);
  
  // >>>>>> Esto es para que el centurion salga del pueblo a combatir
  SetParamObjetivo(hObjetivoPueblo1, "CENTURION_AYUDA_COMBATE", FALSE);// TRUE
  SetParamObjetivo(hObjetivoPueblo1, "PotenciaHuirConElCenturion", 10000);
  
  SetDelayEntrenamientoTropasPueblo(hEstrategiaFaciles, "GELDUBA", fLow);
  
  hObjetivoPueblo2 = CrearObjetivo(hEstrategiaBajos, "ConquistaPueblo2", "CAR MENAPII");
  AnyadirGrupoAObjetivo(hObjetivoPueblo2, "G_BAJOS");  
  AnyadirObjetivo(hEstrategiaBajos,  hObjetivoPueblo2);
  SetParamObjetivo(hObjetivoPueblo2, "NombreGrupoGenerado", "G_BAJOS");
  SetValue(hEstrategiaBajos, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  SetValue(hEstrategiaBajos, "GRUPOTROPAS_A_ENTRENAR", "CABALLERIA", 70);
  SetValue(hEstrategiaBajos, "GRUPOTROPAS_A_ENTRENAR", "DISTANCIA", 0);
  SetParamObjetivo(hObjetivoPueblo2, "PuedePedirRefuerzos", FALSE);
  
  // >>>>>> Esto es para que el centurion salga del pueblo a combatir
  SetParamObjetivo(hObjetivoPueblo2, "CENTURION_AYUDA_COMBATE", FALSE);// TRUE
  SetParamObjetivo(hObjetivoPueblo2, "PotenciaHuirConElCenturion", 10000);
  
  SetDelayEntrenamientoTropasPueblo(hEstrategiaBajos, "CAR MENAPII", fHig);
  
  hObjetivoPueblo3 = CrearObjetivo(hEstrategiaMedios, "ConquistaPueblo2", "SUBLONES");
  AnyadirGrupoAObjetivo(hObjetivoPueblo3, "G_MEDIOS");  
  AnyadirObjetivo(hEstrategiaMedios,  hObjetivoPueblo3);
  SetParamObjetivo(hObjetivoPueblo3, "NombreGrupoGenerado", "G_MEDIOS");
  SetValue(hEstrategiaMedios, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  SetValue(hEstrategiaMedios, "GRUPOTROPAS_A_ENTRENAR", "DISTANCIA", 70);
  SetValue(hEstrategiaMedios, "GRUPOTROPAS_A_ENTRENAR", "CABALLERIA", 0);
  SetParamObjetivo(hObjetivoPueblo3, "PuedePedirRefuerzos", FALSE);
  
  // >>>>>> Esto es para que el centurion salga del pueblo a combatir
  SetParamObjetivo(hObjetivoPueblo3, "CENTURION_AYUDA_COMBATE", FALSE);// TRUE
  SetParamObjetivo(hObjetivoPueblo3, "PotenciaHuirConElCenturion", 10000);
  
  SetDelayEntrenamientoTropasPueblo(hEstrategiaMedios, "SUBLONES", fLow);
 
  hObjetivoPueblo4 = CrearObjetivo(hEstrategiaCercados, "ConquistaPueblo2", "ASCIBURGIUM");
  AnyadirGrupoAObjetivo(hObjetivoPueblo4, "G_CERCADOS");  
  AnyadirObjetivo(hEstrategiaCercados,  hObjetivoPueblo4);
  SetParamObjetivo(hObjetivoPueblo4, "NombreGrupoGenerado", "G_CERCADOS");
  SetValue(hEstrategiaCercados, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
  SetValue(hEstrategiaCercados, "GRUPOTROPAS_A_ENTRENAR", "PESADAS", 70);
  SetValue(hEstrategiaCercados, "GRUPOTROPAS_A_ENTRENAR", "CABALLERIA", 0);
  SetParamObjetivo(hObjetivoPueblo4, "PuedePedirRefuerzos", FALSE);
  
  // >>>>>> Esto es para que el centurion salga del pueblo a combatir
  SetParamObjetivo(hObjetivoPueblo4, "CENTURION_AYUDA_COMBATE", FALSE);// TRUE
  SetParamObjetivo(hObjetivoPueblo4, "PotenciaHuirConElCenturion", 10000);
  
  SetDelayEntrenamientoTropasPueblo(hEstrategiaCercados, "ASCIBURGIUM", fHig);
  
  // -- Creamos los grupos de ataque diseminados por el mapa
  
  hGFijo = CrearObjetivo(hEstrategiaMedios, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hGFijo, "G_EMBOSCADA");
  AnyadirObjetivo(hEstrategiaMedios, hGFijo);
  
  hGFijoII = CrearObjetivo(hEstrategiaMedios, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hGFijoII, "G_DIRECTO");
  AnyadirObjetivo(hEstrategiaMedios, hGFijoII);

  hGFijoIII = CrearObjetivo(hEstrategiaFaciles, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hGFijoIII, "G_MOGOLLON_LIGERO");
  AnyadirObjetivo(hEstrategiaFaciles, hGFijoIII);
  
  hGFijoIV = CrearObjetivo(hEstrategiaFaciles, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hGFijoIV, "G_LIGEROSII");
  AnyadirObjetivo(hEstrategiaFaciles, hGFijoIV);

  hGFijoV = CrearObjetivo(hEstrategiaBajos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hGFijoV, "G_1");
  AnyadirObjetivo(hEstrategiaBajos, hGFijoV);
  
  hGFijoVI = CrearObjetivo(hEstrategiaBajos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hGFijoVI, "G_2");
  AnyadirObjetivo(hEstrategiaBajos, hGFijoVI);

  hGFijoVII = CrearObjetivo(hEstrategiaBajos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hGFijoVII, "G_3");
  AnyadirObjetivo(hEstrategiaBajos, hGFijoVII);
  
  hGFijoVIII = CrearObjetivo(hEstrategiaBajos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hGFijoVIII, "G_4");
  AnyadirObjetivo(hEstrategiaBajos, hGFijoVIII);
 
  hGFijoIX = CrearObjetivo(hEstrategiaBajos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hGFijoIX, "G_5");
  AnyadirObjetivo(hEstrategiaBajos, hGFijoIX);
  
  hGFijoX = CrearObjetivo(hEstrategiaBajos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hGFijoX, "G_6");
  AnyadirObjetivo(hEstrategiaBajos, hGFijoX);

  hGFijoXI = CrearObjetivo(hEstrategiaBajos, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hGFijoXI, "G_7");
  AnyadirObjetivo(hEstrategiaBajos, hGFijoXI);
  
  hGFijoXII = CrearObjetivo(hEstrategiaCercados, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hGFijoXII, "G_PESADO");
  AnyadirObjetivo(hEstrategiaCercados, hGFijoXII);
  
  hGFijoXIII = CrearObjetivo(hEstrategiaCercados, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hGFijoXIII, "G_PESADOII");
  AnyadirObjetivo(hEstrategiaCercados, hGFijoXIII);
  
  // Unos arqueros que defienden posiciones dadas desde el principio
  hArq = CrearObjetivo(hEstrategiaPatrullas, "DefenderPosicion", 197, 96, 0);
  AnyadirGrupoAObjetivo(hArq, "G_ARQ");
  AnyadirObjetivo(hEstrategiaPatrullas, hArq);
  
  hArqII = CrearObjetivo(hEstrategiaPatrullas, "DefenderPosicion", 181, 170, 0);
  AnyadirGrupoAObjetivo(hArqII, "G_ARQII");
  AnyadirObjetivo(hEstrategiaPatrullas, hArqII);

  hArqIII = CrearObjetivo(hEstrategiaPatrullas, "DefenderPosicion", 136, 188, 0);
  AnyadirGrupoAObjetivo(hArqIII, "G_ARQIII");
  AnyadirObjetivo(hEstrategiaPatrullas, hArqIII);
  
  hArqIV = CrearObjetivo(hEstrategiaPatrullas, "DefenderPosicion", 59, 125, 0);
  AnyadirGrupoAObjetivo(hArqIV, "G_ARQIV");
  AnyadirObjetivo(hEstrategiaPatrullas, hArqIV);

  hArqV = CrearObjetivo(hEstrategiaPatrullas, "DefenderPosicion", 60, 64, 0);
  AnyadirGrupoAObjetivo(hArqV, "G_ARQV");
  AnyadirObjetivo(hEstrategiaPatrullas, hArqV);
  
  hArqVI = CrearObjetivo(hEstrategiaPatrullas, "DefenderPosicion", 89, 124, 0);
  AnyadirGrupoAObjetivo(hArqVI, "G_ARQ");
  AnyadirObjetivo(hEstrategiaPatrullas, hArqVI);

  // Creamos las tropas que van patrullado aleatoriamente
  // PROCURAR QUE EL GRUPO ESTE BASTANTE ESTANCADO EN SU SITIO...
  hObjetivoPatrullas = CrearObjetivo(hEstrategiaPatrullas, "PatrullaOleadasPeriodicas", 10000, 10000, 600, 900);
  AnyadirGrupoAObjetivo(hObjetivoPatrullas, "G_MEGALIPTICO");
    
  SetParamObjetivo(hObjetivoPatrullas, "ParametrosTacticas", "AtacarCorriendo", TRUE);	
  SetParamObjetivo(hObjetivoPatrullas, "MantenerDefensivo", TRUE);
  SetParamObjetivo(hObjetivoPatrullas, "FACTOR_POTENCIA_TROPAS", 7);
  SetParamObjetivo(hObjetivoPatrullas, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hObjetivoPatrullas, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hObjetivoPatrullas, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hObjetivoPatrullas, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hObjetivoPatrullas, "EXPLORAR_FACTOR_DIST_OTROS", 2);
  SetParamObjetivo(hObjetivoPatrullas, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hObjetivoPatrullas, "PermisoPedirAyuda", FALSE);
  SetParamObjetivo(hObjetivoPatrullas, "MaxNumOleadas", 4);
  
  SetParamObjetivo(hObjetivoPatrullas, "GrupoTendraTipoTropa", "PAT_CABALLERIA", 50);  // 6000 pot
  SetParamObjetivo(hObjetivoPatrullas, "GrupoTendraTipoTropa", "PAT_INFANTERIA", 50);  // 6000 pot
  
  AnyadirObjetivo(hEstrategiaPatrullas, hObjetivoPatrullas);
  
  // Unos grupitos de patrulla por el mapa
  // A lo mejor se le ponen pesos de patrulla diferentes (que te busquen o no...)
  hG_A = CrearObjetivo(hEstrategiaPatrullas, "PatrullaOleadasPeriodicas", 10000, 22000, 10, 30);
  AnyadirGrupoAObjetivo(hG_A, "G_A");
  AnyadirGrupoAObjetivo(hG_A, "G_B");//
  AnyadirGrupoAObjetivo(hG_A, "G_C");//
  AnyadirGrupoAObjetivo(hG_A, "G_D");//
  AnyadirGrupoAObjetivo(hG_A, "G_F");//
  SetParamObjetivo(hG_A, "ParametrosTacticas", "AtacarCorriendo", TRUE);	
  SetParamObjetivo(hG_A, "FACTOR_POTENCIA_TROPAS", 3);
  SetParamObjetivo(hG_A, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hG_A, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hG_A, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hG_A, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hG_A, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hG_A, "MaxNumOleadas", 5);// -1
  SetParamObjetivo(hG_A, "PermisoPedirAyuda", FALSE);
  AnyadirObjetivo(hEstrategiaPatrullas, hG_A);
/*
  // timer siniestro
  hTimer = CrearTimer(1000);
  Wait(hTimer);
  
  hG_B = CrearObjetivo(hEstrategiaPatrullas, "PatrullaOleadasPeriodicas", 10000, 22000, 10, 30);
  AnyadirGrupoAObjetivo(hG_B, "G_B");
  SetParamObjetivo(hG_B, "ParametrosTacticas", "AtacarCorriendo", TRUE);	
  SetParamObjetivo(hG_B, "FACTOR_POTENCIA_TROPAS", 3);
  SetParamObjetivo(hG_B, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hG_B, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hG_B, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hG_B, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hG_B, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hG_B, "MaxNumOleadas", -1);
  SetParamObjetivo(hG_B, "PermisoPedirAyuda", FALSE);
  AnyadirObjetivo(hEstrategiaPatrullas, hG_B);

  // timer siniestro
  hTimer = CrearTimer(1000);
  Wait(hTimer);
  
  hG_C = CrearObjetivo(hEstrategiaPatrullas, "PatrullaOleadasPeriodicas", 10000, 22000, 10, 30);
  AnyadirGrupoAObjetivo(hG_C, "G_C");
  SetParamObjetivo(hG_C, "ParametrosTacticas", "AtacarCorriendo", TRUE);	
  SetParamObjetivo(hG_C, "FACTOR_POTENCIA_TROPAS", 3);
  SetParamObjetivo(hG_C, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hG_C, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hG_C, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hG_C, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hG_C, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hG_C, "MaxNumOleadas", -1);
  SetParamObjetivo(hG_C, "PermisoPedirAyuda", FALSE);
  AnyadirObjetivo(hEstrategiaPatrullas, hG_C);

  // timer siniestro
  hTimer = CrearTimer(1000);
  Wait(hTimer);

  hG_D = CrearObjetivo(hEstrategiaPatrullas, "PatrullaOleadasPeriodicas", 10000, 22000, 10, 30);
  AnyadirGrupoAObjetivo(hG_D, "G_D");
  SetParamObjetivo(hG_D, "ParametrosTacticas", "AtacarCorriendo", TRUE);	
  SetParamObjetivo(hG_D, "FACTOR_POTENCIA_TROPAS", 3);
  SetParamObjetivo(hG_D, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hG_D, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hG_D, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hG_D, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hG_D, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hG_D, "MaxNumOleadas", -1);
  SetParamObjetivo(hG_D, "PermisoPedirAyuda", FALSE);
  AnyadirObjetivo(hEstrategiaPatrullas, hG_D);

  // timer siniestro
  hTimer = CrearTimer(1000);
  Wait(hTimer);
      
  hG_F = CrearObjetivo(hEstrategiaPatrullas, "PatrullaOleadasPeriodicas", 10000, 22000, 10, 30);
  AnyadirGrupoAObjetivo(hG_F, "G_F");
  SetParamObjetivo(hG_F, "ParametrosTacticas", "AtacarCorriendo", TRUE);	
  SetParamObjetivo(hG_F, "FACTOR_POTENCIA_TROPAS", 3);
  SetParamObjetivo(hG_F, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hG_F, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hG_F, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hG_F, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hG_F, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hG_F, "MaxNumOleadas", -1);
  SetParamObjetivo(hG_F, "PermisoPedirAyuda", FALSE);
  AnyadirObjetivo(hEstrategiaPatrullas, hG_F);
*/
 
  ActivarTrigger("GameOver");
  ActivarTrigger("FacilCapturado");
  ActivarTrigger("MedioCapturado");
  ActivarTrigger("BajoCapturado");
  ActivarTrigger("CercadoCapturado");
  ActivarTrigger("FacilDestruido");
  ActivarTrigger("MedioDestruido");
  ActivarTrigger("BajoDestruido");
  ActivarTrigger("CercadoDestruido");
  
  ActivarTrigger("EsperaPatrulla");
  ActivarTrigger("Exito");
  ActivarTrigger("GameOver");
  ActivarTrigger("InfPosAlianza");
  ActivarTrigger("AlianzaGalaI");
  ActivarTrigger("AlianzaGalaII");
  ActivarTrigger("AlianzaGalaIII");  
  ActivarTrigger("AlianzaGalaIV");

  ActivarTrigger("HuidaCenturion_Faciles");
  ActivarTrigger("HuidaCenturion_Bajos");
  ActivarTrigger("HuidaCenturion_Medios");
  ActivarTrigger("HuidaCenturion_Cercados");
  
  ActivarTrigger("JefeGaloMedioMuerto");
  ActivarTrigger("JefeGaloBajoMuerto");
  ActivarTrigger("JefeGaloCercadoMuerto");
  ActivarTrigger("JefeGaloFacilMuerto");
  
  ActivarTrigger("ReconocerMedioAliado");
  ActivarTrigger("ReconocerBajoAliado");
  ActivarTrigger("ReconocerCercadoAliado");
  ActivarTrigger("ReconocerFacilAliado");

  // le suelto al jefe galo ese
  OrdenarTropaMantenerPosicion("JefeGaloMedio", FALSE);

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
  ActivarPresentacion(TRUE, "LTEXT_MISION8_PRESENTACION_TITULO",
                            "LTEXT_MISION8_PRESENTACION_LUGAR", hPresentacion);
 
  // camara a donde debe empezar
  EncolarColocarYMirarPunto("TOMA_1");
  EjecutarOrdenesCamara();
  
  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));
 
  ActivarPresentacion(FALSE, "", "", NULL);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolarColocarYMirarPunto("TOMA_1");
  EncolarPausaCamara(8000);
  IntroducirLocucion("08N0", "LTEXT_MISION8_LOCUCION_00_TXT", 8000, 600, 100);
  EncolarPausaCamara(1000);
  EncolarColocarYMirarPunto("PUEBLO_1");
  EncolarPausaCamara(1000);
  EncolarColocarYMirarPunto("PUEBLO_2");
  EncolarPausaCamara(1000);
  EncolarColocarYMirarPunto("PUEBLO_3");
  EncolarPausaCamara(1000);
  EncolarColocarYMirarPunto("PUEBLO_4");
  EncolarPausaCamara(2000);
  IntroducirPuntoSincronia();   // 2
  
  EncolaTrayectoriaCamara("RECORRIDO_1", FALSE, FALSE, 0, 0);
  IntroducirLocucion("", "", 100, 0, 0);    
  IntroducirLocucion("08N1", "LTEXT_MISION8_LOCUCION_01_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();
     
  EncolarColocarYMirarPunto("TOMA_2");
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("08N2", "LTEXT_MISION8_LOCUCION_02_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();   // 4
  
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("08N3", "LTEXT_MISION8_LOCUCION_03_TXT", 10000, 600, 100);
  EncolarColocarYMirarPunto("TOMA_3");
  EncolarPausaCamara(5000);
  EncolarColocarYMirarPunto("TOMA_4");
  IntroducirPuntoSincronia();   // 5

  EncolarColocarYMirarPunto("TOMA_0");
  IntroducirLocucion("", "", 100, 0, 0);    
  IntroducirLocucion("08N4", "LTEXT_MISION8_LOCUCION_04_TXT", 2000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("08N5", "LTEXT_MISION8_LOCUCION_05_TXT", 3000, 600, 100);
  IntroducirPuntoSincronia();   // 6

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

  // que llueva, que llueva
  ModificarLluvia(100.0, 100.0, 50.0, 240);
  
  // pueblos
  IluminarZona(188, 0, 190, 10, 60000);
  IluminarZona(144, 0, 60, 10, 60000);
  IluminarZona(23, 0, 28, 10, 60000);
  IluminarZona(40, 0, 144, 10, 60000);
  
  // suevos
  IluminarZona(58, 0, 85, 10, 60000);
  
  WaitBool( (fPuntoSincronia == 2) || bBriefingEnded );

  if ( !bBriefingEnded )
  {
    // que salga el sol, que salga el sol
    ModificarLluvia(0.0, 0.0, 75.0, 240);
  }
  
     
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




//////////////////////////////////////////////////////////////////////
// TRIGGERS DE MISIÓN  
//////////////////////////////////////////////////////////////////////

//Algunas patrullas pueden molestar nada más empezar, que se esperen un poco antes de activarse
/////////////////////////////////////////////////
Trigger "EsperaPatrulla" [Inactivo]
(
  TRUE
)
Var
{
  handle hTimer;
}
Do
{
  hTimer = CrearTimer(60000);  // 1 min
  Wait(hTimer);
 
  hG_E = CrearObjetivo(hEstrategiaPatrullas, "PatrullaOleadasPeriodicas", 10000, 22000, 10, 30);
  AnyadirGrupoAObjetivo(hG_E, "G_E");
  SetParamObjetivo(hG_E, "ParametrosTacticas", "AtacarCorriendo", TRUE);	
  SetParamObjetivo(hG_E, "FACTOR_POTENCIA_TROPAS", 3);
  SetParamObjetivo(hG_E, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hG_E, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hG_E, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hG_E, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hG_E, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hG_E, "MaxNumOleadas", -1);
  SetParamObjetivo(hG_E, "PermisoPedirAyuda", FALSE);
  AnyadirObjetivo(hEstrategiaPatrullas, hG_E);
      
  DestruirTrigger("EsperaPatrulla");
}  

//LOOK_CAPTURADOS**
// PUEBLOS CAPTURADOS
/////////////////////////////////////////////////
Trigger "FacilCapturado" [Inactivo]
(
  EstaPuebloConquistado("CESAR", "GELDUBA")
)
Do
{
  
//DisposeHandle(&hObjetivoPueblo1);

  if ( fNPueblos == 0 )
  {
    EliminarObjetivoMision(hObj4Pueblos);
    AgregarObjetivoMision(hObj3Pueblos, "LTEXT_MISION8_OBJETIVO_01_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 1 )
  {
    EliminarObjetivoMision(hObj3Pueblos);
    AgregarObjetivoMision(hObj2Pueblos, "LTEXT_MISION8_OBJETIVO_02_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 2 )
  {
    EliminarObjetivoMision(hObj2Pueblos);
    AgregarObjetivoMision(hObj1Pueblo, "LTEXT_MISION8_OBJETIVO_03_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj1Pueblo);
    AgregarObjetivoMision(hObj4Pueblos, "LTEXT_MISION8_OBJETIVO_00_TXT");
    IndicarObjetivoCumplido(hObj4Pueblos);
  }
  
  fNPueblos = fNPueblos + 1;
  
  DesactivarTrigger("FacilCapturado");
  DesactivarTrigger("FacilDestruido");
  
  ActivarTrigger("FacilRecapturado");
  ActivarTrigger("FacilReconquista");
}

/////////////////////////////////////////////////
    Trigger "FacilReconquista" [Inactivo]
    (
      TRUE
    )
    Var
    {
      handle hTimer;
    }
    Do
    {
	    hTimer = CrearTimer(fWaitRecon);
      Wait(hTimer);
        
      DisposeHandle(&hGFijoIII); 
      DisposeHandle(&hGFijoIV);
    
      hGFijoIII = CrearObjetivo(hEstrategiaFaciles, "AsaltarCampamento", "GELDUBA");
      AnyadirGrupoAObjetivo(hGFijoIII, "G_MOGOLLON_LIGERO");  
      AnyadirGrupoAObjetivo(hGFijoIII, "G_LIGEROSII"); 
      AnyadirObjetivo(hEstrategiaFaciles,  hGFijoIII);
      SetParamObjetivo(hGFijoIII, "NombreGrupoGenerado", "G_FACILES");
      
      SetParamObjetivo(hGFijoIII, "TiempoParaAtaque", 60);
      SetParamObjetivo(hGFijoIII, "PotenciaAtaque", 20000);
      
      SetValue(hEstrategiaFaciles, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
      SetValue(hEstrategiaFaciles, "GRUPOTROPAS_A_ENTRENAR", "LIGERAS", 70);
      SetValue(hEstrategiaFaciles, "GRUPOTROPAS_A_ENTRENAR", "PESADAS", 0);
      SetParamObjetivo(hGFijoIII, "PuedePedirRefuerzos", FALSE);
      
      DestruirTrigger("FacilReconquista");
    }  
            
/////////////////////////////////////////////////
Trigger "MedioCapturado" [Inactivo]
(
  EstaPuebloConquistado("CESAR", "SUBLONES")
)
Do
{
  
//  DisposeHandle(&hObjetivoPueblo3);
  
  if ( fNPueblos == 0 )
  {
    EliminarObjetivoMision(hObj4Pueblos);
    AgregarObjetivoMision(hObj3Pueblos, "LTEXT_MISION8_OBJETIVO_01_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 1 )
  {
    EliminarObjetivoMision(hObj3Pueblos);
    AgregarObjetivoMision(hObj2Pueblos, "LTEXT_MISION8_OBJETIVO_02_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 2 )
  {
    EliminarObjetivoMision(hObj2Pueblos);
    AgregarObjetivoMision(hObj1Pueblo, "LTEXT_MISION8_OBJETIVO_03_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj1Pueblo);
    AgregarObjetivoMision(hObj4Pueblos, "LTEXT_MISION8_OBJETIVO_00_TXT");
    IndicarObjetivoCumplido(hObj4Pueblos);
  }
  
  fNPueblos = fNPueblos + 1;

  DesactivarTrigger("MedioCapturado");
  DesactivarTrigger("MedioDestruido");
  
  ActivarTrigger("MedioRecapturado");
  ActivarTrigger("MedioReconquista");
}

///////////////////////////////////////////////////////
    Trigger "MedioReconquista" [Inactivo]
    (
      TRUE
    )
    Var
    {
      handle hTimer;
    }
    Do
    {
	    hTimer = CrearTimer(fWaitRecon);
      Wait(hTimer);
        
      DisposeHandle(&hGFijo); 
      DisposeHandle(&hGFijoII);
  
      hGFijo = CrearObjetivo(hEstrategiaMedios, "AsaltarCampamento", "SUBLONES");
      AnyadirGrupoAObjetivo(hGFijo, "G_EMBOSCADA");  
      AnyadirGrupoAObjetivo(hGFijo, "G_DIRECTO");
      AnyadirObjetivo(hEstrategiaMedios,  hGFijo);
      SetParamObjetivo(hGFijo, "NombreGrupoGenerado", "G_MEDIOS");
      
      SetParamObjetivo(hGFijo, "TiempoParaAtaque", 60);
      SetParamObjetivo(hGFijo, "PotenciaAtaque", 20000);
      
      SetValue(hEstrategiaMedios, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
      SetValue(hEstrategiaMedios, "GRUPOTROPAS_A_ENTRENAR", "DISTANCIA", 70);
      SetValue(hEstrategiaMedios, "GRUPOTROPAS_A_ENTRENAR", "CABALLERIA", 0);
      SetParamObjetivo(hGFijo, "PuedePedirRefuerzos", FALSE);
      
      DestruirTrigger("MedioReconquista");
    } 

/////////////////////////////////////////////////
Trigger "BajoCapturado" [Inactivo]
(
  EstaPuebloConquistado("CESAR", "CAR MENAPII")
)
Do
{
  
//DisposeHandle(&hObjetivoPueblo2);
  
  if ( fNPueblos == 0 )
  {
    EliminarObjetivoMision(hObj4Pueblos);
    AgregarObjetivoMision(hObj3Pueblos, "LTEXT_MISION8_OBJETIVO_01_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 1 )
  {
    EliminarObjetivoMision(hObj3Pueblos);
    AgregarObjetivoMision(hObj2Pueblos, "LTEXT_MISION8_OBJETIVO_02_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 2 )
  {
    EliminarObjetivoMision(hObj2Pueblos);
    AgregarObjetivoMision(hObj1Pueblo, "LTEXT_MISION8_OBJETIVO_03_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj1Pueblo);
    AgregarObjetivoMision(hObj4Pueblos, "LTEXT_MISION8_OBJETIVO_00_TXT");
    IndicarObjetivoCumplido(hObj4Pueblos);
  }
  
  fNPueblos = fNPueblos + 1;
  
  DesactivarTrigger("BajoCapturado");
  DesactivarTrigger("BajoDestruido");
  
  ActivarTrigger("BajoRecapturado");
  ActivarTrigger("BajoReconquista");
}

///////////////////////////////////////////////////////
    Trigger "BajoReconquista" [Inactivo]
    (
      TRUE
    )
    Var
    {
      handle hTimer;
    }
    Do
    {
	    hTimer = CrearTimer(fWaitRecon);  
      Wait(hTimer);
        
      DisposeHandle(&hGFijoV); 
      DisposeHandle(&hGFijoVI);
      DisposeHandle(&hGFijoVII); 
      DisposeHandle(&hGFijoVIII);
      DisposeHandle(&hGFijoIX); 
      DisposeHandle(&hGFijoX);
      DisposeHandle(&hGFijoXI);
      
      hGFijoV = CrearObjetivo(hEstrategiaBajos, "AsaltarCampamento", "CAR MENAPII");
      AnyadirGrupoAObjetivo(hGFijoV, "G_1");  
      AnyadirGrupoAObjetivo(hGFijoV, "G_2");
      AnyadirGrupoAObjetivo(hGFijoV, "G_3");
      AnyadirGrupoAObjetivo(hGFijoV, "G_4");
      AnyadirGrupoAObjetivo(hGFijoV, "G_5");
      AnyadirGrupoAObjetivo(hGFijoV, "G_6");
      AnyadirGrupoAObjetivo(hGFijoV, "G_7");
      AnyadirObjetivo(hEstrategiaBajos,  hGFijoV);
      SetParamObjetivo(hGFijoV, "NombreGrupoGenerado", "G_BAJOS");
      
      SetParamObjetivo(hGFijoV, "TiempoParaAtaque", 60);
      SetParamObjetivo(hGFijoV, "PotenciaAtaque", 20000);
      
      SetValue(hEstrategiaBajos, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
      SetValue(hEstrategiaBajos, "GRUPOTROPAS_A_ENTRENAR", "CABALLERIA", 70);
      SetValue(hEstrategiaBajos, "GRUPOTROPAS_A_ENTRENAR", "DISTANCIA", 0);
      SetParamObjetivo(hGFijoV, "PuedePedirRefuerzos", FALSE);
      
      DestruirTrigger("BajoReconquista");
    } 

/////////////////////////////////////////////////
Trigger "CercadoCapturado" [Inactivo]
(
  EstaPuebloConquistado("CESAR", "ASCIBURGIUM")
)
Do
{
  
  // DisposeHandle(&hObjetivoPueblo4);
  
  if ( fNPueblos == 0 )
  {
    EliminarObjetivoMision(hObj4Pueblos);
    AgregarObjetivoMision(hObj3Pueblos, "LTEXT_MISION8_OBJETIVO_01_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 1 )
  {
    EliminarObjetivoMision(hObj3Pueblos);
    AgregarObjetivoMision(hObj2Pueblos, "LTEXT_MISION8_OBJETIVO_02_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 2 )
  {
    EliminarObjetivoMision(hObj2Pueblos);
    AgregarObjetivoMision(hObj1Pueblo, "LTEXT_MISION8_OBJETIVO_03_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj1Pueblo);
    AgregarObjetivoMision(hObj4Pueblos, "LTEXT_MISION8_OBJETIVO_00_TXT");
    IndicarObjetivoCumplido(hObj4Pueblos);
  }
  
  fNPueblos = fNPueblos + 1;
 
  DesactivarTrigger("CercadoCapturado");
  DesactivarTrigger("CercadoDestruido");
  
  ActivarTrigger("CercadoRecapturado");
  ActivarTrigger("CercadoReconquista");  
}

///////////////////////////////////////////////////////
    Trigger "CercadoReconquista" [Inactivo]
    (
      TRUE
    )
    Var
    {
      handle hTimer;
    }
    Do
    {
	    hTimer = CrearTimer(fWaitRecon);  
      Wait(hTimer);
        
      DisposeHandle(&hGFijoXII);
      DisposeHandle(&hGFijoXIII);
      
      hGFijoXII = CrearObjetivo(hEstrategiaCercados, "AsaltarCampamento", "ASCIBURGIUM");
      AnyadirGrupoAObjetivo(hGFijoXII, "G_PESADO");  
      AnyadirGrupoAObjetivo(hGFijoXII, "G_PESADOII");
      AnyadirObjetivo(hEstrategiaCercados,  hGFijoXII);
      SetParamObjetivo(hGFijoXII, "NombreGrupoGenerado", "G_CERCADOS");
      
      SetParamObjetivo(hGFijoXII, "TiempoParaAtaque", 60);
      SetParamObjetivo(hGFijoXII, "PotenciaAtaque", 20000);
      
      SetValue(hEstrategiaCercados, "GRUPOTROPAS_A_ENTRENAR", "ESPECIALES", 0);
      SetValue(hEstrategiaCercados, "GRUPOTROPAS_A_ENTRENAR", "PESADAS", 70);
      SetValue(hEstrategiaCercados, "GRUPOTROPAS_A_ENTRENAR", "CABALLERIA", 0);
      SetParamObjetivo(hGFijoXII, "PuedePedirRefuerzos", FALSE);
      
      DestruirTrigger("CercadoReconquista");
    } 

//LOOK_RECAPTURADOS**
// PUEBLOS RECAPTURADOS
/////////////////////////////////////////////////
Trigger "FacilRecapturado" [Inactivo]
(
  !EstaPuebloConquistado("CESAR", "GELDUBA") && !EstructuraDestruida("GELDUBA")
)
Do
{
  
  if ( fNPueblos == 1 )
  {
    EliminarObjetivoMision(hObj3Pueblos);
    AgregarObjetivoMision(hObj4Pueblos, "LTEXT_MISION8_OBJETIVO_00_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 2 )
  {
    EliminarObjetivoMision(hObj2Pueblos);
    AgregarObjetivoMision(hObj3Pueblos, "LTEXT_MISION8_OBJETIVO_01_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 3 )
  {
    EliminarObjetivoMision(hObj1Pueblo);
    AgregarObjetivoMision(hObj2Pueblos, "LTEXT_MISION8_OBJETIVO_02_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj4Pueblos);
    AgregarObjetivoMision(hObj1Pueblo, "LTEXT_MISION8_OBJETIVO_03_TXT");
    ObjetivosMisionCambiados();
  }
  
  fNPueblos = fNPueblos - 1;
  
  DesactivarTrigger("FacilRecapturado");
  
  ActivarTrigger("FacilCapturado");
  ActivarTrigger("FacilDestruido");
  
}

/////////////////////////////////////////////////
Trigger "MedioRecapturado" [Inactivo]
(
  !EstaPuebloConquistado("CESAR", "SUBLONES") && !EstructuraDestruida("SUBLONES")
)
Do
{
  
  
    if ( fNPueblos == 1 )
  {
    EliminarObjetivoMision(hObj3Pueblos);
    AgregarObjetivoMision(hObj4Pueblos, "LTEXT_MISION8_OBJETIVO_00_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 2 )
  {
    EliminarObjetivoMision(hObj2Pueblos);
    AgregarObjetivoMision(hObj3Pueblos, "LTEXT_MISION8_OBJETIVO_01_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 3 )
  {
    EliminarObjetivoMision(hObj1Pueblo);
    AgregarObjetivoMision(hObj2Pueblos, "LTEXT_MISION8_OBJETIVO_02_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj4Pueblos);
    AgregarObjetivoMision(hObj1Pueblo, "LTEXT_MISION8_OBJETIVO_03_TXT");
    ObjetivosMisionCambiados();
  }
  
  fNPueblos = fNPueblos - 1;
  
  DesactivarTrigger("MedioRecapturado");
  
  ActivarTrigger("MedioCapturado");
  ActivarTrigger("MedioDestruido");
  
}

/////////////////////////////////////////////////
Trigger "BajoRecapturado" [Inactivo]
(
  !EstaPuebloConquistado("CESAR", "CAR MENAPII") && !EstructuraDestruida("CAR MENAPII")
)
Do
{
  
  if ( fNPueblos == 1 )
  {
    EliminarObjetivoMision(hObj3Pueblos);
    AgregarObjetivoMision(hObj4Pueblos, "LTEXT_MISION8_OBJETIVO_00_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 2 )
  {
    EliminarObjetivoMision(hObj2Pueblos);
    AgregarObjetivoMision(hObj3Pueblos, "LTEXT_MISION8_OBJETIVO_01_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 3 )
  {
    EliminarObjetivoMision(hObj1Pueblo);
    AgregarObjetivoMision(hObj2Pueblos, "LTEXT_MISION8_OBJETIVO_02_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj4Pueblos);
    AgregarObjetivoMision(hObj1Pueblo, "LTEXT_MISION8_OBJETIVO_03_TXT");
    ObjetivosMisionCambiados();
  }
  
  fNPueblos = fNPueblos - 1;
  
  DesactivarTrigger("BajoRecapturado");
  
  ActivarTrigger("BajoCapturado");
  ActivarTrigger("BajoDestruido");
  
}

/////////////////////////////////////////////////
Trigger "CercadoRecapturado" [Inactivo]
(
  !EstaPuebloConquistado("CESAR", "ASCIBURGIUM") && !EstructuraDestruida("ASCIBURGIUM")
)
Do
{
  
  if ( fNPueblos == 1 )
  {
    EliminarObjetivoMision(hObj3Pueblos);
    AgregarObjetivoMision(hObj4Pueblos, "LTEXT_MISION8_OBJETIVO_00_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 2 )
  {
    EliminarObjetivoMision(hObj2Pueblos);
    AgregarObjetivoMision(hObj3Pueblos, "LTEXT_MISION8_OBJETIVO_01_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 3 )
  {
    EliminarObjetivoMision(hObj1Pueblo);
    AgregarObjetivoMision(hObj2Pueblos, "LTEXT_MISION8_OBJETIVO_02_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj4Pueblos);
    AgregarObjetivoMision(hObj1Pueblo, "LTEXT_MISION8_OBJETIVO_03_TXT");
    ObjetivosMisionCambiados();
  }
  
  fNPueblos = fNPueblos - 1;
 
  DesactivarTrigger("CercadoRecapturado");
  
  ActivarTrigger("CercadoCapturado");
  ActivarTrigger("CercadoDestruido");
  
}

//LOOK_DESTRUIDOS**
// PUEBLOS DESTRUIDOS
/////////////////////////////////////////////////
Trigger "FacilDestruido" [Inactivo]
(
  EstructuraDestruida("GELDUBA")
)
Do
{
  
//DisposeHandle(&hObjetivoPueblo1);
  
  if ( fNPueblos == 0 )
  {
    EliminarObjetivoMision(hObj4Pueblos);
    AgregarObjetivoMision(hObj3Pueblos, "LTEXT_MISION8_OBJETIVO_01_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 1 )
  {
    EliminarObjetivoMision(hObj3Pueblos);
    AgregarObjetivoMision(hObj2Pueblos, "LTEXT_MISION8_OBJETIVO_02_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 2 )
  {
    EliminarObjetivoMision(hObj2Pueblos);
    AgregarObjetivoMision(hObj1Pueblo, "LTEXT_MISION8_OBJETIVO_03_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj1Pueblo);
    AgregarObjetivoMision(hObj4Pueblos, "LTEXT_MISION8_OBJETIVO_00_TXT");
    IndicarObjetivoCumplido(hObj4Pueblos);
  }
  
  fNPueblos = fNPueblos + 1;
  
  DestruirTrigger("FacilDestruido");
  DestruirTrigger("FacilCapturado");
  DestruirTrigger("FacilRecapturado");
  DestruirTrigger("ReconocerFacilAliado");
}

////////////////////////////////////////////////
Trigger "MedioDestruido" [Inactivo]
(
  EstructuraDestruida("SUBLONES")
)
Do
{
  
//DisposeHandle(&hObjetivoPueblo3);
  
  if ( fNPueblos == 0 )
  {
    EliminarObjetivoMision(hObj4Pueblos);
    AgregarObjetivoMision(hObj3Pueblos, "LTEXT_MISION8_OBJETIVO_01_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 1 )
  {
    EliminarObjetivoMision(hObj3Pueblos);
    AgregarObjetivoMision(hObj2Pueblos, "LTEXT_MISION8_OBJETIVO_02_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 2 )
  {
    EliminarObjetivoMision(hObj2Pueblos);
    AgregarObjetivoMision(hObj1Pueblo, "LTEXT_MISION8_OBJETIVO_03_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj1Pueblo);
    AgregarObjetivoMision(hObj4Pueblos, "LTEXT_MISION8_OBJETIVO_00_TXT");
    IndicarObjetivoCumplido(hObj4Pueblos);
  }
  
  fNPueblos = fNPueblos + 1;
  
  DestruirTrigger("MedioDestruido");
  DestruirTrigger("MedioCapturado");
  DestruirTrigger("MedioRecapturado");
  DestruirTrigger("ReconocerMedioAliado");
}

////////////////////////////////////////////////
Trigger "BajoDestruido" [Inactivo]
(
  EstructuraDestruida("CAR MENAPII")
)
Do
{
  
//DisposeHandle(&hObjetivoPueblo2);
  
  if ( fNPueblos == 0 )
  {
    EliminarObjetivoMision(hObj4Pueblos);
    AgregarObjetivoMision(hObj3Pueblos, "LTEXT_MISION8_OBJETIVO_01_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 1 )
  {
    EliminarObjetivoMision(hObj3Pueblos);
    AgregarObjetivoMision(hObj2Pueblos, "LTEXT_MISION8_OBJETIVO_02_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 2 )
  {
    EliminarObjetivoMision(hObj2Pueblos);
    AgregarObjetivoMision(hObj1Pueblo, "LTEXT_MISION8_OBJETIVO_03_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj1Pueblo);
    AgregarObjetivoMision(hObj4Pueblos, "LTEXT_MISION8_OBJETIVO_00_TXT");
    IndicarObjetivoCumplido(hObj4Pueblos);
  }
  
  fNPueblos = fNPueblos + 1;
  
  DestruirTrigger("BajoDestruido");
  DestruirTrigger("BajoCapturado");
  DestruirTrigger("BajoRecapturado");
  DestruirTrigger("ReconocerBajoAliado");
}

////////////////////////////////////////////////
Trigger "CercadoDestruido" [Inactivo]
(
  EstructuraDestruida("ASCIBURGIUM")
)
Do
{
  
//DisposeHandle(&hObjetivoPueblo4);
 
  if ( fNPueblos == 0 )
  {
    EliminarObjetivoMision(hObj4Pueblos);
    AgregarObjetivoMision(hObj3Pueblos, "LTEXT_MISION8_OBJETIVO_01_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 1 )
  {
    EliminarObjetivoMision(hObj3Pueblos);
    AgregarObjetivoMision(hObj2Pueblos, "LTEXT_MISION8_OBJETIVO_02_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 2 )
  {
    EliminarObjetivoMision(hObj2Pueblos);
    AgregarObjetivoMision(hObj1Pueblo, "LTEXT_MISION8_OBJETIVO_03_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj1Pueblo);
    AgregarObjetivoMision(hObj4Pueblos, "LTEXT_MISION8_OBJETIVO_00_TXT");
    IndicarObjetivoCumplido(hObj4Pueblos);
  }
  
  fNPueblos = fNPueblos + 1;
  
  DestruirTrigger("CercadoDestruido");
  DestruirTrigger("CercadoCapturado");
  DestruirTrigger("CercadoRecapturado");
  DestruirTrigger("ReconocerCercadoAliado");
}

//LOOK_RECONOCER_ALIANZA**
// 1 PUEBLO ALIADO
/////////////////////////////////////////////////
Trigger "ReconocerFacilAliado" [Inactivo]
(
  EstanAliadas("CESAR", "USIPETES DEL SUR")
)
Do
{
  
//DisposeHandle(&hObjetivoPueblo1);

  if ( fNPueblos == 0 )
  {
    EliminarObjetivoMision(hObj4Pueblos);
    AgregarObjetivoMision(hObj3Pueblos, "LTEXT_MISION8_OBJETIVO_01_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 1 )
  {
    EliminarObjetivoMision(hObj3Pueblos);
    AgregarObjetivoMision(hObj2Pueblos, "LTEXT_MISION8_OBJETIVO_02_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 2 )
  {
    EliminarObjetivoMision(hObj2Pueblos);
    AgregarObjetivoMision(hObj1Pueblo, "LTEXT_MISION8_OBJETIVO_03_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj1Pueblo);
    AgregarObjetivoMision(hObj4Pueblos, "LTEXT_MISION8_OBJETIVO_00_TXT");
    IndicarObjetivoCumplido(hObj4Pueblos);
  }
  
  fNPueblos = fNPueblos + 1;  
  
  DestruirTrigger("ReconocerFacilAliado");
  DestruirTrigger("FacilDestruido");
  DestruirTrigger("FacilCapturado");
  DestruirTrigger("FacilRecapturado");
}

////////////////////////////////////////////////
Trigger "ReconocerMedioAliado" [Inactivo]
(
  EstanAliadas("CESAR", "TANCTERES DEL NORTE")
)
Do
{
  
//DisposeHandle(&hObjetivoPueblo3);

  if ( fNPueblos == 0 )
  {
    EliminarObjetivoMision(hObj4Pueblos);
    AgregarObjetivoMision(hObj3Pueblos, "LTEXT_MISION8_OBJETIVO_01_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 1 )
  {
    EliminarObjetivoMision(hObj3Pueblos);
    AgregarObjetivoMision(hObj2Pueblos, "LTEXT_MISION8_OBJETIVO_02_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 2 )
  {
    EliminarObjetivoMision(hObj2Pueblos);
    AgregarObjetivoMision(hObj1Pueblo, "LTEXT_MISION8_OBJETIVO_03_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj1Pueblo);
    AgregarObjetivoMision(hObj4Pueblos, "LTEXT_MISION8_OBJETIVO_00_TXT");
    IndicarObjetivoCumplido(hObj4Pueblos);
  }
  
  fNPueblos = fNPueblos + 1;
  
  DestruirTrigger("ReconocerMedioAliado");
  DestruirTrigger("MedioDestruido");
  DestruirTrigger("MedioCapturado");
  DestruirTrigger("MedioRecapturado");
}

////////////////////////////////////////////////
Trigger "ReconocerBajoAliado" [Inactivo]
(
  EstanAliadas("CESAR", "TANCTERES DEL SUR")
)
Do
{
  
//DisposeHandle(&hObjetivoPueblo2);
  
  if ( fNPueblos == 0 )
  {
    EliminarObjetivoMision(hObj4Pueblos);
    AgregarObjetivoMision(hObj3Pueblos, "LTEXT_MISION8_OBJETIVO_01_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 1 )
  {
    EliminarObjetivoMision(hObj3Pueblos);
    AgregarObjetivoMision(hObj2Pueblos, "LTEXT_MISION8_OBJETIVO_02_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 2 )
  {
    EliminarObjetivoMision(hObj2Pueblos);
    AgregarObjetivoMision(hObj1Pueblo, "LTEXT_MISION8_OBJETIVO_03_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj1Pueblo);
    AgregarObjetivoMision(hObj4Pueblos, "LTEXT_MISION8_OBJETIVO_00_TXT");
    IndicarObjetivoCumplido(hObj4Pueblos);
  }
  
  fNPueblos = fNPueblos + 1;  
  
  DestruirTrigger("ReconocerBajoAliado");
  DestruirTrigger("BajoDestruido");
  DestruirTrigger("BajoCapturado");
  DestruirTrigger("BajoRecapturado");
  
}

////////////////////////////////////////////////
Trigger "ReconocerCercadoAliado" [Inactivo]
(
  EstanAliadas("CESAR", "USIPETES DEL NORTE")
)
Do
{
  
//DisposeHandle(&hObjetivoPueblo4);
  
  if ( fNPueblos == 0 )
  {
    EliminarObjetivoMision(hObj4Pueblos);
    AgregarObjetivoMision(hObj3Pueblos, "LTEXT_MISION8_OBJETIVO_01_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 1 )
  {
    EliminarObjetivoMision(hObj3Pueblos);
    AgregarObjetivoMision(hObj2Pueblos, "LTEXT_MISION8_OBJETIVO_02_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNPueblos == 2 )
  {
    EliminarObjetivoMision(hObj2Pueblos);
    AgregarObjetivoMision(hObj1Pueblo, "LTEXT_MISION8_OBJETIVO_03_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj1Pueblo);
    AgregarObjetivoMision(hObj4Pueblos, "LTEXT_MISION8_OBJETIVO_00_TXT");
    IndicarObjetivoCumplido(hObj4Pueblos);
  }
  
  fNPueblos = fNPueblos + 1;
  
  DestruirTrigger("ReconocerCercadoAliado");
  DestruirTrigger("CercadoDestruido");
  DestruirTrigger("CercadoCapturado");
  DestruirTrigger("CercadoRecapturado");
}

//LOOK_EXITO**
// EXITO
//////////////////////////////////////////////////
Trigger "Exito" [ Inactivo ]
(
  (fNPueblos >= 4) && (fNJefes >= 4)
)
Do
{
  
  IndicarObjetivoCumplido(hObjPublioVivo);
  IndicarObjetivoCumplido(hObjLabienoVivo);
  IndicarObjetivoCumplido(hObjDiviciacoVivo);
  
  FinalizarMision(TRUE); 
  
  DestruirTrigger("Exito");
  DestruirTrigger("GameOver"); 
  
}

//LOOK_GAME OVER**
// GAME OVER
//////////////////////////////////////////////////
Trigger "GameOver" [ Inactivo ]
(
  !EstaTropaViva("DIVICIACO")
  ||
  !EstaTropaViva("PUBLIO")
  ||
  !EstaTropaViva("LABIENO")
)
Do
{
  
  if ( !EstaTropaViva("DIVICIACO") )
  {
    IndicarObjetivoFracasado(hObjDiviciacoVivo); 
  }
  
  if ( !EstaTropaViva("PUBLIO") )
  {
    IndicarObjetivoFracasado(hObjPublioVivo);
  }

  if ( !EstaTropaViva("LABIENO") )
  {
    IndicarObjetivoFracasado(hObjLabienoVivo);
  }
  
  FinalizarMision(FALSE);
  
  DestruirTrigger("Exito");
  DestruirTrigger("GameOver"); 
  
}

//LOOK_3r_PUEBLO_ALIADO**
// El tercer pueblo QUE SE PETA puede ser tu aliado
Trigger "InfPosAlianza" [ Inactivo ]
(
// Nada mas conquistar el segundo pueblo se informa del modo de conseguir el aliado
   DarNumPueblosConqDestr("CESAR", "GELDUBA", "CAR MENAPII", "SUBLONES", "ASCIBURGIUM") == 2
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

  EncolarMirarEnteCamara("DIVICIACO");
  IntroducirLocucion("0850", "LTEXT_MISION8_EVENTO1_00_TXT", 4000, 600, 100);
  IntroducirLocucion("", "", 100, 0, 0);
  IntroducirLocucion("0851", "LTEXT_MISION8_EVENTO2_01_TXT", 6000, 600, 100);
  IntroducirPuntoSincronia();   // 2
    
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
    
  DestruirTrigger("InfPosAlianza");
}


//////////////////////////////////////////////////
Trigger "AlianzaGalaI" [ Inactivo ]
(
// Si has conquistado dos pueblos al menos, al entrar en la zona es tuyo directamente
  (DarNumUnidadesEnZona("CESAR","Z_PCERCADO") > 89)
  &&  (DarNumPueblosConqDestr("CESAR", "GELDUBA", "CAR MENAPII", "SUBLONES") == 2)
)
Do
{
  
  MensajeLocucionado("08N6","LTEXT_MISION8_MENSAJE_00_TXT");
  AvisoCivilizacion("CESAR", 188, 189);
    
	RomperAlianzaPorNombre("USIPETES DEL NORTE", "SUEVOS"); 
	RomperAlianzaPorNombre("USIPETES DEL NORTE", "TANCTERES DEL NORTE");
	RomperAlianzaPorNombre("USIPETES DEL NORTE", "TANCTERES DEL SUR");
	RomperAlianzaPorNombre("USIPETES DEL NORTE", "USIPETES DEL SUR");  
		 
  CrearAlianzaPorNombre("USIPETES DEL NORTE", "CESAR");
  
  DestruirTrigger("AlianzaGalaII");//Estos por si se quiere que no se puedan conseguir 2 ALIADOS... 
  DestruirTrigger("AlianzaGalaIII");//...
  DestruirTrigger("AlianzaGalaIV");//...
  
  DestruirTrigger("CercadoRecapturado");//
  DestruirTrigger("CercadoReconquista");
  DestruirTrigger("CercadoDestruido");
  
  ActivarTrigger("EnemigoProduceATope");
  
  DestruirTrigger("AlianzaGalaI");
}

//////////////////////////////////////////////
Trigger "AlianzaGalaII" [ Inactivo ]
(
// Si has conquistado dos pueblos al menos, al entrar en la zona es tuyo directamente
     (DarNumUnidadesEnZona("CESAR","Z_PMEDIO") > 89)
  && (DarNumPueblosConqDestr("CESAR", "GELDUBA", "CAR MENAPII", "ASCIBURGIUM") == 2)
)
Do
{
  
  MensajeLocucionado("08N7","LTEXT_MISION8_MENSAJE_01_TXT");  
  AvisoCivilizacion("CESAR", 40, 144);

  RomperAlianzaPorNombre("TANCTERES DEL NORTE", "SUEVOS"); 
	RomperAlianzaPorNombre("TANCTERES DEL NORTE", "TANCTERES DEL SUR");
	RomperAlianzaPorNombre("TANCTERES DEL NORTE", "USIPETES DEL NORTE");
	RomperAlianzaPorNombre("TANCTERES DEL NORTE", "USIPETES DEL SUR");  
		  
  CrearAlianzaPorNombre("TANCTERES DEL NORTE", "CESAR");
  
  DestruirTrigger("AlianzaGalaI");//Estos por si se quiere que no se puedan conseguir 2 ALIADOS... 
  DestruirTrigger("AlianzaGalaIII");//...
  DestruirTrigger("AlianzaGalaIV");//...
  
  DestruirTrigger("MedioRecapturado");//
  DestruirTrigger("MedioReconquista");
  
  ActivarTrigger("EnemigoProduceATope");
  
  DestruirTrigger("AlianzaGalaII");
}

//////////////////////////////////////////////
Trigger "AlianzaGalaIII" [ Inactivo ]
(
// Si has conquistado dos pueblos al menos, al entrar en la zona es tuyo directamente
     (DarNumUnidadesEnZona("CESAR","Z_PFACIL") > 89) 
  && (DarNumPueblosConqDestr("CESAR", "ASCIBURGIUM", "CAR MENAPII", "SUBLONES") == 2)
)
Do
{
  
  MensajeLocucionado("08N8","LTEXT_MISION8_MENSAJE_02_TXT"); 
  AvisoCivilizacion("CESAR", 143, 60);
  
	RomperAlianzaPorNombre("USIPETES DEL SUR", "SUEVOS"); 
	RomperAlianzaPorNombre("USIPETES DEL SUR", "TANCTERES DEL NORTE");
	RomperAlianzaPorNombre("USIPETES DEL SUR", "USIPETES DEL NORTE");
	RomperAlianzaPorNombre("USIPETES DEL SUR", "TANCTERES DEL SUR");  
  
  CrearAlianzaPorNombre("USIPETES DEL SUR", "CESAR");
  
  DestruirTrigger("AlianzaGalaII");//Estos por si se quiere que no se puedan conseguir 2 ALIADOS... 
  DestruirTrigger("AlianzaGalaI");//...
  DestruirTrigger("AlianzaGalaIV");//...
  
  DestruirTrigger("FacilRecapturado");//
  DestruirTrigger("FacilReconquista");
  
  ActivarTrigger("EnemigoProduceATope");
  
  DestruirTrigger("AlianzaGalaIII");
}

///////////////////////////////////////////////
Trigger "AlianzaGalaIV" [ Inactivo ]
(
// Si has conquistado dos pueblos al menos, al entrar en la zona es tuyo directamente
     (DarNumUnidadesEnZona("CESAR","Z_PBAJO") > 89)
  && (DarNumPueblosConqDestr("CESAR", "GELDUBA", "SUBLONES", "ASCIBURGIUM") == 2)
)
Do
{
  
  MensajeLocucionado("08N9","LTEXT_MISION8_MENSAJE_03_TXT");
  AvisoCivilizacion("CESAR", 25, 30);
  
  RomperAlianzaPorNombre("TANCTERES DEL SUR", "SUEVOS"); 
	RomperAlianzaPorNombre("TANCTERES DEL SUR", "TANCTERES DEL NORTE");
	RomperAlianzaPorNombre("TANCTERES DEL SUR", "USIPETES DEL NORTE");
	RomperAlianzaPorNombre("TANCTERES DEL SUR", "USIPETES DEL SUR");  
	  
  CrearAlianzaPorNombre("TANCTERES DEL SUR", "CESAR");
  
  DestruirTrigger("AlianzaGalaII");//Estos por si se quiere que no se puedan conseguir 2 ALIADOS... 
  DestruirTrigger("AlianzaGalaIII");//...
  DestruirTrigger("AlianzaGalaI");//...
  
  DestruirTrigger("BajoRecapturado");//
  DestruirTrigger("BajoReconquista");
  
  ActivarTrigger("EnemigoProduceATope");
  
  DestruirTrigger("AlianzaGalaIV");
}

///////////////////////////////////////////////
Trigger "EnemigoProduceATope" [ Inactivo ]
(
  TRUE
)
Do
{
  SetDelayEntrenamientoTropasPueblo(hEstrategiaBajos, "CAR MENAPII", 0);
  SetDelayEntrenamientoTropasPueblo(hEstrategiaCercados, "ASCIBURGIUM", 0);
  SetDelayEntrenamientoTropasPueblo(hEstrategiaFaciles, "GELDUBA", 0);
  SetDelayEntrenamientoTropasPueblo(hEstrategiaMedios, "SUBLONES", 0);
  
  DestruirTrigger("EnemigoProduceATope");
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
//= H U I D A   F A C I L E S ==========================================================================
////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////
Trigger "HuidaCenturion_Faciles" [Inactivo]
(
  ObjetivoGetParamBOOL(hObjetivoPueblo1, "HuirConElCenturion")
)
Do
{
  // Creamos un objetivo de huida, con las condiciones adecuadas (se dirige al pueblo mas cercano, etc)
  hObjetivoHuida1 = HuirAPuebloAliadoMasCercano(hObjetivoPueblo1, 61, 83);
  
  // Hacemos visibles para el jugador todos los centuriones que haya en el objetivo de huida
  HacerVisibleTropasObjetivo(hObjetivoHuida1, TRUE, "JefeGaloMedio", "JefeGaloBajo", "JefeGaloCercado", "JefeGaloFacil");
  
  ActivarTrigger("LlegadaCenturion_Faciles");
  ActivarTrigger("AbortadaHuida_Faciles");
  DestruirTrigger("HuidaCenturion_Faciles");
}

//////////////////////////////////////////////////////
Trigger "LlegadaCenturion_Faciles" [Inactivo]
(
  ObjetivoGetParamBOOL(hObjetivoHuida1, "EventoCenturion") // O ha llegado o ha muerto
)
Var
{
  handle hEstrategiaPuebloDondeAcaboDeLlegarAhora;
  handle hPuebloReforzado;
}
Do
{
  HacerVisibleTropasObjetivo(hObjetivoHuida1, FALSE, "JefeGaloMedio", "JefeGaloBajo", "JefeGaloCercado", "JefeGaloFacil");

  if (ObjetivoGetParamBOOL(hObjetivoHuida1, "HaLlegadoCenturion"))
  {
    // Ha llegado al destino
    if (ObjetivoGetParamBOOL(hObjetivoHuida1, "RefuerzaPueblo"))
    {
      hEstrategiaPuebloDondeAcaboDeLlegarAhora = ObjetivoGetParamHANDLE(hObjetivoHuida1, "MiEstrategia");

      // Si estoy reforzando el pueblo, el centurion podría estar allí ya
      hPuebloReforzado = ObjetivoGetParamHANDLE(hObjetivoHuida1, "ObjetivoAReforzar");
      HacerVisibleTropasObjetivo(hPuebloReforzado, FALSE, "JefeGaloMedio", "JefeGaloBajo", "JefeGaloCercado", "JefeGaloFacil");
      
      if (hEstrategiaPuebloDondeAcaboDeLlegarAhora)
      {
        // Y el destino es un pueblo: entrenan a tope
       SetDelayEntrenamientoTropasPueblo(hEstrategiaPuebloDondeAcaboDeLlegarAhora, "CAR MENAPII", 0);
       SetDelayEntrenamientoTropasPueblo(hEstrategiaPuebloDondeAcaboDeLlegarAhora, "GELDUBA", 0);
       SetDelayEntrenamientoTropasPueblo(hEstrategiaPuebloDondeAcaboDeLlegarAhora, "SUBLONES", 0);
       SetDelayEntrenamientoTropasPueblo(hEstrategiaPuebloDondeAcaboDeLlegarAhora, "ASCIBURGIUM", 0);
      }
    }
    else
    {
      // Meterlo en un objetivo de defensa
      CambiarObjetivo(hObjetivoHuida1, "DefenderPosicion", 61, 83);
    }
  }
  
  DestruirTrigger("LlegadaCenturion_Faciles");
  DestruirTrigger("AbortadaHuida_Faciles");
}

//////////////////////////////////////////////////////
Trigger "AbortadaHuida_Faciles" [Inactivo]
(
  ObjetivoGetParamBOOL(hObjetivoHuida1, "Abortado")
)
Var
{
  handle hTemp;
}
Do
{
  // Me han petado el pueblo al que acudia. Cambio de destino.
  hTemp = HuirAPuebloAliadoMasCercano(hObjetivoHuida1, 61, 83);
  DisposeHandle(&hObjetivoHuida1);
  hObjetivoHuida1 = hTemp;
}





////////////////////////////////////////////////////////////////////////////////////////////////////////
//= H U I D A   B A J O S ==============================================================================
////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////
Trigger "HuidaCenturion_Bajos" [Inactivo]
(
  ObjetivoGetParamBOOL(hObjetivoPueblo2, "HuirConElCenturion")
)
Do
{
  // Creamos un objetivo de huida, con las condiciones adecuadas (se dirige al pueblo mas cercano, etc)
  hObjetivoHuida2 = HuirAPuebloAliadoMasCercano(hObjetivoPueblo2, 61, 83);
  
  // Hacemos visibles para el jugador todos los centuriones que haya en el objetivo de huida
  HacerVisibleTropasObjetivo(hObjetivoHuida2, TRUE, "JefeGaloMedio", "JefeGaloBajo", "JefeGaloCercado", "JefeGaloFacil");
  
  ActivarTrigger("LlegadaCenturion_Bajos");
  ActivarTrigger("AbortadaHuida_Bajos");
  DestruirTrigger("HuidaCenturion_Bajos");
}

//////////////////////////////////////////////////////
Trigger "LlegadaCenturion_Bajos" [Inactivo]
(
  ObjetivoGetParamBOOL(hObjetivoHuida2, "EventoCenturion") // O ha llegado o ha muerto
)
Var
{
  handle hEstrategiaPuebloDondeAcaboDeLlegarAhora;
  handle hPuebloReforzado;
}
Do
{
  HacerVisibleTropasObjetivo(hObjetivoHuida2, FALSE, "JefeGaloMedio", "JefeGaloBajo", "JefeGaloCercado", "JefeGaloFacil");

  if (ObjetivoGetParamBOOL(hObjetivoHuida2, "HaLlegadoCenturion"))
  {
    // Ha llegado al destino
    if (ObjetivoGetParamBOOL(hObjetivoHuida2, "RefuerzaPueblo"))
    {
      hEstrategiaPuebloDondeAcaboDeLlegarAhora = ObjetivoGetParamHANDLE(hObjetivoHuida2, "MiEstrategia");
      
      // Si estoy reforzando el pueblo, el centurion podría estar allí ya
      hPuebloReforzado = ObjetivoGetParamHANDLE(hObjetivoHuida2, "ObjetivoAReforzar");
      HacerVisibleTropasObjetivo(hPuebloReforzado, FALSE, "JefeGaloMedio", "JefeGaloBajo", "JefeGaloCercado", "JefeGaloFacil");

      if (hEstrategiaPuebloDondeAcaboDeLlegarAhora)
      {
        // Y el destino es un pueblo: entrenan a tope
       SetDelayEntrenamientoTropasPueblo(hEstrategiaPuebloDondeAcaboDeLlegarAhora, "CAR MENAPII", 0);
       SetDelayEntrenamientoTropasPueblo(hEstrategiaPuebloDondeAcaboDeLlegarAhora, "GELDUBA", 0);
       SetDelayEntrenamientoTropasPueblo(hEstrategiaPuebloDondeAcaboDeLlegarAhora, "SUBLONES", 0);
       SetDelayEntrenamientoTropasPueblo(hEstrategiaPuebloDondeAcaboDeLlegarAhora, "ASCIBURGIUM", 0);
      }
    }
    else
    {
      // Meterlo en un objetivo de defensa
      CambiarObjetivo(hObjetivoHuida2, "DefenderPosicion", 61, 83);
    }
  }
  
  DestruirTrigger("LlegadaCenturion_Bajos");
  DestruirTrigger("AbortadaHuida_Bajos");
}

//////////////////////////////////////////////////////
Trigger "AbortadaHuida_Bajos" [Inactivo]
(
  ObjetivoGetParamBOOL(hObjetivoHuida2, "Abortado")
)
Var
{
  handle hTemp;
}
Do
{
  // Me han petado el pueblo al que acudia. Cambio de destino.
  hTemp = HuirAPuebloAliadoMasCercano(hObjetivoHuida2, 61, 83);
  DisposeHandle(&hObjetivoHuida2);
  hObjetivoHuida2 = hTemp;
}


////////////////////////////////////////////////////////////////////////////////////////////////////////
//= H U I D A   M E D I O S ============================================================================
////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////
Trigger "HuidaCenturion_Medios" [Inactivo]
(
  ObjetivoGetParamBOOL(hObjetivoPueblo3, "HuirConElCenturion")
)
Do
{
  // Creamos un objetivo de huida, con las condiciones adecuadas (se dirige al pueblo mas cercano, etc)
  hObjetivoHuida3 = HuirAPuebloAliadoMasCercano(hObjetivoPueblo3, 61, 83);
  
  // Hacemos visibles para el jugador todos los centuriones que haya en el objetivo de huida
  HacerVisibleTropasObjetivo(hObjetivoHuida3, TRUE, "JefeGaloMedio", "JefeGaloBajo", "JefeGaloCercado", "JefeGaloFacil");
  
  ActivarTrigger("LlegadaCenturion_Medios");
  ActivarTrigger("AbortadaHuida_Medios");
  DestruirTrigger("HuidaCenturion_Medios");
}

//////////////////////////////////////////////////////
Trigger "LlegadaCenturion_Medios" [Inactivo]
(
  ObjetivoGetParamBOOL(hObjetivoHuida3, "EventoCenturion") // O ha llegado o ha muerto
)
Var
{
  handle hEstrategiaPuebloDondeAcaboDeLlegarAhora;
  handle hPuebloReforzado;
}
Do
{
  HacerVisibleTropasObjetivo(hObjetivoHuida3, FALSE, "JefeGaloMedio", "JefeGaloBajo", "JefeGaloCercado", "JefeGaloFacil");

  if (ObjetivoGetParamBOOL(hObjetivoHuida3, "HaLlegadoCenturion"))
  {
    // Ha llegado al destino
    if (ObjetivoGetParamBOOL(hObjetivoHuida3, "RefuerzaPueblo"))
    {
      hEstrategiaPuebloDondeAcaboDeLlegarAhora = ObjetivoGetParamHANDLE(hObjetivoHuida3, "MiEstrategia");
      
      // Si estoy reforzando el pueblo, el centurion podría estar allí ya
      hPuebloReforzado = ObjetivoGetParamHANDLE(hObjetivoHuida3, "ObjetivoAReforzar");
      HacerVisibleTropasObjetivo(hPuebloReforzado, FALSE, "JefeGaloMedio", "JefeGaloBajo", "JefeGaloCercado", "JefeGaloFacil");

      if (hEstrategiaPuebloDondeAcaboDeLlegarAhora)
      {
        // Y el destino es un pueblo: entrenan a tope
       SetDelayEntrenamientoTropasPueblo(hEstrategiaPuebloDondeAcaboDeLlegarAhora, "CAR MENAPII", 0);
       SetDelayEntrenamientoTropasPueblo(hEstrategiaPuebloDondeAcaboDeLlegarAhora, "GELDUBA", 0);
       SetDelayEntrenamientoTropasPueblo(hEstrategiaPuebloDondeAcaboDeLlegarAhora, "SUBLONES", 0);
       SetDelayEntrenamientoTropasPueblo(hEstrategiaPuebloDondeAcaboDeLlegarAhora, "ASCIBURGIUM", 0);
      }
    }
    else
    {
      // Meterlo en un objetivo de defensa
      CambiarObjetivo(hObjetivoHuida3, "DefenderPosicion", 61, 83);
    }
  }
  
  DestruirTrigger("LlegadaCenturion_Medios");
  DestruirTrigger("AbortadaHuida_Medios");
}

//////////////////////////////////////////////////////
Trigger "AbortadaHuida_Medios" [Inactivo]
(
  ObjetivoGetParamBOOL(hObjetivoHuida3, "Abortado")
)
Var
{
  handle hTemp;
}
Do
{
  // Me han petado el pueblo al que acudia. Cambio de destino.
  hTemp = HuirAPuebloAliadoMasCercano(hObjetivoHuida3, 61, 83);
  DisposeHandle(&hObjetivoHuida3);
  hObjetivoHuida3 = hTemp;
}


////////////////////////////////////////////////////////////////////////////////////////////////////////
//= H U I D A   C E R C A D O S ========================================================================
////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////
Trigger "HuidaCenturion_Cercados" [Inactivo]
(
  ObjetivoGetParamBOOL(hObjetivoPueblo4, "HuirConElCenturion")
)
Do
{
  // Creamos un objetivo de huida, con las condiciones adecuadas (se dirige al pueblo mas cercano, etc)
  hObjetivoHuida4 = HuirAPuebloAliadoMasCercano(hObjetivoPueblo4, 61, 83);
  
  // Hacemos visibles para el jugador todos los centuriones que haya en el objetivo de huida
  HacerVisibleTropasObjetivo(hObjetivoHuida4, TRUE, "JefeGaloMedio", "JefeGaloBajo", "JefeGaloCercado", "JefeGaloFacil");
  
  ActivarTrigger("LlegadaCenturion_Cercados");
  ActivarTrigger("AbortadaHuida_Cercados");
  DestruirTrigger("HuidaCenturion_Cercados");
}

//////////////////////////////////////////////////////
Trigger "LlegadaCenturion_Cercados" [Inactivo]
(
  ObjetivoGetParamBOOL(hObjetivoHuida4, "EventoCenturion") // O ha llegado o ha muerto
)
Var
{
  handle hEstrategiaPuebloDondeAcaboDeLlegarAhora;
  handle hPuebloReforzado;
}
Do
{
  HacerVisibleTropasObjetivo(hObjetivoHuida4, FALSE, "JefeGaloMedio", "JefeGaloBajo", "JefeGaloCercado", "JefeGaloFacil");

  if (ObjetivoGetParamBOOL(hObjetivoHuida4, "HaLlegadoCenturion"))
  {
    // Ha llegado al destino
    if (ObjetivoGetParamBOOL(hObjetivoHuida4, "RefuerzaPueblo"))
    {
      hEstrategiaPuebloDondeAcaboDeLlegarAhora = ObjetivoGetParamHANDLE(hObjetivoHuida4, "MiEstrategia");
      
      // Si estoy reforzando el pueblo, el centurion podría estar allí ya
      hPuebloReforzado = ObjetivoGetParamHANDLE(hObjetivoHuida4, "ObjetivoAReforzar");
      HacerVisibleTropasObjetivo(hPuebloReforzado, FALSE, "JefeGaloMedio", "JefeGaloBajo", "JefeGaloCercado", "JefeGaloFacil");

      if (hEstrategiaPuebloDondeAcaboDeLlegarAhora)
      {
        // Y el destino es un pueblo: entrenan a tope
       SetDelayEntrenamientoTropasPueblo(hEstrategiaPuebloDondeAcaboDeLlegarAhora, "CAR MENAPII", 0);
       SetDelayEntrenamientoTropasPueblo(hEstrategiaPuebloDondeAcaboDeLlegarAhora, "GELDUBA", 0);
       SetDelayEntrenamientoTropasPueblo(hEstrategiaPuebloDondeAcaboDeLlegarAhora, "SUBLONES", 0);
       SetDelayEntrenamientoTropasPueblo(hEstrategiaPuebloDondeAcaboDeLlegarAhora, "ASCIBURGIUM", 0);
      }
    }
    else
    {
      // Meterlo en un objetivo de defensa
      CambiarObjetivo(hObjetivoHuida4, "DefenderPosicion", 61, 83);
    }
  }
  
  DestruirTrigger("LlegadaCenturion_Cercados");
  DestruirTrigger("AbortadaHuida_Cercados");
}

//////////////////////////////////////////////////////
Trigger "AbortadaHuida_Cercados" [Inactivo]
(
  ObjetivoGetParamBOOL(hObjetivoHuida4, "Abortado")
)
Var
{
  handle hTemp;
}
Do
{
  // Me han petado el pueblo al que acudia. Cambio de destino.
  hTemp = HuirAPuebloAliadoMasCercano(hObjetivoHuida4, 61, 83);
  DisposeHandle(&hObjetivoHuida4);
  hObjetivoHuida3 = hTemp;
}

//LOOK_JEFES_MUERTOS**
//-------------------------------------------
Trigger "JefeGaloFacilMuerto" [Inactivo]
(
  !EstaTropaViva("JefeGaloFacil") ||
  EstanAliadas("CESAR", "USIPETES DEL SUR")
)
Do
{
  
  if ( fNJefes == 0 )
  {
    EliminarObjetivoMision(hObj4Jefes);
    AgregarObjetivoMision(hObj3Jefes, "LTEXT_MISION8_OBJETIVO_05_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNJefes == 1 )
  {
    EliminarObjetivoMision(hObj3Jefes);
    AgregarObjetivoMision(hObj2Jefes, "LTEXT_MISION8_OBJETIVO_06_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNJefes == 2 )
  {
    EliminarObjetivoMision(hObj2Jefes);
    AgregarObjetivoMision(hObj1Jefe, "LTEXT_MISION8_OBJETIVO_07_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj1Jefe);
    AgregarObjetivoMision(hObj4Jefes, "LTEXT_MISION8_OBJETIVO_04_TXT");
    IndicarObjetivoCumplido(hObj4Jefes);
  }
  
  fNJefes = fNJefes + 1;
      
  DestruirTrigger("JefeGaloFacilMuerto");
}

//-------------------------------------------
Trigger "JefeGaloBajoMuerto" [Inactivo]
(
  !EstaTropaViva("JefeGaloBajo") ||
  EstanAliadas("CESAR", "TANCTERES DEL SUR")
)
Do
{
  
  if ( fNJefes == 0 )
  {
    EliminarObjetivoMision(hObj4Jefes);
    AgregarObjetivoMision(hObj3Jefes, "LTEXT_MISION8_OBJETIVO_05_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNJefes == 1 )
  {
    EliminarObjetivoMision(hObj3Jefes);
    AgregarObjetivoMision(hObj2Jefes, "LTEXT_MISION8_OBJETIVO_06_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNJefes == 2 )
  {
    EliminarObjetivoMision(hObj2Jefes);
    AgregarObjetivoMision(hObj1Jefe, "LTEXT_MISION8_OBJETIVO_07_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj1Jefe);
    AgregarObjetivoMision(hObj4Jefes, "LTEXT_MISION8_OBJETIVO_04_TXT");
    IndicarObjetivoCumplido(hObj4Jefes);
  }
  
  fNJefes = fNJefes + 1;
      
  DestruirTrigger("JefeGaloBajoMuerto");
}

//-------------------------------------------
Trigger "JefeGaloMedioMuerto" [Inactivo]
(
  !EstaTropaViva("JefeGaloMedio") ||
  EstanAliadas("CESAR", "TANCTERES DEL NORTE")
)
Do
{
  
  if ( fNJefes == 0 )
  {
    EliminarObjetivoMision(hObj4Jefes);
    AgregarObjetivoMision(hObj3Jefes, "LTEXT_MISION8_OBJETIVO_05_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNJefes == 1 )
  {
    EliminarObjetivoMision(hObj3Jefes);
    AgregarObjetivoMision(hObj2Jefes, "LTEXT_MISION8_OBJETIVO_06_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNJefes == 2 )
  {
    EliminarObjetivoMision(hObj2Jefes);
    AgregarObjetivoMision(hObj1Jefe, "LTEXT_MISION8_OBJETIVO_07_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj1Jefe);
    AgregarObjetivoMision(hObj4Jefes, "LTEXT_MISION8_OBJETIVO_04_TXT");
    IndicarObjetivoCumplido(hObj4Jefes);
  }
  
  fNJefes = fNJefes + 1;
      
  DestruirTrigger("JefeGaloMedioMuerto");
}

//-------------------------------------------
Trigger "JefeGaloCercadoMuerto" [Inactivo]
(
  !EstaTropaViva("JefeGaloCercado") ||
  EstanAliadas("CESAR", "USIPETES DEL NORTE")
)
Do
{
  
  if ( fNJefes == 0 )
  {
    EliminarObjetivoMision(hObj4Jefes);
    AgregarObjetivoMision(hObj3Jefes, "LTEXT_MISION8_OBJETIVO_05_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNJefes == 1 )
  {
    EliminarObjetivoMision(hObj3Jefes);
    AgregarObjetivoMision(hObj2Jefes, "LTEXT_MISION8_OBJETIVO_06_TXT");
    ObjetivosMisionCambiados();
  }
  else
  if ( fNJefes == 2 )
  {
    EliminarObjetivoMision(hObj2Jefes);
    AgregarObjetivoMision(hObj1Jefe, "LTEXT_MISION8_OBJETIVO_07_TXT");
    ObjetivosMisionCambiados();
  }
  else
  {
    EliminarObjetivoMision(hObj1Jefe);
    AgregarObjetivoMision(hObj4Jefes, "LTEXT_MISION8_OBJETIVO_04_TXT");
    IndicarObjetivoCumplido(hObj4Jefes);
  }
  
  fNJefes = fNJefes + 1;
  
  DestruirTrigger("JefeGaloCercadoMuerto");
}

//LOOK_END**
//////////////////////////////////////////////////////
Trigger "End" [ Activo ]  
(
  TRUE
)
Do
{
}