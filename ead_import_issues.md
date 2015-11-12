EAD Importer Issues
-------------------

+ +ead:did/ead:note elements are silently dropped during import. perhaps follow the AT model and convert these to ead:odd (i.e. “general description” notes) in ArchivesSpace. (add to schematron)
+ +ead:p/ead:note (as footnotes)
+ + nested note elements….  just provide a warning??  ex:  bioghist/bioghist/p (this won’t import as you’d expect)
* unitdate normalized attributes update
<unitdate normal=”1910”/> is imported with 1910-1910 in the date expression field.  in this case, the date expression field in ASpace should be blank since 1910 will be stored in the ASpace begin date field.
* if no container/@id|@parent, then don’t require those to make a container group.  right now, any component that has more than one container element needs to have @id and @parent attributes to ensure that the values import properly.
* allow subject/name matching based on pre-existing ASpace ids….  also allow matching based on other values?  we’d prefer to use an attribute that matches the ASpace URL, since the agent/subject record in ASpace could be pre-subdivided, which ead2002 won’t be able to retain.
* ALL notes should default to published, unless there’s an @audience=”internal attribute present.
* @audience=‘internal’ should be an option, as well, at the collection-level.
* AR-1282: include eadheader/@findaidstatus; map to Finding Aid Status
* AR-1264: index/indexentry import is wonky, name and ref are imported as separate indexentry
* 💀!? AR-1270?; AR-1134: ead/did/physdesc/dimension|physfacet element is loaded twice, once as a Note w/Type=Physical Description and again as a Note with Type=Dimensions. 
Maybe the real problem here is that elements that are children of did are being represented as notes -- they have a wrap-in-tag functionality that allows for all of the elements in `<p>`, but really should be disallowed in this case. 💀
* 💀💀💀 in the case of multiple unittitles or unitids, behavior is “last wins” rather than “multiple unittitles.” Esp problematic for records with names in multiple languages
* language code needs to be repeatable 
* langmaterial/language elements stripped during import (e.g. <langmaterial> We've got <language>one</language>, <language>two</language>, <language>three</language></langmaterial>
    becomes: “We’ve got one, two, three.” in the language note after being imported into ASpace.
* An index entry with a ref@target and ref@text imports as two separate items. It should import as one item with associated reference and reference text. 
* Can’t have notes over 65k
* Nested controlaccess are imported, but they’re flattened….  add a warning about this?  (add to schematron)
extents:  should these be reviewed? 
