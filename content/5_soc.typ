= SoC
In this chapter, the basics and architecture of System-on-Chips (SoCs) are examined in detail, thus providing a foundation for understanding their integration with FPGA technology.

== Basics
The definition of the SoC technology is defined as a complex IC that integrates a complete product in a single chip. SoC usually incorporates a processor, on-chip memory, and interfaces with peripherals. SoCs encompass both software and hardware components. The SoC technology allows a complete system to be designed into one or a few integrated devices, making it tempting for developers and manufacturers.

Since the SoCs typically contain all the components needed for a whole processor system, they are often also able to run smaller versions of operating systems.

The purpose of the SoCs is to reduce system size and power consumption of embedded devices they are implemented in, since only one chip is needed for the entire processor system. They also have the advantage of shorter communication channels between components, decreasing delay and improving performance @martin2001.

== Architecture
The architecture of SoC technology is dependent on the application. With that said, SoC technology, in the view of the implementation this paper covers, still classifies core components. These will be examined in this chapter.

The SoC usually incorporate core components corresponding to the following groups:
- processor,
- memory,
- peripherals,
- hardware accelerators @martin2001.
#{ "  " }
This structure is seen in most SoCs. A type of generic template incorporating these components can be seen in @fig:soc_generic. Due to these components not being a core topic of this paper, they won't be examined in great detail; however, their core concepts will be mentioned in the following sections.

#figure(
  image("/figures/5_soc/SoC_template.jpg", width: 75%),
  caption: [
    Generic template for a SoC @schaumont2013
  ],
)<fig:soc_generic>
#{ "  " }
The processor is the central controller of the SoC design, often implemented with RISC (Reduced Instruction Set Computer) architecture, for example ARM Cortex or RISC-V.

Memory with its controllers is also a very important part of the SoC design. On-chip memory, for example SRAM, offers fast localized access, while off-chip memory, for example DRAM, offers more capacity. The internal cache memory is related to the processor.

Peripherals include many hardware components, which are not inherently a core component of the processor system but are still controlled by it. It includes components such as UART (Universal Asynchronous Receiver/Transmitter) interface, DMA controllers, video and audio encoders, and many more. They also include inputs and outputs of the SoC.

The hardware accelerators represent specialized hardware components within the SoC, designed to perform specific tasks, more efficiently than other of the general components. These include image and signal processing components, like DSPs @schaumont2013.

With the acquired understanding in the previous chapters, the integration of FPGAs and SoCs into a cohesive SoC FPGA architecture should now be more comprehensible.

#pagebreak()