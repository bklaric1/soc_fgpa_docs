
= SoC FPGA
(Header1)
== Header2
=== Header3
==== Header4

$"offset" = n_"word" * "word_size" = 7 * 32 = 224 "bits"$ -> Formula

Test @bruegge2004object


@tab:peripheral_status0 -> reference to a table

#figure(
  table(
    columns: (auto, auto, auto, auto, auto),
    inset: 10pt,
    align: horizon,
    table.header( [*Name*], [*Startbit*], [*Endbit*], [*Length*], [*Comment*]),
    [buffer_usage], [0], [15], [16],[usage of the output fifo buffer],
    [_NOT USED_],[16],[31],[16], [addresspace is not used. Filled with zeros]
  ), caption: [buffer usage]
)<tab:peripheral_status0>

#pagebreak()