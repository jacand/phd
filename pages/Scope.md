---
title: Scope
layout: default
active: cope
---

This Implementation Guide is utilized by the Continua design guidelines and by the IHE remote patient monitoring architecture. Continua defines design guidelines for Personal Health Device (PHD) to Personal Health Gateway (PHG) communications where the PHG uploads the device data using one of three data models that include either HL7 V2 PCD-01, HL7 V3 PHMR CDA, or FHIR. For each of these data models there are associated transport transactions (not to be confused with FHIR transactions such as creates, conditional creates, updates, etc.) and mappings from the base device standard, which is the IEEE 11073 PHD, to FHIR objects. This guide is concerned with the FHIR data model based upon FHIR version 3.5.0 and illustrates how one maps PHD information into FHIR resources.

 - [Next: Use Cases]({{ output }}UseCases.html)
 - [Previous: Audience]({{ output }}Audience.html)