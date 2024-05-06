#import "@preview/fontawesome:0.2.0": *
#import "@preview/ilm:1.1.0": *
#set text(lang: "es")
#show: ilm.with(
  title: [Encares de psiquiatría],
  author: "M. Escobal",
  date: datetime(year: 2024, month: 03, day: 19),
  abstract: [],
  preface: [],
  bibliography: bibliography("encares.bib"),
  figure-index: (enabled: false),
  table-index: (enabled: false),
  listing-index: (enabled: false),
  table-of-contents: outline(title: "Indice", depth: 1)
)
#set heading(numbering: none)
#show heading: set block(above: 1.4em, below: 1em)
#show heading.where(level: 2): it => {pagebreak(weak: true); it}
// #show raw: set text(font: "New Computer Modern Mono")
// #set text(font: "New Computer Modern")
#set par(leading: 0.55em, first-line-indent: 1.8em, justify: true)
#show par: set block(spacing: 0.55em)
= Introducción
#fa-battery-empty()
#include "Intro.typ"
= Semiología

#include "Semiología.typ"

= Trastornos mentales orgánicos

#include "F00.typ"

#include "F05.typ"

= Trastornos por consumo de sustancias psicoactivas

#include "F10.typ"

#include "F11.typ"

= Trastornos psicóticos

#include "F20.typ"

#include "F22a.typ"

#include "F22b.typ"

#include "F23.typ"

= Trastornos del humor

#include "F30.typ"

#include "F31.typ"

#include "F32.typ"

= Trastornos de ansiedad

#include "F40.typ"

#include "F40a.typ"

#include "F41a.typ"

#include "F41b.typ"

#include "F42.typ"

#include "F43.typ"

#include "F44.typ"

#include "F45.typ"

#include "F48.typ"

= Trastornos asociados a disfunciones fisiológicas

#include "F50.typ"

//#include "F51.typ"

= Trastornos de la personalidad y del control de impulsos

#include "F60.typ"

#include "F63.typ"

#include "F68.typ"

= Retraso Mental

#include "F70.typ"

= Trastornos del desarrollo psicológico

#include "F84.typ"

= Trastornos de inicio en la infancia/adolescencia

#include "F90.typ"

#include "F93.typ"

#include "F98.typ"

= Otras situaciones clínicas

#include "IAE.typ"

#include "Estupor.typ"

#include "snm.typ"

= Apéndice

#include "Fragmentos.typ"

#include "Abreviaturas.typ"
