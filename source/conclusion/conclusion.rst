Conclusion
==========

To summarize, some of the key concepts that were discussed within this guide include the following:
  * In general Latency sensitive applications are categorized as mission critical workloads that must meet strict timing requirements. Such workloads cover multiple domains and use cases including industrial IoT, financial sector trading, as well as Radio Access Networks.
  * RAN applications in particular are required to continually meet their Transmission Time Interval (TTI) windows. A TTI violation implies that the application was not able to meet the necessary timing requirement within the allowed window.
  * Part of the optimization goal of tuning a system for latency sensitive workloads is to reduce the amount of time spent on system related tasks, or conversely to maximize the amount of buffer for a given TTI interval.
  * In order to ensure that the majority of the TTI budget is devoted to RAN related processing it is necessary to reduce, to the greatest extent possible, any source of jitter or noise that could potentially interrupt resources that are allocated to latency sensitive workloads. Such hardware resources can include CPU cores, memory, cache, network interfaces, among others.
  * For CPU cores in particular, sources of noise can include context switches, frequency transitions, idle transitions, SMIs, IRQs, among others.
  * Several tools can be used to measure the amount of jitter and noise that a system is subjected to. For example, hwlatdetect can be used to measure latency spikes at a platform level, such as those due to an SMI event. As another example, cyclictest can be used to measure latency spikes on a per-core level.
  * Such measurement tools can help identify and root cause such sources of noise, for example unexpected context swaps due to a noisy neighbor workload, or an SMI event due to a platform related task.
  * These measurement tools should be run in a systematic manner in a layered approach starting with the hardware layer and gradually progressing up the stack to the CaaS and concluding with the application layer. Only when a given layer passes the necessary latency requirements should the next layer be benchmarked. In addition, it is recommended to run each benchmark on a subset of cores, rather than on every available core within the system.
  * Collectively, the presented benchmark methodology and sample results can be used to certify a system as compliant for running latency sensitive workloads. This in turn increases the probability that a given application can consistently meet the specified TTI intervals.
  * Tuning a system for latency sensitive workloads involves a holistic approach, where the system is subdivided into layers, and the appropriate set of optimizations are applied to each respective layer. For example, for RAN applications the hardware platform must be populated with memory in a 1 DPC fashion, the BIOS should set to the appropriate workload profile, the OS should support a real-time kernel and have the appropriately set grub commandline parameters, and the CaaS should support workload isolation in an orchestrated manner.

For future revisions of the guide:
  * The current PDF format will be converted into web document format to help broaden the intended distribution and further accelerate the release of newer revisions.
  * The list of example operating systems and CaaS offerings will be expanded to include additional OS and CaaS variants.
  * The benchmark methodology will be expanded to include more concrete examples for specific OS and CaaS variants.
