<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="urn:isbn:1-931666-22-9" prefix="ead"/>
    <sch:pattern id="resource-level">
        <sch:rule id="R1.1" context="ead:ead/ead:archdesc | ead/archdesc">
            <sch:assert test="matches(@level, '\S')">R1.1: There must be a value for the @level
                attribute at the resource level. </sch:assert>
        </sch:rule>
        <sch:rule id="R1.2" context="ead:archdesc/ead:did/ead:unittitle">
            <sch:assert test="matches(., '\S')">R1.2: There must be a title at the resource level
            </sch:assert>
        </sch:rule>
        <sch:rule id="R1.3" context="ead:archdesc/ead:did//ead:unitdate">
            <sch:assert test="matches(., '\S') or matches(@normal, '\S')">R1.3: There must be a date
                at the resource in either the text content of a unitdate or a value of the unitdate
                normal attribute </sch:assert>
        </sch:rule>
        <sch:rule id="R1.4" context="ead:archdesc/ead:did/ead:unitid">
            <sch:assert test="matches(., '\S')">R1.4: There must be a unitid at the resource level
            </sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
