# Amp Types table

For firmware version 1.0.2.

SysEx address to assign the amp type byte: `0x60 0x00 0x00 0x51`.
In a `.tls` file, assign the TLS number to: `preamp_a_type`.

**Bold** = Default amp when using the Katana's knob / tone studio.

## Acoustic

TLS | SysEx | GT-100 Name | Katana Type
:-:|:-:|-:|:-
**1** | **01** | **FULL RANGE** | **Acoustic**
25 | 19 | CUSTOM | Acoustic

## Clean

TLS | SysEx | GT-100 Name | Katana Type
:-:|:-:|-:|:-
**8** | **08** | **JC-120** | **Clean**
0 | 00 | NATURAL CLEAN | Clean
9 | 09 | CLEAN TWIN | Clean

## Crunch

TLS | SysEx | GT-100 Name | Katana Type
:-:|:-:|-:|:-
**11** | **0B** | **TWEED** | **Crunch**
2 | 02 | COMBO CRUNCH | Crunch
3 | 03 | STACK CRUNCH | Crunch
10 | 0A | PRO CRUNCH | Crunch
12 | 0C | DELUXE CRUNCH | Crunch
13 | 0D | VO DRIVE | Crunch
14 | 0E | VO LEAD | Crunch
15 | 0F | MATCH DRIVE | Crunch

## Lead

TLS | SysEx | GT-100 Name | Katana Type
:-:|:-:|-:|:-
**24** | **18** | **5150 DRIVE** | **Lead**
4 | 04 | HiGAIN STACK | Lead
6 | 06 | EXTREME LEAD | Lead
7 | 07 | CORE METAL | Lead
16 | 10 | BG LEAD | Lead
17 | 11 | BG DRIVE | Lead
18 | 12 | MS1959 I | Lead
19 | 13 | MS1959 I+II | Lead
20 | 14 | R-FIRE VINTAGE | Lead
21 | 15 | R-FIRE MODERN | Lead
22 | 16 | T-AMP LEAD | Lead
26 | 1A | BGNR UB | Lead

## Brown

TLS | SysEx | GT-100 Name | Katana Type
:-:|:-:|-:|:-
**23** | **17** | **SLDN** | **Brown**
5 | 05 | POWER DRIVE | Brown
27 | 1B | ORNG RB | Brown
