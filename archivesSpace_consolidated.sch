<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="urn:isbn:1-931666-22-9" prefix="ead"/>
    <sch:pattern id="resource-level">
        <sch:rule id="R1.1" context="*:ead/*:archdesc | ead/archdesc">
            <sch:assert test="matches(@level, '\S')">R1.1: There must be a value for the @level
                attribute at the resource level. </sch:assert>
        </sch:rule>
        <sch:rule id="R1.2" context="*:archdesc/*:did">
            <sch:assert test="matches(*:unittitle/text(), '\S')">R1.2: There must be a unittitle at the resource level</sch:assert>
            <sch:assert test="matches(*:unitdate/text(), '\S') or matches(*:unitdate/@normal, '\S')">R1.3: There must be a date
                    at the resource in either the text content of a unitdate or a value of the unitdate
                    normal attribute </sch:assert>
            <sch:assert test="matches(*:unitid/text(), '\S')">R1.4: There must be a unitid at the resource level</sch:assert>
        </sch:rule>
        <sch:rule id="R1.5" context="*:archdesc/*:did/*:physdesc">
            <sch:assert test="exists(*:extent)">R1.5.1: There must be an extent statement at the resource level
            </sch:assert>
            <!-- this may be too strict; consider case of ".25 cubic feet" -->
            <sch:assert test="*:extent[matches(normalize-space(.), '\s')][matches(normalize-space(.), '^\d')]">
                R1.5.2: The extent statement at the resource level must start with a number and it must also have at least one space present. (e.g. "5 Linear Feet" is a valid value, but "5items" is not).
            </sch:assert>            
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="component-level">
        <sch:rule id="C1" context="*:c | *[matches(local-name(), '^c\d')]">
            <sch:assert test="matches(@level, '\S')">
                C1: The must be a level designation for every component
            </sch:assert>
        </sch:rule>
        <sch:rule context="*:dsc//*:did">
            <sch:assert test="matches(*:unittitle[1], '\S') or  matches(descendant::*:unitdate[1], '\S')">
                C2: There must be a title or date for every component
            </sch:assert>
        </sch:rule>
        <sch:rule context="*:dsc//*:did/*:physdesc/*:extent">
            <sch:assert test="matches(normalize-space(.), '\D')">
                C3: An extent statement at the component level must contain more that just a number
            </sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="dates">
        <sch:rule id="D1" context="*:unitdate[contains(@normal, '/')]">
            <let name="begin_date" value="substring-before(@normal, '/')"/>
            <let name="end_date" value="substring-after(@normal, '/')"/>
            <assert test="replace($end_date, '-', '') >= replace($begin_date, '-', '')">The date
                normalization value for this field needs to be updated. The first date, <value-of
                    select="$begin_date"/>, is encoded as occurring <span class="italic"
                        >before</span> the end date, <value-of select="$end_date"/>
            </assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
