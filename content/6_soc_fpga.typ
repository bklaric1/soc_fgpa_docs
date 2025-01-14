= SoC FPGA
The culmination of these two technologies 

== Basics

advantages and purpose

The combination of these technologies is shown in the @fig:soc_fpga_architecure.

#figure(
  image("/figures/6_soc_fpga/SoC FPGA Architecture.jpg", width: 75%),
  caption: [
    Typical SoC FPGA architecture @chen2024
  ],
)<fig:soc_fpga_architecure>
#{ "" }

@intel2024socfpga

== Architecture

HPS and FPGA fabric integration and communication

A question may arise, regarding the area distribution between FPGA and hard processor system. The area distribution between them is typically considered proprietary by semiconductor companies and is rarely published in public documentation. Therefore the distribution of the physical silicon area between the two is left to be speculated.

#figure(
  image("/figures/6_soc_fpga/HPS_ARM.jpg", width: 75%),
  caption: [
    Caption @intel2024hps
  ],
)<fig:name>
#{ "" }

== Comparison with soft IP



== Applications



#pagebreak()