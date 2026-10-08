Sample Benchmark Results
========================

The following section includes sample benchmark data for cyclictest, oslat, hwlatdetect, hwnoise, and timerlat. For each of the associated measurement tools, both a positive and a negative example are provided for illustrative purposes. A system to be deemed compliant for latency sensitive workloads should be able to meet or exceed all of the following results.

.. note::
   * All of the examples shown below are for illustrative purposes only.
   * For specific examples of benchmark data for an existing combination of hardware platform, CPU, OS, and CaaS variant, where available to be shared under a Non-Disclosure Agreement (NDA), please reach out to your Intel representative.

Hwlatdetect
-----------

The following presents a positive example for a hwlatdetect benchmark result.

.. csv-table::
   :file: csv/hwlatdetect_positive.csv

The following presents a negative example for a hwlatdetect benchmark result.

.. csv-table::
   :file: csv/hwlatdetect_negative.csv

Hwnoise
-------

The following presents an example for a hwnoise benchmark result.

.. csv-table::
   :file: csv/hwnoise_positive.csv

Cyclictest
----------

The following presents a positive example for a cyclictest benchmark result.

.. csv-table::
   :file: csv/cyclictest_positive.csv

The following presents a negative example for a cyclictest benchmark result.

.. csv-table::
   :file: csv/cyclictest_negative.csv

Oslat
-----

The following presents a positive example for an oslat benchmark result.

.. csv-table::
   :file: csv/oslat_positive.csv

The following presents a negative example for an oslat benchmark result.

.. code-block:: bash
                
                oslat:
                [FAILED] The maximum latency measured 22 is bigger than the expected one 20
                Expected
                    <bool>: false
                to be true

               	  
Timerlat
--------

The following presents an example for a timerlat benchmark result.

.. code-block:: bash

                             |          IRQ Timer Latency (us)        |         Thread Timer Latency (us)
                CPU COUNT    |      cur       min       avg       max |      cur       min       avg       max
                0   58634    |        1         0         1        10 |       11         2        10        23
                1   58634    |        1         0         1         9 |       12         2         9        23
                2   58634    |        0         0         1        11 |       10         2         9        23
                3   58634    |        1         0         1        11 |       11         2         9        24
                4   58634    |        1         0         1        10 |       11         2         9        26
                5   58634    |        1         0         1         8 |       10         2         9        25
                6   58634    |        1         0         1         9 |       11         2         9        23
                7   58633    |        1         0         1         9 |       11         2         9        26
                8   58633    |        1         0         1         9 |       10         2         9        26
                9   58633    |        1         0         1        13 |       11         2         9        28
                10  58633    |        1         0         1        13 |       12         2         9        24
                11  58633    |        1         0         1         8 |       10         2         9        23
                12  58633    |        1         0         1        10 |       10         2         9        22
                13  58633    |        1         0         1        18 |       12         2         9        27
                14  58633    |        1         0         1        10 |       11         2         9        28
                15  58633    |        0         0         1        11 |        7         2         9        26
                16  58633    |        1         0         1        13 |       10         2         9        24
                17  58633    |        1         0         1         9 |       13         2         9        22
                18  58633    |        1         0         1        10 |       11         2         9        23
                19  58633    |        1         0         1        12 |       11         2         9        28
                20  58633    |        1         0         1        14 |       11         2         9        24
                21  58633    |        1         0         1         8 |       11         2         9        22

               
