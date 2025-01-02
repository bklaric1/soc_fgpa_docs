#let titlepage(
  title: "",
  degree: "",
  program: "",
  supervisor: "",
  author: "",
  university: "",
  bib_path: "",
  logo_path: "",
  description: "",
  submissionDate: datetime,
) = {

  
  set page(
    margin: (left: 20mm, right: 20mm, top: 30mm, bottom: 30mm),
    numbering: none,
    number-align: center,
  )

  let body-font = "New Computer Modern"
  let sans-font = "New Computer Modern Sans"

  set text(
    font: body-font, 
    size: 12pt, 
    lang: "en"
  )

  set par(leading: 0.5em)

  
  // --- Title Page ---
  v(0.5cm)
  align(center, image(logo_path, width: 26%))

  v(1mm)
  align(center, text(font: sans-font, 1.5em, weight: 700, university))

  v(2mm)
  align(center, text(font: sans-font, 1em, weight: 100, description))
  
  v(10mm)
  align(center, text(font: sans-font, 2em, weight: 700, title))


  let entries = ()
  v(1cm)
  entries.push(("Author: ", author))
  entries.push(("Supervisor: ", supervisor))
  entries.push(("Submission Date: ", submissionDate.display("[day].[month].[year]")))

  v(1cm)
  align(
    center,
    grid(
      columns: 2,
      gutter: 1em,
      align: left,
      ..for (term, desc) in entries {
        (strong(term), desc)
      }
    )
  )
}
