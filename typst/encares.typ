#import "@preview/fontawesome:0.2.1": *
#import "@preview/ilm:1.1.2": *
#import "@preview/note-me:0.2.1": *
#set text(lang: "es")
#show: ilm.with(
  title: [Encares de Psiquiatría],
  author: "M. Escobal",
  chapter-pagebreak: true,
  table-of-contents: outline(title: "Indice", depth: 2),
)
#let autor = "M. Escobal"
#set page(numbering: "1")
#set par(leading: 0.55em, first-line-indent: 1.8em, justify: true)
#let nivel = 2
#set heading(numbering: (..numeros) =>
  if numeros.pos().len() <= nivel {
    return numbering("1.1", ..numeros)
    }
)
#let encabezado(tamano) = {
  set text(size: tamano)
  set pagebreak(weak: true)
}

#show heading.where(level: 1): it => [
  #set text(size: 40pt)
  #it
  #pagebreak(weak: true)
]

#show heading.where(level: 2): it => [
  #pagebreak(weak: true)
  #set text(size: 32pt)
  #it
]

#show heading.where(level: 3): it => [
  #set text(size: 24pt)
  #it
]

#show heading.where(level: 4): it => [
  #set text(size: 18pt)
  #it
]

#show heading.where(level: 5): it => [
  #set text(size: 14pt)
  #it
]

#show heading.where(level: 6): it => [
  #set text(size: 12pt)
  #it
]

= Introducción

#include "Intro.typ"

#include "Semiologia.typ"

= Trastornos mentales orgánicos

#include "F00.typ"

#include "F05.typ"

= Trastornos por consumo de sustancias psicoactivas

#include "F10.typ"

#include "F10-26.typ"

#include "F11.typ"

= Trastornos psicóticos

#include "F20.typ"

#include "F22.typ"

#include "F22a.typ"

#include "F23.typ"

= Trastornos del humor
// Generalidades de trastornos del humor, en desaparición
#include "F30.typ"

#include "F31.typ"

#include "F32.typ"

= Trastornos de ansiedad

#include "F40.typ"

#include "F401.typ"

#include "F410.typ"

#include "F411.typ"

#include "F42.typ"

#include "F43.typ"

#include "F44.typ"

= Trastornos asociados a disfunciones fisiológicas

#include "F50.typ"

#include "F51.typ"

= Trastornos de la personalidad y del control de impulsos

#include "F60.typ"

#include "F632.typ"

#include "F680.typ"


= Retraso Mental

#include "F70.typ"

= Trastornos del desarrollo psicológico

#include "F84.typ"

= Trastornos de inicio en la infancia o adolescencia

#include "F90.typ"

== Otros trastornos de inicio en la niñez y adolescencia
=== F98.5 Tartamudez
Definición: alteración en la fluencia y/o patrón temporal del lenguaje que es inapropiado para la edad del individuo y persistente en el tiempo. Puede estar acompañado de fenómenos motores.

Otros nombres: trastorno de la fluencia de inicio en la infancia. Edad de inicio: 2 a 7 años. A los 16: 65-85% se recuperan.

==== Etiología
Desconocida. Conceptualización actual: dominancia incompleta de los centros primarios del lenguaje de etiología multifactorial.

Genética: da cuenta del 50-80% de los casos. Correlación entre hermanos: 19%. Riesgo x 3 en familiares de primer grado. Asociación con genes dopaminérgicos SLC6A3 y DRD2.

Comparte características con S de la Tourette: inicio en la infancia, hombres 4:1, curso fluctuante, empeoran con ansiedad, están asociados a tics, tienen anomalías cerebrales en los ganglios basales, empeoran por agonistas dopaminérgicos, mejoran con antagonistas. Infecciosa: algunos casos asociados a PANDAS (trastornos autoinmunes pediátricos asociados a infecciones estreptocóccicas), que están vinculados a Tourette y TOC.

Casos adquiridos en adultos: asociados a medicación y TEC.

= Otras situaciones clínicas

#include "R53.typ"

== IAE
=== Notas clínicas
Factores de riesgo para suicidio

=== Encare
==== Agrupación sindromática
===== Síndrome conductual
#tip[Evaluación de IAE: MMPPRRR]

Hace X tiempo:

- Método: intoxicación - traumatismo (grave) - asfíctico (grave).
- Móvil: situación difícil más o menos compartible / mínimo: inautenticidad (T de la P) / sin móvil aparente, no puede dar cuenta (contexto discordante, catatónico).
- Precauciones tomadas para evitar o no ser salvado \(gravedad) \* Premeditación: plan previo para
  llevarlo a cabo \(grave) - impulsividad, no existe reflexión entre
  representación y acto. \* Rectificación: total o no, culpabilidad,
  arrepentimiento, análisis de la situación \* Reiteración: AP de otros
  IAE \(gravedad). \* Repercusiones: física, ambiental \(manipulativo),
  intencionalidad, manejo del ambiente.

Clasificarlo y decir si es grave.

===== Síndrome secundario
<_síndrome_secundario>
- síndrome depresivo. \* síndrome biográfico: T de la P contexto
  depresivo, disfórico, intolerancia a las frustraciones, pobre control
  de impulsos, otros IAEs, conductas adictivas, conductas
  heteroagresivas. \* Síndrome delirante: vivencial + conductual
  \(comando alucinatorio). Contexto delirante. \* Síndrome
  histérico-conversivo contexto disociado.

- Síndrome disociativo discordante: contexto discordante. \* Síndrome
  deficitario intelectual adquirido / congénito - impulsividad

== Estupor
<_estupor>
=== Notas clínicas
<_notas_clínicas_23>
Esto es un escueto resumen de un encare de un paciente que se presenta
con un estupor catatónico en una esquizofrenia. El resto de los datos
los completan con elementos de otras historias. Tomar en cuenta que un
estupor puede presentarse en diferentes patologías \(estupor
melancólico, histérico, esquizofrenia, confusional).

=== Encare
==== Agrupación sindromática
+ síndrome de inhibición psicomotriz Permanente, cotidiano, grave. Estupor.
+ síndrome conductual
  + Impulsivo: IAE, Crisis de EPM con hetero-agresividad, sin reflexión / meditación.
  + Conductas basales y pragmatismos.
+ síndrome disociativo-discordante IDEA

Hacemos diagnóstico de síndrome Catatónico, máxima discordancia psicomotriz: reducción de iniciativa motriz, máxima inhibición psicomotriz (estupor catatónico), con hipomimia, hipogestua-lidad, clinofilia. Sobre este fondo se presentan descargas motoras enigmáticas y absurdas (IAE, hetero):
- Inhibición psicomotriz
- Descarga impulsiva
- Negativismo-oposicionismo

==== Diagnóstico positivo
Psicosis Psicosis Crónica Esquizofrenia En período de estado Tipo catatónica Descompensada

==== Diagnósticos diferenciales
+ Otras causas de estupor:
  + Depresivo: más lento, precedido de síntomas afectivos, AP o AF afectivos.
  + Confusional: organicidad (fiebre, etc.), no existe catalepsia
  + Histérico: se jerarquiza el mutismo, pero se comunica por otros medios.
+ Depresión psicótica en esquizofrenia: (depresión postpsicótica), donde existen síntomas   depresivos y no existen síntomas discordantes. Clinofilia y disminución de la expresividad van por cuenta de síntomas negativos.
+ Otras formas de esquizofrenia: hebefrénica (predomina la jovialidad pueril y trastornos conductuales), paranoide (predomina el delirio).
+ Otras psicosis crónicas: Parafrenia (30-50 años, delirio polimorfo fantástico, persecutorio, megalomaníaco, a mecanismo imaginativo, para-lógico, bipolaridad), paranoia \(ambos carecen de evolución deficitaria, no condicionando retirada a un mundo autista).

==== Paraclínica
Descartar lo orgánico.

==== Tratamiento
Antipsicóticos. ECT.

==== Evolución y pronóstico
MALO por estupor, actos impulsivos. Potencialmente mortal por deshidratación, infecciones, trastornos hidroelectrolíticos con arritmias.

== Síndrome Neuroléptico Maligno
=== Notas clínicas
Puede ser causado por TODOS los antipsicóticos \(51% APPG y 45% APSG: incluyendo aripiprazol, asenapina, clozapina, iloperidona, olanzapina, paliperidona, quetiapina, risperidona y ziprasidona). Incidencia 0.2%, sobre todo con AP1G incisivos \(Haloperidol en el 44% de todos los casos), menor con AP2G. AP1G sedativos no tienen registro como causa única de SNM. Factores de riesgo: patología orgánica preexistente, uso concomitante de litio, infección, retirada de anticolinérgicos o alcohol. #footnote[Schneider, M., Regente, J., Greiner, T., Lensky, S., Bleich, S., Toto, S., … & Heinze, M. \(2020). Neuroleptic malignant syndrome: evaluation of drug safety data from the AMSP program during 1993–2015. European Archives of Psychiatry and Clinical Neuroscience, 270, 23-33.]. Es más frecuente en hombres en un 50%, sobre todo jóvenes. #footnote[Gurrera, R. J. \(2017). A systematic review of sex and age factors in neuroleptic malignant syndrome diagnosis frequency. Acta Psychiatrica Scandinavica, 135\(5), 398-408.]. Desarrollo: 16% dentro de las 24 horas de iniciación del antipsicótico, 66% a la semana, 90% ocurren dentro de los primeros 30 días.

=== Encare
==== Agrupación sindromática
===== Síndrome de alteración de la conciencia
Ver Delirium

===== Síndrome de inhibición psicomotriz
Estupor catatónico. Rigidez muscular generalizada (en caño de plomo). Aquinesia.

===== Fenómenos acompañantes
Fiebre, temblor, sialorrea. Distonía, trismo, mioclono. Disartria, disfagia, rabdomiólisis. Secuencia habitual\(70%): alteración de conciencia rigidez muscular fiebre disfunción autonómica.

==== Diagnóstico
Es un diagnóstico de exclusión (ver diferenciales).

===== Criterios propuestos por DSM-IV
+ Rigidez muscular intensa + fiebre + asociación temporal con administración de antipsicótico.
+ 2 o + de: diaforesis, disfagia, temblor, incontinencia, disminución del nivel de conciencia \(de confusión a coma), mutismo, taquicardia, PA elevada o fluctuante, leucocitosis, aumento de CPK o equivalente.
+ Descartar otras causas \(drogas, neurológicas) D. No se explica mejor por otro cuadro \(Síndrome catatónico)

===== Criterios de expertos
Un consenso de expertos propuso criterios algo más restrictivos:

1. Exposición a un antagonista de DA o retiro de un agonista de DA en las 72 horas anteriores al inicio de los síntomas
2. Hipertermia en 2 ocasiones mayor o iguala 38oC oral.
3. Rigidez
4. Alteración del estado mental con reducción o fluctuación de niveles de conciencia.
5. Elevación de la CPK al menos 4 veces por encima de lo normal.
6. Labilidad del sistema Simpático en al menos 2 de los siguientes parámetros: a. PA \> 25% sobre lo basal b. Fluctuaciones de PA \> 20 mmHg en la diastólica o 25 mm Hg en la sistólica dentro de 24 horas c. Diaforesis d. Incontinencia urinaria.
7. Hipermetabolismo definido como FC % sobre lo basal y FR \>50% sobre lo basal.
8. Ausencia de otras etiologías \(infecciones, toxinas, causas metabólicas o neurológicas).

==== Diagnóstico diferencial
Causas orgánicas:

- Causas neurológicas:
  - Drogas: estados hipermetabólicos secundarios a drogas (fenilciclidona)
  - Infecciosas: encefalitis viral aguda, tétanos, infecciones parasitarias, bacterianas, micóticas
  - Efecto de masa: tumores, abscesos
  - ACV
  - Traumático
- Catatonía: en un trastorno del humor o en esquizofrenia. La catatonía maligna puede ser indistinguible del SNM. - Endocrinológico: feocromocitoma, tirotoxicosis
- Sistémico: LES, enfermedades del tejido conectivo.
- Otros: insolación, síndrome serotoninérgico, toxinas, hipertermia maligna luego de exposición a agentes anestésicos inhalatorios, hipertermia parkinsoniana por discontinuación de agonistas DA (levodopa, amantandina), hipertermia por estimulantes (cocaína, anfetaminas) o abuso de alucinógenos (fenciclidina), envenenamiento anticolinérgico, abstinencia de alcohol o sedantes.

==== Paraclínica

Valoración general \* Hemograma: leucocitosis. \* Ionograma:
hiponatremia / hipernatremia. Gasometría: acidosis metabólica o hipoxia
en 75% CPK: elevada \* 4 \(95%) Orina: mioglobinuria \(67%) Función
renal: falla renal aguda por necrosis muscular producto de la rigidez,
hipertermia e isquemia. EEG: enlentecimiento difuso en 54% Sideremia: Fe
disminuido Estudio de LCR y neurogimagen: no son de primera línea,
suelen dar normales.

==== Etiopatogenia y fisiopatología
<_etiopatogenia_y_fisiopatología_2>
Desencadenado por bloqueo de receptores D2 de centros reguladores del
hipotálamo y tronco cerebral que provocan un síndrome hipermetabólico
generalizado sistémico. Se postula que la disregulación con
hiperactividad del SN Simpático explica muchas manifestaciones del SNM.

Una disregulación del Simpático previa por estrés emocional podría
constituir una vulnerabilidad par el SNM. Otro factor de vulnerabilidad
sería la hipoactividad D2 previa. Factores de riesgo: agitación
psicomotriz, administración parenteral, aumento rápido de dosis, dosis
total diaria elevada, varón joven, síndrome orgánico cerebral, retardo
mental. Otros factores: extenuación, deshidratación, malnutrición,
episodios previos de SNM \(17-30% de incidencia si se someten nuevamente
a antipsicóticos).

==== Tratamiento
Cesación de agente causante. Tratamiento de apoyo

- monitorización constante
- aporte de volumen: agresivo.
- corrección de electrolitos
- fluidos alcalinizados o carga con bicarbonato puede prevenir falla renal
- persistencia de hipertermia: medidas físicas para bajar temperatura

Farmacológico:

- Benzodiacepinas: Lorazepam i/v 1-2 mg cada 4-6 horas. Reducción de rigidez y fiebre en 24-47 horas, remisión de síntomas catatónicos (mutismo e inmovilidad).
- Agentes dopaminérgicos: revierten parkinsonismo, el tiempo de recuperación y la mortalidad a la mitad solos o en combinación.
- Amantadina 200-400 mg/día en dosis divididas v/o o por SNG.
- Bromocriptina 2.5 mg c/12 o c/8 aumentando hasta un total de 45 mg/día si se requiere. Puede empeorar la psicosis y precipitar hipertensión y vómitos. Debe continuarse 10 días después de la remisión para evitar recurrencia si se discontinúa precozmente.
- Dantrolene: relajante de músculo esquelético. Útil en caso asociados con hipertermia extrema y rigidez. Se puede usar junto con BZD o con un agonista DA. No se puede administrar con bloqueadores de calcio. Dosis: inicio 1-2.5 mg/kg IV, luego 1 mg/Kg cada 6 horas si hay respuesta luego de la primera dosis. Efectos secundarios: insuficiencia respiratoria / hepática. Debe continuarse 10 días luego de la resolución de los síntomas por probabilidad de recurrencia si se retira precozmente.
- ECT: puede ser eficaz. Segunda línea, si fallan fármacos o si no se puede descartar una catatonía letal. Se hacen 6-10 sesiones. Aparece respuesta a la 4#sub[a]. Vigilar la aparición de lesión muscular y de hiperkalemia.

==== Evolución y pronóstico

Luego de ser reconocido y tratado, el SNM es autolimitado a menos que existan complicaciones. El tiempo promedio de recuperación son 7-10 días luego de la discontinuación de la droga. Casi todos los pacientes se recuperan en 30 días o menos. El uso de medicación de depósito puede dar episodios del doble de duración. En algunos pacientes puede haber catatonía y parkinsonismo residual por meses. La ECT suele ser útil para estos síntomas residuales. Tasa de mortilidad: originalmente era de un 30%, actualmente hay reportes de 0-15%.

Buen pronóstico:
- diagnóstico precoz
- rápida discontinuación del antipsicótico
- uso de farmacoterapia específica

Mal pronóstico:
- mioglobinuria
- falla renal

La muerte en general se produce por falla cardíaca, respiratoria, neumonia por aspiración, embolia pulmonar, falla renal mioglobinúrica o coagulación intravascular diseminada.

Si se reinicia el antipsicótico de forma inmediata: recurrencia de un 30%. Se recomienda esperar al menos 2 semanas después de la resolución para retomar cualquier antipsicótico- Se recomienda una dosificación lenta / gradual de neuroléptico sedativo o de APSG. Preferentemente usar antagonistas parciales de DA \(aripiprazol, brexpiprazol, cariprazina).

Obtener consentimiento informado antes de reiniciar. En general no hay recurrencia si se empieza la misma droga luego de las 4 semanas de la recuperación del episodio inicial.
= Apéndice

#include "Fragmentos.typ"

#include "Abreviaturas.typ"
