#import "/layout/proposal_template.typ": *
#import "/metadata.typ": *
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
)

#outline()
#pagebreak()

#set heading(numbering: "1.1")
#include "/content/1_motivation.typ"
#include "/content/2_research.typ"
#include "/content/3_introduction.typ"
#include "/content/4_fpga.typ"
#include "/content/5_soc.typ"
#include "/content/6_soc_fpga.typ"
#include "/content/7_context.typ"
#include "/content/8_future_perspectives.typ"