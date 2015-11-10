<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns uri="http://www.w3.org/1999/xlink" prefix="xlink"/>
    <ns uri="urn:isbn:1-931666-22-9" prefix="ead"/>
    <!-- eventually, this file should test for all of the ASpace "EAD" requirements prior to import  
        (still need to figure what all of those are, including all undocumented data model constraints, etc.)
        
        still to add:
           something about field lengths (also need to test for length of title / unit ids, etc.)... if something is too long for the database, etc., like the 65k character limit :(
           what else???
        
        still to do:
           re-write the error messages!
           make sure that the error messages include everything needed
           pray that i can use xpath 2.0, as i've done here
           group and arrange this file like a semi-decent schematron file should actually be structured (and learn how to do that!)
    -->
    
    <pattern>
        <rule context="ead:archdesc">
            <assert test="@level">You must supply a level attribute at the resource level</assert>
        </rule>
        <rule context="ead:archdesc/ead:did">
            <assert test="ead:unittitle[normalize-space()]">You must supply a
                title at the resource level</assert>               
<!--            <assert test="boolean(ead:unittitle//text()[normalize-space()][1])">You must supply a
                title at the resource level</assert>
-->
          <assert
               test="descendant::ead:unitdate[normalize-space()] or descendant::ead:unitdate[@normal]"
                >You must supply a date at the resource level (including as child of unittitle)</assert>
          
 <!--           <assert
                test="boolean(descendant::ead:unitdate//text()[normalize-space()][1]) or descendant::ead:unitdate/@normal"
                >You must supply a date at the resource level</assert>
  -->        
          
            <assert test="boolean(ead:unitid//text()[normalize-space()][1])">You must supply an
                identifier at the resource level</assert>
            <assert test="boolean(ead:physdesc/ead:extent//text()[normalize-space()][1])">You must
                supply an extent statement at the resource level. This should be formatted with an
                extent number and an extent type, like so: "3.25 cubic meters"</assert>
            <!-- is ASpace (like the AT) fine with this value just being in physdesc?  if so, then update this check.  or, make ASpace more strict, so that folks can still 
            import generic physdesc notes at the resource level.-->
        </rule>
    </pattern>
    
    <pattern>
        <rule context="ead:unitdate[contains(@normal, '/')]">
            <!-- this will work for most cases, but it's not going to catch if someone inputs a date like 2010-02-30...
                the EAD2002 schema also won't pick that particular error up (and it sounds like EAD3 is doing away with all of those sorts of validations!)  
            to correct that here, i'd just need to analye the string and set year, month, and day values for each begin and end dates to do the validtion.
            i assume that's worth doing?
            -->
            <let name="begin_date" value="substring-before(@normal, '/')"/>
            <let name="end_date" value="substring-after(@normal, '/')"/>
            <assert test="replace($end_date, '-', '') gt replace($begin_date, '-', '')">The date
                normalization value for this field needs to be updated. The first date, <value-of
                    select="$begin_date"/>, is encoded as occurring <span class="italic"
                        >before</span> the end date, <value-of select="$end_date"/>
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="*[@level ='otherlevel']">
            <assert test="@otherlevel">If the value of a level attribute is "otherlevel', then you
                must specify the value of the otherlevel attribute</assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="ead:c | ead:*[matches(local-name(), '^c0|^c1')]">
            <assert test="@level">You must specify a level attribute at every level of
                description</assert>
            <assert
                test="boolean(ead:did/ead:unittitle//text()[normalize-space()][1])  or boolean(ead:did/ead:unitdate//text()[normalize-space()][1]) or ead:did/ead:unitdate[@normal]"
                > You must specify either a title or a date when describing archival components
                (this is a requirement enforced by the AchivesSpace data model, not by EAD)</assert>
        </rule>
    </pattern>
    
    <!-- rather than include this rule, we shoud only use the container/@id values during import if there is more than 1 @id per archival component
    <pattern>
        <rule context="ead:container[not(@parent)]">
            <assert test="@id ">In order to ensure that your container elements import properly, you should assign id attributes for each container grouping per archival component</assert>
        </rule>
    </pattern>
    -->
</schema>
