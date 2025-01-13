= SoC
In this chapter, the basics and architecture of System-on-Chips (SoCs) are examined in detail, thus providing a foundation for understanding their integration with FPGA technology.

== Basics
The definition of the System-on-Chip (SoC) technology is defined as a complex IC that integrates a complete product in a single chip. SoC usually incorporates a processor, on-chip memory, and interfaces with peripherals. SoCs encompass both software and hardware components. The SoC technology allows a complete system to be designed into one or a few integrated devices, making it tempting for developers and manufacturers.

Since the SoCs typically contain all the components needed for a whole processor system, they are often also able to run smaller versions of operating systems.

The purpose of the SoCs is to reduce system size and power consumption of embedded devices they are implemented in, since only one chip is needed for the entire processor system. They also have the advantage of shorter communication channels between components, decreasing delay and improving performance @martin2001.



== Architecture

@schaumont2013

#figure(
  image("/figures/5_soc/SoC_template.jpg", width: 75%),
  caption: [
    Generic template for a System-on-Chip @schaumont2013
  ],
)<fig:name>
#{ "" }

#pagebreak()