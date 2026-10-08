Scope
=====

The intended scope and goals for this guide includes the following:

    1. To deliver a standalone technical white paper that provides in depth guidance on how to setup and tune Intel x86 platforms to run latency sensitive workloads on top of Container-as-a-Service deployments, such as Red Hat OpenShift Container Platform.
    2. The focus will be primarily upon Telecommunications workloads, such as Virtualized Radio Access Networks (vRAN) applications. However, the methodology and tunings provided within this document may also be applicable to other mission critical workloads, for example those within industrial IoT or financial sectors.
    3. The documentation will take a ground-up approach illustrating how to configure the platform, the BIOS, the operating system, up to the CaaS layer.
    4. This guide will not provide instructions for how to tune individual ISV applications, however, where relevant a suitable proxy workload, for example the Intel® FlexRAN™ application, will be referenced whenever a concrete example is needed of a latency sensitive workload.
    5. Although specific tunings will not be provided for individual OEM platforms, general guidelines will be provided that apply generally across multiple server product lines.
    6. Similarly, although specific tunings will not be provided for individual OS and CaaS layers, general guidelines will be provided that apply generally across multiple Linux based OS and CaaS variants.
