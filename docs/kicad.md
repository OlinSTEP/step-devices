# Schematics, PCBs, and KiCad

## How to setup KiCad
In STEP, we use an open source electronic design automation tool called KiCad to design all of the hardware we use. In the following section, you'll learn how to setup KiCad so you can have access to all of the work we've already one.

### Install KiCad
Installing KiCad is different on every computer. For the most up to date information checkout the [KiCad website](https://www.kicad.org/download/).

### Setting up the library

The following steps assume you've already cloned the git repository on to your own computer. First we are going to create an environment variable in KiCad which contains the location of the `step-hardware` repository. This will be useful in later steps when we'll need to refer to that location.

1. Open up KiCad
2. Click on `Preferences` tab in the top menu bar
3. Click on `Configure Paths...`
4. At this point a new menu should have popped up called `Environment Vairbales`. Click on the plus button in the bottom left corner to add a new environment variable to the list
5. Fill out the `Name` column for the new environment variable. We recommend using the name `STEP_DIR`
6. Fill out the `Path` column for the new environment variable with the path to the `step-hardware` repository. It should look something like `/home/username/step-hardware`
7. Press the `Ok` button in the bottom right corner to save the changes and close the menu

If everything has worked, at this point you've successfully created a new environment variable in KiCad which points to the STEP repository. Now we'll add the symbols library in the STEP repository to the list of global libraries in KiCad.

8. Click on `Preferences` tab in the top menu bar
9. Click on `Manage Symbol Libraries...`
10. At this point a new menu should have popped up called `Libraries by Scope`. Click on the `Global Libraries` tab to make sure you are looking at the list of global libraries
11. Click on the plus icon under the bottom left side of the table
12. Fill out the `Nickname` column for the new library. We recommend using the name `STEP_Symbols`
13. Fill out the `Library Path` column with the following: `${STEP_DIR}/parts/symbols/STEP_Symbols.lib` (*note*: if you named the environment variable anything other than `STEP_DIR` replace `STEP_DIR` with that name)
14. Make sure the `Plugin Type` is set to `Legacy` and the `Options` column is left blank
15. Optionally, fill out the `Description` column with a description of your choosing
16. Press the `Ok` button in the bottom right corner to save your changes and close the menu


If everything has worked, at this point you've successfully loaded the STEP symbols library into KiCad. Now we'll add the footprints library in the STEP repository to the list of global libraries in KiCad.


17. Click on `Preferences` tab in the top menu bar
18. Click on `Manage Footprint Libraries...`
19. At this point a new menu should have popped up called `Libraries by Scope`. Click on the `Global Libraries` tab to make sure you are looking at the list of global libraries
20. Click on the plus icon under the bottom left side of the table
21. Fill out the `Nickname` column for the new library. We recommend using the name `STEP_Footprints`
22. Fill out the `Library Path` column with the following: `${STEP_DIR}/parts/footprints/STEP_Footprints.pretty` (*note*: if you named the environment variable anything other than `STEP_DIR` replace `STEP_DIR` with that name)
23. Make sure the `Plugin Type` is set to `KiCad` and the `Options` column is left blank
24. Optionally, fill out the `Description` column with a description of your choosing
25. Press the `Ok` button in the bottom right corner to save your changes and close the menu


If everything has worked, at this point you've successfully loaded the STEP footprints library into KiCad.

## How to create a new component
Are you working on a schematic but can't find the component you want use in the `STEP_Symbols` library? Well look no further! In this tutorial, we'll walk through the process of making a new KiCad part (or modifying an existing one) and adding it to the `STEP_Symbols` library!

### Make a new branch

Whenever you make a new part, it's good practice to make it in a new branch. This allows people to review the part before it's merged into the rest of the library. It also makes it easier to review the changes when all the new parts you'd like to add are in a separate branch from the rest of your work so that way reviewers don't have to scroll through pages of diffs in order to find the new part you'd like to add.

To make a new branch, first you need to pick which branch you want to branch off of. Usually, you'll want to either branch off of main or the current branch you're working on. You can navigate to the branch you want using the [`checkout`](https://git-scm.com/docs/git-checkout) command. Now you can use the [`checkout`](https://git-scm.com/docs/git-checkout) command along with the `-b` flag to make the new branch. Here's an example:
```bash
git checkout [starting_branch_name]
git checkout -b [new_branch_name]
```

### Start making a new part (checkout the KiCad documentation)

The creators of KiCad have already made some awesome documentation about using their product. So rather than try to replicate what they've done, you should check them out! Here's a link to the documentation on creating a new schematic symbol: <https://docs.kicad.org/5.1/en/getting_started_in_kicad/getting_started_in_kicad.html#make-schematic-symbols-in-kicad>.

### Some special considerations...

In addition to what the KiCad documentation says, there are a few special things we like to add to our components which makes them easier to use in KiCad and purchase when it comes time for fabrication.

#### If a similar part exists already, use it

If you see a part in any of the KiCad symbols libraries that is similar to the one you want to make, you can duplicate it and use it as a starting point for your part. You can duplicate parts by right clicking on their name and selecting `Save a Copy as...`. Make sure to save the copy to the `STEP_Symbols` library and fill out the symbol properities so they match the rest of the parts in the STEP library.

#### Setting symbol properities

Every symbol in KiCad has a set of symbol properties. By default, this includes things like the `Reference`, `Value`, `Footprint`, and `Datasheet`. In addition to those default values, every component has some additional properties that make it easier to find on the vendor's website. If you're in the symbol editor, you can head to the top bar and click on the op-amp symbol with a gear ontop of it to open the Symbol Properties Menu. Once your in the Symbol Properties Menu you can click on the small plus icon bellow the Fields table to create a new property. Here is a list of all the properties a symbol in the STEP library should have:
  
  * [Reference](https://klc.kicad.org/symbol/s6/s6.1/): One or two letters that designate the type of component (e.g. `U`).
  * [Value](https://klc.kicad.org/symbol/s2/s2.1/): The name of the part (e.g. `STM32F439BI`, `R_100K`). This is usually a shorter version of the longer part number.
  * [Footprint](https://klc.kicad.org/symbol/s5/s5.2/): The PCB footprint associated with the part. Make sure that the footprint is located in the `STEP_Footprints` library.
 * [Datasheet](): A link to the datasheet associated with the part (e.g. `https://ww1.microchip.com/downloads/en/DeviceDoc/MCP73831-Family-Data-Sheet-DS20001984H.pdf`).
  * [Manufacturer](): The name of the manufacturer (e.g. `Analog Devices`).
  * [MPN](): The full part number as specified by the manufacturer (e.g. `STM32F439BIT6`).
  * [Vendor](): The name of the vendor who is selling the part (e.g. `DigiKey`, `Mouser`).
  * [VPN](): The part number as specified by the vendor (e.g. `497-17468-ND`).
  * [Link](): A url to where we can purchase the part (e.g. `https://www.digikey.com/en/products/detail/stmicroelectronics/STM32F439BIT6/5268309`).
  
**NOTE:** You can click on any of the field names to see more detailed information. All of this information is based on the [KiCad Library Conventions](https://klc.kicad.org/) and the work done by [Olin Electric Motorsports](https://github.com/olin-electric-motorsports/olin-electric-motorsports/tree/main/parts).

#### Making symbol properties visible/invisible

For each property in the Fields section of the Symbol Properties Menu, there is an option to "show" the field in the part drawing. The only fields that should be shown are the `Reference` and the `Value`. All other fields should be hidden.

#### Adding keywords

Underneath the Fields section of the Symbol Properties Menu, there is an option to list Keywords. Make sure you do this! TKeywords make it easier to search for the part. Try to think of larger categories that the symbol belongs to (e.g. an `STM32` is a `Microcontroller` or `MCU`) and list that as a keyword. Another good place to look for possible keywords is the Component Type coloumn of the [Refernece](https://klc.kicad.org/symbol/s6/s6.1/) table on the KiCad Library Conventions website.

#### Making new pins

If you need to make a new integrated circuit (IC), you'll probably need to make some new pins. The [KiCad documentation](https://docs.kicad.org/5.1/en/getting_started_in_kicad/getting_started_in_kicad.html#make-schematic-symbols-in-kicad) briefly touches apon how to make a new pin. However, they don't go into detail about the most confusing part of making a new pin, assigning the `Electrical Type`. The `Electrical Type` is used by the ERC (Electrical Rule Check) to make sure there aren't an obvious mistakes in the schematic. The ERC is super limited and not very smart but can catch some big mistakes that a reviewer might miss. In order to get the most out of the ERC, it's important to make sure the `Electrical Type` category is properly set for each pin. Otherwise the ERC will generate random errors that aren't helpful. If your unsure what type your pin should be, take a look at the article [*Electrical type of schematic symbol pins*](https://forum.kicad.info/t/electrical-type-of-schematic-symbol-pins-kicad-4-and-kicad-5/9439) for a great description of each type of pin. You may also want to take a look at the datasheet of your part. Sometimes the datasheet will list the pin type for each pin.

### Save your new part

Make sure that when you save your new part you save it to the `STEP_Symbols` library!
