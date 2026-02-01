# Random-Binary-Sequence-Generator

A PRBS generator produces a pseudo-random binary sequence, which mimics a random sequence of binary numbers. These sequences are crucial for testing high-speed communication systems by serving as test signals. PRBSs are employed to thoroughly assess dynamic performance and are particularly useful for conducting bit error rate (BER) testing, ensuring comprehensive verification of system functionality under various conditions.

With the increasing demand for high-speed circuits to achieve higher data rates, there is a corresponding need for advanced PRBS generators. Individual building blocks such as latches, D flip-flops (DFFs), and XOR gates draw high current to implement it. These components require large devices to handle the currents, resulting in increased area requirements. 

The Conventional Random Bits Generator core requires high power consumption for this operation. Parallel implementations of the PRBS and Linear Feedback Shift Register are examples of the traditional  generator. Above is the verilog implementation of the same.

The Proposed PRBS introduces an architecture that efficiently generates four uncorrelated maximum length random sequences using fewer building blocks. It aims to reduce required building blocks compared to conventional one. This advancement is verified using verilog synthesis and hardware realization on the FPGA Board.

The specific code and circuit diagram of the proposed PRBS cannot be shared due to copyright constraints. However, the resulting output waveform from this PRBS design is available for review and analysis.

---

## FPGA Verification

Both the PRBS and CRBS designs were implemented and validated for 2⁷–1, 2⁹–1, and 2¹⁵–1 bit configurations, featuring a configurable 7–15–22 bit architecture. The designs were tested and verified on the following FPGA boards:

- **Basys 3**

- **Spartan 3E**

- **Spartan 7**

The output waveforms were captured via the PMOD pins of the FPGA using a **Mixed Domain Oscilloscope**, with the system driven by a high-frequency clock (in MHz) generated externally. The acquired data was analyzed to generate **Eye Diagrams** and **Power Spectral Density** (PSD) plots, forming the basis for complete hardware–software co-verification.

**Core power utilization** was also evaluated and optimized by analyzing the current drawn through the FPGA core under different architecture configurations.


---

### IBERT Testing


Further validation was performed through IBERT testing using the SMA ports on **ZCU102** and **ZCU104 FPGAs**. This enabled high-speed link characterization and ensured signal integrity across the implemented designs.


---

Following successful verification at both the software and hardware levels, the RTL design was finalized and submitted for **IC tape-out**, leading to a real-world functioning ASIC implementation.


---


