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

= Trastornos mentales orgánicos

#include "F00.typ"

#include "F05.typ"

= Trastornos por consumo de sustancias psicoactivas

#include "F10.typ"

#include "F11.typ"

= Trastornos psicóticos

#include "F20.typ"

#include "F22.typ"

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
<_trastornos_de_la_personalidad_y_del_control_de_impulsos>
== Trastornos de la personalidad
<_trastornos_de_la_personalidad>
=== Notas clínicas
<_notas_clínicas_17>
==== Subtipos
<_subtipos>
#block[
#strong[Grupo A \* Paranoide \(F60.0) #strong[Obstinado \(Compulsivo)]
Fanático]

]
\(Narcisista) #strong[Querellante \(Negativista)] Insular \(Evitativo)
#strong[Maligno \(Sádico) \* Esquizoide \(F60.1)] Remoto \(Evitativo,
Esquizotípico) #strong[Lánguido \(Depresivo)] Desafectivizado
\(Compulsivo) #strong[Despersonalizado \(Esquizotípico) \* Esquizotípico
\(F21] Insípido \(Esquizode, Depresivo, Dependiente) #strong[Timorato
\(Evitativo, Negativista) .Grupo B \* Antisocial \(F60.2, Disocial)]
Nómade \(Esquizoide, Evitativo) #strong[Malevolente \(Sádico,
Paranoide)] Codicioso \(patrón puro) #strong[Arriesgado \(Histriónico)]
Defensor de reputación \(Narcisista) \* Límite \(F60.3, Inestable) \*
Histriónico \(F60.4) #strong[Apaciguador \(Dependiente, compulsivo)]
Vivaz \(Narcisita) #strong[Intempestivo \(Negativista)] Insincero
\(Antisocial) #strong[Teatral \(puro)] Infantil \(Límite) \* Narcisista
\(F60.8, Otros) #strong[Inescrupuloso \(Antisocial)] Elitista \(puro)
#strong[Enamorado \(Histriónico)] Compensatorio \(Negativista,
Evitativo) .Grupo C \* Obsesivo \(F60.5, Anancástico #strong[Concienzudo
\(Dependiente)] Burocrático \(Narcisista) #strong[Puritano \(Paranoide)]
Parsimonioso \(Esquizoide) #strong[Acosado \(Negativista) \* Evitativo
\(F60.6, Ansioso)] Fóbico \(Dependiente) #strong[Conflictuado
\(Negativista)] Hipersensitivo \(Paranoide) #strong[Autoabandonado
\(Depresivo) \* Dependiente \(F60.7)] Inquieto \(Evitativo)
#strong[Desinteresado \(Depresivo)] Inmaduro \(puro)
#strong[Complaciente \(Masoquista)] Ineficaz \(Esquizoide) .Otros \*
Negativista \(Pasivo-agresivo) #strong[Vacilante \(Límite)] Descontento
\(Depresivo) #strong[Tortuoso \(Dependiente)] Abrasivo \(Sádico) \*
Sádico #strong[Sin carácter \(Evitativo)] Tiránico \(Negativista)
#strong[Imponedor \(Compulsivo)] Explosivo \(Límite) \* Depresivo
#strong[Intranquilo \(Evitativo)] Autodespectivo \(Dependiente)
#strong[Malhumorado \(Negativista)] Fashion \(Histriónico, Narcisista)
#strong[Mórbiudo \(Masoquista) \* Masoquista] Virtuoso \(Histriónico)
#strong[Posesivo \(Negativista)] Autoarruinado \(Evitativo) \*\*
Oprimido \(Depresivo) \=\=\=\= Trastorno esquizotípico de la
personalidad

#block[
#strong[Tratamiento psicofarmacológico Evidencia escasa
footnote:\[Jakobsen, K.]

]
D., Skyum, E., Hashemi, N., Schjerning, O., Fink-Jensen, A., & Nielsen,
J. \(2017). Antipsychotic treatment of schizotypy and schizotypal
personality disorder: a systematic review. Journal of
Psychopharmacology, 31\(4), 397-405.\]. - Amisulpiride: podría ser
eficaz para algunos de los síntomas cognitivos \(evidencia A) -
Risperidona: dosis de 2mg mejorarían escala PANSS. - Antipsicóticos en
genera peuden mejorar algunos síntomas psicótico-símiles \(ilusiones,
hostilidad, ideación paranoide)

=== Encare
<_encare_19>
==== En suma
<_en_suma_7>
Destacar: MC, patrón horizontal de comportamiento.

==== Agrupación sindromática
<_agrupación_sindromática_16>
===== Síndrome conductual
<_síndrome_conductual_8>
- Cuadro actual: IAE, heteroagresión, en un contexto de impulsividad \*
  Curso de vida \* Conductas basales y pragmatismos

Destacando: baja tolerancia a las frustraciones, rápido pasaje al acto.

===== Otros síndromes
<_otros_síndromes_2>
- Síndrome depresivo \(disfórico)

- Síndrome delirante.

- Síndrome de ansiedad-angustia u otro de la serie neurótica.

===== Nivel y Personalidad
<_nivel_y_personalidad>
Adolescente: destacar que su personalidad no está plenamente
desarrollada. Conflictividad infantil Trastornos de la atención,
hiperquinesia en etapa escolar. Rasgos: pautas duraderas de percibir,
relacionarse, concebir el entorno y a sí mismo que se expresan en una
amplia gama de contextos sociales y personales significativos, en donde
encontramos elementos de varias series \(poner ejemplos de c/u):

- Histriónicos

- Dependientes

- Paranoicos

- Antisociales, etc.

En BL: fundamentalmente rasgos marcados por la inestabilidad en:

- Relaciones interpersonales \(ejemplo: admiración - devaluación)

- Afectividad: cambios rápidos de estado \(depresión - irritabilidad).
  Cólera inadecuada y excesiva y falta de control de los impulsos, con
  heteroagresividad \(ejemplos). Sentimiento crónico de vacuidad o
  abatimiento.

- Identidad personal o autoimagen: múltiples carreras, trabajos,
  parejas.

- Conductas: impulsividad en actividades potencialmente dañinas
  \(drogas, alcohol). Autoagresividad: IAE.

==== Diagnóstico positivo
<_diagnóstico_positivo_16>
- Rígidos, maladaptativos, inflexibles

- Corte longitudinal

- Malestar subjetivo

- Egosintónico, aloplástico

- Contacto interpersonal

===== Trastorno de personalidad
<_trastorno_de_personalidad>
Según DSM, ya que se trata de un paciente \> de 18 años en el cual los
rasgos anteriormente definidos son rígidos, maladaptativos e inflexibles
y afectan el corte longitudinal de su existencia, provocando malestar
subjetivo y mal funcionamiento sociolaboral y afectivo \(conflictividad
que se da en un contexto interpersonal). Dicha conflictividad es vivida
como egosintónica: aceptable, inobjetable y parte de sí mismo, que le
genera conductas y exigencias hacia los otros, por lo que decimos que
son aloplásticas.

===== Grupo
<_grupo>
Pensamos que se trata de un TP del grupo B por las características
reseñadas, centradas en la labilidad emocional, extroversión y s/t la
impulsividad, en un contexto errático de conducta y afectividad LEEIE
\(lábiles, emotivos, extrovertidos, inestables, erráticos).

===== Tipo
<_tipo>
Por el patrón de inestabilidad analizado manifestado en el afecto,
conducta, autoimagen y relaciones objetales que corroboraremos en
reiteradas entrevistas, nos orientamos a un trastorno de la personalidad
tipo fronterizo o límite \(del DSM)

===== Descompensado
<_descompensado>
De éste decimos que está descompensado por:

- Crisis conversiva

- Síndrome depresivo disfórico \(por suma de fracasos)

- IAE c/ del monto de impulsividad

- Síndrome de ansiedad-angustia

===== Causa de descompensación
<_causa_de_descompensación>
Se plantea como causa de descompensación: estrés psicosocial.

==== Diagnóstico diferencial
<_diagnóstico_diferencial_9>
- Con otros trastornos de la personalidad: si bien existen elementos
  histriónicos, antisociales, pensamos que no centran el cuadro clínico
  y no pensamos por el momento que se trate de un trastorno histriónico
  o antisocial de la personalidad. De cualquier modo investigaremos en
  reiteradas entrevistas, sabiendo que cada tipo comparte
  características con los restantes. \* Psicosis tóxica \* Trastorno de
  la personalidad orgánico \(DSM): epilepsia parcial compleja, AP de TEC
  o trauma obstétrico. \* Neurosis: egodistónica, autoplástica. La
  conflictiva es intrapsíquica y no interpersonal. \* Depresión en
  adolescente: se puede presentar con trastornos de conducta. Crisis de
  adolescencia. \* Trastorno afectivo primario

==== Diagnóstico etiopatogénico y psicopatológico
<_diagnóstico_etiopatogénico_y_psicopatológico_13>
===== Etiopatogenia
<_etiopatogenia_7>
Se plantea para esta patología una etiopatogenia multifactorial.

#block[
#strong[Biológico]

]
AP de trastorno atencional \(DSM), cualquier trastorno neurológico de la
infancia

AF de enfermedad depresiva o alcoholismo, que vinculan al trastorno
Borderline con los trastornos depresivos

- Adolescente con padres antisociales \* Carencia afectiva \* Pérdida
  temprana del vínculo con sus padres \* Perturbación del medio,
  alcoholismo, violencia, prostitución \* Maltrato reiterado \*
  Alteraciones importantes a nivel del curso de vida \* Refuerzo
  positivo social inconsciente: recompensa a conductas antisociales \*
  Marco social poco continente.

===== Psicopatología
<_psicopatología_8>
Se invoca un terreno de vulnerabilidad básica del individuo para
mantener un sentido estable del yo \(yo fragmentado con relaciones de
objeto ambivalentes). Otto Kernberg: hace hincapié en:

1. Síndrome de difusión de la identidad: que nos muestra una incapacidad
del paciente para mantener una identidad yoica estable. 2. Utilización
de mecanismos de defensa arcaicos primarios: ES PRO AC NE • Escisión •
Proyección reactiva • Acting Out • Negación Escisión: división
ambivalente de las personas en buenas y malas tanto del presente como
del pasado \(poner ejemplos) Proyección: atribución a los demás de sus
propios sentimientos, no reconocidos como tales. Negación: afirma
proyección y escisión. Acting-out: expresión directa mediante la acción
de un deseo o conflicto inconsciente evitando el acceso a la conciencia
de la idea o el afecto que la acompaña. 3. Mantenimiento del juicio de
la realidad.

==== Paraclínica
<_paraclínica_18>
Orientada a:

- Confirmar diagnóstico de tipo \* Descartar diagnósticos diferenciales
  \* Valoración general \* Con vistas al tratamiento

===== Biológico
<_biológico_20>
Examen físico, rutinas, VIH, VDRL, estigmas de consumo de drogas. Con
vistas al tratamiento con carbamazepina: hígado y MO \(descartando
leucopenia, trombocitopenia, hepatopatía), test de embarazo
\(promiscuidad).

===== Psicológico
<_psicológico_22>
Reiteradas entrevistas para confirmar patrón de comportamiento. Una vez
superado el cuadro actual. Tests de personalidad proyectivos \(TAT,
Rorschach), no proyectivos \(Minnesota), evaluando fortaleza yoica,
mecanismos de defensa y manejo de la angustia, elementos que utilizamos
con el fin de implementar una psicoterapia. Test de nivel \(Weschler).
3. Social Fundamental para el diagnóstico evaluando aquellos aspectos
interpersonales del trastorno. Crisis anteriores y repercusión en el
paciente y en el medio, medicación recibida y respuesta a la misma.
Policía, juez.

==== Tratamiento
<_tratamiento_23>
Dirigido a:

1. actuar sobre el episodio actual, previniendo nuevos IAE, procurando
la remisión del cuadro depresivo y la ansiedad-angustia. 2. a largo
plazo, basado s/t en favorecer la reinserción social del paciente.

===== Episodio actual
<_episodio_actual_2>
Internación en hospital psiquiátrico por: no existencia de continencia
interna, medio poco continente \(riesgo de auto/heteroagresividad),
riesgo de IAE por impulsividad y contexto depresivo. Puede ser
compulsiva. Breve. Equipo multidisciplinario. Vigilar IAE,
heteroagresividad, fugas. Visitas continentadoras. Sala individual.

#block[
#strong[Biológico]

]
Carbamazepina 200 mg c/12 hs v/o, 200 mg c/ pocos días hasta 1200-1600
mg. Actúa sobre descontrol, labilidad emocional e impulsividad.
Monitoreo del polo hepático y médula ósea. Agregar si la ansiedad es o
dar si existen contraindicaciones: Clonazepam, empezando con 2 mg VO c/8
hs y según tolerancia hasta 16 mg/día. Su función es sedante y
ansiolítica, además de estabilizador del humor. Provee de rápida
sedación. Opción: Haloperidol 1-2 mg VO, propericiazina.

Para el síndrome depresivo: Fluoxetina 20 mg H:8 v/o. A los 2 días,
agregaremos 20 mg VO h:14, monitorizando efectos secundarios frecuentes
como ansiedad, insomnio y según la tolerancia iremos pudiendo llegar a
80 mg/día. Si existen AP: a largo plazo.

En suma: durante su estancia en el hospital: Carbamazepina, Clonazepam y
Haloperidol \(de ser necesario). Si hay marcada ansiedad, nos
inclinaremos por paroxetina o fluvoxamina como antidepresivos ya que
además poseen un efecto sedante \(inicio, aumentos, controles de efectos
secundarios, latencia).

Para el insomnio: Flunitrazepam VO 2 mg H:20 a regular según respuesta,
que iremos retirando una vez controlados los parámetros del sueño, dado
el \> riesgo de AE en horas de la noche.

Si se agita: levomepromazina 25 mg 1 amp IM. PDA: Haloperidol 5 mg IM
h:20.

#block[
#strong[Psicológico]

]
Entrevistas reiteradas para afianzar el vínculo, manteniendo límites
claros y no realizando concesiones, evitando el sobreinvolucramiento.

#block[
#strong[Social]

]
Iniciaremos psicoeducación de la familiar, informando sobre el
trastorno, el pronóstico, e insistiendo en la importancia de los
controles y de la terapia familiar. Otorgaremos el alta hospitalaria
cuando haya retrocedido el cuadro actual.

===== A largo plazo
<_a_largo_plazo_5>
\=\=\=\=\=\= Biológico

Controles de medicación en policlínica, al principio semanales y luego
hasta 1 x mes. Evitaremos la polifarmacia, disminuiremos en la evolución
la medicación \(para evitar adicción y facilitar cumplimiento) al mínimo
indispensable. Mantendremos Carbamazepina a largo plazo y un tratamiento
antidepresivo de 12 meses como mínimo.

\=\=\=\=\=\= Psicológico

Psicoterapia de apoyo, buscando mejor nivel de funcionamiento,
analizando la eventualidad de psicoterapia de corte psicoanalítico o
cognitivo-conductual. Buscaremos ® la rigidez de rasgos adaptativos y la
interferencia con el funcionamiento cotidiano. Sabemos de la dificultad
para la inserción en cualquier psicoterapia.

\=\=\=\=\=\= Social

Tratamiento familiar. Grupos de adolescentes, comunidad terapéutica para
jóvenes con TP, procurando la rehabilitación social. NA o AA.

==== Evolución y pronóstico
<_evolución_y_pronóstico_17>
Enfermedad de evolución crónica con morbimortalidad con tendencia a
disminuir en la edad adulta la inadaptación social. El cuadro actual
será compensado con el tratamiento instituido y a largo plazo depende
del éxito de la rehabilitación, de la adhesión al tratamiento a largo
plazo y de la continencia social. Sujeto a complicaciones depresivas,
episodios psicóticos breves, trastornos de conducta con consecuencias
ML, consumo de sustancias y riesgo para HIV-SIDA.

== Cleptomanía
<_cleptomanía>
=== Encare
<_encare_20>
==== Agrupación sindromática
<_agrupación_sindromática_17>
===== Síndrome de alteración del control de impulsos
<_síndrome_de_alteración_del_control_de_impulsos>
Dado por fracaso reiterado en los intentos de resistirse al impulso de
robar objetos que no se utilizan para uso personal o por fines
lucrativos \(los objetos suelen deshecharse, regalarse o esconderse). El
acto está precedido por sensación de tensión emocional y seguido de
gratificación durante e inmediatamente después de realizar el acto. El
acto se realiza de forma solitaria sin grandes esfuerzos para evitar ser
descubierto. B. Otros síndromes síndrome de ansiedad angustia, síndrome
depresivo \(vinculado a culpa). Esto no impide la repetición del acto.

==== Personalidad y nivel
<_personalidad_y_nivel_15>
==== Diagnóstico positivo
<_diagnóstico_positivo_17>
Cleptomanía

==== Diagnóstico diferencial
<_diagnóstico_diferencial_10>
• Hurto recurrente sin trastorno mental manifiesto: son actos
planificados y existe un motivo de ganancia personal. • Deterioro
cognitivo \(olvido de pagar objetos, alteración de juicio con
desinhibición que lleva a conductas de robo) • Psicosis: hurto en
contexto discordante, delirante o por comando alucinatorio. • Trastorno
de la personalidad borderline o antisocial: en este caso no hay una
conducta maladaptativa sino un patrón que afecta todas las áreas de la
vida de la persona

==== Etiopatogenia y psicopatología
<_etiopatogenia_y_psicopatología_4>
==== Paraclínica
<_paraclínica_19>
Biológico: ninguna. Psicológico: tests de personalidad.

==== Tratamiento
<_tratamiento_24>
===== Biológico Antidepresivos + tratamiento de cuadros comórbidos.
<_biológico_antidepresivos_tratamiento_de_cuadros_comórbidos>
===== Psicologico • exposición in vivo + prevención de respuesta •
<_psicologico_exposición_in_vivo_prevención_de_respuesta>
reestructuracion cognitiva • sensibilización encubierta •
desensibilización sistematica \=\=\=\= Evolución y pronostico \=\=\=
Fuentes Comité de consenso de Catalunya. Recomendaciones

== Trastorno facticio
<_trastorno_facticio>
Producción intencionada o fingimiento de síntomas o incapacidades
somáticas o psicológicas

Sinónimos: Síndrome de Münchausen, paciente peregrinante, visitador de
hospitales, \"hospitalismo\".

Excluye: simulación, Münchausen por poderes.

=== Encare
<_encare_21>
==== Diagnóstico positivo
<_diagnóstico_positivo_18>
#block[
#strong[CIE-10 - Patrón persistente de producción intencionada o
simulación de]

]
síntomas y/o daño autoinfligido para producirse los síntomas. - Sin
evidencia de motivación externa \(económica, evitación de daño). Excluye
simulación. - Excluye otro trastorno que pueda explicar mejor los
síntomas.

#block[
#strong[DSM-IV - Fingimiento o producción intencionada de signos o
síntomas]

]
físicos o psicológicos - El sujeto busca asumir el rol de enfermo -
Ausencia de incentivos externos \(económico, legal)

Especificadores:

- Con predominio de síntomas psicológicos - Con predominio de síntomas
  físicos - Con ambos

==== Diagnóstico diferencial
<_diagnóstico_diferencial_11>
- Enfermedad física verdadera - Simulación - Trastorno facticio por
  poderes - Trastornos somatomorfos

= Retraso Mental
<_retraso_mental>
== Retardo mental
<_retardo_mental>
=== Notas clínicas
<_notas_clínicas_18>
=== Encare
<_encare_22>
==== En suma
<_en_suma_8>
Analfabetismo Pensión por incapacidad Laboral - núcleo familiar AF:
Retraso Mental - Alcoholismo. AP: Escuela de Recuperación, INAU.

==== Agrupación sindromática
<_agrupación_sindromática_18>
Según motivo de ingreso:

===== Síndrome conductual
<_síndrome_conductual_9>
Crisis de excitación psicomotriz \(conversiva). IAE en contexto de
impulsividad. Heteroagresividad. Fugas.

- Actual Incapacidad en previsión de actos y sus consecuencias:
  alteración del juicio.

- Curso de vida Pauta de heteroagresividad que demuestra baja tolerancia
  a las frustraciones y un pobre control de los impulsos. Conductas
  antisociales. Consumo de sustancias.

- Pragmatismos y conductas basales.

===== Síndrome delirante
<_síndrome_delirante_5>
Temática pobre, ideas y supersticiones ingenuas, alta incidencia
sociocultural.

===== Síndrome deficitario intelectual \(congénito o precozmente adquirido)
<_síndrome_deficitario_intelectual_congénito_o_precozmente_adquirido>
- Escolaridad: deficiente, destacar analfabetismo. \* Pensamiento:
  pobre, pueril, concreto, anecdótico. No puede dar cuenta de
  situaciones importantes de su vida. baja capacidad de abstracción. \*
  Logros: incapacidad adaptativa social, falta de habilidad en resolver
  problemas cotidianos que lo llevan a una disminución de la autonomía y
  responsabilidad esperadas para su edad evidenciado en: #strong[Logros
  sociales escasos.] Escasos logros a nivel laboral, familiar, etc. \*\*
  Dificultades en manejo del dinero.

A confirmar por tests psicométricos.

===== Otros
<_otros_3>
Epilepsia.

==== Personalidad y nivel
<_personalidad_y_nivel_16>
Yo débil:

- Baja tolerancia a las frustraciones

- Incapacidad de adaptación a nuevas situaciones.

- Existencia acotada, dependiente, círculo restringido de intereses.

- Dificultad para solucionar conflictos que lleva a:

- Inhibición, oposición, desafío, terquedad, mitomanía.

- Descargas bruscas de tensión emocional.

- Alteración del juicio: no existe previsión de consecuencias de sus
  actos.

- Rechazo de imperativos morales \(o sumisión a los mismos).

- Egocentrismo.

Personalidad: teñida por el déficit intelectual. Personalidad
defectuosa.

==== Diagnóstico positivo
<_diagnóstico_positivo_19>
===== Nosografía clásica
<_nosografía_clásica_17>
#block[
#strong[Oligofrenia o Retraso Mental.]

]
Diagnóstico clínico presuntivo por:

- Déficit escolar importante \* Incapacidad adaptativa social \* Inicio
  en etapa de desarrollo \(\< 18 años)

A confirmar por tests psicométricos \(CI\<70). Dadas las alteraciones
del pensamiento … …. inferimos que clínicamente se halla por debajo de
los parámetros normales.

#block[
#strong[Grado de déficit]

]
Diagnóstico clínico-psicométrico. Del punto de vista clínico:

- Leve: puede acceder a algún nivel de enseñanza. Entrenable y educable
  \(puede hablar, leer y escribir bien). \* Moderado: no educable,
  entrenable \(… lo que valoraremos en sucesivas entrevistas y una vez
  superado el cuadro actual). \* Grave: se acompaña de trastornos
  motores importantes, sobre todo neurológicos, no existe autonomía en
  habilidades elementales. Necesita supervisión continua. No educable,
  no entrenable.

#block[
#strong[Tipo]

]
Disarmónico por la inestabilidad afectiva, con reacciones emotivas
frecuentes bajo la forma de reacciones explosivas de
auto/heteroagresividad \(y otros trastornos de conducta). Armónico:
buena adaptación, docilidad, colaboración, pasividad y obediencia
\(retraso intelectual simple).

#block[
#strong[Complicado]

]
Con crisis convulsiva, conversiva, IAE, aumento del monto de
impulsividad, síndrome delirante, etc.

#block[
#strong[Causa de descompensación]

]
Biopsicosocial.

===== CIE-10 - DSM-IV
<_cie_10_dsm_iv_3>
Al codificar en Eje II, es compatible con diagnósticos del eje I \(el
eje I descompensa el eje II). F70 Retraso mental leve F71 Retraso mental
moderado F72 Retraso mental grave F73 Retraso mental profundo F78 Otro
retraso mental F79 Retraso mental sin especificación Cuarto carácter
para especificar la extensión del deterioro añadido del comportamiento:
• F7x.0 con deterioro del comportamiento mínimo o ausente • F7x.1 con
deterioro del comportamiento importante que requiere atención o
trata-miento • F7x.8 con otros deterioros del comporta-miento • F7x.9
sin alusión al deterioro del comporta-miento

==== Diagnósticos diferenciales
<_diagnósticos_diferenciales_11>
1. Epilepsia generalizada tipo Gran mal: • Descartar en base a
diferencias con crisis conversivas. • Dada la frecuente comorbilidad,
deben realizarse estudios paraclínicos. • En caso de haber alteraciones
conductuales \(IAE, heteroagresividad, fuga) y es epiléptico conocido,
se puede plantear DD con: • Estado crepuscular postictal. • Crisis
parcial compleja. • \(ambos se descartan porque no existe trastorno de
la conciencia en la comisión del acto). 2. Crisis de adolescencia
patológica: en el caso del RM la alteración se da en el curso
longitudinal y está centrada en el déficit escolar y adaptativo social,
hecho que excede el DD planteado. En la crisis de adolescencia existe: •
menor duración • historia previa sin alteraciones deficitarias •
generalmente hay causa desencadenante. 3. Según HC puede plantearse DD
con: Neurosis, Trastorno de la Personalidad. Neurosis: necesita una
personalidad más con-formada \(el oligofrénico puede usar mecanismos de
defensa seudoneuróticos).

==== Diagnóstico etiopatogénico
<_diagnóstico_etiopatogénico_3>
Multifactorial.

#block[
#strong[Biológico]

]
Factores pre, peri, postnatales: metabólicos, complicación de embarazo,
infecciones neonatales, traumatismos obstétricos. Importa descartar:
consanguinidad de padres, edad de la madre, alcoholismo paterno \(
Frecuencia, citar si existe).

#block[
#strong[Psicosocial]

]
Actuando sobre este terreno biológicamente o congénitamente alterado,
existen elementos que nos hablan de: DEPRIVACION AMBIENTAL •
alteraciones del medio familiar, violencia, alcoholismo • medio de poco
estímulo • familia poco continente

==== Paraclínica
<_paraclínica_20>
Destinada a: • Evaluar déficit • Descartar diagnósticos diferenciales •
Con vistas al tratamiento • Valoración general

#block[
#strong[Biológico]

]
• Lo somático que tenga • EEG en busca de signos focales, neurólogo. •
Rutinas • Valoración para uso de Carbamazepina: Hemograma completo,
Funcional y enzimograma hepático.

#block[
#strong[Psicológico]

]
• Test psicométrico específico: Bender y Weschler para evaluar CI y
grado de déficit en su escala ejecutiva y verbal. • Test de personalidad
proyectivos y no proyectivos.

#block[
#strong[Social]

]
Directamente o con Asistente Social: • Terceros dada la poca
confiabilidad • Red de soporte social • Incidencia del medio en su
patología y en la descompensación • Historia perinatal para orientación
de etiología

==== Tratamiento
<_tratamiento_25>
Destinado a:

- Cuadro actual: tratamiento sintomático Bps \* Largo plazo: bPS,
  mantendremos fármacos de mantenimiento, pero será fundamental-mente
  psicosocial y estará destinado a favorecer inserción social y combatir
  complicaciones.

Se usará medicación en casos en que #footnote[National Institute for
Health and Care Excellence. \"Psychotropic medicines in people with
learning disabilities whose behaviour challenges.\" \(2017).]: \* Las
intervenciones psicosociales solas no sean suficientes. \* Exista riesgo
para sí o para terceros.

#block[
#strong[Cuadro actual]

]
Internación en Hospital General: fundamental-mente por continencia
interna y externa con de descontrol por parte del paciente y aislamiento
del foco conflictivo. Breve porque es mal tolera-da. Vigila fuga, IAE,
heteroagresividad. En lo posible aislado al inicio. Equipo
multidisciplinario.

Biológico

1. Sedaremos con Benzodiacepinas: Clonazepam, en su calidad de sedativo
y su acción contra la irritación, impulsividad y disforia. Además otras
benzodiacepinas, al tratarse de un cerebro disfuncional, presentan con
\> frecuencia el fenómeno de desinhibición. También antiepiléptico.
Indicaremos 2 mg v/o H8, H14 y 4 mg VO H20 \(2 2 4), que iremos según
respuesta hasta llegar a 14-16 mg/día. 2. Indicaremos Carbamazepina como
estabilizador del humor y por su acción sobre la irritabilidad y la
disforia e impulsividad. Empezamos con 200 mg VO c/12 hs e iremos
pudiendo llegar a 1200-1600 mg/día. Parecería que la dosis óptima
corresponde a una concentración plasmática de 4-12 µg/ml. Realizaremos
controles con hemograma \(semanal el 1º mes, luego mensual o
bi-mensual), funcional y enzimograma hepático \(mensual el 1º trimestre,
luego bimensual)., ya que como efecto secundario puede disminuir la
fórmula leucocitaria con el consiguiente riesgo de infecciones graves y
también provoca alteraciones en el FH \(hepatotoxicidad). 3. Indicaremos
Propericiazina \(cerebro disfuncional \> EPI y \> EPS) NL que contribuye
a la sedación, con acción sobre la impulsividad. Como efecto secundario
baja el umbral convulsivo y existe la posibilidad de que nuestro
paciente sea epiléptico. Se indica 25 mg VO H20, pudiendo llegar a 50 mg
según la evolución. 4. Realizaremos Flunitrazepam 2 mg v/o ya que
consideramos fundamental la regulación del sueño. Retiraremos al obtener
mejoría. NOTA: considerar el uso de antipsicóticos atípicos, sobre todo
Risperidona.

Psicológico

Entrevistas frecuentes para lograr buen vínculo, tranquilizar con
respecto a la internación.

#block[
#strong[A largo plazo]

]
Estará destinado a incidir sobre la adaptación social, procurando la
autonomía s/t con medidas psicosociales.

Biológico

Realizaremos controles al principio semanales, que iremos espaciando
hasta llegar a mensuales. Procuraremos disminuir al mínimo efectivo los
fármacos para facilitar el cumplimiento. Previo al alta, según
valoración del perfil de cumpli-miento del paciente y la continentación
del me-dio, en caso de ser dificultoso el cumplimiento indicaremos
Palmitato de Pipotiazina 25-50 mg i/m c/4 semanas que nos asegura el
cumplimien-to.

Psicosocial

Vincularemos a taller de rehabilitación que puede ser dificultoso por
los trastornos conductuales. Realizaremos psicoeducación de familiares
para mejorar continencia del medio, lograr con-troles clínicos
periódicos y cumplimiento de la medicación. Vincularemos a la familia
con ex-perto en terapia familiar para cambio de conductas de ésta que
puedan incidir en las descompensaciones. Eventualmente vincularemos al
pa-ciente con expertos en Retraso Mental. Vincula-remos con AS para que
tenga acceso a beneficios sociales.

==== Evolución y pronóstico
<_evolución_y_pronóstico_18>
PPI: bueno con tratamiento instituido, supedita-do a trastornos
conductuales con auto/hetero. PVI: bueno, supeditado al psiquiátrico.
PVA: sujeto a lo orgánico que tenga, en cierto modo vinculado al PPA que
pensamos reservado ya que está dificultado por: • Autonomía limitada •
Conductas antisociales • Continentación social y recursos económicos •
Bajo umbral de reactividad para psicosis Evolución que intentamos
mitigar con las medidas efectuadas.

= Trastornos del desarrollo psicológico
<_trastornos_del_desarrollo_psicológico>
== F84 Trastornos generalizados del desarrollo
<_f84_trastornos_generalizados_del_desarrollo>
- F84.0 Autismo infantil \(Psicosis Infantil, Síndrome de Kanner) -
  F84.1 Autismo atípico - F84.2 Síndrome de Rett - F84.3 Otro trastorno
  desintegrativo de la infancia - F84.4 Trastorno hipercinético asociado
  a RM y movimientos estereotipados - F84.5 Síndrome de Asperger
  \(Trastorno Esquizoide de la Infancia)

=== Notas Clínicas
<_notas_clínicas_19>
Característica fundamental de lo TGD: alteraciones cualitativas de la
interacción social y formas de comunicación con un conjunto restringido
de intereses y actividades.

Otros nombres: trastorno autístico, autismo infantil, psicosis infantil,
síndrome de Kanner.

Síndrome de Asperger: validez diagnóstica dudosa. Autismo SIN déficit o
retraso en el lenguaje o en el desarrollo cognoscitivo. Generalmente
asociado a torpeza motora. Pueden tener episodios psicóticos
ocasionales. Sinónimo: trastorno esquizoide de la infancia.

Tendencia a usar Trastornos del Espectro Autista \(TEA) como término
paraguas. Prevalencia hasta 1

=== Encare
<_encare_23>
==== Diagnóstico positivo
<_diagnóstico_positivo_20>
===== DSM-5
<_dsm_5>
#block[
#strong[Trastorno del espectro autista]

]
Diagnóstico bidimensional. Los estudios muestran que tiene más validez
que el tridimensional del DSM-IV #footnote[Mandy, W. P., Charman, T., &
Skuse, D. H. \(2012). Testing the construct validity of proposed
criteria for DSM-5 autism spectrum disorder. Journal of the American
Academy of Child & Adolescent Psychiatry, 51\(1), 41-50.].

#block[
#set enum(numbering: "1.", start: 1)
+ Déficit en la comunicación social e interacción social. Ejemplos: ..
  Reciprocidad socioemocional .. Conductas comunicativas no verbales ..
  Desarrollo mantenimiento y comprensión de relaciones \(ajuste del
  comportamiento al contexto). . Patrones restrictivos y repetitivos del
  comportamiento, intereses o actividades. \> 2: .. Movimientos
  \(estereotipados) .. Rutinización .. Restricción de intereses .. Hiper
  o hiporreactividad a estímulos sensoriales . Síntomas presentes en las
  primeras fases del desarrollo . Deterioro clínicamente significativo .
  Descartar RM \(pueden ser comórbidos)
]

Especificadores: \* Con o sin déficit intelectual \* Con o sin deterioro
del lenguaje \* Asociado o no afección médica / genética /factor
ambiental \* Asociado a otro trastorno del neurodesarrollo / mental /
del comoportamiento \* Gravedad \(según grado de ayuda requerida: 3, 2,
1)

===== CIE-10
<_cie_10_2>
#block[
#strong[F84.0 Autismo]

]
Diagnóstico basado en 3 dimensiones.

#block[
#set enum(numbering: "1.", start: 1)
+ Desarrollo alterado antes de los 3 años de edad con afectación de 1 de
  3: .. Lenguaje / comunicación .. Lazos sociales / interacción .. Juego
  simbólico y funcional . 6 síntomas de: .. Alteraciones en la
  interacción social \> 2 de: … Falta de contacto visual, expresión
  facial, postura o gestos que regulen la interacción social. … Falta de
  vínculos compartiendo intereses / actividades / emociones … Falta de
  reciprocidad socioemocional. Débil integración del comportamiento
  social, emocional y comunicativo .. Alteraciones en la comunicación \>
  1 de: … Retraso/ausencia de lenguaje hablado sin gestos de
  compensación

  #block[
  #set enum(numbering: "i.", start: 1)
  + Fracaso para iniciar / mantener una conversación … Uso estereotipado
    o idiosincrático del lenguaje … Falta de juegos de simulación
    espontáneos o juego social imitativo .. Intereses restringidos o
    estereotipados \> 1 de: … Comportamiento estereotipado

  + Adherencia a rutinas carentes de sentido … Manierismos motores
    estereotipados / repetitivos … Preocupación por objetos carentes de
    funcionalidad . Descartar otros TGD, trastornos del desarrollo
    específicos, RM, F20 de inicio en la infancia, S° de Rett.
  ]
]

#block[
#set enum(numbering: "1.", start: 1)
+ Ausencia de retraso en el lenguaje o cognitivo . Alteración
  cualitativa en la interacción social: similar criterio que el autismo.
  . Intereses restringidos, repetitivos y estereotipados. . Descartar
  otros TGS, F20, F21, TOC, TP anancástico, trastorno reactivo y
  desinhibido de la vinculación en la infancia.
]

No se requieren para el diagnóstico pero suelen estar presentes:

- torpeza motora \* capacidades especiales vinculadas a interés
  específico.

- Autismo atípico: no se cumplen algunos de los criterios. \* Síndrome
  de Rett: niñas. Inicio normal, luego pérdida de funciones y retraso en
  crecimiento cefálico que aparece entre los 7m y 2 años. \* Otro
  trastorno desintegrativo de la infancia: inicio normal → pérdida de
  funciones. \* Trastorno hipercinético asociado a RM y movimientos
  estereotipados.

==== Diagnóstico diferencial
<_diagnóstico_diferencial_12>
En adultos, sobre todo para S de Asperger: DD con Trastorno de la P del
grupo A \(Esquizoide)

==== Tratamiento
<_tratamiento_26>
===== Biológico En metaanálisis no hay diferencias significativas entre
<_biológico_en_metaanálisis_no_hay_diferencias_significativas_entre>
el placebo y los siguientes tratamientos #footnote[Yu, Yanjie, et al.
\"Pharmacotherapy of restricted/repetitive behavior in autism spectrum
disorder: a systematic review and meta-analysis.\" BMC psychiatry 20.1
\(2020): 1-11.]: fluvoxamina, risperidona, fluoxetina, citalopram,
oxitocina, N-Acetilcisteína, buspirona.

Aripiprazol: potencialmente útil para uso transitorio en el tratamiento
de aspectos comportamentales \(irritabilidad, hiperactividad,
estereotipias). Debe prestarse atención a los efectos secundarios
\(ganancia de peso, sedación, sialorrea, temblor). Un estudio muestra
que a largo plazo no se diferencia del placebo → se recomienda usar por
períodos cortos #footnote[Hirsch, Lauren E., and Tamara Pringsheim.
\"Aripiprazole for autism spectrum disorders \(ASD).\" Cochrane Database
of Systematic Reviews 6 \(2016).].

===== Psicológico Psicoterapia de apoyo con promoción de conductas
<_psicológico_psicoterapia_de_apoyo_con_promoción_de_conductas>
sociales e interacción. Técnicas de resolución de problemas.
Entrenamiento en habilidades sociales.

= Trastornos de inicio en la infancia o adolescencia
#include "F90.typ"

== Síndrome de fatiga crónica
=== Notas clínicas
Nombre alternativo: encefalomielitis miálgica \(F93.32). Enfermedad
crónica compleja que afecta mùltiples sitemas corporales cuya
fisiopatología está en investigación. Afecta a cada individuo de forma
diferente, es fluctuante con cambios impredecibles en el día, en la
semana o en períodos más largos. Puede afectar diferentes aspectos de la
vida diaria, familiar, social, emocional, laboral, académico.
Frecuentemente objeto de prejuicio o descreimineto, estigmatización.
Severidad:

- Leve: pueden hacer tareas domésticas livianas, pueden tener
  dificultades con la movilidad. Pueden mantener una actividad laboral o
  académica pero en detrimento de otras actividades. Muchas veces optan
  por trabajar menos.

- Moderada: restricción en todas las actividades de la vida diaria, con
  oscilaciones. En general no trabajan/estudian. Necesidad de descansos
  en la tarde de 1-2 horas. Sueño nocturno de mala calidad, fragmentado.

- Severa: incapacidad para realizar tareas diarias mínimas. Severos
  trastornos cognitivos. Pueden requerir de silla de ruedas para
  moverse. Incapacidad para salir de la casa, o lo hacen con
  consecuencias prolongadas. La mayor parte del tiempo en cama.
  Sensibilidad extrema a la luz o el sonido.

- Muy severa: en cama todo el día, dependiente de cuidador, necesitan
  ayuda con higiene personal y para comer. Muy sensibles a estímulos
  externos. En ocasiones pueden no deglutir, necesitando de alimentación
  por sonda.

En la atención importa la individualización, atender el estigma,
involucrar a familiares / cuidadores, sensibilidad al contexto
socioeconómico, cultural, étnico .

==== Diagnóstico
El diagnóstico es clínico. Sospecha:

- Síntomas por más de 4 semanas \(niños y adolescentes) o 6 semanas
  \(adultos):

  - Fatiga debilitante que empeora con la actividad, no causada por
    esfuerzo físico, cognitivo o emocional. No alivia de forma
    significativa con el descanso.

  - Fatiga post-ejercicio, con peoría de síntomas: desproporcionado a la
    actividad, con retardo de horas o días, con tiempo prolongado de
    recuperación \(días, semanas o más)

  - Sueño poco reparador, patrón de sueño alterado, hipersomnia

  - Dificultades cognitivas \(“niebla mental”), anomias, dificultad para
    hablar, respuestas lentas, problemas en memoria a corto plazo, en
    concentración o en la multitarea.

- Afectación de pragmatismos

- Exclusión de otras patologías que expliquen los síntomas

Otros síntomas asociados \(pero no exclusivo) al SFC:

- Intolerancia ortostática y disfunción autonómica \(incluyendo mareos,
  palpitaciones, lipotimias, náuseas, ante cambios de posición)

- Hipersensibilidad a la temperatura

===== Paraclínica
<_paraclínica_22>
De realizarse una evaluación médica completa, examen físico.
Laboratorio: hemograma, glicemia, orina, perfil hepático, perfil
tiroideo, VES, proteína C reactiva, calcemia y fosfatemia, HbA1c,
ferritina sérica, descartar enfermedad celíaca, CK. Otros según la
clínica: vitamina D, vitamina B12, cortisol si se sospecha insuficiencia
adrenal.

== Otros trastornos de inicio en la niñez y adolescencia
<_otros_trastornos_de_inicio_en_la_niñez_y_adolescencia>
=== F98.5 Tartamudez
<_f98_5_tartamudez>
Definición: alteración en la fluencia y/o patrón temporal del lenguaje
que es inapropiado para la edad del individuo y persistente en el
tiempo. Puede estar acompañado de fenómenos motores.

Otros nombres: trastorno de la fluencia de inicio en la infancia. Edad
de inicio: 2 a 7 años. A los 16: 65-85% se recuperan.

==== Etiología
<_etiología>
Desconocida. Conceptualización actual: dominancia incompleta de los
centros primarios del lenguaje de etiología multifactorial.

Genética: da cuenta del 50-80% de los casos. Correlación entre hermanos:
19%. Riesgo x 3 en familiares de primer grado. Asociación con genes
dopaminérgicos SLC6A3 y DRD2,

Comparte características con S de la Tourette: inicio en la infancia,
hombres 4:1, curso fluctuante, empeoran con ansiedad, están asociados a
tics, tienen anomalías cerebrales en los ganglios basales, empeoran pora
agonistas dopaminérgicos, mejoran con antagonistas. Infecciosa: algunos
casos asociados a PANDAS \(trastornos autoinmunes pediátricos asociados
a infecciones estreptocóccicas), que están vinculados a Tourette y TOC.

Casos adquiridos en adultos: asociados a medicación y TEC.

= Otras situaciones clínicas
<_otras_situaciones_clínicas>
== IAE
<_iae>
=== Notas clínicas
<_notas_clínicas_22>
Factores de riesgo para suicidio

=== Encare
<_encare_25>
==== Agrupación sindromática
<_agrupación_sindromática_19>
===== Síndrome conductual
<_síndrome_conductual_10>
#block[
Evaluación de IAE: MMPPRRR

]
Hace X tiempo:

- Método: intoxicación - traumatismo \(grave) - asfíctico \(grave). \*
  Móvil: situación difícil más o menos compartible / mínimo:
  inautenticidad \(T de la P) / sin móvil aparente, no puede dar cuenta
  \(contexto discordante, catatónico). \* Precauciones tomadas para
  evitar o no ser salvado \(gravedad) \* Premeditación: plan previo para
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
<_tratamiento_29>
Cesación de agente causante. Tratamiento de apoyo

- monitorización constante

- aporte de volumen: agresivo.

- corrección de electrolitos

- fluidos alcalinizados o carga con bicarbonato puede prevenir falla
  renal

- persistencia de hipertermia: medidas físicas para bajar temperatura

Farmacológico:

- Benzodiacepinas: Lorazepam i/v 1-2 mg cada 4-6 horas. Reducción de
  rigidez y fiebre en 24-47 horas, remisión de síntomas catatónicos
  \(mutismo e inmovilidad).

- Agentes dopaminérgicos: revierten parkinsonismo, el tiempo de
  recuperación y la mortalidad a la mitad solos o en combinación.

  - Amantadina 200-400 mg/día en dosis divididas v/o o por SNG.

  - Bromocriptina 2.5 mg c/12 o c/8 aumentando hasta un total de 45
    mg/día si se requiere. Puede empeorar la psicosis y precipitar
    hipertensión y vómitos. Debe continuarse 10 días después de la
    remisión para evitar recurrencia si se discontinúa precozmente.

- Dantrolene: relajante de músculo esquelético. Útil en caso asociados
  con hipertermia extrema y rigidez. Se puede usar junto con BZD o con
  un agonista DA. No se puede administrar con bloqueadores de calcio.
  Dosis: inicio 1-2.5 mg/kg IV, luego 1 mg/Kg cada 6 horas si hay
  respuesta luego de la primera dosis. Efectos secundarios:
  insuficiencia respiratoria / hepática. Debe continuarse 10 días luego
  de la resolución de los síntomas por probabilidad de recurrencia si se
  retira precozmente.

- ECT: puede ser eficaz. Segunda línea, si fallan fármacos o si no se
  puede descartar una catatonía letal. Se hacen 6-10 sesiones. Aparece
  respuesta a la 4#sub[a]. Vigilar la aparición de lesión muscular y de
  hiperkalemia.

==== Evolución y pronóstico
<_evolución_y_pronóstico_20>
Luego de ser reconocido y tratado, el SNM es autolimitado a menos que
existan complicaciones. El tiempo promedio de recuperación son 7-10 días
luego de la discontinuación de la droga. Casi todos los pacientes se
recuperan en 30 días o menos. El uso de medicación de depósito puede dar
episodios del doble de duración. En algunos pacientes puede haber
catatonía y parkinsonismo residual por meses. La ECT suele ser útil para
estos síntomas residuales. Tasa de mortilidad: originalmente era de un
30%, actualmente hay reportes de 0-15%.

Buen pronóstico:

- diagnóstico precoz

- rápida discontinuación del antipsicótico

- uso de farmacoterapia específica

Mal pronóstico:

- mioglobinuria

- falla renal

La muerte en general se produce por falla cardíaca, respiratoria,
neumonia por aspiración, embolia pulmonar, falla renal mioglobinúrica o
coagulación intravascular diseminada.

Si se reinicia el antipsicótico de forma inmediata: recurrencia de un
30%. Se recomienda esperar al menos 2 semanas después de la resolución
para retomar cualquier antipsicótico- Se recomienda una dosificación
lenta / gradual de neuroléptico sedativo o de APSG. Preferentemente usar
antagonistas parciales de DA \(aripiprazol, brexpiprazol, cariprazina).

Obtener consentimiento informado antes de reiniciar. En general no hay
recurrencia si se empieza la misma droga luego de las 4 semanas de la
recuperación del episodio inicial.

= Apéndice

#include "Fragmentos.typ"

#include "Abreviaturas.typ"
