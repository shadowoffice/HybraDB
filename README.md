# Hybrasyl Example Database

This is a collection of XML files and Lua scripts for
[Hybrasyl Server](https://github.com/hybrasyl/server). Hybrasyl uses
XML to store maps, items, NPCs and other world data, and Lua scripts
for NPC/reactor/game event scripting.

You can help expand this database by creating issues or pull requests,
and we welcome it. The files here are intended to get Hybrasyl running
locally for further Hybrasyl development, but also to aid content
developers & designers to craft new content.

# How to use this repository

This repository is intended to be checked out alongside a new server
setup. You can create the Hybrasyl directory (`My Documents/Hybrasyl`
on Windows 10 - or, on GNU/Linux, `~/Hybrasyl` for the user running
the server), and check out this repository to `world`, e.g.
`Hybrasyl/World`. Then the server should start normally and load all
of these data files.

# What is included?

A few test maps, lots of different items, and a “resurrector” NPC who
will take care of you if and when you die. There is also at least one
example XML file for every "type" of XML used by Hybrasyl. You’ll be able
to test combat, too, by going to the Crypt, as a spawngroup is included.

# Working with XML

The nice thing about XML is that it is trivially easy to verify the
correctness of a file (that is to say, a file Hybrasyl will parse and
use). There are a variety of tools you can use to validate XML against
schema; we use `xmllint` for these examples, but there are a lot of
other tools out there.

To make validating XML easier for burgeoning authors, Hybrasyl's
schema are included and kept up to date in this repository (in the
[Schema](./Schema) directory).

Let's consider [monk_kalkuri.xml](./xml/items/monk_kalkuri.xml). We can
use `xmllint` to verify this against the main Hybrasyl schema, and pretty print it to boot:


```
$ xmllint xml/items/monk_kalkuri.xml --schema Schema/Hybrasyl.xsd

<?xml version="1.0"?>
<Item xmlns="http://www.hybrasyl.com/XML/Hybrasyl/2020-02">
  <Name>Kalkuri</Name>
  <Properties>
    <Appearance Sprite="916" DisplaySprite="1" BodyStyle="Transparent"/>
    <Stackable Max="1"/>
    <Physical Value="30000" Weight="11" Durability="3000000" Perishable="false" Vendorable="false" Bound="false"/>
    <Equipment Slot="Weapon" Unique="false" WeaponType="OneHand"/>
    <StatModifiers>
      <Base Str="0" Con="0" Int="0" Wis="0" Dex="0" Hp="500" Mp="500"/>
      <Combat Hit="5" Dmg="10" Ac="-5" Regen="0" Mr="10"/>
    </StatModifiers>
    <Flags>Depositable Tailorable Exchangeable Master</Flags>
    <Variants/>
    <Damage>
      <Small Min="324" Max="364"/>
      <Large Min="454" Max="484"/>
    </Damage>
    <Restrictions>
      <Level Min="99"/>
  	  <Class>Monk</Class>
    </Restrictions>
  </Properties>
</Item>
xml/items/monk_kalkuri.xml validates
```

Now we know Hybrasyl will load and use this file! Hooray.
There is also a script included to do this for you. `validator.sh` can be used to validate all
schema and only print out errors. For example:

```
[baughj@caputina HybraDB]$ ./validator.sh
./maps/mileth_village.xml:73: parser error : AttValue: " or ' expected
    <Sign Type="Sign" X="13" Y=42">
                               ^
./maps/mileth_village.xml:73: parser error : attributes construct error
    <Sign Type="Sign" X="13" Y=42">
                               ^
./maps/mileth_village.xml:73: parser error : Couldn't find end of Start Tag Sign line 73
    <Sign Type="Sign" X="13" Y=42">
                               ^
./maps/mileth_village.xml:75: parser error : Opening and ending tag mismatch: Signs line 72 and Sign
    </Sign>

```

All Hybrasyl XML must specify an XML namespace - you'll note that all
the files in this repository do. Currently, the main namespace for
Hybrasyl is `http://www.hybrasyl.com/XML/Hybrasyl/2020-02`. This is specified using the `xmlns` attribute for the *root* element in an XML file
(e.g. `<Item>`, `<Map>`, etc). For instance: `<Item xmlns="http://www.hybrasyl.com/XML/Hybrasyl/2020-02">`.

You can learn more about Hybrasyl XML and Hybrasyl’s datatypes by
looking at [Hybrasyl’s schema](http://www.hybrasyl.com/XML/Hybrasyl)
or by
[looking at the resulting C# datatypes](https://github.com/hybrasyl/server/tree/develop/XML/XSD/Objects).

The project uses a proprietary tool called
[xsd2code](https://www.xsd2code.com/home.aspx) to process schema into
C# objects. If you plan on making a PR against Hybrasyl to make data
changes, @baughj, the holder of the project’s xsd2code license, can
help you with this.
