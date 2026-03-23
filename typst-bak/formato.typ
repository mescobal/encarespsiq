#set text(lang: "es")
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

