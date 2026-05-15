Var
{
	handle hEstrategiaPompeyo;
	handle hEstrategiaInfanterias;
	handle hEstrategiaCaballeria;
	handle hEstrategiaMaquinas;
		
	handle hCivilizacionPompeyo;
	handle hCivilizacionInfanterias;
	handle hCivilizacionCaballeria;
	handle hCivilizacionMaquinas;
	
	handle hDefensaInfanterias;	
  handle hDefensaCaballaria;
  handle hDefensaMaquinas;
  
  handle hPatrullasInfanterias;	
  handle hPatrullasCaballeria;
  handle hPatrullasMaquinas;
    
  handle hDefensaFortalezaInfanterias;
  handle hDefensaFortalezaCaballeria; 
  handle hDefensaFortalezaMaquinas;
  
  handle hObjetivoDefensaFortaleza;
  
  handle hHuidaMedico;
  
  handle hG_1;
  handle hG_2;
  handle hG_3;
  handle hG_4;
  handle hG_5;
  handle hG_6;
  handle hG_7;
  handle hG_8;
  handle hG_9;
  handle hG_10;
  handle hG_11;
  handle hG_12;
  handle hG_13;
  handle hG_14;
  handle hG_15;
  handle hG_ORGANIZADO;
  handle hG_CACHONDO;
  handle hG_CASHONDO;
  handle hG_CAJONDO;
  handle hG_ESTANCADO;
  
  bool bRendicion1            =FALSE;
  bool bRendicion2            =FALSE;
  bool bRendicion3            =FALSE;
  
  // Objetivos
  handle hObjQuinto;
  handle hObjFuerte;
  
  // Dificultad
	float fNivelDificultad;
	
	float fProdPueblos;
	float fProdPompeyo;
	
  // briefing
  bool bBriefingEnded               = FALSE;
  float fPuntoSincronia             = 0;
  handle hPuntoSincronia            = NULL;
  
  // otros
  bool bMensajeReclutarEmitido      = FALSE;
	
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
   
  //Alianzas de los enemigos iniciales
  CrearAlianzaPorNombre("POMPEYO", "ENEMIGOS1");
  CrearAlianzaPorNombre("POMPEYO", "ENEMIGOS2");
  CrearAlianzaPorNombre("POMPEYO", "ENEMIGOS3");
  
  // quieeeeeetos
  OrdenarTropaMantenerPosicion("CentuCab", TRUE);
  OrdenarTropaMantenerPosicion("CentuMaq", TRUE);
  OrdenarTropaMantenerPosicion("CentuInf", TRUE);
  
  // arrancamos el briefing
  ActivarTrigger("Briefing");
}


Trigger "Main2" [Inactivo]
(
  TRUE
)
Do
{
  // restricciones de la mision
  IntroducirRestriccionUnidad("ORDEN_TRANSFORMAR_A_CENTURION", "CABALLERIA_GERMANA", "CESAR");
  IntroducirRestriccionUnidad("ORDEN_TRANSFORMAR_A_CENTURION", "GALO_ESPADON", "CESAR");
  IntroducirRestriccionUnidad("ORDEN_TRANSFORMAR_A_CENTURION", "GALO_LIGERA", "CESAR");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_CABALLERIA_PESADA", "CESAR");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_CABALLERIA_ARQUERA", "CESAR");
  
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "CABALLERIA_PARTHA", "");
  IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_CUADRIGA", "");
  //IntroducirRestriccionUnidad("ORDEN_ENTRENAR_TROPAS", "EGIPCIO_ARQUERON", "FENICIOS");
  
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "BALLESTA_MOVIL_ROMANA", "POMPEYO");
  IntroducirRestriccionUnidad("ORDEN_CONSTRUIR", "CATAPULTA_ROMANA", "POMPEYO");
  
  // soltar a estos  
  OrdenarTropaMantenerPosicion("CentuCab", FALSE);
  OrdenarTropaMantenerPosicion("CentuMaq", FALSE);
  OrdenarTropaMantenerPosicion("CentuInf", FALSE);

  // objetivos de misión
  hObjFuerte = CrearHandle("Bool");
  hObjQuinto = CrearHandle("Bool");
  
  AgregarObjetivoMision(hObjFuerte, "LTEXT_MISION21_OBJETIVO_01_TXT");
  AgregarObjetivoMision(hObjQuinto, "LTEXT_MISION21_OBJETIVO_00_TXT");
  
  // Comprobar el nivel de dificultad
  fNivelDificultad = DarDificultadMision();
  if ( fNivelDificultad == 1 )
  { 
    fProdPueblos = 180000;
    fProdPompeyo = 240000;
  }
  else
  if ( fNivelDificultad == 2 )
  {    
    fProdPueblos = 120000;
    fProdPompeyo = 180000;
  }
  else
  if ( fNivelDificultad == 3 )
  {
    fProdPueblos = 60000;
    fProdPompeyo = 120000;
    
    //Poner que el pueblo pueda hacer arqueros para entrar en le pueblo...
  }
  else
  {
    fProdPueblos = 60000;
    fProdPompeyo = 120000;
    
    MensajeChat("Nivel de dificulatd desconocido, oiga");
  }
  
  
  //Estrategias del enemigo y del aliado
	hEstrategiaPompeyo = CrearEstrategiaScript();
  hCivilizacionPompeyo = DarCivilizacion("POMPEYO");
  AsignarEstrategia(hCivilizacionPompeyo, hEstrategiaPompeyo);
  StartEstrategia(hEstrategiaPompeyo);
    
  hEstrategiaInfanterias = CrearEstrategiaScript();
  hCivilizacionInfanterias = DarCivilizacion("ENEMIGOS1");
  AsignarEstrategia(hCivilizacionInfanterias, hEstrategiaInfanterias);
  StartEstrategia(hEstrategiaInfanterias);
  
  hEstrategiaCaballeria = CrearEstrategiaScript();
  hCivilizacionCaballeria = DarCivilizacion("ENEMIGOS2");
  AsignarEstrategia(hCivilizacionCaballeria, hEstrategiaCaballeria);
  StartEstrategia(hEstrategiaCaballeria);
      
  hEstrategiaMaquinas = CrearEstrategiaScript();
  hCivilizacionMaquinas = DarCivilizacion("ENEMIGOS3");
  AsignarEstrategia(hCivilizacionMaquinas, hEstrategiaMaquinas);
  StartEstrategia(hEstrategiaMaquinas);
      
  
  //Los grupos de patrullas aleatorias  
  hPatrullasInfanterias = CrearObjetivo(hEstrategiaInfanterias, "PatrullaOleadasPeriodicas", 15000, 15000, 60, 60);
  AnyadirGrupoAObjetivo(hPatrullasInfanterias, "G_PATRULLA1");
  SetParamObjetivo(hPatrullasInfanterias, "ParametrosTacticas", "AtacarCorriendo", TRUE);	
	SetParamObjetivo(hPatrullasInfanterias, "FACTOR_POTENCIA_TROPAS", 1);
  SetParamObjetivo(hPatrullasInfanterias, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hPatrullasInfanterias, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hPatrullasInfanterias, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hPatrullasInfanterias, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hPatrullasInfanterias, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hPatrullasInfanterias, "MaxNumOleadas", 7);
  AnyadirObjetivo(hEstrategiaInfanterias, hPatrullasInfanterias);
  
  hPatrullasCaballeria = CrearObjetivo(hEstrategiaCaballeria, "PatrullaOleadasPeriodicas",15000, 15000, 60, 60);
  AnyadirGrupoAObjetivo(hPatrullasCaballeria, "G_PATRULLA2");
  SetParamObjetivo(hPatrullasCaballeria, "ParametrosTacticas", "AtacarCorriendo", TRUE);	
	SetParamObjetivo(hPatrullasCaballeria, "FACTOR_POTENCIA_TROPAS", 1);
  SetParamObjetivo(hPatrullasCaballeria, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hPatrullasCaballeria, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hPatrullasCaballeria, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hPatrullasCaballeria, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hPatrullasCaballeria, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hPatrullasCaballeria, "MaxNumOleadas", 5);
  AnyadirObjetivo(hEstrategiaCaballeria, hPatrullasCaballeria);
  
  hPatrullasMaquinas = CrearObjetivo(hEstrategiaMaquinas, "PatrullaOleadasPeriodicas", 15000, 15000, 60, 60);
  AnyadirGrupoAObjetivo(hPatrullasMaquinas, "G_PATRULLA3");
  SetParamObjetivo(hPatrullasMaquinas, "ParametrosTacticas", "AtacarCorriendo", TRUE);	
	SetParamObjetivo(hPatrullasMaquinas, "FACTOR_POTENCIA_TROPAS", 1);
  SetParamObjetivo(hPatrullasMaquinas, "EXPLORAR_FACTOR_ENEMIGOS", 0);
  SetParamObjetivo(hPatrullasMaquinas, "EXPLORAR_FACTOR_VISTA_YA", 0);
  SetParamObjetivo(hPatrullasMaquinas, "EXPLORAR_FACTOR_ESTRUCTURAS", 0);
  SetParamObjetivo(hPatrullasMaquinas, "EXPLORAR_FACTOR_PUEBLOS", 0);
  SetParamObjetivo(hPatrullasMaquinas, "ComposicionEstricta", FALSE);
  SetParamObjetivo(hPatrullasMaquinas, "MaxNumOleadas", 3);
  AnyadirObjetivo(hEstrategiaMaquinas, hPatrullasMaquinas);
   
  
  //Objetivo del ataque cerca de la fortaleza a la fortaleza// HAY QUE PONER EL ATACAR PUNTO POR OLEADAS
  hDefensaFortalezaInfanterias = CrearObjetivo(hEstrategiaInfanterias, "AtaqueOleadasPeriodicas", 12000, 12000, 240, 360);
  AnyadirGrupoAObjetivo(hDefensaFortalezaInfanterias , "G_FUERTE1"); 
  AnyadirObjetivo(hEstrategiaInfanterias,  hDefensaFortalezaInfanterias);
  SetParamObjetivo(hDefensaFortalezaInfanterias, "PosicionAtaque", 121, 152);
  SetParamObjetivo(hDefensaFortalezaInfanterias, "PosicionSiguiente", 133, 103);
  SetParamObjetivo(hDefensaFortalezaInfanterias, "PosicionSiguiente", 164, 124);
  SetParamObjetivo(hDefensaFortalezaInfanterias, "RetardoSiguiente", 100);
  
  hDefensaFortalezaCaballeria = CrearObjetivo(hEstrategiaCaballeria, "AtaqueOleadasPeriodicas", 12000, 12000, 240, 360);
  AnyadirGrupoAObjetivo(hDefensaFortalezaCaballeria, "G_FUERTE2"); 
  AnyadirObjetivo(hEstrategiaCaballeria,  hDefensaFortalezaCaballeria);
  SetParamObjetivo(hDefensaFortalezaCaballeria, "PosicionAtaque", 132, 89);
  SetParamObjetivo(hDefensaFortalezaCaballeria, "PosicionSiguiente", 176, 108);
  SetParamObjetivo(hDefensaFortalezaCaballeria, "PosicionSiguiente", 143, 152);
  SetParamObjetivo(hDefensaFortalezaCaballeria, "RetardoSiguiente", 120);
  
  hDefensaFortalezaMaquinas = CrearObjetivo(hEstrategiaMaquinas, "AtaqueOleadasPeriodicas", 12000, 12000, 240, 360);
  AnyadirGrupoAObjetivo(hDefensaFortalezaMaquinas , "G_FUERTE3"); 
  AnyadirObjetivo(hEstrategiaMaquinas,  hDefensaFortalezaMaquinas);
  SetParamObjetivo(hDefensaFortalezaMaquinas, "PosicionAtaque", 160, 134);
  SetParamObjetivo(hDefensaFortalezaMaquinas, "PosicionSiguiente", 103, 92);
  SetParamObjetivo(hDefensaFortalezaMaquinas, "PosicionSiguiente", 154, 88);
  SetParamObjetivo(hDefensaFortalezaMaquinas, "RetardoSiguiente", 140);
    
  //Objetivo de la defensa de la fortaleza
  hObjetivoDefensaFortaleza = CrearObjetivo(hEstrategiaPompeyo, "DefensaFortaleza", "POMPEYO_FORTRESS");
  AnyadirGrupoAObjetivo(hObjetivoDefensaFortaleza , "G_FUERTEPOMPEYO"); 
  AnyadirObjetivo(hEstrategiaPompeyo,  hObjetivoDefensaFortaleza);
  
  SetDelayEntrenamientoTropasPueblo(hEstrategiaPompeyo, "Pueblo3", fProdPompeyo);  
    
   
  //La gestion de los pueblos enemigos
  hDefensaInfanterias = CrearObjetivo(hEstrategiaInfanterias, "ConquistaPueblo2", "Pueblo1");
  AnyadirGrupoAObjetivo(hDefensaInfanterias , "G_DEFENSA1"); 
  //SetValue(hEstrategiaInfanterias, "GRUPOTROPAS_A_ENTRENAR", "EXPLORADOR_HALCON", 1);
  //SetValue(hEstrategiaInfanterias, "GRUPOTROPAS_A_ENTRENAR", "EXPLORADOR_LOBO", 1);
  SetValue(hEstrategiaInfanterias, "GRUPOTROPAS_A_ENTRENAR", "MEDICO", 0);
  SetValue(hEstrategiaInfanterias, "GRUPOTROPAS_A_ENTRENAR", "INF_ARQUERO", 25);
  SetValue(hEstrategiaInfanterias, "GRUPOTROPAS_A_ENTRENAR", "INF_PESADA", 25);
  SetValue(hEstrategiaInfanterias, "GRUPOTROPAS_A_ENTRENAR", "PIQUERO", 20);
  SetValue(hEstrategiaInfanterias, "GRUPOTROPAS_A_ENTRENAR", "CABALLERIA_PESADA", 0);
  SetValue(hEstrategiaInfanterias, "GRUPOTROPAS_A_ENTRENAR", "CABALLERIA_ARQUERA", 0);  
  SetParamObjetivo(hDefensaInfanterias, "DistribuirTropas", 20, hPatrullasInfanterias, 50, hDefensaFortalezaInfanterias, 30);
  //SetParamObjetivo(hDefensaInfanterias , "NombreGrupoGenerado", "G_DEFENSA1");
  SetParamObjetivo(hDefensaInfanterias , "PuedePedirRefuerzos", FALSE);
  SetParamObjetivo(hDefensaInfanterias, "POTMIN_DEFENSA_PUEBLO", 20000);
  AnyadirObjetivo(hEstrategiaInfanterias,  hDefensaInfanterias );
  SetParamObjetivo(hDefensaInfanterias, "CENTURION_AYUDA_COMBATE", TRUE);
  
  SetDelayEntrenamientoTropasPueblo(hEstrategiaInfanterias, "Pueblo1", fProdPueblos);  

  
    
  hDefensaCaballaria = CrearObjetivo(hEstrategiaCaballeria, "ConquistaPueblo2", "Pueblo2");
  AnyadirGrupoAObjetivo(hDefensaCaballaria , "G_DEFENSA2"); 
  //SetValue(hEstrategiaCaballeria, "GRUPOTROPAS_A_ENTRENAR", "EXPLORADOR_HALCON", 1);
  //SetValue(hEstrategiaCaballeria, "GRUPOTROPAS_A_ENTRENAR", "EXPLORADOR_LOBO", 1);
  SetValue(hEstrategiaCaballeria, "GRUPOTROPAS_A_ENTRENAR", "MEDICO", 0);
  SetValue(hEstrategiaCaballeria, "GRUPOTROPAS_A_ENTRENAR", "CABALLERIA_PESADA", 35);
  SetValue(hEstrategiaCaballeria, "GRUPOTROPAS_A_ENTRENAR", "CABALLERIA_ARQUERA", 35);  
  SetValue(hEstrategiaCaballeria, "GRUPOTROPAS_A_ENTRENAR", "INF_ARQUERO", 0);
  SetValue(hEstrategiaCaballeria, "GRUPOTROPAS_A_ENTRENAR", "INF_PESADA", 0);
  SetValue(hEstrategiaCaballeria, "GRUPOTROPAS_A_ENTRENAR", "PIQUERO", 0);
  SetParamObjetivo(hDefensaCaballaria, "DistribuirTropas", 50, hPatrullasCaballeria, 30, hDefensaFortalezaCaballeria, 20);
  //SetParamObjetivo(hDefensaCaballaria  , "NombreGrupoGenerado", "G_DEFENSA2");
  SetParamObjetivo(hDefensaCaballaria  , "PuedePedirRefuerzos", FALSE);
  
  if ((fNivelDificultad == 1) || (fNivelDificultad == 2))
  {
    SetParamObjetivo(hDefensaCaballaria, "PedirArquerosTorres", FALSE);
  }
  
  SetParamObjetivo(hDefensaCaballaria, "POTMIN_DEFENSA_PUEBLO", 20000);
  AnyadirObjetivo(hEstrategiaCaballeria,  hDefensaCaballaria  );
  SetParamObjetivo(hDefensaCaballaria, "CENTURION_AYUDA_COMBATE", TRUE);
  
  SetDelayEntrenamientoTropasPueblo(hEstrategiaCaballeria, "Pueblo2", fProdPueblos);  

  
  
  hDefensaMaquinas = CrearObjetivo(hEstrategiaMaquinas, "ConquistaPueblo2", "Pueblo3");
  AnyadirTropaAObjetivo(hDefensaMaquinas, "MediMaq");
  AnyadirGrupoAObjetivo(hDefensaMaquinas, "G_DEFENSA3"); 
  //SetValue(hEstrategiaMaquinas, "GRUPOTROPAS_A_ENTRENAR", "EXPLORADOR_HALCON", 1);  
  //SetValue(hEstrategiaMaquinas, "GRUPOTROPAS_A_ENTRENAR", "EXPLORADOR_LOBO", 1);
  SetValue(hEstrategiaMaquinas, "GRUPOTROPAS_A_ENTRENAR", "MEDICO", 0);  
  SetValue(hEstrategiaMaquinas, "GRUPOTROPAS_A_ENTRENAR", "MAQUINAS_DEFENSA", 20);  
  SetValue(hEstrategiaMaquinas, "GRUPOTROPAS_A_ENTRENAR", "MAQUINAS_ATAQUE", 20);
  SetValue(hEstrategiaMaquinas, "GRUPOTROPAS_A_ENTRENAR", "ASALTO_FORTALEZA", 30);
  SetParamObjetivo(hDefensaMaquinas, "DistribuirTropas", 30, hPatrullasMaquinas, 20, hDefensaFortalezaMaquinas, 50);
  //SetParamObjetivo(hDefensaMaquinas , "NombreGrupoGenerado", "G_DEFENSA3");
  SetParamObjetivo(hDefensaMaquinas , "PuedePedirRefuerzos", FALSE);
  SetParamObjetivo(hDefensaMaquinas, "POTMIN_DEFENSA_PUEBLO", 20000);
  
  AnyadirObjetivo(hEstrategiaMaquinas,  hDefensaMaquinas );
  SetParamObjetivo(hDefensaMaquinas, "CENTURION_AYUDA_COMBATE", TRUE);
  
  SetDelayEntrenamientoTropasPueblo(hEstrategiaMaquinas, "Pueblo3", fProdPueblos);  
  
  
  
  //Grupos que defienden la posicion
  hG_1 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_1, "G_1");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_1);
  
  hG_2 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_2, "G_2");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_2);
  
  hG_3 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_3, "G_3");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_3);
  
  hG_4 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_4, "G_4");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_4);
  
  hG_5 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_5, "G_5");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_5);
  
  hG_6 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_6, "G_6");
  SetParamObjetivo(hG_6, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_6);
    
  hG_7 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_7, "G_7");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_7);
  
  hG_8 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_8, "G_8");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_8);
  
  hG_9 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_9, "G_9");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_9);
  
  hG_10 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_10, "G_10");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_10);
  
  hG_11 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_11, "G_11");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_11);
  
  hG_12 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_12, "G_12");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_12);
  
  hG_13 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_13, "G_13");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_13);
  
  hG_14 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_14, "G_14");
  SetParamObjetivo(hG_14, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_14);
  
  hG_15 = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_15, "G_15");
  //SetParamObjetivo(hG_15, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_15);
  
  hG_ORGANIZADO = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_ORGANIZADO, "G_ORGANIZADO");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_ORGANIZADO);
  
  hG_CACHONDO = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_CACHONDO, "G_CACHONDO");
  SetParamObjetivo(hG_CACHONDO, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_CACHONDO);
  
  hG_CASHONDO = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_CASHONDO, "G_CASHONDO");
  SetParamObjetivo(hG_CASHONDO, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_CASHONDO);
  
  hG_CAJONDO = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_CAJONDO, "G_CAJONDOS");
  SetParamObjetivo(hG_CAJONDO, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_CAJONDO);
  
  hG_ESTANCADO = CrearObjetivo(hEstrategiaPompeyo, "DefenderPosicion");
  AnyadirGrupoAObjetivo(hG_ESTANCADO, "G_ESTANCADO");
  AnyadirObjetivo(hEstrategiaPompeyo, hG_ESTANCADO);
         
  //Activacion de triggers
  ActivarTrigger("PuebInfTuyo");
  ActivarTrigger("PuebCabTuyo");
  ActivarTrigger("PuebMaqTuyo");
  ActivarTrigger("MeetPuebInf");
  ActivarTrigger("MeetPuebCab");
  ActivarTrigger("MeetPuebMaq");
  ActivarTrigger("TercerPuebloHostil");
  ActivarTrigger("MercenariosPompeyoTuyos");
  ActivarTrigger("MercenariosPompeyoTuyosII");
  ActivarTrigger("MercenariosPompeyoTuyosIII");
  ActivarTrigger("Exito");
  ActivarTrigger("CentuMuerto");
  ActivarTrigger("RomanosMuertos");
  
//  ActivarTrigger("IntroduccionCiceron");
//  ActivarTrigger("EntrarEnZVigiaI");
//  ActivarTrigger("EntrarEnZVigiaII");
//  ActivarTrigger("EntrarEnZVigiaIII");
//  ActivarTrigger("EntrarEnZVigiaIV");

  
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
  ActivarPresentacion(TRUE, "LTEXT_MISION21_PRESENTACION_TITULO",
                            "LTEXT_MISION21_PRESENTACION_LUGAR", hPresentacion);
                            
  // camara a donde debe empezar
  EncolarColocarYMirarPunto("BRIEFING_1");
  EjecutarOrdenesCamara();
  
  WaitBool(HandleDisparado(hPresentacion) || HandleDisparado(hEscape));
 
  ActivarPresentacion(FALSE, "", "", NULL);

  // cámaras
  IntroducirPonerModoJuegoCamara(FALSE);

  EncolarColocarYMirarPunto("BRIEFING_1");
  IntroducirLocucion("21N0", "LTEXT_MISION21_LOCUCION_00_TXT", 8000, 600, 100);
  EncolarPausaCamara(6000);
  IntroducirPuntoSincronia();    

  EncolaTrayectoriaCamara("BRIEFING_2", FALSE, FALSE, 0, 0);
  IntroducirLocucion("", "", 100, 600, 100);
  IntroducirLocucion("21N1", "LTEXT_MISION21_LOCUCION_01_TXT", 6000, 600, 100);
  EncolarPausaCamara(2000);
  IntroducirPuntoSincronia();      

  EncolarColocarYMirarPunto("BRIEFING_3");
  EncolarPausaCamara(3000);
  EncolarColocarYMirarPunto("BRIEFING_4");
  EncolarPausaCamara(3000);
  EncolarColocarYMirarPunto("BRIEFING_5");
  EncolarPausaCamara(3000);
  IntroducirLocucion("", "", 100, 600, 100);
  IntroducirLocucion("21N2", "LTEXT_MISION21_LOCUCION_02_TXT", 8000, 600, 100);
  IntroducirPuntoSincronia();      

  EncolarColocarYMirarPunto("BRIEFING_6");
  EncolarPausaCamara(6000);
  EncolarColocarYMirarPunto("BRIEFING_7");
  EncolarPausaCamara(3000);
  IntroducirLocucion("", "", 100, 600, 100);
  IntroducirLocucion("21N3", "LTEXT_MISION21_LOCUCION_03_TXT", 6000, 600, 100);
  IntroducirPuntoSincronia();      

  EncolaTrayectoriaCamara("BRIEFING_8", FALSE, FALSE, 0, 0);
  EncolarPausaCamara(1000);
  IntroducirLocucion("", "", 100, 600, 100);
  IntroducirLocucion("21N4", "LTEXT_MISION21_LOCUCION_04_TXT", 3000, 600, 100);
  IntroducirLocucion("", "", 100, 600, 100);
  IntroducirLocucion("21N5", "LTEXT_MISION21_LOCUCION_05_TXT", 5000, 600, 100);
  IntroducirPuntoSincronia();          

  IntroducirPonerModoJuegoCamara(TRUE);

  // iluminar las ciudades por lo de los colores
  IluminarZonaOnOff(140, 3, 85, 40, "fortaleza", TRUE);
  IluminarZonaOnOff(132, 3, 120, 30, "fortaleza2", TRUE);
  IluminarZonaOnOff(162, 3, 114, 30, "fortaleza3", TRUE);
  IluminarZonaOnOff(100, 3, 120, 30, "fortaleza4", TRUE);
  IluminarZonaOnOff(167, 2, 45, 20, "merc1", TRUE);
  IluminarZonaOnOff(44, 2, 190, 20, "merc2", TRUE);
  IluminarZonaOnOff(230, 2, 178, 20, "merc3", TRUE);

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

  VaciarOrdenesCamara();
  VaciarLocuciones();

  // fuera luces
  IluminarZonaOnOff(140, 3, 85, 40, "fortaleza", FALSE);      
  IluminarZonaOnOff(132, 3, 120, 30, "fortaleza2", FALSE);    
  IluminarZonaOnOff(162, 3, 114, 30, "fortaleza3", FALSE);
  IluminarZonaOnOff(100, 3, 120, 30, "fortaleza4", FALSE);
  IluminarZonaOnOff(167, 2, 45, 20, "merc1", FALSE);
  IluminarZonaOnOff(44, 2, 190, 20, "merc2", FALSE);
  IluminarZonaOnOff(230, 2, 178, 20, "merc3", FALSE);

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
}
Do
{
  DestruirTrigger("EfectosBriefing"); 
}

//////////////////////////////////////////////////////////////////
// TRIGGERS DE MISION
//////////////////////////////////////////////////////////////////


// Exito
Trigger "Exito" [Inactivo]
(
 	EstructuraDestruida("Barracon")
)
Do
{
	
	IndicarObjetivoCumplido(hObjQuinto);
	IndicarObjetivoCumplido(hObjFuerte);
	FinalizarMision(TRUE);	
	
	DestruirTrigger("Exito");
}

// Matan al centurion del jugador
//---------------------------------
Trigger "CentuMuerto" [Inactivo]
(
 	!EstaTropaViva("CentuRomano")
)
Do
{
	
	DestruirTrigger("ReclutarEnemigos1");
	DestruirTrigger("ReclutarEnemigos2");
	DestruirTrigger("ReclutarEnemigos3");
	
	IndicarObjetivoFracasado(hObjQuinto);
	FinalizarMision(FALSE);
	
	DestruirTrigger("Exito");
	DestruirTrigger("CentuMuerto");
}

// Matan las tropas del jugador
//---------------------------------
Trigger "RomanosMuertos" [Inactivo]
(
 	CivilizacionEstaKO("CESAR")
)
Do
{

	IndicarObjetivoFracasado(hObjFuerte);
	FinalizarMision(FALSE);
	
	DestruirTrigger("Exito");
	DestruirTrigger("RomanosMuertos");
}

// Rendicion de los pueblos //HAY QUE PONER UNA TACTICA DE RECLUTAMIENTO y neutralizarlas
//---------------------------------
Trigger "PuebInfTuyo" [Inactivo]
(
 	(!EstaTropaViva("CentuInf") && !EstaTropaViva("MediInf"))
)
Do
{
    
  MensajeLocucionado("21N7","LTEXT_MISION21_MENSAJE_01_TXT");  
  AvisoCivilizacion("CESAR", 37, 194);

  if ( !bMensajeReclutarEmitido )
  {
    bMensajeReclutarEmitido = TRUE;
    MensajeLocucionado("21NA","LTEXT_MISION21_MENSAJE_04_TXT");
  }
	
	NeutralizarCivilizacion("ENEMIGOS1", TRUE);
	HacerVisibleGrupoTropas("G_PATRULLA1", TRUE); 
	HacerVisibleGrupoTropas("G_DEFENSA1", TRUE);
	HacerVisibleGrupoTropas("G_FUERTE1", TRUE);
	
	//CambiarBando("ENEMIGOS1", "CESAR");// provisional
	bRendicion1 = TRUE;
	
	ActivarTrigger("ReclutarEnemigos1");
	
	DestruirTrigger("MeetPuebInf");
	DestruirTrigger("PuebInfTuyo");
	
}

//---------------------------------
Trigger "PuebCabTuyo" [Inactivo]
(
 	(!EstaTropaViva("CentuCab") && !EstaTropaViva("MediCab"))
)
Do
{

  MensajeLocucionado("21N9","LTEXT_MISION21_MENSAJE_03_TXT");  
  AvisoCivilizacion("CESAR", 166, 50);

  if ( !bMensajeReclutarEmitido )
  {
    bMensajeReclutarEmitido = TRUE;
    MensajeLocucionado("21NA","LTEXT_MISION21_MENSAJE_04_TXT");
  }

	NeutralizarCivilizacion("ENEMIGOS2", TRUE);
	HacerVisibleGrupoTropas("G_PATRULLA2", TRUE); 
	HacerVisibleGrupoTropas("G_DEFENSA2", TRUE);
	HacerVisibleGrupoTropas("G_FUERTE2", TRUE);
	//CambiarBando("ENEMIGOS2", "CESAR");// provisional
	bRendicion2 = TRUE;
	ActivarTrigger("ReclutarEnemigos2");
	DestruirTrigger("MeetPuebCab");
	DestruirTrigger("PuebCabTuyo");
}

//---------------------------------
Trigger "PuebMaqTuyo" [Inactivo]
(
 	(!EstaTropaViva("CentuMaq") && !EstaTropaViva("MediMaq"))
)
Do
{
  
  MensajeLocucionado("21N8","LTEXT_MISION21_MENSAJE_02_TXT");  
  AvisoCivilizacion("CESAR", 233, 181);
  
  if ( !bMensajeReclutarEmitido )
  {
    bMensajeReclutarEmitido = TRUE;
    MensajeLocucionado("21NA","LTEXT_MISION21_MENSAJE_04_TXT");
  }
  
	NeutralizarCivilizacion("ENEMIGOS3", TRUE);
	HacerVisibleGrupoTropas("G_PATRULLA3", TRUE); 
	HacerVisibleGrupoTropas("G_DEFENSA3", TRUE);
	HacerVisibleGrupoTropas("G_FUERTE3", TRUE);
	//CambiarBando("ENEMIGOS3", "CESAR");// provisional
	bRendicion3 = TRUE;
	ActivarTrigger("ReclutarEnemigos3");
	DestruirTrigger("MeetPuebMaq");
	DestruirTrigger("PuebMaqTuyo");
}

//---------------------------
Trigger "ReclutarEnemigos1" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer; 
}
Do
{
  if ( ReclutarTropasCerca("CentuRomano", "ENEMIGOS1", 14) )
  {
    ReclutarTropasCerca("CentuRomano", "ENEMIGOS1", 18);
  }

  hTimer = CrearTimer(1000);
  Wait(hTimer);
  
}

//---------------------------
Trigger "ReclutarEnemigos2" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer; 
}
Do
{
  if ( ReclutarTropasCerca("CentuRomano", "ENEMIGOS2", 14) )
  {
    ReclutarTropasCerca("CentuRomano", "ENEMIGOS2", 18);
  }

  hTimer = CrearTimer(1000);
  Wait(hTimer);
  
}

//---------------------------
Trigger "ReclutarEnemigos3" [ Inactivo ]
(
  TRUE
)
Var
{
  handle hTimer; 
}
Do
{
  if ( ReclutarTropasCerca("CentuRomano", "ENEMIGOS3", 14) )
  {
    ReclutarTropasCerca("CentuRomano", "ENEMIGOS3", 18);
  }

  hTimer = CrearTimer(1000);
  Wait(hTimer);
  
}

// Informacion de lo que hay que hacer para meter presion a los pueblos enemigos
//----------------------------------------
Trigger "MeetPuebInf" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_PuebloInf", "CESAR")
)
Do
{
	
	SetParamObjetivo(hDefensaInfanterias, "DistribuirTropas", 100, hPatrullasInfanterias, 0, hDefensaFortalezaInfanterias, 0);		
	
	HacerVisibleTropa("CentuInf", TRUE);
	HacerVisibleTropa("MediInf", TRUE);
	
	DestruirTrigger("MeetPuebInf");
}

//----------------------------------------
Trigger "MeetPuebCab" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_PuebloCab", "CESAR")
)
Do
{
	
	SetParamObjetivo(hDefensaCaballaria, "DistribuirTropas", 100, hPatrullasCaballeria, 0, hDefensaFortalezaCaballeria, 0);
  	
	HacerVisibleTropa("CentuCab", TRUE);
	HacerVisibleTropa("MediCab", TRUE);
	
	DestruirTrigger("MeetPuebCab");
}

//----------------------------------------
Trigger "MeetPuebMaq" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_PuebloMaq", "CESAR")
)
Do
{
	
	SetParamObjetivo(hDefensaMaquinas, "DistribuirTropas", 100, hPatrullasMaquinas, 0, hDefensaFortalezaMaquinas, 0);
  
	HacerVisibleTropa("CentuMaq", TRUE);
	HacerVisibleTropa("MediMaq", TRUE);
	
	ActivarTrigger("MedicoMaqBye");
	
	DestruirTrigger("MeetPuebMaq");
}

//Huida médico del pueblo de las maquinas y especiales
//----------------------------------------
Trigger "MedicoMaqBye" [Inactivo]
(
 	(DarTropasVivasDeGrupo("G_DEFENSA3") <4) &&
 	(!EstaPuebloConquistado("CESAR", "Pueblo1") || !EstaPuebloConquistado("CESAR", "Pueblo2")) 
)
Do
{
		
	//DisposeHandle(&hDefensaMaquinas);
	
	if (!EstaPuebloConquistado("CESAR", "Pueblo1"))
	{
	hHuidaMedico = CrearObjetivo(hEstrategiaMaquinas, "HuidaYRefuerzo", hDefensaInfanterias, "MediMaq");
  }
  
  else
	{
	hHuidaMedico = CrearObjetivo(hEstrategiaMaquinas, "HuidaYRefuerzo", hDefensaCaballaria, "MediMaq");
  }
  
	AnyadirTropaAObjetivo(hHuidaMedico, "MediMaq");
	AnyadirGrupoAObjetivo(hHuidaMedico, "G_DEFENSA3");
  //SetParamObjetivo(hHuidaMedico, "Tactica", "ActitudBatallon", "Defensiva");
  AnyadirObjetivo(hEstrategiaMaquinas, hHuidaMedico);
  
	DestruirTrigger("MedicoMaqBye");
}

// El tercer pueblo no se rinde
//----------------------------------------
Trigger "TercerPuebloHostil" [Inactivo]
(
  (bRendicion1 && bRendicion2) ||
  (bRendicion1 && bRendicion3) ||
  (bRendicion2 && bRendicion3)  
)
Do
{
	
	DestruirTrigger("PuebInfTuyo");
	DestruirTrigger("PuebCabTuyo");
	DestruirTrigger("PuebMaqTuyo");
	
	DestruirTrigger("MeetPuebInf");
	DestruirTrigger("MeetPuebCab");
	DestruirTrigger("MeetPuebMaq");
	
	if ( !bRendicion1 )
	{
	  ActivarTrigger("MensajeNoRendir1");
	}
	else
	if ( !bRendicion2 )
	{
	  ActivarTrigger("MensajeNoRendir2");
	}
	else
	{
	  ActivarTrigger("MensajeNoRendir3");
	}
		
	DestruirTrigger("TercerPuebloHostil");
}


Trigger "MensajeNoRendir3" [Inactivo]
(
 	(!EstaTropaViva("CentuMaq") && !EstaTropaViva("MediMaq"))
)
Do
{
  
  MensajeLocucionado("21NC","LTEXT_MISION21_MENSAJE_06_TXT");  
  AvisoCivilizacion("CESAR", 234, 181);
	DestruirTrigger("MensajeNoRendir3");
}

Trigger "MensajeNoRendir1" [Inactivo]
(
 	(!EstaTropaViva("CentuInf") && !EstaTropaViva("MediInf"))
)
Do
{
  
  MensajeLocucionado("21NB","LTEXT_MISION21_MENSAJE_05_TXT");  
  AvisoCivilizacion("CESAR", 37, 193);
	DestruirTrigger("MensajeNoRendir1");
}

Trigger "MensajeNoRendir2" [Inactivo]
(
 	(!EstaTropaViva("CentuCab") && !EstaTropaViva("MediCab"))
)
Do
{
  
  MensajeLocucionado("21ND","LTEXT_MISION21_MENSAJE_07_TXT");  
  AvisoCivilizacion("CESAR", 167, 51);
	DestruirTrigger("MensajeNoRendir2");
}


// Grupos de Pompeyo que se unen al jugador
//----------------------------------------
Trigger "MercenariosPompeyoTuyos" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_CACHONDO", "CESAR")
)
Do
{
  
	MensajeLocucionado("21N6","LTEXT_MISION21_MENSAJE_00_TXT");		
	AvisoCivilizacion("CESAR", 266, 139);
	
	CambiarBandoPorGrupo("G_CACHONDO", "CESAR");
		
	DestruirTrigger("MercenariosPompeyoTuyos");
}

//----------------------------------------
Trigger "MercenariosPompeyoTuyosII" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_CASHONDO", "CESAR")
)
Do
{
	MensajeLocucionado("21N6","LTEXT_MISION21_MENSAJE_00_TXT");		
	AvisoCivilizacion("CESAR", 167, 171);	
	
	CambiarBandoPorGrupo("G_CASHONDO", "CESAR");
		
	DestruirTrigger("MercenariosPompeyoTuyosII");
}

//----------------------------------------
Trigger "MercenariosPompeyoTuyosIII" [Inactivo]
(
 	HanEntradoCivilizacionesEnZona("Z_CAJONDO", "CESAR")
)
Do
{
	MensajeLocucionado("21N6","LTEXT_MISION21_MENSAJE_00_TXT");		
	AvisoCivilizacion("CESAR", 20, 194);
	
	CambiarBandoPorGrupo("G_CAJONDOS", "CESAR");
		
	DestruirTrigger("MercenariosPompeyoTuyosIII");
}

// ---------------------------
Trigger "End" [ Activo ]  
(
  TRUE
)
Do
{
}