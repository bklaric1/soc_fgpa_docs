= FPGA
In this chapter, the basics and architecure of FPGAs are examined in detail, thus providing a foundation for understanding their integration with SoC technology.

== Basics
As already mentioned in introduction, FPGAs are programmable ICs. They offer high hardware flexibility in form of posibility to customize the circuit it self, through electrically programmable switches, which connect different components inside the FPGA, meaning the structure of the circuit can be changed after manufacturing at any time through programming.

First FPGA was developed in 1985 by the company Xilinx (which was later aquired by AMD). The developed FPGA, XC2064, had only 64 configurable logic blocks. Few other companies joined the development of FPGAs as well, most notably Altera and Actel (now Microchip). By 2013, these three companies held 77% of the FPGA market @fpga_wikipedia.

The introduction of FPGAs provides an alternative to traditional Very Large Scale Integration (VLSI) technologies. For the both non-customizable Application Specific Integrated Circuits (ASICs) and semi-customazible Mask-Programmed Gate Arrays (MPGAs) the production was very costly and required extensive manufacturing effort and prototyping. To avoid the financial risk of prototyping new products, FPGAs began to see use. Their low time-to-market and risk made them the ultimate solution for the industry @stephen1992.

For this paper, an SRAM-based FPGA with island-style routing will be examined, as it is the most commonly produced FPGA. What exactly all these terms mean, will be explained in the following chapters.

== Memory technologies in FPGA programming
The programming of an FPGA, in its core, happens through programming of the electrical switches in connection to the logic blocks. Therefore, is the programming of FPGAs heavily dependent on the memory technology used in production, as the properties of the programmable switches has a notable influence on the logic architecture. There are a few types of memory technologies used or considered for use in FPGA programming: Erasable Programmable Read-Only Memory (EPROM), Electrically Erasable Programmable Read-Only Memory (EEPROM), flash, antifuse and Static Random-Access Memory (SRAM). Among these technologies, flash memory, antifuse and static memory are the ones, which are still used. @amano2018.


=== SRAM-based programming
Static Random-Access Memory (SRAM) based FPGAs are the most commonly used technology for FPGA programming, mainly due to being fully capable the complementary metal-oxide semiconductor (CMOS) technology . That refers to manufacturing capabilities that enable the production of smaller, faster, and more efficient integrated circuits. This memory technology provides the highest reconfigurability, as it allows unlimited rewriting @amano2018.

The read/write speed of SRAM is the highest of the three, with the lower and upper border being 1 ns.
For implementation of a SRAM memory cell 5 or 6 transistors are needed, which compared to other technologies is presents a big difference @yang2014.

SRAM technology is volatile and the configuration usually needs to be saved into external memory, which can present a challenge. Otherwise is the programming lost when the power is cut.  These drawbacks become almost negligible, because of the compatiblity with the CMOS technology, making this type of memory technology mainstream @amano2018.


=== Flash-based programming
Flash memory is in its nature non-volatile, enabling the FPGA to retain its configuration even when powered off. This eliminates the need for external memory to reload the configuration. Being smaller size than SRAM is also a positive factor, with the flash memory needing 1 or 2 transistors @yang2014.

They can also be written to multiple times, but not infinite, so the reconfigurability is there, but restricted to a certain number of rewrites. The CMOS technology can't be used with flash memory, creating the need for non-standard CMOS process and thus removing the posibility for miniaturization. The need for high voltage during the write/erase process is also a disadvantage @amano2018.

Due to the pros and cons of the flash memory technology, it is mostly used in specific applications, due to non-volatility @yang2014.

=== Antifuse-based programming
With the antifuse programming, the widely used type is the metal-to-metal-type. The resistance between the connections is very high at the start, thus making the circuit open, with no connections between points. During the programming process, this resistance is lowered through controlled electrical current, which forms a forms a permanent low-resistance connection between the points. The disadvantage of this technology is that it is only possible to programm it one-time. Once programmed, the connections become permanent, making this type of memory also non-volatile. Due to no silicon area needed, this technology has a small footprint. Since the high reliability, antifuse-based FPGAs are mainly used in aviation and aerospace systems @yang2014.

Antifuse-based programming is reliable, being robust against soft errors, and secure, due to the way the programming takes place, reverse engineering is impossible, since using the stanard methods of reverse engineering would destroy the chip. Main disadvantages of this technology is the lack of reconfigurability and the huge effort needed when programming, since a special programmer and a lot of time is needed. Also no tests can be run to check if any errors occured in the writing process @amano2018.

To summarize the comparison between these three types of memory technology, the pros and cons can be seen in @fig:feature_comparison_memory.

#figure(
  image("/figures/4_fpga/FPGA_memory_comparison.jpg", width: 75%),
  caption: [
    Comparison of memory technologies used in FPGAs @amano2018
  ],
)<fig:feature_comparison_memory>


== Routing architecture
Routing is a critical aspect of FPGA architecture, as it determines how the configurable logic blocks (CLBs) are connected to implement a user's design. There are a few routing styles being implemented in FPGAs, the island-based routing architecture, channel-style routing architecture and hierarchical routing architecture.

Island-based routing includes CLBs placed in a grid style connected via vertical and horizontal programmable routing
channels, as can be seen in @fig:island_style_fpga. The connections with the routing channel are found on every side of the CLBs. This type of the routing architecture is the most common @yang2014.

#figure(
  image("/figures/4_fpga/Island_style_FPGA.jpg", width: 75%),
  caption: [
    Island-style architecture in FPGAs @yang2014
  ],
)<fig:island_style_fpga>

The other two architecture types are only found in early FPGA devices and aren't used anymore @yang2014.

The focus of this paper will be set on island-based routing due to its prevalence and importance in current FPGA design.

== Architecture
As seen in @fig:fpga_architecture, the FPGAs consist of three main componentes:
- configurable logic blocks (CLBs),
- programmable interconnects,
- I/O blocks @farooq2012.

TODO: Change image

#figure(
  image("/figures/6_soc_fpga/SoC FPGA Architecture.jpg", width: 75%),
  caption: [
    Typical SoC FPGA architecture @chen2024
  ],
)<fig:fpga_architecture>

These components are the core building blocks of the FPGAs. 
The CLBs, implemented through look-up tables and flip-flops, implement the core logic the user programs. They are arranged in a regular grid pattern across the FPGA chip, in the aforementioned island-style architecture. 
The interconnects represent the connections between CLBs.
The I/O blocks are the pins of the FPGA chip and are used for external communication. 
This architecture allows programmers to implement any type of digital circuits by configuring both the logic functions within CLBs and the connections between them in form of programming the switches connection the CLBs to the interconnects.

The functionality of the FPGAs is further extended through the use of IPs (Intellectual Properties), implemented with these main components. They provide pre-designed modules for various applications and use scenarios.

Each component will be examined in detail in the following chapters.

=== Logic blocks

Text
which are grouped together in logic elements (LE)
Einzelne Logikelemente sind nicht fest verdrahtet und man kann beliebige Funktionalität programmieren
Fine-grain vs coarse grain


#pagebreak()


=== Interconnects

Text

#pagebreak()


=== I/O blocks

Text

#pagebreak()


=== IPs

Text
IPs sind vielfach einsetzbarer, vorgefertigter Funktionsblock, die von einem Entwickler oder Hersteller umgesetzt sind und werden dann so weiter lizenziert/verkauft
Speicherblöcke, zum Beispiel M4K RAM Blöcke


#pagebreak()


== Programming of a FPGA

Text

#pagebreak()