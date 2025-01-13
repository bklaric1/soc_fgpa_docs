= SoC FPGA

== Basics

== Architecture

== Comparison with soft IP

The combination of these technologies is shown in the @fig:soc_fpga_architecure.

#figure(
  image("/figures/6_soc_fpga/SoC FPGA Architecture.jpg", width: 75%),
  caption: [
    Typical SoC FPGA architecture @chen2024
  ],
)<fig:soc_fpga_architecure>
#{ "" }

#figure(
  image("/figures/6_soc_fpga/HPS_ARM.jpg", width: 75%),
  caption: [
    Caption @intel2024hps
  ],
)<fig:name>
#{ "" }
Each domain has some core components. For FPGAs it's the FPGA fabric, which houses large number of logic blocks, general purpose inputs/outputs and Intelectual Properties (IPs). 

$"offset" = n_"word" * "word_size" = 7 * 32 = 224 "bits"$ -> Formula

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