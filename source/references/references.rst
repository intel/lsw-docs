References
==========

The following section provides references to industry standards that should be adhered to in the context of deploying latency sensitive workloads, for example meeting the stringent Transmission Time Intervals (TTI) for RAN applications, along with performing Precision Time Protocol and Synchronous Ethernet synchronization.

Timing and Synchronization Standards
------------------------------------

The IEEE 1588-2008 and IEEE 1588-2019 guides document the Precision Time Protocol (PTP) version 2 and version 2.1 standards and provide the foundation of precise packet-based timing synchronization. They define the PTP standard including clock roles (Grandmaster, Boundary, and Transparent clocks) and are required for the timing alignment of Radio Access Network (RAN) applications, for example MMIMO deployment. In the context of RAN these standards enable sub-microsecond synchronization accuracy between distribute radio units (RUs), distributed units (DUs), and centralized units (CUs). The reference profiles in this case include ITU-T G.8275.1, which provides a full timing support implementation, an ITU-T G.8275.2, which provides partial timing support.

In addition, the ITU-T G.8261, G8262, G8264 standards document the requirements for Synchronous Ethernet (SyncE).  The G.8261 standard specifies the overall architecture and performance limits for packet-based frequency synchronization.  Furthermore, the G.8262 standard defines the Ethernet Equipment Clock (EEC) requirements in terms of wander, jitter, and holdover. Moreover, the G.8264 specification defines the Ethernet Synchronization Messaging Channel (ESMC) standard. In the context of RAN deployments, SyncE is used in conjunction with PTP to provide frequency stability during PTP holdover or in the event of link failures. Typical performance targets for SyncE include frequency accuracy on the order of sub 16 parts per billion (ppb) at air interface reference.

In terms of phase and timing synchronization the ITU-T G.8271, G.8272, G.8273, and G.8275 standards cover the key latency and phase error control specifications for RAN.  The G.8271 standard discusses on the timing and phase synchronization architecture along with performance.  In this case, the key target requirement is an end-to-end network limit of +/- 1.5 microseconds for 5G Time Division Duplex (TDD) relative time error. The G.8272 standard focuses on the  Primary Reference Time Clock (PRTC), with a target of 100 nanoseconds (1 PPS) traceable to the UTC. The G.8273.2 standard addresses boundary and transparent clock performance, while the G.8275 standard focuses on Network PTP profiles and defines how the delay, asymmetry, and packet delay variation are to be handled. Collectively these standards define the absolute versus relative time error budgets and specify how timing packets must traverse the network in order to maintain accuracy.

Transport and Latency Budget Standards
--------------------------------------

The IEEE 802.1AS-2020 (gPTP) standard documents the Time-Sensitive Networking (TSN) adaptation of PTP for Ethernet protocols, which is relevant whenever RAN elements share infrastructure within TSN domains, and maintains bounded latencies for deterministic time propagation, for example less than 1 microsecond. The IEEE 1914.1 and 1914.3 packet-based front-haul defines the latency, jitter, and synchronization requirements for Centralized RAN (C-RAN) and front-haul over Ethernet. Some of the key requirements include a round-trip latency less than or equal to 250 microseconds, a Packet Delay Variation (PDV) of less than 100 nanoseconds for synchronization traffic, and jitter less than 10 nanoseconds for timing signals. The 3GPP specifications for timing and TTI alignments are documented within 3GPP TS 38.104, TS 38.133, TS 38.211, TS 38.213, and TR 38.801. The 3GPP TS 38.104 specification describes the base station (gNB) radio performance requirements, such as the frame timing accuracy, typically +/- 1.5 microseconds cell-to-cell for Time Division Duplex (TDD) RAN. Furthermore, 3GPP TS 38.133 describes the requirements for synchronization accuracy between Radio Units (RUs), which must maintain a phase alignment, for example less than or equal to 260 nanoseconds for a 5G New Radio (5GNR) TDD sub-carrier spacing greater than or equal to 30 kHz. The 3GPP TS 38.211 and TS 38.213 specifications describe the physical channels and timing structures, for example with definitions of Transmission Time Intervals (TTIs) of 1 ms, 0.5 ms, or 0.25 ms depending on the use case. In addition, the 3GPP TR 38.801 specification describes the study of NR RAN architectures and contains timing distribution models along with methods for propagation delay compensations.

Best Practice and Industry Implementation Guidance
--------------------------------------------------

The Alliance for Telecommunications Industry Solutions (ATIS) provides practical end-to-end design examples for deploying solutions that include PTP, SyncE, along with GNSS with holdover. In addition, the Open RAN (O-RAN) Working Groups (WG), for example WG4, provide definitions for synchronization models and acceptable latency for RU-DU interconnects, for example a 100 nanosecond differential delay. Furthermore, the Small Cell Forum provides such specifications as TR-196, which documents small cell synchronization and front-haul timing requirements. Moreover, ITU-T G.8271 Appendix VI includes a set of time error budgets for both network and equipment contributions. Vendors such as Microchip, ADI, and Calnex provide real-world jitter and holdover performance numbers along with recommended testing methodologies.

Typical Timing and Latency Targets for 5G RAN
---------------------------------------------

The following table provides an overview of the set of parameters, the typical requirements, along with the associated sources.

.. csv-table::
   :header: "Parameter", "Typical Requirement"
   :file: csv/references.csv       


