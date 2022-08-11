*=====================================================================

// PROYECTO: Primera sesión intermedia STATA
// PROGRAMA: sesion_6.do
// TAREA: De long a wide
// CREADO POR: Manuel Toral
// FECHA DE CREACIÓN: 2022-07-29
// FECHA DE ACTUALIZACIÓN: 2022-08-01

*========================================================================

cd "C:\Users\User\Documents\MUCD_stata_intermedio\Sesion_1"

// 1. Datos
import delimited "data\IDEFC_NM_jun22.csv", clear

preserve


egen wanted = anymatch(año), values(2015)

// Regex

gen homicidio = regexm(subtipodedelito, "Homicidio|homicidio")



// 2. Dos caminos y un proceso

// 2.1 Camino 1

rename (enero-diciembre) (delito(#)) ,addnumber

restore

// 2.2 Camino 2

// 2.2 Camino 2

preserve

foreach v of varlist enero-diciembre {
    rename `v' delito_`v'
  } 

foreach v in enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre {
    rename `v' delito_`v'
  } 

// 2.3 Camino 3

preserve

local meses enero febrero marzo abril mayo junio julio agosto septiembre ///
	octubre noviembre diciembre

foreach v of local meses {
    rename `v' delito_`v'
  } 
  
  
  
// Otras funciones de foreach

gen int homicidio = 0
foreach v of varlist tipodedelito {
    replace homicidio = homicidio + 1 if `v' == "Homicidio"
}



  


