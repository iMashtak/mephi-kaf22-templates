#import "../lib.typ": *

#show: nir-pz.with(
  theme: [Некоторая тема НИРа],
  author: "Студент С.С.",
  group: "М99-999",
  teacher: "Руководитель Р.Р.",
  consultant: "Консультант К.К.",
  spec: "09.04.04 Программная инженерия",
  year: "2025",
  bib: "example/bib.bib",
  task: [
    #include "nir-task.typ"
  ],
  abstract: [
    #lorem(100)

    #lorem(100)
  ],
  intro: [
    #lorem(100)

    #lorem(100)
  ],
  conclusion: [
    #lorem(100)

    #lorem(100)
  ],
  appendices: [
    = Приложение первое

    #lorem(100)

    = Приложение второе

    #lorem(100)
  ]
)

= Аналитическая часть

#lorem(50)

== Подраздел первый

#lorem(100)

#lorem(100)

== Подраздел второй

#lorem(100)

#lorem(100)

= Теоретическая часть

#lorem(100)

#lorem(100)

#lorem(100)

#lorem(100)

= Инженерная часть

#lorem(100)

#lorem(100)

#lorem(100)

#lorem(100)

= Практическая часть

#lorem(100)

#lorem(100)

#lorem(100)

#lorem(100)
