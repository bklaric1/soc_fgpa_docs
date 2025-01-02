#import "/layout/proposal_template.typ": *
#import "/metadata.typ": *
#import "/utils/todo.typ": *
#import "/utils/print_page_break.typ": *

#set document(title: title, author: author)

#show: proposal.with(
  title: title,
  program: program,
  supervisor: supervisor,
  author: author,
  university: university,
  description: description,
  bib_path: bib_path,
  logo_path: logo_path,
  submissionDate: submissionDate,
  transparency_ai_tools: include "/content/transparency_ai_tools.typ",
)


#set heading(numbering: none)
#include "/content/abstract.typ"


#pagebreak()
#outline()

Ref Test @bruegge2004object

#pagebreak()

#set heading(numbering: "1.1")
#include "/content/introduction.typ"
#include "/content/problem.typ"
#include "/content/motivation.typ"
#include "/content/specification.typ"
#include "/content/objective.typ"
#include "/content/schedule.typ"
