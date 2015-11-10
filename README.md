## EAD Import into ArchivesSpace
Resources
---------
 * Nathan's Schematron validation service: http://128.122.90.55:8083/SchemaMap/
 * Mark Custer's Schematron file: https://github.com/fordmadox/schematrons/blob/master/ArchivesSpace-EAD-validator.sch
 * Harvard's ArchivesSpace Checker: https://github.com/harvard-library/archivesspace-checker
 * Harvard's schematronium (gem that runs schematron over 1 or more xml): https://github.com/harvard-library/schematronium
 * Google Drive:

Issues
------
* What is target EAD profile?

* Requirements: What is minimum necessary for import?

* Error reporting an diagnostics
*  verbose logging to to report successful import operations
*  https://github.com/archivesspace/archivesspace/blob/master/backend/spec/lib_ead_converter_spec.rb
* locationb of relevant logs?
* Identifying "silent" failures
* Known Problems: What will not import?
 * Recursive notes
 * `<did>` model: not same as p
 * Repetition
 * granularity refinement
 * mixed content

Alternative Import Scenarios
----------------------------

 * csv-based import of container data, controlaccess?
 * MARC, XML. other based import of Collection data


Batch imports for testing:
--------------------------
<https://archivesspace.github.io/archivesspace/api/#post-repositories-repo_id-batch_imports>
