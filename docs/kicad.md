# Schematics, PCBs, and KiCad

## How to create a new component
Are you working on a schematic but can't find the component you want use in the `STEP_Symbols` library? Well look no further! In this tutorial, we'll walk through the process of making a new KiCad part (or modifying an existing one) and adding it to the `STEP_Symbols` library!

**1. Make a new branch**

Whenever you make a new part, it's good practice to make it in a new branch. This allows people to review the part before it's merged into the rest of the library. It also makes it easier to review the changes when all the new parts you'd like to add are in a separate branch from the rest of your work so that way reviewers don't have to scroll through pages of diffs in order to find the new part you'd like to add.

To make a new branch, first you need to pick which branch you want to branch off of. Usually, you'll want to either branch off of main or the current branch you're working on. You can navigate to the branch you want using the [`checkout`](https://git-scm.com/docs/git-checkout) command. Now you can use the [`checkout`](https://git-scm.com/docs/git-checkout) command along with the `-b` flag to make the new branch. Here's an example:
```bash
git checkout [starting_branch_name]
git checkout -b [new_branch_name]
```

**2. Start making a new part (checkout the KiCad documentation)**

The creators of KiCad have already made some awesome documentation about using their product. So rather than try to replicate what they've done, you should check them out! Here's a link to the documentation on creating a new schematic symbol: <https://docs.kicad.org/5.1/en/getting_started_in_kicad/getting_started_in_kicad.html#make-schematic-symbols-in-kicad>.

**3. Some special considerations...**

In addition to what the KiCad documentation says, there are a few special things we like to add to our components which makes them easier to use in KiCad and purchase when it comes time for fabrication.

  a. Setting symbol properities
  
  Every symbol in KiCad has a set of symbol properties. By default, this includes things like the `Reference`, `Value`, `Footprint`, and `Datasheet`. In addition to those default values, every component has some additional properties that make it easier to find on the vendor's website. If you're in the symbol editor, you can head to the top bar and click on the op-amp symbol with a gear ontop of it to open the Symbol Properities Menu. Once your in the Symbol Properties Menu you can click on the small plus icon bellow the Fields table to create a new property. Here is a list of all the properties a symbol in the STEP library should have:
  
  * [Reference](https://klc.kicad.org/symbol/s6/s6.1/): One or two letters that designate the type of component (e.g. `U`).
  * [Value](https://klc.kicad.org/symbol/s2/s2.1/): The name of the part (e.g. `STM32F439BI`, `R_100K`). This is usually a shorter version of the longer part number.
  * [Footprint](https://klc.kicad.org/symbol/s5/s5.2/): The PCB footprint associated with the part. Make sure that the footprint is located in the `STEP_Footprints` library.
 * [Datasheet](): A link to the datasheet associated with the part (e.g. `https://ww1.microchip.com/downloads/en/DeviceDoc/MCP73831-Family-Data-Sheet-DS20001984H.pdf`).
  * [Manufacturer](): The name of the manufacturer.
  * [MPN](): The full part number as specified by the manufacturer (e.g. `STM32F439BIT6`).
  * [Vendor](): The name of the vendor who is selling the part (e.g. `DigiKey`, `Mouser`).
  * [VPN](): The part number as specified by the vendor (e.g. `497-17468-ND`).
  * [PurchasingLink](): A url to where we can purchase the part.
  
  **NOTE:** All of this information is based on the [KiCad Library Conventions](https://klc.kicad.org/) and the work done by [Olin Electric Motorsports](https://github.com/olin-electric-motorsports/olin-electric-motorsports/tree/main/parts). You can click on any of the field names to see more detailed information.
  

**4. Save your new part**

Make sure that when you save your new part you save it to the `STEP_Symbols` library!
