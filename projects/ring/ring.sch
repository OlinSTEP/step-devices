EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "RING_PCB"
Date "2022-04-06"
Rev "REV1"
Comp "STEP @ Olin"
Comment1 "Adi R | Prisha S | Sam K | Luke NH | Alex W | Declan K "
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L step:MLPF-WB55-01E3 AE1
U 1 1 624E9D60
P 1050 6150
F 0 "AE1" H 1825 6437 60  0000 C CNN
F 1 "MLPF-WB55-01E3" H 1825 6331 60  0000 C CNN
F 2 "step-footprints:MLPF-WB55-01E3" H 1850 6390 60  0001 C CNN
F 3 "https://www.st.com/resource/en/datasheet/mlpf-wb55-01e3.pdf" H 1050 6150 60  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/stmicroelectronics/MLPF-WB55-01E3/10057115" H 1050 6150 50  0001 C CNN "buy"
	1    1050 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 6250 1100 6250
Text Label 1100 6250 2    50   ~ 0
RF1
Text Label 1800 4375 2    50   ~ 0
RF1
Wire Wire Line
	1650 6750 1750 6750
Connection ~ 1750 6750
Wire Wire Line
	1750 6750 1850 6750
Connection ~ 1850 6750
Wire Wire Line
	1850 6750 1950 6750
Wire Wire Line
	1650 6750 1650 6775
Connection ~ 1650 6750
$Comp
L power:GND #PWR0101
U 1 1 624F15A5
P 1650 6775
F 0 "#PWR0101" H 1650 6525 50  0001 C CNN
F 1 "GND" H 1655 6602 50  0000 C CNN
F 2 "" H 1650 6775 50  0001 C CNN
F 3 "" H 1650 6775 50  0001 C CNN
	1    1650 6775
	1    0    0    -1  
$EndComp
Wire Notes Line
	675  7400 675  5475
Text Notes 650  5450 0    157  ~ 0
RF
$Comp
L step:NX1612SA-32.000MHZ-CHP-CIS-3 Y1
U 1 1 6250E0C6
P 1250 2175
F 0 "Y1" H 1000 1975 50  0000 C CNN
F 1 "NX1612SA-32.000MHZ-CHP-CIS-3" V 850 2025 50  0000 C CNN
F 2 "step-footprints:OSCSC105P160X120X35-4N" H 900 2425 50  0001 L BNN
F 3 "" H 1250 2175 50  0001 L BNN
F 4 "NDK" H 1250 2175 50  0001 L BNN "MANUFACTURER"
	1    1250 2175
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 2175 1000 2000
Wire Wire Line
	1800 2000 1800 2075
Wire Wire Line
	1200 2475 1250 2475
$Comp
L power:GND #PWR0102
U 1 1 6250FE22
P 1250 2475
F 0 "#PWR0102" H 1250 2225 50  0001 C CNN
F 1 "GND" H 1255 2302 50  0000 C CNN
F 2 "" H 1250 2475 50  0001 C CNN
F 3 "" H 1250 2475 50  0001 C CNN
	1    1250 2475
	1    0    0    -1  
$EndComp
Connection ~ 1250 2475
Wire Wire Line
	1250 2475 1300 2475
$Comp
L step:LSM6DSO32TR U2
U 1 1 6250AC73
P 6700 6075
F 0 "U2" H 6700 5025 60  0000 C CNN
F 1 "LSM6DSO32TR" H 6975 5150 60  0000 C CNN
F 2 "step-footprints:LSM6DSO32TR" H 7450 6875 60  0001 C CNN
F 3 "https://www.st.com/resource/en/datasheet/lsm6dso32.pdf" H 6700 6075 60  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/stmicroelectronics/LSM6DSO32TR/11694177" H 7650 6775 50  0001 C CNN "buy"
	1    6700 6075
	1    0    0    -1  
$EndComp
Text Label 3800 2575 0    50   ~ 0
LSM_INT1
Text Label 3800 2675 0    50   ~ 0
LSM_INT2
Text Label 8250 6325 0    50   ~ 0
LSM_INT1
Text Label 8250 6225 0    50   ~ 0
LSM_INT2
NoConn ~ 8250 6525
NoConn ~ 8250 6625
Wire Wire Line
	7450 7175 7500 7175
$Comp
L power:GND #PWR0103
U 1 1 624F9D6F
P 7500 7175
F 0 "#PWR0103" H 7500 6925 50  0001 C CNN
F 1 "GND" H 7625 7075 50  0000 C CNN
F 2 "" H 7500 7175 50  0001 C CNN
F 3 "" H 7500 7175 50  0001 C CNN
	1    7500 7175
	1    0    0    -1  
$EndComp
Connection ~ 7500 7175
Wire Wire Line
	7500 7175 7550 7175
Text Notes 8325 6600 0    50   ~ 0
Can be connected to any STM GPIO \nand used to wake from sleep mode \nvia the EXTI Interrupt
Wire Wire Line
	3800 1375 3800 1275
Connection ~ 3800 1275
Wire Wire Line
	3800 1275 3800 1175
Wire Wire Line
	3800 1475 3800 1375
Connection ~ 3800 1375
Wire Wire Line
	3800 1175 4000 1175
$Comp
L step:C_100nF C5
U 1 1 62507FB9
P 4400 1325
F 0 "C5" H 4425 1400 50  0000 L CNN
F 1 "C_100nF" H 4250 1550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4438 1175 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 4425 1425 50  0001 C CNN
F 4 "KEMET" H 4400 1325 60  0001 C CNN "MFN"
F 5 "C0402C104K9RACTU" H 4400 1325 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/KEMET/C0402C104K9RACTU?qs=DBJr%252BvBUjU5VnZSA4JeTzg%3D%3D" H 4825 1825 60  0001 C CNN "buy"
	1    4400 1325
	1    0    0    -1  
$EndComp
Connection ~ 4400 1175
Wire Wire Line
	4400 1175 4600 1175
$Comp
L step:C_100nF C6
U 1 1 62508D05
P 4600 1325
F 0 "C6" H 4625 1400 50  0000 L CNN
F 1 "C_100nF" H 4450 1625 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4638 1175 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 4625 1425 50  0001 C CNN
F 4 "KEMET" H 4600 1325 60  0001 C CNN "MFN"
F 5 "C0402C104K9RACTU" H 4600 1325 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/KEMET/C0402C104K9RACTU?qs=DBJr%252BvBUjU5VnZSA4JeTzg%3D%3D" H 5025 1825 60  0001 C CNN "buy"
	1    4600 1325
	1    0    0    -1  
$EndComp
$Comp
L step:C_100nF C2
U 1 1 625095B1
P 4200 1325
F 0 "C2" H 4225 1400 50  0000 L CNN
F 1 "C_100nF" H 4050 1625 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4238 1175 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 4225 1425 50  0001 C CNN
F 4 "KEMET" H 4200 1325 60  0001 C CNN "MFN"
F 5 "C0402C104K9RACTU" H 4200 1325 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/KEMET/C0402C104K9RACTU?qs=DBJr%252BvBUjU5VnZSA4JeTzg%3D%3D" H 4625 1825 60  0001 C CNN "buy"
	1    4200 1325
	1    0    0    -1  
$EndComp
$Comp
L step:C_100nF C1
U 1 1 62509D0B
P 4000 1325
F 0 "C1" H 4025 1400 50  0000 L CNN
F 1 "C_100nF" H 3850 1550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4038 1175 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 4025 1425 50  0001 C CNN
F 4 "KEMET" H 4000 1325 60  0001 C CNN "MFN"
F 5 "C0402C104K9RACTU" H 4000 1325 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/KEMET/C0402C104K9RACTU?qs=DBJr%252BvBUjU5VnZSA4JeTzg%3D%3D" H 4425 1825 60  0001 C CNN "buy"
	1    4000 1325
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 1475 4200 1475
Connection ~ 4200 1475
Wire Wire Line
	4200 1475 4400 1475
Connection ~ 4400 1475
Wire Wire Line
	4400 1475 4600 1475
Connection ~ 4000 1175
Wire Wire Line
	4000 1175 4200 1175
Connection ~ 4200 1175
Wire Wire Line
	4200 1175 4400 1175
Connection ~ 4600 1175
Connection ~ 3800 1175
$Comp
L power:GND #PWR0107
U 1 1 62515C16
P 4800 1475
F 0 "#PWR0107" H 4800 1225 50  0001 C CNN
F 1 "GND" H 4925 1400 50  0000 C CNN
F 2 "" H 4800 1475 50  0001 C CNN
F 3 "" H 4800 1475 50  0001 C CNN
	1    4800 1475
	1    0    0    -1  
$EndComp
Connection ~ 4600 1475
$Comp
L step:ANT016008LCS2442MA2 U3
U 1 1 6251D782
P 4950 6250
F 0 "U3" H 5975 6537 60  0000 C CNN
F 1 "ANT016008LCS2442MA2" H 5975 6431 60  0000 C CNN
F 2 "step-footprints:ANT016008LCS2442MA2" H 6000 6390 60  0001 C CNN
F 3 "https://product.tdk.com/system/files/dam/doc/product/rf/rf/antenna/catalog/rf_ant_ant016008lcs2442ma2_summary_en.pdf" H 4950 6250 60  0001 C CNN
F 4 "https://product.tdk.com/system/files/dam/doc/product/rf/rf/antenna/design_note/dn-ant016008lcs2442ma2.pdf" H 4950 6250 50  0001 C CNN "eval_guide"
F 5 "https://www.digikey.com/en/products/detail/tdk-corporation/ANT016008LCS2442MA2/4959425" H 4950 6250 50  0001 C CNN "buy"
	1    4950 6250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2500 6250 2900 6250
Text Label 4950 6250 0    50   ~ 0
RAD_PLANE
NoConn ~ 3800 7200
NoConn ~ 3900 7200
NoConn ~ 4000 7200
NoConn ~ 4100 7200
Wire Notes Line
	5450 7400 5450 5475
Wire Notes Line
	675  7400 5450 7400
Wire Notes Line
	675  5475 5450 5475
Text Label 1800 3875 2    50   ~ 0
SWDIO
Text Label 1800 3975 2    50   ~ 0
SWCLK
Text Label 6700 6675 2    50   ~ 0
MISO
Text Label 6700 6075 2    50   ~ 0
CS
Text Label 6700 6275 2    50   ~ 0
SCK
Text Label 6700 6575 2    50   ~ 0
MOSI
Wire Wire Line
	6700 6475 6375 6475
Wire Wire Line
	6375 6475 6375 6775
Wire Wire Line
	6375 6775 6700 6775
$Comp
L power:GND #PWR0108
U 1 1 62535713
P 6375 6775
F 0 "#PWR0108" H 6375 6525 50  0001 C CNN
F 1 "GND" H 6380 6602 50  0000 C CNN
F 2 "" H 6375 6775 50  0001 C CNN
F 3 "" H 6375 6775 50  0001 C CNN
	1    6375 6775
	1    0    0    -1  
$EndComp
Connection ~ 6375 6775
$Comp
L step:C_100nF C11
U 1 1 6253612C
P 8300 5825
F 0 "C11" H 8450 5925 50  0000 L CNN
F 1 "C_100nF" H 8450 5850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8338 5675 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 8325 5925 50  0001 C CNN
F 4 "KEMET" H 8300 5825 60  0001 C CNN "MFN"
F 5 "C0402C104K9RACTU" H 8300 5825 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/KEMET/C0402C104K9RACTU?qs=DBJr%252BvBUjU5VnZSA4JeTzg%3D%3D" H 8725 6325 60  0001 C CNN "buy"
	1    8300 5825
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 6253B17D
P 8300 5975
F 0 "#PWR0110" H 8300 5725 50  0001 C CNN
F 1 "GND" H 8425 5900 50  0000 C CNN
F 2 "" H 8300 5975 50  0001 C CNN
F 3 "" H 8300 5975 50  0001 C CNN
	1    8300 5975
	1    0    0    -1  
$EndComp
Wire Notes Line
	6000 5475 9775 5475
Wire Notes Line
	9775 5475 9775 7400
Wire Notes Line
	9775 7400 6000 7400
Wire Notes Line
	6000 7400 6000 5475
Text Notes 5975 5475 0    157  ~ 0
Accelerometer
Text Label 3800 4075 0    50   ~ 0
BOOT0
$Comp
L power:GND #PWR0111
U 1 1 6254BFA4
P 3800 4775
F 0 "#PWR0111" H 3800 4525 50  0001 C CNN
F 1 "GND" H 3805 4602 50  0000 C CNN
F 2 "" H 3800 4775 50  0001 C CNN
F 3 "" H 3800 4775 50  0001 C CNN
	1    3800 4775
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 4775 3800 4675
Connection ~ 3800 4775
Wire Wire Line
	3800 4575 3800 4675
Connection ~ 3800 4675
$Comp
L step:Test_Point_SMD TP1
U 1 1 62552E8D
P 6925 3475
F 0 "TP1" V 6925 3650 50  0000 L CNN
F 1 "Test_Point_SMD" V 6925 3825 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6925 3325 50  0001 C CNN
F 3 "" H 6925 3475 50  0001 C CNN
	1    6925 3475
	0    1    1    0   
$EndComp
$Comp
L step:Test_Point_SMD TP2
U 1 1 62553281
P 6925 3625
F 0 "TP2" V 6925 3800 50  0000 L CNN
F 1 "Test_Point_SMD" V 6925 3975 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6925 3475 50  0001 C CNN
F 3 "" H 6925 3625 50  0001 C CNN
	1    6925 3625
	0    1    1    0   
$EndComp
$Comp
L step:Test_Point_SMD TP3
U 1 1 625542A1
P 6925 3775
F 0 "TP3" V 6925 3950 50  0000 L CNN
F 1 "Test_Point_SMD" V 6925 4125 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6925 3625 50  0001 C CNN
F 3 "" H 6925 3775 50  0001 C CNN
	1    6925 3775
	0    1    1    0   
$EndComp
$Comp
L step:Test_Point_SMD TP5
U 1 1 625563D4
P 6925 4100
F 0 "TP5" V 6925 4275 50  0000 L CNN
F 1 "Test_Point_SMD" V 6925 4450 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6925 3950 50  0001 C CNN
F 3 "" H 6925 4100 50  0001 C CNN
	1    6925 4100
	0    1    1    0   
$EndComp
Text Label 6875 3475 2    50   ~ 0
SWDIO
Text Label 6875 3625 2    50   ~ 0
SWCLK
Text Label 6875 3775 2    50   ~ 0
BOOT0
$Comp
L Battery_Management:BQ297xy U4
U 1 1 6255AE0C
P 7225 1575
F 0 "U4" H 7225 1942 50  0000 C CNN
F 1 "BQ297xy" H 7225 1851 50  0000 C CNN
F 2 "Package_SON:WSON-6_1.5x1.5mm_P0.5mm" H 7225 1925 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/bq2970.pdf" H 6975 1775 50  0001 C CNN
	1    7225 1575
	1    0    0    -1  
$EndComp
Text Notes 1425 5775 0    50   ~ 0
Integrated Passive Device (IPD)\nMatching, PI, LP Filter
Text Notes 3375 5800 0    50   ~ 0
SMD Chip Antenna 
$Comp
L power:GND #PWR0106
U 1 1 6255E9DE
P 6875 4100
F 0 "#PWR0106" H 6875 3850 50  0001 C CNN
F 1 "GND" H 6880 3927 50  0000 C CNN
F 2 "" H 6875 4100 50  0001 C CNN
F 3 "" H 6875 4100 50  0001 C CNN
	1    6875 4100
	1    0    0    -1  
$EndComp
$Comp
L step:C_4.7uF C3
U 1 1 62576C8D
P 1125 8350
F 0 "C3" H 875 8450 50  0000 L CNN
F 1 "C_4.7uF" H 725 8350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1213 7750 50  0001 C CNN
F 3 "" H 1200 8000 50  0001 C CNN
F 4 "Samsung Electro-Mechanics" H 1125 7550 50  0001 C CNN "Manufacturer"
F 5 "CL21A475KAQNNNE" H 1125 7450 50  0001 C CNN "MPN"
F 6 "Digi-Key" H 1175 7950 50  0001 C CNN "Vendor"
F 7 "1276-1244-1-ND" H 1175 7850 50  0001 C CNN "VPN"
F 8 "https://www.digikey.com/en/products/detail/samsung-electro-mechanics/CL21A475KAQNNNE/3886902" H 1600 7650 60  0001 C CNN "Buy"
	1    1125 8350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1475 8450 1125 8450
Wire Wire Line
	1125 8150 1350 8150
Wire Wire Line
	1125 8150 975  8150
Connection ~ 1125 8150
$Comp
L power:+BATT #PWR0112
U 1 1 6257AFEF
P 975 8150
F 0 "#PWR0112" H 975 8000 50  0001 C CNN
F 1 "+BATT" H 990 8323 50  0000 C CNN
F 2 "" H 975 8150 50  0001 C CNN
F 3 "" H 975 8150 50  0001 C CNN
	1    975  8150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2975 8150 3050 8150
$Comp
L step:C_10uF C4
U 1 1 6257DBDA
P 3275 8350
F 0 "C4" H 3390 8446 50  0000 L CNN
F 1 "C_10uF" H 3390 8355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3313 8950 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2018/06/20/CL21A106KPFNNNE.pdf" H 3300 9200 50  0001 C CNN
F 4 "DK" H 3275 8400 60  0001 C CNN "MFN"
F 5 "1276-1052-1-ND" H 3275 9100 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/samsung-electro-mechanics/CL21A106KPFNNNE/1276-1052-1-ND/3889138" H 3700 8850 60  0001 C CNN "PurchasingLink"
	1    3275 8350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 6257E95E
P 975 8450
F 0 "#PWR0113" H 975 8200 50  0001 C CNN
F 1 "GND" H 980 8277 50  0000 C CNN
F 2 "" H 975 8450 50  0001 C CNN
F 3 "" H 975 8450 50  0001 C CNN
	1    975  8450
	1    0    0    -1  
$EndComp
Connection ~ 1125 8450
$Comp
L power:GND #PWR0114
U 1 1 6257F38C
P 3275 8600
F 0 "#PWR0114" H 3275 8350 50  0001 C CNN
F 1 "GND" H 3280 8427 50  0000 C CNN
F 2 "" H 3275 8600 50  0001 C CNN
F 3 "" H 3275 8600 50  0001 C CNN
	1    3275 8600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3275 8450 3275 8600
Connection ~ 3275 8600
Text Label 1475 8600 2    50   ~ 0
TPS_MODE
Wire Wire Line
	975  8450 1125 8450
Text Label 1475 8800 2    50   ~ 0
TPS_STOP
$Comp
L step:TPS62840DLCR U5
U 1 1 62589D2E
P 1475 8250
F 0 "U5" H 2100 8637 60  0000 C CNN
F 1 "TPS62840DLCR" H 2100 8531 60  0000 C CNN
F 2 "step-footprints:TPS62840DLCR" H 2125 8490 60  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/tps62840.pdf?ts=1649684065696&ref_url=https%253A%252F%252Fwww.google.com%252F" H 1475 8250 60  0001 C CNN
F 4 "https://www.ti.com/store/ti/en/p/product/?p=TPS62840DLCR&HQS=ocb-tistore-invf-invftransact-invf-store-octopart-wwe" H 1475 8250 50  0001 C CNN "buy"
	1    1475 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1475 8300 1350 8300
Wire Wire Line
	1350 8300 1350 8150
Connection ~ 1350 8150
Wire Wire Line
	1350 8150 1475 8150
Wire Wire Line
	3275 8150 3450 8150
Connection ~ 3275 8150
$Comp
L power:+1V8 #PWR0115
U 1 1 6258E739
P 3450 8150
F 0 "#PWR0115" H 3450 8000 50  0001 C CNN
F 1 "+1V8" H 3465 8323 50  0000 C CNN
F 2 "" H 3450 8150 50  0001 C CNN
F 3 "" H 3450 8150 50  0001 C CNN
	1    3450 8150
	1    0    0    -1  
$EndComp
$Comp
L step:L_2.2uH L3
U 1 1 62591099
P 2875 8150
F 0 "L3" H 2875 8375 50  0000 C CNN
F 1 "L_2.2uH" H 2875 8284 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric_Pad1.05x1.20mm_HandSolder" H 2875 8150 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/281/reference_specification_DFE201612E-1101893.pdf" H 2875 8150 50  0001 C CNN
F 4 "DFE201612E-2R2M=P2" H 2875 8150 50  0001 C CNN "MPN"
F 5 "https://www.mouser.com/ProductDetail/Murata-Electronics/DFE201612E-2R2M%3DP2?qs=AQlKX63v8Rsi4vow61OBVg%3D%3D" H 2875 8150 50  0001 C CNN "buy"
	1    2875 8150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2775 8150 2725 8150
Wire Wire Line
	2725 8300 3050 8300
Wire Wire Line
	3050 8300 3050 8150
Connection ~ 3050 8150
Wire Wire Line
	3050 8150 3275 8150
Wire Wire Line
	2725 8600 3275 8600
$Comp
L step:Test_Point_SMD TP6
U 1 1 62597342
P 6925 3950
F 0 "TP6" V 6925 4125 50  0000 L CNN
F 1 "Test_Point_SMD" V 6925 4300 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6925 3800 50  0001 C CNN
F 3 "" H 6925 3950 50  0001 C CNN
	1    6925 3950
	0    1    1    0   
$EndComp
$Comp
L power:+1V8 #PWR0117
U 1 1 6259CD29
P 6750 3950
F 0 "#PWR0117" H 6750 3800 50  0001 C CNN
F 1 "+1V8" H 6600 4000 50  0000 C CNN
F 2 "" H 6750 3950 50  0001 C CNN
F 3 "" H 6750 3950 50  0001 C CNN
	1    6750 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6875 3950 6750 3950
Wire Notes Line
	3725 7725 3725 9075
Wire Notes Line
	3725 9075 675  9075
Wire Notes Line
	675  9075 675  7725
Wire Notes Line
	675  7725 3725 7725
Text Notes 625  7700 0    157  ~ 0
System Power (Buck)
$Comp
L step:R_2.2K R2
U 1 1 625C6B3B
P 6600 1825
F 0 "R2" H 6530 1779 50  0000 R CNN
F 1 "R_2.2K" H 6530 1870 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 6530 1825 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 6680 1825 50  0001 C CNN
F 4 "DK" H 6600 1825 60  0001 C CNN "MFN"
F 5 "RMCF0805FT2K20CT-ND" H 6600 1825 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT2K20/RMCF0805FT2K20CT-ND/1942387" H 7080 2225 60  0001 C CNN "PurchasingLink"
	1    6600 1825
	-1   0    0    1   
$EndComp
$Comp
L step:C_0.1uF C12
U 1 1 625C9CB0
P 6350 1825
F 0 "C12" H 6100 1850 50  0000 L CNN
F 1 "C_0.1uF" H 5950 1750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 6388 1675 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 6375 1925 50  0001 C CNN
F 4 "DK" H 6350 1825 60  0001 C CNN "MFN"
F 5 "478-3352-1-ND" H 6350 1825 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=478-3352-1-ND" H 6775 2325 60  0001 C CNN "PurchasingLink"
	1    6350 1825
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 1675 6825 1675
Wire Wire Line
	6350 1675 6350 1475
Wire Wire Line
	6350 1475 6825 1475
$Comp
L step:R_330 R1
U 1 1 625CF1AD
P 6350 1325
F 0 "R1" H 6280 1279 50  0000 R CNN
F 1 "R_330" H 6280 1370 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 6280 1325 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 6430 1325 50  0001 C CNN
F 4 "DK" H 6350 1325 60  0001 C CNN "MFN"
F 5 "RMCF0805FT330RCT-ND" H 6350 1325 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/stackpole-electronics-inc/RMCF0805FT330R/RMCF0805FT330RCT-ND/1942351" H 6830 1725 60  0001 C CNN "PurchasingLink"
	1    6350 1325
	-1   0    0    1   
$EndComp
Text Label 5925 1175 2    50   ~ 0
CELL+
$Comp
L step:Test_Point_SMD TP7
U 1 1 625D7E4B
P 6350 2400
F 0 "TP7" V 6299 2578 50  0000 L CNN
F 1 "Test_Point_SMD" V 6390 2578 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 6350 2250 50  0001 C CNN
F 3 "" H 6350 2400 50  0001 C CNN
	1    6350 2400
	0    -1   -1   0   
$EndComp
$Comp
L step:Test_Point_SMD TP8
U 1 1 625D85F9
P 6350 2575
F 0 "TP8" V 6299 2753 50  0000 L CNN
F 1 "Test_Point_SMD" V 6390 2753 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 6350 2425 50  0001 C CNN
F 3 "" H 6350 2575 50  0001 C CNN
	1    6350 2575
	0    -1   -1   0   
$EndComp
Text Label 6400 2400 0    50   ~ 0
CELL+
Text Label 6400 2575 0    50   ~ 0
CELL-
Connection ~ 6350 1475
Wire Wire Line
	5925 1175 6125 1175
Wire Wire Line
	7225 1875 7225 2125
Text Label 5925 2125 2    50   ~ 0
CELL-
Wire Wire Line
	5925 2125 6350 2125
Wire Wire Line
	6350 1975 6350 2125
Connection ~ 6350 2125
Wire Wire Line
	6350 2125 7225 2125
$Comp
L power:GND #PWR0118
U 1 1 625F4FE9
P 6600 1975
F 0 "#PWR0118" H 6600 1725 50  0001 C CNN
F 1 "GND" H 6725 1925 50  0000 C CNN
F 2 "" H 6600 1975 50  0001 C CNN
F 3 "" H 6600 1975 50  0001 C CNN
	1    6600 1975
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0119
U 1 1 625FA2ED
P 6125 1175
F 0 "#PWR0119" H 6125 1025 50  0001 C CNN
F 1 "+BATT" H 6140 1348 50  0000 C CNN
F 2 "" H 6125 1175 50  0001 C CNN
F 3 "" H 6125 1175 50  0001 C CNN
	1    6125 1175
	1    0    0    -1  
$EndComp
Connection ~ 6125 1175
Wire Wire Line
	6125 1175 6350 1175
$Comp
L power:+1V8 #PWR0120
U 1 1 625FF412
P 4875 1175
F 0 "#PWR0120" H 4875 1025 50  0001 C CNN
F 1 "+1V8" H 4890 1348 50  0000 C CNN
F 2 "" H 4875 1175 50  0001 C CNN
F 3 "" H 4875 1175 50  0001 C CNN
	1    4875 1175
	1    0    0    -1  
$EndComp
$Comp
L power:+1V8 #PWR0121
U 1 1 6261D39A
P 8300 5675
F 0 "#PWR0121" H 8300 5525 50  0001 C CNN
F 1 "+1V8" H 8425 5800 50  0000 C CNN
F 2 "" H 8300 5675 50  0001 C CNN
F 3 "" H 8300 5675 50  0001 C CNN
	1    8300 5675
	1    0    0    -1  
$EndComp
Connection ~ 8300 5675
Text Label 7625 1475 0    50   ~ 0
C_gate
Text Label 7625 1675 0    50   ~ 0
D_gate
$Comp
L step:C_100nF C10
U 1 1 62536BDD
P 8100 5825
F 0 "C10" H 8125 5900 50  0000 L CNN
F 1 "C_100nF" H 8450 5775 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8138 5675 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 8125 5925 50  0001 C CNN
F 4 "KEMET" H 8100 5825 60  0001 C CNN "MFN"
F 5 "C0402C104K9RACTU" H 8100 5825 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/KEMET/C0402C104K9RACTU?qs=DBJr%252BvBUjU5VnZSA4JeTzg%3D%3D" H 8525 6325 60  0001 C CNN "buy"
	1    8100 5825
	1    0    0    -1  
$EndComp
Connection ~ 8100 5675
Wire Wire Line
	8100 5675 8300 5675
Wire Wire Line
	8100 5975 8300 5975
Connection ~ 8300 5975
Wire Wire Line
	7450 5675 7550 5675
Connection ~ 7550 5675
Wire Wire Line
	7550 5675 8100 5675
NoConn ~ 3800 3675
NoConn ~ 3800 3775
$Comp
L step:C_100nF C13
U 1 1 625B50DD
P 4800 1325
F 0 "C13" H 4825 1400 50  0000 L CNN
F 1 "C_100nF" V 4975 1200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4838 1175 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 4825 1425 50  0001 C CNN
F 4 "KEMET" H 4800 1325 60  0001 C CNN "MFN"
F 5 "C0402C104K9RACTU" H 4800 1325 60  0001 C CNN "MPN"
F 6 "https://www.mouser.com/ProductDetail/KEMET/C0402C104K9RACTU?qs=DBJr%252BvBUjU5VnZSA4JeTzg%3D%3D" H 5225 1825 60  0001 C CNN "buy"
	1    4800 1325
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 1175 4800 1175
Connection ~ 4800 1175
Wire Wire Line
	4800 1175 4875 1175
Wire Wire Line
	4600 1475 4800 1475
Wire Wire Line
	1000 2000 1800 2000
Wire Wire Line
	1800 2175 1500 2175
Text Label 1800 2575 2    50   ~ 0
BATT_LVL
$Comp
L step:R_200K R3
U 1 1 625D05FB
P 8775 1300
F 0 "R3" H 8845 1346 50  0000 L CNN
F 1 "R_200K" H 8845 1255 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 8705 1300 50  0001 C CNN
F 3 "" H 8855 1300 50  0001 C CNN
F 4 "DK" H 8775 1300 60  0001 C CNN "MFN"
F 5 "P300KDACT-ND" H 8775 1300 60  0001 C CNN "MPN"
	1    8775 1300
	1    0    0    -1  
$EndComp
$Comp
L step:R_100K R4
U 1 1 625D1FDC
P 8775 1650
F 0 "R4" H 8845 1696 50  0000 L CNN
F 1 "R_100K" H 8845 1605 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 8705 1650 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 8855 1650 50  0001 C CNN
F 4 "DK" H 8775 1650 60  0001 C CNN "MFN"
F 5 "P100KCCT-ND" H 8775 1650 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERJ-6ENF1003V/P100KCCT-ND/119551" H 9255 2050 60  0001 C CNN "PurchasingLink"
	1    8775 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 625D2AC0
P 8775 1800
F 0 "#PWR0122" H 8775 1550 50  0001 C CNN
F 1 "GND" H 8780 1627 50  0000 C CNN
F 2 "" H 8775 1800 50  0001 C CNN
F 3 "" H 8775 1800 50  0001 C CNN
	1    8775 1800
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0123
U 1 1 625D34A1
P 8775 1150
F 0 "#PWR0123" H 8775 1000 50  0001 C CNN
F 1 "+BATT" H 8950 1250 50  0000 C CNN
F 2 "" H 8775 1150 50  0001 C CNN
F 3 "" H 8775 1150 50  0001 C CNN
	1    8775 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8775 1500 8775 1475
Wire Wire Line
	8775 1475 8875 1475
Connection ~ 8775 1475
Wire Wire Line
	8775 1475 8775 1450
Text Label 8875 1475 0    50   ~ 0
BATT_LVL
Text Label 1800 3675 2    50   ~ 0
TPS_MODE
Text Label 1800 3775 2    50   ~ 0
TPS_STOP
Text Label 3800 2875 0    50   ~ 0
SCK
Text Label 3800 2975 0    50   ~ 0
MISO
Text Label 3800 3075 0    50   ~ 0
MOSI
Text Label 1800 4075 2    50   ~ 0
CS
Text Label 1800 4275 2    50   ~ 0
NRST
$Comp
L step:Test_Point_SMD TP4
U 1 1 6263E888
P 6925 3325
F 0 "TP4" V 6925 3500 50  0000 L CNN
F 1 "Test_Point_SMD" V 6925 3675 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6925 3175 50  0001 C CNN
F 3 "" H 6925 3325 50  0001 C CNN
	1    6925 3325
	0    1    1    0   
$EndComp
Text Label 6875 3325 2    50   ~ 0
NRST
Wire Notes Line
	7975 3175 5550 3175
Wire Notes Line
	5550 3175 5550 4425
Wire Notes Line
	5550 4425 7975 4425
Wire Notes Line
	7975 4425 7975 3175
Text Notes 5550 3175 0    157  ~ 0
Test Points & LEDs
Wire Notes Line
	5550 2725 5550 825 
Text Notes 5550 825  0    157  ~ 0
Battery Protection
Wire Notes Line
	5325 825  5325 5375
Wire Notes Line
	5325 5375 675  5375
Wire Notes Line
	675  5375 675  825 
Wire Notes Line
	675  825  5325 825 
Text Notes 625  800  0    157  ~ 0
wb55 uC
$Comp
L step:STM32WB55CEU6TR U1
U 1 1 624E507C
P 2800 2975
F 0 "U1" H 2800 5042 50  0000 C CNN
F 1 "STM32WB55CEU6TR" H 2800 4951 50  0000 C CNN
F 2 "step-footprints:QFN50P700X700X60-49N" H 2800 2975 50  0001 L BNN
F 3 "" H 2800 2975 50  0001 L BNN
F 4 "STMicroelectronics" H 2800 2975 50  0001 L BNN "MANUFACTURER"
F 5 "0.6 mm" H 2800 2975 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 6 "5" H 2800 2975 50  0001 L BNN "PARTREV"
F 7 "IPC 7351B" H 2800 2975 50  0001 L BNN "STANDARD"
	1    2800 2975
	1    0    0    -1  
$EndComp
Connection ~ 3800 1675
Wire Wire Line
	3800 1675 3800 1775
Connection ~ 3800 1775
Wire Wire Line
	3800 1775 3800 1875
Wire Wire Line
	3800 1575 3800 1675
Wire Wire Line
	3800 1575 3800 1475
Connection ~ 3800 1575
Connection ~ 3800 1475
Text Notes 3975 1800 0    50   ~ 0
Wired for internal LDO \nconfig; see pg 27
Text Notes 975  1850 0    50   ~ 0
32MHz External \nclk; required for RF
Connection ~ 4800 1475
$Comp
L step:CSD17318Q2T Q1
U 1 1 625AFF6F
P 7875 2125
F 0 "Q1" V 8027 2171 50  0000 L CNN
F 1 "CSD17318Q2T" V 8125 1725 50  0000 L CNN
F 2 "step-footprints:TRANS_CSD17318Q2T" H 8025 2125 50  0001 L BNN
F 3 "https://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=https%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fcsd17318q2" H 7875 2125 50  0001 L BNN
F 4 "https://www.digikey.com/en/products/detail/texas-instruments/CSD17318Q2T/7596430" H 9675 2075 50  0001 C CNN "buy"
	1    7875 2125
	0    1    1    0   
$EndComp
$Comp
L step:CSD17318Q2T Q2
U 1 1 625BBCD7
P 8275 2125
F 0 "Q2" V 8427 2171 50  0000 L CNN
F 1 "CSD17318Q2T" V 8525 1750 50  0000 L CNN
F 2 "step-footprints:TRANS_CSD17318Q2T" H 8425 2125 50  0001 L BNN
F 3 "https://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=https%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fcsd17318q2" H 8275 2125 50  0001 L BNN
F 4 "https://www.digikey.com/en/products/detail/texas-instruments/CSD17318Q2T/7596430" H 10075 2075 50  0001 C CNN "buy"
	1    8275 2125
	0    -1   1    0   
$EndComp
Wire Wire Line
	7675 2125 7225 2125
Connection ~ 7225 2125
Wire Wire Line
	7625 1675 7775 1675
Wire Wire Line
	7775 1675 7775 1825
Wire Wire Line
	7625 1475 8375 1475
Wire Wire Line
	8375 1475 8375 1825
Wire Wire Line
	8475 2125 8675 2125
$Comp
L power:GND #PWR0109
U 1 1 625D0AB7
P 8675 2125
F 0 "#PWR0109" H 8675 1875 50  0001 C CNN
F 1 "GND" H 8680 1952 50  0000 C CNN
F 2 "" H 8675 2125 50  0001 C CNN
F 3 "" H 8675 2125 50  0001 C CNN
	1    8675 2125
	1    0    0    -1  
$EndComp
Wire Notes Line
	9350 825  9350 2725
Wire Notes Line
	5550 825  9350 825 
Wire Notes Line
	5550 2725 9350 2725
Text Notes 7750 2700 0    50   ~ 0
Low side shared drain \nNMOS Load Switch \n 
Text Notes 8050 1050 0    50   ~ 0
1/3 Resistor Divider \nto uC ADC
Text Notes 6675 2600 0    50   ~ 0
Battery Terminal\nSolder Pads\n 
Wire Wire Line
	8075 2125 8075 1950
Connection ~ 8075 2125
Text Label 8075 1950 0    50   ~ 0
DRAIN
$Comp
L step:LED_0805_Amber D1
U 1 1 62632341
P 5700 3550
F 0 "D1" V 5739 3433 50  0000 R CNN
F 1 "LED_Amber" V 5975 3550 50  0000 R CNN
F 2 "LED_SMD:LED_0402_1005Metric" H 5600 3550 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Chicago%20Miniature%20Lamps%20PDFs/CMDA5_Series_Rev_Aug_2014.pdf" H 5700 3650 50  0001 C CNN
F 4 "DK" H 5700 3550 60  0001 C CNN "MFN"
F 5 "L71517CT-ND" H 5700 3550 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/product-detail/en/visual-communications-company-vcc/CMDA5DY7D1S/L71517CT-ND/614867" H 6100 4050 60  0001 C CNN "PurchasingLink"
	1    5700 3550
	0    -1   -1   0   
$EndComp
$Comp
L step:R_1K R5
U 1 1 6263382C
P 5700 3850
F 0 "R5" H 5770 3896 50  0000 L CNN
F 1 "R_1K" H 5770 3805 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 5630 3850 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-rncp.pdf" H 5780 3850 50  0001 C CNN
F 4 "DK" H 5700 3850 60  0001 C CNN "MFN"
F 5 "RNCP0805FTD1K00CT-ND" H 5700 3850 60  0001 C CNN "MPN"
F 6 "https://www.digikey.com/products/en?keywords=RNCP0805FTD1K00CT-ND" H 6180 4250 60  0001 C CNN "PurchasingLink"
	1    5700 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 626342EE
P 5700 4000
F 0 "#PWR01" H 5700 3750 50  0001 C CNN
F 1 "GND" H 5705 3827 50  0000 C CNN
F 2 "" H 5700 4000 50  0001 C CNN
F 3 "" H 5700 4000 50  0001 C CNN
	1    5700 4000
	1    0    0    -1  
$EndComp
Text Label 5700 3400 0    50   ~ 0
LED_1
Text Notes 5675 4375 0    50   ~ 0
Backside LED\nfor testing to DNP
Text Label 3800 3475 0    50   ~ 0
LED_1
$Comp
L step:Test_Point_SMD TP10
U 1 1 6268088A
P 8575 3475
F 0 "TP10" V 8575 3650 50  0000 L CNN
F 1 "Test_Point_SMD" V 8575 3825 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 8575 3325 50  0001 C CNN
F 3 "" H 8575 3475 50  0001 C CNN
	1    8575 3475
	0    1    1    0   
$EndComp
$Comp
L step:Test_Point_SMD TP11
U 1 1 62680890
P 8575 3625
F 0 "TP11" V 8575 3800 50  0000 L CNN
F 1 "Test_Point_SMD" V 8575 3975 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 8575 3475 50  0001 C CNN
F 3 "" H 8575 3625 50  0001 C CNN
	1    8575 3625
	0    1    1    0   
$EndComp
$Comp
L step:Test_Point_SMD TP12
U 1 1 62680896
P 8575 3775
F 0 "TP12" V 8575 3950 50  0000 L CNN
F 1 "Test_Point_SMD" V 8575 4125 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 8575 3625 50  0001 C CNN
F 3 "" H 8575 3775 50  0001 C CNN
	1    8575 3775
	0    1    1    0   
$EndComp
Text Label 8525 3475 2    50   ~ 0
BTN_1
Text Label 8525 3625 2    50   ~ 0
BTN_2
Text Label 8525 3775 2    50   ~ 0
BTN_3
$Comp
L step:Test_Point_SMD TP13
U 1 1 6268089F
P 8575 3950
F 0 "TP13" V 8575 4125 50  0000 L CNN
F 1 "Test_Point_SMD" V 8575 4300 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 8575 3800 50  0001 C CNN
F 3 "" H 8575 3950 50  0001 C CNN
	1    8575 3950
	0    1    1    0   
$EndComp
$Comp
L power:+1V8 #PWR0104
U 1 1 626808A5
P 8400 3950
F 0 "#PWR0104" H 8400 3800 50  0001 C CNN
F 1 "+1V8" H 8250 4000 50  0000 C CNN
F 2 "" H 8400 3950 50  0001 C CNN
F 3 "" H 8400 3950 50  0001 C CNN
	1    8400 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8525 3950 8400 3950
$Comp
L step:Test_Point_SMD TP9
U 1 1 626808AC
P 8575 3325
F 0 "TP9" V 8575 3500 50  0000 L CNN
F 1 "Test_Point_SMD" V 8575 3675 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 8575 3175 50  0001 C CNN
F 3 "" H 8575 3325 50  0001 C CNN
	1    8575 3325
	0    1    1    0   
$EndComp
Text Label 8525 3325 2    50   ~ 0
BTN_0
Wire Notes Line
	8100 3175 9675 3175
Wire Notes Line
	9675 3175 9675 4425
Wire Notes Line
	9675 4425 8100 4425
Wire Notes Line
	8100 4425 8100 3175
Text Notes 8050 3175 0    157  ~ 0
Button Pads
Text Notes 8375 4325 0    50   ~ 0
4x Button TP's - \nSolder N/O Button \nbetween 1V8 & it's pad 
Text Label 1800 2975 2    50   ~ 0
BTN_0
Text Label 1800 3075 2    50   ~ 0
BTN_1
Text Label 1800 3175 2    50   ~ 0
BTN_2
Text Label 1800 3275 2    50   ~ 0
BTN_3
$EndSCHEMATC
