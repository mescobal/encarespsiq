#import "@preview/fontawesome:0.2.1": *
#import "@preview/ilm:1.1.2": *
#set text(lang: "es")
#import "@preview/note-me:0.5.0": *
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

#include "F60-3.typ"

#include "F632.typ"

#include "F68.typ"


= Retraso Mental

#include "F70.typ"

= Trastornos del desarrollo psicológico

#include "F84.typ"

= Trastornos de inicio en la infancia o adolescencia

#include "F90.typ"

#include "F985.typ"
== Otros trastornos de inicio en la niñez y adolescencia

= Otras situaciones clínicas

#include "R53.typ"

#include "IAE.typ"

#include "Estupor.typ"

#include "snm.typ"

= Apéndice

#include "Fragmentos.typ"

#include "Abreviaturas.typ"
