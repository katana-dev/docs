# Katana Patch capabilities

**Tested on:**<br>
✓ Firmware `1.0.2`<br>
✓ Katana-100 Combo<br>

**Attribution:**<br>
Used a lot of [https://github.com/snhirsch/katana-midi-bridge](https://github.com/snhirsch/katana-midi-bridge)'s work to cross reference things.<br>
The [KATANAFxFloorBoard application](https://sourceforge.net/projects/fxfloorboard/files/experimental/) by Colin Willcocks is very helpful.<br>
GT-100 references from [GT-100 / GT-001 MIDI spec](http://cdn.roland.com/assets/media/pdf/GT-100_GT-001_MIDI_Imple_e01_W.pdf).<br>

#### Contents

<!-- TOC depthFrom:2 depthTo:3 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Sneaky Patch features](#sneaky-patch-features)
	- [Confirmed](#confirmed)
	- [Unconfirmed](#unconfirmed)
- [About the SysEx information](#about-the-sysex-information)
- [SysEx Patch locations](#sysex-patch-locations)
- [SysEx Patch blocks](#sysex-patch-blocks)

<!-- /TOC -->

## Sneaky Patch features

Let me start with what you all want to know:<br>
> What can you do in your patches that isn't supposed to be possible with the Kantana?<br>
The **Sneaky Patch features**!

The table is split in confirmed to work and unconfirmed.
The confirmed part has less useful features at the bottom.

### Confirmed

Feature | Useful | Comment
:-:|:-:|:-
Sneaky Effect types | Very | Several effects are not listed in Tone Studio while they do work.<br>A full list is coming, but notable ones to check out are:<br>- Booster effects: Lead Distortion & Custom.<br>- Mod / FX effects: Tone Modify, Sub Distortion.<br>- FX only effect: Tera Echo!<br><br>Can be set using SysEx, `.tsl` edits and [KATANAFxFloorBoard](https://sourceforge.net/projects/fxfloorboard/files/experimental/).
Simultaneous effects | Very | Effects that overlap on the knobs, Booster + Mod and Delay + FX,<br>can be enabled at the same time. Toggle the effect so it is ON and<br>change the Effect Level so this is not 0.<br><br>**Note:**<br>Don't move the knob after this, as it will disable one effect.<br><br>Can be set using SysEx, `.tsl` edits and [KATANAFxFloorBoard](https://sourceforge.net/projects/fxfloorboard/files/experimental/).
Effect ordering<br><br>`.. .. 07 20`<br>`.. .. 07 33` | Very | The CHAIN 1-3 setting can be overruled.<br>You can re-order any of the functional effects.<br>Applies to:<br>- Noise suppressor<br>- Booster (OD/DS)<br>- Mod (FX1)<br>- Amp<br>- Delay<br>- FX (FX2)<br>- Reverb<br>- Foot volume<br>- FX loop (Send/Return)<br><br>Can be set using SysEx, `.tsl` edits and [KATANAFxFloorBoard](https://sourceforge.net/projects/fxfloorboard/files/experimental/).
Effect flipping<br><br>`.. .. 12 15`<br>`.. .. 12 16` | Maybe | In SysEx land, the listed addresses allow you to set for each knob<br>which effect is currently active.<br>`00` first effect (Boost/Delay).<br> `01` second effect (Mod/FX).<br><br>By setting an Effect Level other than 0 in advance but not<br>enabling the effect yet, you can flip effects with a single<br>command.<br><br>For example between Tape Delay <-> Phaser (FX).<br>Or set Mod to Sub Distortion, then Booster <-> Sub Distortion to<br>flick between different overdrive pedals.
Patch level<br><br>`.. .. 07 10` | No | In SysEx and `.tsl` you can set the Patch Level.<br>It acts as a master volume after all effects.<br>By default this is set to the maximum 200%.<br>ANY change to the front panel will reset this value to 200%.<br>I would not recommend using it in your patches.<br>Use the front panel MASTER knob and POWER CONTROL instead.

### Unconfirmed

Feature | Comment
:-:|:-
Output select | This is not disabled, but I couldn't hear a difference in sound.<br>It may be disabled due to a lack of cabinet simulation.<br>`00` JC-120<br>`01` Small Amp<br>`02` Combo Amp<br>`03` Stack Amp<br>`04` JC-120 Return<br>`05` Combo Return<br>`06` Stack Return<br>`07` Line/Phones (default)
Divider LPF/HPF | In the divider block, the Low/High-pass filter is not force disabled.<br>However it could be disabled indirectly because dual-amp mode is force disabled.
Accel FX | All parameters can be changed, but I haven't found a way to toggle it's effect yet.
EXP SW | The expression pedal switch.<br>It's parameters can be changed, but I haven't found a way to trigger the switch yet.
Master BPM,<br>Key and Beat | These values can be set, but I've not confirmed if any effects are using it.
Manual Mode | On the GT-100, manual mode lets you assign effects to each of the stomp buttons.<br>These assignments are not disabled. But where are the buttons?<br>And how do we enter manual mode? Perhaps it has an effect on the GA-FC?
Patch Category | A category can be set for the patch (ex: Country, Rock, Metal, USER 1).<br>I haven't found any place where this is displayed or used. The `.tsl` do store it.

---

## About the SysEx information

The Katana's SysEx specifications and capabilities are very similar to the GT-100/GT-001.
To keep this document from taking up a lot of copy-pasting time it will meanly speak in terms of **differences from the GT-100**.
With that in mind you probably want to keep the GT-100 spec handy when building implementations.

This table also only covers patches, not the system areas.
For your application the system area is potentially relevant, because aside from global system settings the front panel knobs are also made available in this range.
Particularly in the `0x00 0x00 0x04 0x20` to `0x00 0x00 0x04 0x29` range.
Refer to [Steven Hirsch's documentation](https://github.com/snhirsch/katana-midi-bridge/blob/master/doc/katana_sysex.txt) of this for more details.

There is more work left to be done to complete this table, odds are it will be updated a few times.

**Gotcha**
As a general rule, the system area features can conflict with values in the patch areas, you should be aware of the order in which you write these values.
For maximum control over all parameters I would recommend writing the system area first, then the patch area.

## SysEx Patch locations

Following the same scheme as the GT-100.
The following patch locations are active.

Address (hex) | Patch name
-:|:-
`10 00 .. ..` | _Currently unclear "0th patch"_
`10 01 .. ..` | CH1 user patch
`10 02 .. ..` | CH2 user patch
`10 03 .. ..` | CH3 user patch
`10 04 .. ..` | CH4 user patch
`20 00 .. ..` | Panel factory reset patch
`20 01 .. ..` | CH1 factory reset patch
`20 02 .. ..` | CH2 factory reset patch
`20 03 .. ..` | CH3 factory reset patch
`20 04 .. ..` | CH4 factory reset patch
`60 00 .. ..` | Panel patch (temporary)

## SysEx Patch blocks

Here are some of the blocks that differ from the GT-100.
More differences may be found later.

_Forced_ in this context means: sending SysEx commands to the value is ineffective and the value listed will be returned on queries.

Range (hex) | Block name | Details
-:|-:|:-
`.. .. 00 20`<br>`.. .. 00 25` | Compressor | Forced OFF.
`.. .. 00 50`<br>`.. .. 00 6E` | Preamp A | Forced ON.<br>T-COMP forced `0A` (+0).<br>Gain SW forced `01` (middle).<br>Solo SW forced OFF.<br>Speaker type forced OFF.
`.. .. 01 00`<br>`.. .. 01 1F` | Preamp B | Forced OFF.
`.. .. 00 66`<br>`.. .. 00 67`<br>and<br>`.. .. 01 16`<br>`.. .. 01 17` | _Undocumented_<br>Preamp A an B | 2 read-write bytes, values `00` - `0A`, default `05`.<br>Presumably custom amp/speaker related.<br>I personally can't hear any difference.<br>It's value is not mapped by Tone Studio in a `.tsl` file.<br>But it does get saved/recalled on the Katana.
`.. .. 01 30`<br>`.. .. 01 3B` | EQ | Forced OFF.
`.. .. 06 00`<br>`.. .. 06 08` | Chorus | Forced OFF.
`.. .. 06 20`<br>`.. .. 06 2B` | Pedal FX | Forced OFF.<br>_Undocumented_ read-only address `.. .. 06 21` value `18`.
`.. .. 06 30`<br>`.. .. 06 33` | Foot Volume | Forced volume curve `02` (normal).<br>Forced volume min 0%.<br>Forced volume max 100%.
`.. .. 06 40`<br>`.. .. 06 49` | Divider | Forced mode `00` (single).<br>Forced CH select `00` (channel A).<br>Forced channel A dynamic `00` (off).
`.. .. 06 50`<br>`.. .. 06 52` | Mixer | Forced mode `00` (stereo).<br>Forced channel balance `00` (100% Ch.A, 0% Ch.B).<br>Forced spread 0%.
`.. .. 06 60` | Amp Control | Forced OFF.
`.. .. 06 68`<br>`.. .. 06 6B` | NS2 | Forced OFF.<br>Forced PRM detect `00` (input).
`.. .. 07 11`<br>`.. .. 07 15` | Master EQ | Forced flat on all values (+0db).
`.. .. 08 30`<br>`.. .. 0A 30` | Assign | Forced assign 1-8 OFF.
`.. .. 12 00`<br>`.. .. 12 16` | Katana specific | This block holds patch data specific to the Katana.<br>Which chain, color assignment for effects, etc.
