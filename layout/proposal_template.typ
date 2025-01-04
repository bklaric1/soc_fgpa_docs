#import "/layout/titlepage.typ": *
#import "/utils/print_page_break.typ": *

#let proposal(
  title: "",
  program: "",
  supervisor: "",
  author: "",
  university: "",
  description: "",
  logo_path: "",
  bib_path: "",
  submissionDate: datetime,
  is_print: false,
  body,
) = {
  titlepage(
    title: title,
    program: program,
    supervisor: supervisor,
    author: author,
    logo_path: logo_path,
    bib_path: bib_path,
    university: university,
    description: description,
    submissionDate: submissionDate
  )

  print_page_break(print: is_print)

  // Set the document's basic properties.
  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    numbering: "1",
    number-align: center,
  )

  // Save heading and body font families in variables.
  let body-font = "New Computer Modern"
  let sans-font = "New Computer Modern Sans"

  // Set body font family.
  set text(
    font: body-font, 
    size: 12pt, 
    lang: "en"
  )

  show math.equation: set text(weight: 400)

  // --- Headings ---
  show heading: set block(below: 0.85em, above: 1.75em)
  show heading: set text(font: body-font)
  set heading(numbering: "1.1")

  // --- Paragraphs ---
  let firstParagraphIndent = 1.45em
  show heading: it => {
    it
    h(firstParagraphIndent)
  }
  set par(leading: 1em, justify: true, first-line-indent: 2em)

  // --- Citation Style ---
  set cite(style: "alphanumeric")

  // --- Figures ---
  show figure: set text(size: 0.85em)

  body

  bibliography("/thesis.bib")
}
