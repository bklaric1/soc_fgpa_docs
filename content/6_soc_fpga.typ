= SoC FPGA
The culmination of these two technologies is summed up as a single product, SoC FPGA. What the purpose of it them combining is, what the advantages are, and in which branches of industry is this technology applied will be examined in the following chapters. The examples used will be those of Intel corporation.

== Basics
SoC FPGAs combine a hard processor system (HPS, acronym by Intel) and FPGA fabric into one chip, with the components providing complementary architectures within a single IC. Having these two components on the same silicon provides many advantages and allows direct connection between them. This decreases production cost, since fewer device pins, PCB tracks and vias are needed, thus resulting in smaller board size @intel2024.

This integration also provides at least comparable and likely superior performance compared to the use of these two components separately, with lower power usage and system cost. Since the communication between the components is direct, the latency is lower and bandwidth of the data sent is substantially higher @altera2013.

The power consumption, when examined, shows a decrease in total device core power consumption by up to 40% and transceiver channel power consumption by up to 50% @intel2018.

The implementation of these two components allows for parallel execution of both systems, allowing for complex tasks to be handled by the HPS, while parallel computation is done by the FPGA. This makes this system very flexible, since many tasks can be executed and computed independently of one another.

Since FPGA logic, more precisely logic gates and interconnects have known and consistent propagation delays, meaning this system has real-time capabilities.

Although the SoC FPGA combines these two components, some functions are kept separate, such as clocking, power, reset. This is done because HPS can be run without the FPGA part @intel2024. 

An overview of the combination of these technologies is shown in the @fig:soc_fpga_architecure.

#figure(
  image("/figures/6_soc_fpga/SoC FPGA Architecture.jpg", width: 75%),
  caption: [
    Typical SoC FPGA architecture @chen2024
  ],
)<fig:soc_fpga_architecure>

== Architecture
This integration has been previously mentioned in the context of hard IPs. The HPS is essentially a hard IP block embedded within the FPGA chip.

The architecture of this technology is very dependent on the vendor and their choice of implementation. It is also dependent on the processor system used. For clarification purposes, this paper will focus on an example from Intel, in from of Cyclone V SE SoC. Here, an FPGA is integrated with Arm Cortex-A9 as HPS. 

This structure can be seen in @fig:hps. Looking back at the template of SoC implementation, it can be examined, that this implementation follows the template.

#figure(
  image("/figures/6_soc_fpga/HPS_ARM.jpg", width: 75%),
  caption: [
    HPS with ARM Cortex-A9 processor @intel2018
  ],
)<fig:hps>
#{ "   " }
The main exchange block between HPS and FPGA parts is the Level 3 Interconnect, which provides different types of Advanced eXtensible Interface (AXI) bridges. These allow for memory access from both directions, with HPS-to-FPGA bridge allowing the HPS core to access the memory instantiated in the FPGA fabric, while FPGA-to-HPS bridge allows for s logic in the FPGA fabric to access the memory and peripherals in the HPS. This provides a flexible exchange between two areas. Each HPS-FPGA bridge provides asynchronous clock crossing for data transfer between the FPGA fabric and the HPS. This is however not the only form of exchange possible, since both parts can access the DDR memory directly, so shared memory access is also an option @intel2018.

As stated before, these two components can operate separately. HPS and FPGA portions can be powered on independently. HPS can be powered on without powering on the FPGA portion, but to power FPGA portion, HPS needs to be powered on first. It is also possible to turn off the FPGA portion while keeping the HPS turned on @altera2014. 

A question may arise, regarding the area distribution between FPGA and hard processor system. The area distribution between them is typically considered proprietary by semiconductor companies and is rarely published in public documentation. Therefore, the distribution of the physical silicon area between the two is left to be speculated.

== Comparison with the soft processor system
One might ask a question, why implement a hard processor system, which can't later be configured, defeating the whole purpose of FPGAs, which is the reconfigurability of the system after production, when there are soft processor systems.

Now there are many reasons for this, but the best way to answer this would be to compare them, with examples. As a hard processor system, an ARM Cortex-A9 processor will be considered, and for soft processor system a Nios II/f processor (since it's the fastest version @altera2006), implemented into Cyclone V SE SoC. This will be a comparison of the processor performance, with difference in implementation also being taken into an account.

As mentioned, the main disadvantage of the HPS system is the fact, that after production, the possibility to reconfigure the system on hardware level is nonexistent, since it's implemented directly into silicon. On the other hand, a soft processor system is implemented in the FPGA logic, and therefore can be reconfigured at any time, providing flexibility.

The HPS doesn't use any FPGA resources, like soft processor system does, in form from logic blocks, but takes physical area in the chip.

Now, the main difference between these two implementations is the performance of their components, mainly processors. When comparing the clock frequencies between the two, the ARM Cortex-A9 has a higher clock frequency with up to 925 MHz @intel2018.

On the other side, the Nios II/f reaches clock frequency speeds of 170 MHz, which is much lower than the HPS core processor. This is mostly due to limitations of the FPGA fabric speed @intel2023.

The HPS with ARM Cortex-A9 also has other benefits, which the inclusion of an ARM processor brings.

But the fact that soft processor system is implemented fully from logic blocks is still a huge accomplishment.

== Applications
The application of SoC FPGAs has become essential in a variety of fields, due to their ability to combine the flexibility of FPGA hardware with the performance of integrated hard processor systems.

They play a pivotal role in automotive systems, finding a usage in almost all modern fields, as shown in @fig:application_automotive. SoC FPGAs are used in automotive due to their real-time processing capabilities, and due to reconfigurability and scalability. Advanced Driver Assistance Systems (ADAS) wouldn't be conceivable without the use of SoC FPGAs, since they offer parallel processing capabilities of an FPGA to handle high-bandwidth data efficiently, while the HPS manages decision-making algorithms. They have seen use in In-Vehicle Infotainment (IVI), where FPGA logic ensures high-speed video streaming and adaptable interfaces, while the HPS supports application management. And due to deterministic execution of FPGA logic, SoC FPGAs are also used in autonomous driving applications @microsemi2017.

#figure(
  image("/figures/6_soc_fpga/Application_automotive.jpg", width: 75%),
  caption: [
    Applications of SoC FPGA technology in automotive @microsemi2017
  ],
)<fig:application_automotive>
#{ "  " }
The field of healthcare also found a use for SoC FPGAs, integrating them in devices like CT scanners, MRIs, and ultrasounds, where they have many tasks, like accelerating image reconstruction. Portable health devices have also seen SoC FPGA integration due to real-time capabilities and energy-efficient solutions. With the every growing integration of AI into healthcare, SoC FPGAs are also seeing more use @intel2024healthcare. SoC FPGAs have also been utilized in the field of cancer detection @afifi2019.

SoC FPGAs have also been integrated in my different fields, like telecommunications, smart energy, robotics, drones, rockets. Nowadays, they are utilized in many ares of the modern technologies, providing their advantages, and with ever-growing advancements, they should see even more integration in edge and cloud computing. 

Attempting to name all the fields where they are integrated and explain in what way would result in an additional few pages. Therefore, in sense of keeping the length of this paper in the boundaries, these areas, and the implementation should just be mentioned.

#pagebreak()