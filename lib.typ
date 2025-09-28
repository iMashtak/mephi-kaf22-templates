#let std-bibliography = file => bibliography(
  file,
  title: "Список литературы",
  style: "gost-r-705-2008-numeric",
)

#let dhpat(sep, stroke) = tiling(
  size: (10pt, (sep + std.stroke(stroke).thickness) * 10),
  {
    let t = std.stroke(stroke).thickness / 2 + 0.1pt
    let theline = line(length: 10pt, stroke: stroke)
    place(dy: t, theline)
    place(dy: t + sep, theline)
  },
)

#let undertext(above: [\ ], under: content, inset: 1pt, gutter: 3pt) = grid(
  columns: 1fr,
  align: (center),
  inset: (inset),
  gutter: (gutter),
  above,
  grid.hline(),
  under
)

#let thesis(
  kind: [],
  kind-continuation: [],
  theme: [],
  author: "",
  teacher: "",
  consultant: "",
  spec: "",
  group: "",
  year: "",
  style: none,
  bib: none,
  abstract: none,
  intro: none,
  conclusion: none,
  appendices: none,
  task: none,
  body,
) = {
  // Dependencies

  import "@preview/codly:1.3.0": *
  show: codly-init
  import "@preview/codly-languages:0.1.8": *
  codly(languages: codly-languages, zebra-fill: none)

  // Document settings

  set document(title: theme, author: author)
  set text(
    lang: "ru",
    size: 12pt,
    font: "Times New Roman",
  )
  set page(
    paper: "a4",
    numbering: none,
    margin: (left: 30mm, right: 10mm, y: 20mm),
  )
  set par(
    justify: true,
    linebreaks: "optimized",
    first-line-indent: (
      all: true,
      amount: 1.25cm,
    ),
    spacing: 1.5em,
    leading: 1.5em,
  )
  set heading(
    numbering: "1.",
  )
  show heading: set text(hyphenate: false)
  show heading: set align(center)
  show heading: it => {
    it
    v(0.5em)
  }
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    text(it, 14pt)
  }
  show heading.where(level: 2): it => {
    align(left, text(it, 13pt))
  }
  show heading.where(level: 3): it => {
    align(left, text(it, 12pt))
  }
  show selector(<nonumber>): set heading(numbering: none)
  set math.equation(numbering: "(1)")

  // Title Page

  page([
    #align(center, [
      #set par(leading: 1.0em, spacing: 1.0em)

      #[
        #set par(spacing: 0.3em)

        МИНИСТЕРСТВО НАУКИ И ВЫСШЕГО ОБРАЗОВАНИЯ РОССИЙСКОЙ ФЕДЕРАЦИИ

        #text([ФЕДЕРАЛЬНОЕ ГОСУДАРСТВЕННОЕ АВТОНОМНОЕ ОБРАЗОВАТЕЛЬНОЕ УЧРЕЖДЕНИЕ ВЫСШЕГО ОБРАЗОВАНИЯ], 6pt)

        #text([*Национальный исследовательский ядерный университет «МИФИ»*], 11pt)
      ]

      #line(length: 100%)

      #grid(
        columns: (1fr, 3fr),
        image("mephi-image.png"),
        [
          #text(
            [
              *Институт*

              *интеллектуальных кибернетических систем*

              *Кафедра №22 «Кибернетика»*
            ],
            15pt,
          )
        ],
      )

      #text([Направление подготовки #spec], 14pt)

      #text(kind, 20pt)

      #text(kind-continuation, 14pt)

      #text(theme, 16pt)

      #line(length: 100%, stroke: (thickness: 6pt, paint: dhpat(2pt, 0.8pt), cap: "butt"))

      #if style == "pz" {
        table(
          columns: (1fr, 1fr, 1fr),
          stroke: none,
          align: (left, center, center),
          [#text([Группа], 13pt)], [#undertext(above: group, under: [\ ])], [],

          [#text([Студент], 13pt)],
          [#undertext(under: [#text([(подпись)], 9pt)])],
          [#undertext(above: [#author], under: [#text([(ФИО)], 9pt)])],

          [#text([Руководитель], 13pt)],
          [#undertext(under: [#text([(подпись)], 9pt)])],
          [#undertext(above: [#teacher], under: [#text([(ФИО)], 9pt)])],

          [#text([Научный консультант], 13pt)],
          [#undertext(under: [#text([(подпись)], 9pt)])],
          [#undertext(above: [#consultant], under: [#text([(ФИО)], 9pt)])],
        )

        table(
          columns: (1fr, 1fr, 1fr, 1fr),
          stroke: none,
          align: (center, center, center, center),

          [
            #set par(leading: 0.5em)
            #text([Оценка\ руководителя], 13pt)
          ],
          [#undertext(above: [#v(1.8em)], under: [#text([(0-30 баллов)], 9pt)])],
          [
            #set par(leading: 0.5em)
            #text([Оценка\ консультанта], 13pt)
          ],
          [#undertext(above: [#v(1.8em)], under: [#text([(0-30 баллов)], 9pt)])],

          [
            #text([Итоговая оценка], 13pt)
          ],
          [#undertext(under: [#text([(0-100 баллов)], 9pt)])],
          [
            #text([ECTS], 13pt)
          ],
          [#undertext(under: [])],
        )

        text([Комиссия], 13pt)

        table(
          columns: (1fr, 1fr, 1fr),
          stroke: none,
          [#text([Председатель], 13pt)],
          [#undertext(under: [#text([(подпись)], 9pt)])],
          [#undertext(under: [#text([(ФИО)], 9pt)])],

          [], [#undertext(under: [#text([(подпись)], 9pt)])], [#undertext(under: [#text([(ФИО)], 9pt)])],

          [], [#undertext(under: [#text([(подпись)], 9pt)])], [#undertext(under: [#text([(ФИО)], 9pt)])],

          [], [#undertext(under: [#text([(подпись)], 9pt)])], [#undertext(under: [#text([(ФИО)], 9pt)])],
        )
      }
      #if style == "rspz" {
        table(
          columns: (1fr, 0.5fr, 1fr, 1fr),
          align: (left, center, center, center),
          stroke: none,

          [#text([Группа], 13pt)], table.cell(colspan: 2, [#undertext(under: [\ ])]), [],

          [#text([Студент], 13pt)],
          [\ ],
          [#undertext(under: [#text([(подпись)], 9pt)])],
          [#undertext(above: [#author], under: [#text([(ФИО)], 9pt)])],

          [#text([Руководитель], 13pt)],
          [#undertext(under: [#text([(0-20 баллов)], 9pt)])],
          [#undertext(under: [#text([(подпись)], 9pt)])],
          [#undertext(above: [#teacher], under: [#text([(ФИО)], 9pt)])],

          [#text([Научный консультант], 13pt)],
          [#undertext(under: [#text([(0-20 баллов)], 9pt)])],
          [#undertext(under: [#text([(подпись)], 9pt)])],
          [#undertext(above: [#consultant], under: [#text([(ФИО)], 9pt)])],
        )
      }

      #v(1fr)

      #text([*Москва #year*], 14pt)
    ])
  ])

  if task != none {
    task
  }

  // Thesis content

  set page(numbering: "1")
  counter(page).update(2)

  if abstract != none {
    [
      = Реферат <nonumber>

      #abstract
    ]
  }

  outline()

  if intro != none {
    [
      = Введение <nonumber>

      #intro
    ]
  }

  {
    body
  }

  if conclusion != none {
    [
      = Заключение <nonumber>

      #conclusion
    ]
  }

  if bib != none {
    pagebreak()
    std-bibliography(bib)
  }

  if appendices != none {
    counter(heading).update(0)
    set heading(numbering: "A.1.")
    appendices
  }
}

#let nir-pz(
  theme: [],
  author: "",
  spec: "",
  group: "",
  teacher: "",
  consultant: "",
  year: "",
  bib: none,
  task: none,
  abstract: none,
  intro: none,
  conclusion: none,
  appendices: none,
  body,
) = {
  thesis(
    body,
    kind: [*Пояснительная записка*],
    kind-continuation: [к научно-исследовательской работе студента на тему:],
    theme: theme,
    author: author,
    group: group,
    teacher: teacher,
    consultant: consultant,
    spec: spec,
    year: year,
    style: "pz",
    bib: bib,
    task: task,
    abstract: abstract,
    intro: intro,
    conclusion: conclusion,
    appendices: appendices,
  )
}

#let nir-rspz(
  theme: [],
  author: "",
  spec: "",
  group: "",
  teacher: "",
  consultant: "",
  year: "",
  bib: none,
  abstract: none,
  intro: none,
  conclusion: none,
  appendices: none,
  body,
) = {
  thesis(
    body,
    kind: [*Расширенное содержание пояснительной записки*],
    kind-continuation: [к научно-исследовательской работе студента на тему:],
    theme: theme,
    author: author,
    group: group,
    teacher: teacher,
    consultant: consultant,
    spec: spec,
    year: year,
    style: "rspz",
    bib: bib,
    abstract: abstract,
    intro: intro,
    conclusion: conclusion,
    appendices: appendices,
  )
}

#let uir-pz(
  theme: [],
  author: "",
  spec: "",
  group: "",
  teacher: "",
  consultant: "",
  year: "",
  bib: none,
  abstract: none,
  intro: none,
  conclusion: none,
  appendices: none,
  body,
) = {
  thesis(
    body,
    kind: [*Пояснительная записка*],
    kind-continuation: [к учебно-исследовательской работе студента на тему:],
    theme: theme,
    author: author,
    group: group,
    teacher: teacher,
    consultant: consultant,
    spec: spec,
    year: year,
    style: "pz",
    bib: bib,
    abstract: abstract,
    intro: intro,
    conclusion: conclusion,
    appendices: appendices,
  )
}

#let uir-rspz(
  theme: [],
  author: "",
  spec: "",
  group: "",
  teacher: "",
  consultant: "",
  year: "",
  bib: none,
  abstract: none,
  intro: none,
  conclusion: none,
  appendices: none,
  body,
) = {
  thesis(
    body,
    kind: [*Расширенное содержание пояснительной записки*],
    kind-continuation: [к учебно-исследовательской работе студента на тему:],
    theme: theme,
    author: author,
    group: group,
    teacher: teacher,
    consultant: consultant,
    spec: spec,
    year: year,
    style: "rspz",
    bib: bib,
    abstract: abstract,
    intro: intro,
    conclusion: conclusion,
    appendices: appendices,
  )
}

#let tasks-table(
  rspz-date: [],
  pz-date: [],
  ..sections,
) = {
  set par(leading: 0.65em, justify: false, linebreaks: auto, first-line-indent: 0pt)
  set text(size: 11pt)
  table(
    columns: (0.5fr, 3.5fr, 1.25fr, 1fr, 1fr),
    align: (left, left, left, center, left),
    ..{
      let i = 0
      let result = for section in sections.pos() {
        i += 1
        (
          [#i.],
          [*#section.name*],
          [],
          [],
          [],
          ..{
            let j = 0
            let tasks = for item in section.tasks {
              j += 1
              ([#i.#j.], item.title, item.form, item.date, [])
            }
            if i == 1 {
              j += 1
              tasks.push([#i.#j.])
              tasks.push([_Оформление расширенного содержания пояснительной записки (РСПЗ)_])
              tasks.push([Текст РСПЗ])
              tasks.push(rspz-date)
              tasks.push([])
            }
            if sections.at(i - 1) == sections.pos().last() {
              j += 1
              tasks.push([#i.#j.])
              tasks.push([_Оформление пояснительной записки (ПЗ) и иллюстративного материала для доклада_])
              tasks.push([Текст ПЗ, презентация])
              tasks.push(pz-date)
              tasks.push([])
            }
            tasks
          },
        )
      }
      result.insert(0, [#align(center, [#text([№], 12pt)\ #text([п/п], 10pt)])])
      result.insert(1, [#align(center, [#text([Содержание работы], 12pt)])])
      result.insert(2, [#align(center, [#text([Форма\ отчётности], 12pt)])])
      result.insert(3, [#align(center, [#text([Срок\ исполнения], 12pt)])])
      result.insert(4, [#align(center, [#text([Отметка о выполнении], 12pt)\ #text([Дата, подпись], 9pt)])])
      result
    }
  )
}

#let task(
  kind: [],
  theme: [],
  author: "",
  group: "",
  teacher: "",
  bib: none,
  body,
) = {
  set document(title: theme, author: author)
  set text(
    lang: "ru",
    size: 12pt,
    font: "Times New Roman",
  )
  set page(
    paper: "a4",
    numbering: none,
    margin: (left: 30mm, right: 10mm, y: 20mm),
  )

  align(center, [
    #set par(leading: 1.0em, spacing: 1.0em)

    #[
      #set par(spacing: 0.3em)

      МИНИСТЕРСТВО НАУКИ И ВЫСШЕГО ОБРАЗОВАНИЯ РОССИЙСКОЙ ФЕДЕРАЦИИ

      #text([ФЕДЕРАЛЬНОЕ ГОСУДАРСТВЕННОЕ АВТОНОМНОЕ ОБРАЗОВАТЕЛЬНОЕ УЧРЕЖДЕНИЕ ВЫСШЕГО ОБРАЗОВАНИЯ], 6pt)

      #text([*Национальный исследовательский ядерный университет «МИФИ»*], 11pt)
    ]

    #line(length: 100%)

    #grid(
      columns: (1fr, 3fr),
      image("mephi-image.png"),
      [
        #text(
          [
            *Институт*

            *интеллектуальных кибернетических систем*

            *Кафедра №22 «Кибернетика»*
          ],
          15pt,
        )
      ],
    )

    #text([*Задание на #kind*], 24pt)

    #table(
      columns: (1.2fr, 1.5fr, 4fr),
      align: (left, center, center),
      stroke: none,

      [#text([Студенту гр.], 14pt)],
      [#undertext(above: text(group, 14pt), under: [#text([(группа)], 9pt)])],
      [#undertext(above: text(author, 14pt), under: [#text([(ФИО)], 9pt)])],
    )

    #text([*ТЕМА #kind*], 16pt)

    #text(theme, 16pt)

    #line(length: 100%, stroke: (thickness: 6pt, paint: dhpat(2pt, 0.8pt), cap: "butt"))

    #v(2em)

    #text([*ЗАДАНИЕ*], 16pt)
  ])

  {
    body
  }

  if bib != none {
    set par(leading: 1.0em, spacing: 1.0em)

    import "@preview/alexandria:0.2.1": *
    show: alexandria(prefix: "x-", read: path => read(path))

    load-bibliography(bib, full: true, style: "gost-r-705-2008-numeric")

    align(center, [
      #text([*ЛИТЕРАТУРА*], 16pt)
    ])

    context {
      let (references, ..rest) = get-bibliography("x-")
      table(
        columns: (1fr, 19fr),
        align: (left, left),

        ..{
          let i = 0
          for ref in references {
            i += 1
            (
              [#i.],
              [
                #hayagriva.render(ref.reference)
              ],
            )
          }
        }
      )
    }
  }
}

#let nir-task(
  theme: [],
  author: "",
  group: "",
  teacher: "",
  bib: none,
  body,
) = {
  task(
    body,
    kind: [НИР],
    theme: theme,
    author: author,
    group: group,
    teacher: teacher,
    bib: bib,
  )
}
