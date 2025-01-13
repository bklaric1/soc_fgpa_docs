#import "/layout/titlepage.typ": *
#import "/layout/print_page_break.typ": *

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

  show link: underline

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
  set par(leading: 0.85em, justify: true, first-line-indent: 1.5em, spacing: 0.85em)

  // --- Citation Style ---
  set cite(style: "institute-of-electrical-and-electronics-engineers")

  // --- Figures ---
  show figure: set text(size: 0.85em)

  body

  bibliography("/references.bib")
}