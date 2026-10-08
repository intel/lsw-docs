Initial System Setup
====================

This section provides a general overview of the preliminary setup process of a given platform for running latency sensitive workloads. The setup process includes a sample hardware BOM, BIOS configuration, a sample software BOM, a sample CaaS deployment, and a sample YAML template for a performance profile along with the associated grub command line. Afterwards, the system should be at a state where each of the previously described measurement tools can be executed on the platform.

Hardware BOM
------------

The following table provides a sample Bill of Materials for a hardware platform suitable for deploying and benchmarking latency sensitive workloads.

.. csv-table::
   :header: "Hardware", "Description"
   :file: csv/hwbom.csv

BIOS Configuration
------------------

The following describes the BIOS configuration settings required to achieve optimal performance for latency sensitive workloads such as RAN applications. Typically OEM vendors provide a workload profile specific to RAN, such as a "Telco Optimized Profile" or a "vRAN" specific profile. These profiles are designed to meet optimized performance for such RAN workloads. In the event that such a profile is unavailable, Intel provides a set of recommended BIOS settings for maximum performance for low latency configurations to meet the optimized deterministic performance requirements for RAN. Refer to the document "BIOS Settings for FlexRAN™ Platforms based on Intel :sup:`®` Xeon :sup:`®` Processors" (Document ID #861864) for information on the relevant settings. The document is available for download from: `Document ID #861864 <https://cdrdv2.intel.com/v1/dl/getContent/861864>`_.  This document provides details for multiple generations of Intel :sup:`®` Xeon :sup:`®` based processors.  With reference to the given hardware platform please reference Section 3.5 "Intel :sup:`®` Xeon :sup:`®` 6 SoC".

.. note::
    The following guide is updated on a regular basis. Be sure to download the latest version for the most up to date guidance regarding the recommended BIOS settings. Please work with an appropriate representative from Intel in the event this document is not accessible.

Software BOM
------------

The following table provides a sample Bill of Materials for a software stack suitable for deploying and benchmarking latency sensitive workloads.  Note as before the use of a realtime operating system for such timing sensitive applications.

.. csv-table::
   :header: "Ingredient", "SW Version Details"
   :file: csv/swbom.csv

.. note::
   The following table represents the recommended versions as of the date of the publication for this guide. Only the latest versions, including the BIOS and microcode versions, should be used when benchmarking a given system.

CaaS Deployment
---------------

A sample Container-as-a-Service platform would be the Red Hat OpenShift Container Platform (RHOCP). For instructions on how to install RHOCP with Zero Touch Provisioning (ZTP) please refer to the `Edge computing documentation for Red Hat OpenShift 4.20 <https://docs.redhat.com/en/documentation/openshift_container_platform/4.20/html/edge_computing/ztp-deploying-far-edge-clusters-at-scale>`_.


Performance Profile
-------------------

The following presents a sample Performance Profile for the Node Tuning Operator included with the Red Hat OpenShift Container Platform. This example assumes the use of a 40C80T Intel :sup:`®` Xeon :sup:`®` 6 SoC 6706P-B CPU.

.. code-block:: yaml
		:linenos:

                apiVersion: performance.openshift.io/v2
                kind: PerformanceProfile
                metadata:
                  name: openshift-node-performance-profile
                  annotations:
                    ran.openshift.io/ztp-deploy-wave: "10"
                    ran.openshift.io/reference-configuration: "ran-du.redhat.com"
                spec:
                  additionalKernelArgs:
                    - rcupdate.rcu_normal_after_boot=0
                    - efi=runtime
                    - vfio_pci.enable_sriov=1
                    - vfio_pci.disable_idle_d3=1
                    - module_blacklist=irdma
                  cpu:
                    isolated: 2-41,44-83
                    reserved: 0-1,42-43
                  hardwareTuning:
                    isolatedCpuFreq: 2500000
                    reservedCpuFreq: 2500000
                  hugepages:
                    defaultHugepagesSize: 1G
                    pages:
                      - size: 1G
                        count: 32
                  machineConfigPoolSelector:
                    pools.operator.machineconfiguration.openshift.io/$mcp: ""
                  nodeSelector:
                    node-role.kubernetes.io/$mcp: ""
                  numa:
                    topologyPolicy: restricted
                  realTimeKernel:
                    enabled: true
                  workloadHints:
                    realTime: true
                    highPowerConsumption: false
                    perPodPowerManagement: false

.. note::
    Please adjust the core assignment and memory based on the specific hardware platform under test.

The following presents a sample of the relevant parameters within the grub commandline generated for a system populated with a 40C80T Intel x86 CPU.

.. csv-table::
   :header: "Parameters", "Value", "Description"
   :file: csv/boot-params.csv
