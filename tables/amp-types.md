# Amp Types table

**Tested on:**<br>
✓ Firmware `1.0.2`<br>
✓ Katana-50 Combo<br>
✓ Katana-100 Combo<br>
✓ Katana Head<br>

**Attribution:**<br>
Much inspired by https://github.com/snhirsch/katana-midi-bridge.<br>
SysEx & TSL parameter found by https://github.com/Beanow.<br>
GT-100 names from [GT-100 / GT-001 MIDI spec](http://cdn.roland.com/assets/media/pdf/GT-100_GT-001_MIDI_Imple_e01_W.pdf).<br>

## Default amps

SysEx address to assign the amp type byte: `0x00 0x00 0x04 0x20`.

SysEx | GT-100 Name | Katana LED
:-:|-:|:-
0x00 | FULL RANGE | Acoustic
0x01 | JC-120 | Clean
0x02 | TWEED | Crunch
0x03 | 5150 DRIVE | Lead
0x04 | SLDN | Brown

## Sneaky Amps

SysEx address to assign the amp type byte: `0x60 0x00 0x00 0x51`.<br>
In a `.tsl` file, assign the TSL number to: `preamp_a_type`.

The bright setting is a boolean on address `0x60 0x00 0x00 0x59`.<br>
In a `.tsl` file, it's called `preamp_a_bright` and can be `0` or `1`.

The Bright check boxes mean:
- (empty) = the bright setting is ignored.
- ✓ (single) = the bright setting works.
- ✓✓ (double) = the bright setting works and is very noticeable.

**Bold** = Default amp when using the Katana's knob / tone studio.

### Custom

The CUSTOM amp is unique and lets you change a number of extra parameters to basically design your own amp model based on several amp templates.
Boss gave it the Acoustic LED on the Katana, but I decided to list it separately since it can do a lot more than just flat response.

TSL | SysEx | GT-100 Name | Katana LED | Bright
:-:|:-:|-:|:-|:-:
25 | 0x19 | CUSTOM | Acoustic | 

Take a look at the [How To guide](../how-to/use-28-amp-types.md) to see how to configure this.

### Acoustic

TSL | SysEx | GT-100 Name | Katana LED | Bright
:-:|:-:|-:|:-|:-:
**1** | **0x01** | **FULL RANGE** | **Acoustic** | 

### Clean

TSL | SysEx | GT-100 Name | Katana LED | Bright
:-:|:-:|-:|:-|:-:
**8** | **0x08** | **JC-120** | **Clean** | ✓✓
0 | 0x00 | NATURAL CLEAN | Clean | ✓
9 | 0x09 | CLEAN TWIN | Clean | ✓✓

### Crunch

TSL | SysEx | GT-100 Name | Katana LED | Bright
:-:|:-:|-:|:-|:-:
**11** | **0x0B** | **TWEED** | **Crunch** | ✓
2 | 0x02 | COMBO CRUNCH | Crunch | ✓
3 | 0x03 | STACK CRUNCH | Crunch | 
10 | 0x0A | PRO CRUNCH | Crunch | ✓✓
12 | 0x0C | DELUXE CRUNCH | Crunch | 
13 | 0x0D | VO DRIVE | Crunch | 
14 | 0x0E | VO LEAD | Crunch | 
15 | 0x0F | MATCH DRIVE | Crunch | 

### Lead

TSL | SysEx | GT-100 Name | Katana LED | Bright
:-:|:-:|-:|:-|:-:
**24** | **0x18** | **5150 DRIVE** | **Lead** |
4 | 0x04 | HiGAIN STACK | Lead |
6 | 0x06 | EXTREME LEAD | Lead |
7 | 0x07 | CORE METAL | Lead |
16 | 0x10 | BG LEAD | Lead | ✓✓
17 | 0x11 | BG DRIVE | Lead | ✓✓
18 | 0x12 | MS1959 I | Lead |
19 | 0x13 | MS1959 I+II | Lead |
20 | 0x14 | R-FIRE VINTAGE | Lead |
21 | 0x15 | R-FIRE MODERN | Lead |
22 | 0x16 | T-AMP LEAD | Lead |
26 | 0x1A | BGNR UB | Lead |

### Brown

TSL | SysEx | GT-100 Name | Katana LED | Bright
:-:|:-:|-:|:-|:-:
**23** | **0x17** | **SLDN** | **Brown** |
5 | 0x05 | POWER DRIVE | Brown |
27 | 0x1B | ORNG RB | Brown |
