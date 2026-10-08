Assumptions
===========

This guide is written with the following baseline assumptions regarding the operating system, subscription and system configuration:

1. Operating System and Kernel
    * The target system should be running Red Hat OpenShift Container Platform (RHOCP).
    * Real-time testing is performed on nodes / systems where a real-time kernel is installed and active.
    * You have administrator-level / cluster admin privileges on RHOCP.

2. System configuration
    * System BIOS is tuned to Intel, Red Hat and / or OEM recommendations for real-time workloads.

The following table presents the key term definitions that will be used throughout this document.

.. csv-table::
   :header: "Term", "Definition"
   :file: csv/abbreviations.csv
