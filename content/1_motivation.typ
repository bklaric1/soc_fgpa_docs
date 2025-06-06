= Motivation
This subject has been a point of my interest for some time now. I first took notice of the FPGA technology during _Digital Technology_ classes in the second semester. A part of the subject was the practical work with an FPGA board. This peaked my interest at the time, since working with logic gates was always fascinating to me. I have had many more opportunities to work with FPGA boards since then, and I am currently working on a technical project based on a SoC FPGA board. The project incorporates the Terasic DE1-SoC board, which can be seen in @fig:terasic, as a CAN data logger, where the CAN cores are developed in the FPGA fabric whereas the logging and presentation of the data take place in the processor system.

#figure(
  image("/figures/1_motivation/SoC_FPGA.jpg", width: 75%),
  caption: [
    Terasic DE1-SoC board with Cyclone V SE SoC FPGA chip
  ],
)<fig:terasic>
#{ "  " }
The technology was always compelling to me. I have wanted for a long time to delve deeper into the core to learn about everything there is to know about the FPGA technology and incorporation of an integrated processor system with the FPGA on a single chip. The seminar, with the presentation and this paper, presented itself as a great way to dive deeper into the subject with the proper motivation.

#pagebreak()