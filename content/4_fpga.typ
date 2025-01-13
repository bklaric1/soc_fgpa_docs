= FPGA
In this chapter, the basics and architecture of FPGAs are examined in detail, thus providing a foundation for understanding their integration with SoC technology.

== Basics
As already mentioned in the introduction, FPGAs are programmable ICs. They offer high hardware flexibility in the form of the possibility to customize the circuit itself through electrically programmable switches. This connects different components inside the FPGA, meaning the structure of the circuit can be changed after manufacturing at any time through programming.

The first FPGA was developed in 1985 by the company Xilinx (which was later acquired by AMD). The developed FPGA, XC2064, had only 64 configurable logic blocks. A few other companies joined the development of FPGAs as well, most notably Altera and Actel (now Microchip). By 2013, these three companies held 77% of the FPGA market @fpga_wikipedia.

The introduction of FPGAs provides an alternative to traditional Very Large Scale Integration (VLSI) technologies. For the both non-customizable Application Specific Integrated Circuits (ASICs) and semi-customizable Mask-Programmed Gate Arrays (MPGAs) the production was very costly and required extensive manufacturing effort and prototyping. To avoid the financial risk of prototyping new products, FPGAs began to see use. Their low time-to-market and risk made them the ultimate solution for the industry @stephen1992.

For this paper, an SRAM-based FPGA with island-style routing will be examined, as it is the most commonly produced FPGA. What exactly all these terms mean will be explained in the following chapters. It should also be mentioned that 3-D FPGA architecture also exists; however, this paper will focus on the 2-D architecture.

== Memory technologies in FPGA programming
The programming of an FPGA, in its core, happens through programming of the electrical switches in connection to the logic blocks. Therefore, is the programming of FPGAs is heavily dependent on the memory technology used in production, as the properties of the programmable switches have a notable influence on the logic architecture. There are a few types of memory technologies used or considered for use in FPGA programming: Erasable Programmable Read-Only Memory (EPROM), Electrically Erasable Programmable Read-Only Memory (EEPROM), flash, antifuse and Static Random-Access Memory (SRAM). Among these technologies, flash memory, antifuse and static memory are the ones that are still used. @iida2018two.

=== SRAM-based programming
Static Random-Access Memory (SRAM)-based FPGAs are the most commonly used technology for FPGA programming, mainly due to being fully capable of the complementary metal-oxide semiconductor (CMOS) technology. That refers to manufacturing capabilities that enable the production of smaller, faster, and more efficient integrated circuits. This memory technology provides the highest reconfigurability, as it allows unlimited rewriting @iida2018two.

The read/write speed of SRAM is the highest of the three, with the lower and upper border being 1 ns.
For implementation of an SRAM memory cell, 5 or 6 transistors are needed, which compared to other technologies is presents a big difference @yang2014.

SRAM technology is volatile, and the configuration usually needs to be saved into external memory, which can present a challenge. Otherwise, the programming is lost when the power is cut.  These drawbacks become almost negligible, because of the compatibility with the CMOS technology, making this type of memory technology mainstream @iida2018two.

=== Flash-based programming
Flash memory is, in its nature, non-volatile, enabling the FPGA to retain its configuration even when powered off. This eliminates the need for external memory to reload the configuration. Being smaller than SRAM is also a positive factor, with the flash memory requiring 1 or 2 transistors @yang2014.

They can also be written to multiple times, but not infinitely, so the reconfigurability is there, but restricted to a certain number of rewrites. The CMOS technology can't be used with flash memory, creating the need for non-standard CMOS processes and thus removing the possibility for miniaturization. The need for high voltage during the write/erase process is also a disadvantage @iida2018two.

Due to the pros and cons of the flash memory technology, it is mostly used in specific applications, due to its non-volatility @yang2014.

=== Antifuse-based programming
With the antifuse programming, the widely used type is the metal-to-metal-type. The resistance between the connections is very high at the start, thus making the circuit open with no connections between points. During the programming process, this resistance is lowered through controlled electrical current, which forms a permanent low-resistance connection between the points. The disadvantage of this technology is that it is only possible to program it one-time. Once programmed, the connections become permanent, making this type of memory also non-volatile. Due to no silicon area needed, this technology has a small footprint. Since the high reliability, antifuse-based FPGAs are mainly used in aviation and aerospace systems @yang2014.

Antifuse-based programming is reliable, being robust against soft errors, and secure. Due to the way the programming takes place, reverse engineering is impossible, since using the standard methods of reverse engineering would destroy the chip. The main disadvantages of this technology are the lack of reconfigurability and the huge effort needed when programming, since a special programmer and a lot of time are needed. Also, no tests can be run to check if any errors occurred in the writing process @iida2018two.

To summarize the comparison between these three types of memory technology, the pros and cons can be seen in @fig:feature_comparison_memory.

#figure(
  image("/figures/4_fpga/FPGA_memory_comparison.jpg", width: 85%),
  caption: [
    Comparison of memory technologies used in FPGAs @iida2018two
  ],
)<fig:feature_comparison_memory>

== Routing architecture
Routing is a critical aspect of FPGA architecture, as it determines how the logic blocks are connected to implement a user's design. There are a few routing styles being implemented in FPGAs: the island-based routing architecture, channel-style routing architecture, and hierarchical routing architecture.

Island-based routing includes logic blocks placed in a grid style connected via vertical and horizontal programmable routing channels, as can be seen in @fig:island_style_fpga. The connections with the routing channel are found on every side of the logic blocks. The logic behind connection and switch boxes will be examined later in the following chapters. This type of routing architecture is the most common @yang2014.

#figure(
  image("/figures/4_fpga/Island_style_FPGA.jpg", width: 75%),
  caption: [
    Island-style architecture in FPGAs @varghese2001
  ],
)<fig:island_style_fpga>
#{ "  " }
The other two architecture types are only found in early FPGA devices and aren't used anymore @yang2014.

The focus of this paper will be set on island-based routing due to its prevalence and importance in current FPGA design.

== Architecture
As seen in @fig:fpga_architecture_overview, the FPGAs consist of roughly three main components:
- logic blocks,
- interconnects (consisting of connection and switch boxes and routing channels),
- I/O blocks @iida2018two.
#{ "  " }
#figure(
  image("/figures/4_fpga/FPGA_architecture_overview.jpg", width: 75%),
  caption: [
    Typical SoC FPGA architecture @iida2018two
  ],
)<fig:fpga_architecture_overview>
#{ "  " }
These components are the core building blocks of the FPGAs.

The logic blocks, implemented through look-up tables and D-Flip-Flops, implement the core logic of the user programs. They are arranged in a regular grid pattern across the FPGA chip in the aforementioned island-style architecture.
The interconnects represent the connections between logic blocks. They are further sorted into three components: routing channels, connection boxes, and switch boxes.

The I/O blocks interface with the pins of the FPGA chip and are used for external communication.

This architecture allows programmers to implement any type of digital circuit by configuring both the logic functions within logic blocks and the connections between them, in the form of programming the switches that connect the logic blocks to the interconnects.

The functionality of the FPGAs is further extended through the use of Intellectual Properties (IPs), implemented with these main components. They provide pre-designed modules for various applications and use scenarios.

Each component will be examined in detail in the following chapters.

=== Logic blocks
The logic blocks terminology is very complex and vendor-dependent, thus being an almost certain source of confusion. To avoid this, this paper will focus on presenting a logic block as a core building block of the FPGAs, with it containing some number of logic elements @farooq2012.

As explained, a logic block is a core component of FPGAs. It is used to implement any algebraic logic or to serve as storage through already implemented D-Flip-Flops.

The structure of a logic block can be seen in @fig:logic_block_structure. There, a different core component is to be seen, a logic element, also named BLE (basic logic element). Logic blocks incorporate some number of logic elements, dependent on the chip and the vendor. The logic elements are connected to the routing channels through the external connections of the logic block.

#figure(
  image("/figures/4_fpga/Logic_block_structure.jpg", width: 85%),
  caption: [
    Structure of a logic block @farooq2012
  ],
)<fig:logic_block_structure>
#{ "  " }
Logic blocks consists of smaller units called logic elements.
If the logic element is examined, a structure as shown in @fig:logic_block_structure can be seen. This is a standard logic element consisting of a Look-Up Table (LUT), D-FLip-Flop and an output multiplexer.

#figure(
  image("/figures/4_fpga/Logic_element_basic.jpg", width: 75%),
  caption: [
    Basic view of the logic element architecture @betz1998
  ],
)<fig:logic_element_basic>
#{ "  " }
A LUT can implement any arbitrary logical function, up to the number of inputs. A 4-input LUT has $2^4 = 16$ different possible combinations, @iida2018two.

A deeper delve into LUTs presents some interesting information. For example, due to area taken and efficiency, the 4-input LUTs were the considered as the best choice when FPGA technology started blooming, as shown in @fig:lut_trade-off. Nowadays, 6-input LUTs are implemented and seen more often, due to advancements in the implementation of CMOS technology and optimization of the mapping of logic circuit design into actual hardware resources @amagasaki2018.

#figure(
  image("/figures/4_fpga/LUT_trade-off.jpg", width: 75%),
  caption: [
    Trade-off between area/delay and LUT inputs @amagasaki2018
  ],
)<fig:lut_trade-off>
#{ "  " }
D-Flip-Flops are basic registers used to save a value for one clock cycle. They are used in every logic element, as with them, a user can implement sequential logic instead of combinational.

To differentiate, combinational logic is dependent only on the actual inputs, presenting itself in the form of standard logic gates, like AND, OR, XOR, and other gates.

On the other hand, sequential logic allows for more complex implementations, as previous state or output is saved into the D-Flip-Flop over the clock cycle. That makes it possible to implement more complex logical functions, like counters or state machines, with a D-Flip-Flop acting as a storage (register) @sueyoshi2018.

The output multiplexer is used to choose between either the combinational and sequential logic.

If the architecture of the logic element is further examined, as shown in @fig:logic_element_complex, it can be seen that the LUT consists of single SRAM cells and multiplexers implementing the truth table of the LUT.

#figure(
  image("/figures/4_fpga/Logic_element_complex.jpg", width: 75%),
  caption: [
    Deeper look into the architecture of a logic element @farooq2012
  ],
)<fig:logic_element_complex>
#{ "  " }
The choice of implementation of the logic blocks can be divided into two big groups: fine-grain and coarse-grain approaches.

The fine-grained logic blocks implement LUTs and do it so with the use of LUTs. It is the standard approach used in commercial FPGAs, since each block is designed to implement basic logic functions. It requires a lot of programmable interconnect, which eventually results in an FPGA that suffers from area-inefficiency, low performance, and high power consumption. This is due to the island-style routing occupying 80-90% of the total area, with the logic occupying only 10-20% @motomura2018 @farooq2012.

The coarse-grained logic blocks are implemented on a higher level, where one logic block consists of a combination of  LUTs, arithmetic units, or other resources. They are very efficient when implementing specific operations. On the other hand, implementation of simple functions leads to a waste of resources. These types of FPGAs are used, among other branches, in Reconfigurable Computing (RC) @motomura2018 @farooq2012.

=== Interconnects
The programmable interconnects, as already mentioned, incorporate three components: routing channels, connection boxes, and switch boxes. They can be seen in @fig:fpga_routing.

#figure(
  image("/figures/4_fpga/FPGA_routing.jpg", width: 75%),
  caption: [
    Overview of routing components in an FPGA @babu2021
  ],
)<fig:fpga_routing>
#{ "  " }
The routing channels or wire segments consist of wires connecting the logic blocks as well as I/O blocks through connection boxes and switch boxes and thus enabling communication between one another. They are an essential part of FPGAs; as they enable the connection of multiple logic blocks, more complex logic functions can be created. They also enable communication with external devices through the I/O blocks. A routing channel has a width, represented by the letter W, which corresponds to the amount of wires in one segment @rahman2003.
For example, in @fig:fpga_routing the width of the wire segment is 4.
There is also segment length, which represents how many logic blocks the wire segment spans across. This can be seen in greater detail in @fig:wire_length.

#figure(
  image("/figures/4_fpga/Wire_length.jpg", width: 75%),
  caption: [
    Different wire lengths @masud2000
  ],
)<fig:wire_length>
#{ "  " }
The connection boxes are a unidirectional switching blocks that enable connections from the inputs and outputs coming from logic blocks in the form of local wires, also called short wire segments, with wires of the routing channels, either horizontally or vertically.

These boxes are typically implemented using SRAM-based programmable switches, enabling reconfigurable connections at each connection point. Each potential connection within a connection box is controlled by an SRAM cell. The state of the SRAM cell, either '0' or '1', determines if the transistor will be conducting, since the SRAM cell is connected to the gate of a transistor (mostly CMOS), and thus a certain point is active or inactive.

The value $F_c$ represents the percentage of how many wire segments each logic block pin can connect to. Typical values are between 0.25 and 1 (25% and 100% of available wire segments) @rahman2003.

A typical connection box can be seen in @fig:connection_box.

#figure(
  image("/figures/4_fpga/Connection_box.jpg", width: 55%),
  caption: [
    Connection box with 3 inputs and outputs @joseph2018
  ],
)<fig:connection_box>
#{ "  " }
The switch boxes connect wire segments in more different ways and thus are more complex in comparison to connection boxes. The same principle is used as with connection boxes, where each point has an SRAM cell and a transistor @sivaswamy2005.

The three typical connection types inside a switch box are:
- disjoint,
- universal,
- Wilton @joseph2018.
#{ "  " }
With the disjoint connection type, each wire segment connects to exactly three other wire segments. Uses single-length wires.

The universal and Wilton connection types require fewer wire segments and transistors per connection point; however, with longer wire segments, they use more switches per track and therefore require more transistor area overall.

There are also a few other variations, from which Imran is worth mentioning, modifying the Wilton type to use the same number of switches as the disjoint type. The most commonly used type is Wilton; however, modern FPGAs incorporate different types for optimal performance @shi2022.

The difference between these connection types can be seen in @fig:switch_boxes_connections.

#figure(
  image("/figures/4_fpga/Switch_boxes_connections.jpg", width: 75%),
  caption: [
    Connection types comparison @joseph2018
  ],
)<fig:switch_boxes_connections>
#{ "  " }
The value $F_s$ is used to represent how many connections each incoming wire segment can make inside a switch box. For 2-D FPGAs: $F_s = 3$; for 3-D FPGAs: $F_s = 3$ @rahman2003

An in-depth view of these components can be examined in @fig:complex_view.

#figure(
  image("/figures/4_fpga/Routing_complex.jpg", width: 75%),
  caption: [
    In-depth view of the routing in FPGAs @zhou2006
  ],
)<fig:complex_view>

=== I/O blocks
These blocks connect the I/O pins of the FPGA chip with the internal wiring. Its purpose is to provide a configurable way for signals to interact with the chip. I/O blocks serve various roles, such as power supply, clock, and user I/Os @iida2018two.

An example I/O block from Xilinx XC4000 can be seen in @fig:io_block. This I/O block incorporates pull-ups and pull-downs to clamp the output to 0 or 1 instead of the output floating. It also supports different voltages. There is also, among other things, a D-Flip-Flop on every input/output.

#figure(
  image("/figures/4_fpga/IO_block.jpg", width: 75%),
  caption: [
    I/O block of Xilinx XC4000 @amagasaki2018
  ],
)<fig:io_block>

== IPs
FPGA vendors have gradually incorporated more functionalities into their programmable chips, making them more flexible and more performant. This is done using IPs. 

IPs are pre-designed, reusable functional blocks since they are mostly common modules found in many designs. They are used to further enhance the functionality of FPGAs. As said, they are implemented from the manufacturer but can also be implemented from a developer after production. They are usually licensed and sold @izumi2018.

As seen in @fig:fpga_complex_architecture, FPGAs incorporate the IPs in many forms, such as different controllers, RAM blocks, Digital Signal Processor (DSP) blocks, and even whole processor subsystems.

#figure(
  image("/figures/4_fpga/FPGA_complex_architecture.jpg", width: 75%),
  caption: [
    Modern heterogeneous FPGAs with incorporated IPs @boutros2022
  ],
)<fig:fpga_complex_architecture>
#{ "  " }
The IPs are usually split up into two categories, based on how they are implemented:
- soft IPs,
- hard IPs.
#{ "  " }
There are also firm IPs, which find themselves in between these two kinds, but the paper will focus on the mentioned two types.

Soft IPs are functional blocks implemented using the aforementioned structure consisting of logic blocks, interconnects, and I/O blocks. Since they are essentially programmed into FPGAs, they are usually implemented after production, thus making them very flexible and portable. These IPs have a disadvantage in the form of no guarantee of timing or power characteristics, since it's dependent on which process or application it's implemented in. Some examples of soft IPs are: interface blocks, encryption blocks, networking blocks, controllers, and whole processor systems @ochoaruiz2013[pp. 62--64].

Hard IPs are different from soft IPs in form that they are implemented directly in silicon of the FPGA chip. This means they can only be implemented at production time. They often provide the advantage of having predictable performance and are optimized for the given usage. These types of IPs have fixed layouts, taking away dedicated chip area. Hard IPs are typically DSP blocks, RAM blocks (for example, M4K blocks), processor systems, with real processors implemented in the silicon, and many others @ochoaruiz2013[pp. 62--64]. 

An example FPGA with different implemented IPs can be seen @fig:fpga_ips, presenting different possibilities of IP implementations.

#figure(
  image("/figures/4_fpga/FPGA_IPs.jpg", width: 75%),
  caption: [
    Different IPs implemented in an FPGA chip @ochoaruiz2013
  ],
)<fig:fpga_ips>
#{ "  " }
The ability to implemented whole processor systems presents the introduction to the SoC capabilities of the FPGA chips, able to incorporate processor systems with FPGA fabric in one chip.

== Programming of an FPGA
Programming an FPGA requires a specific design and programming flow. The design flow involves translating a desired digital circuit into configuration data that can be loaded into the FPGA's programmable components. 

This is done using Hardware Description Languages (HDLs), in combination with the suitable CAD programs, like Quartus from Intel. Software like this enables analysis and synthesis of HDL designs. This gives the developers the ability to compile their designs, perform timing analysis, and, among other things, also to configure an FPGA device with the programmer @quartus_wikipedia.

It is worth noting, that programming with HDLs differs from standard programming in many aspects, but one of the most important is that the whole written code runs in parallel and not chronologically, like in C, for example.

When talking about HDLs, the widely spread ones are VHDL and Verilog. VHDL is most commonly used in Europe and stands for VHSIC (Very High Speed Integrated Circuit) HDL, whereas Verilog is most used in America.

As seen in @fig:fpga_design_flow, the typical design flow encompasses a few different stages. From the design the developer writes in HDL, a CAD program like Quartus completes the other steps with automatic optimization, leaving only the last step, which is the programming of the target FPGA device.

#figure(
  image("/figures/4_fpga/FPGA_design_flow.jpg", width: 30%),
  caption: [
    Typical FPGA design flow @iida2018five
  ],
)<fig:fpga_design_flow>
#{ "  " }
#pagebreak()