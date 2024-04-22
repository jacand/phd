Alias: $CodeableConcept11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/CodeableConcept11073MDC
Alias: $Quantity11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/Quantity11073MDC

Profile: PhdBaseObservation
Parent: Observation
Id: PhdBaseObservation
Description: "Observation elements that are common to all the Continua PHD Observation profiles"
* ^meta.lastUpdated = "2017-12-14T04:17:26.671-05:00"
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdBaseObservation"
* ^status = #draft
* ^date = "2017-11-24T15:17:35.385-05:00"
* . ^comment = "This variant on the Observation defines a base profile for the PHD Observation profiles. This profile is abstract and does not exist alone."
* meta 1..
  * security ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "system"
    * ^slicing.discriminator[+].type = #value
    * ^slicing.discriminator[=].path = "code"
    * ^slicing.rules = #open
  * security contains PhdHtest 0..1
  * security[PhdHtest] ^short = "Security value set to HTEST when measurement status indicates demo or test data"
    * system 1..
    * system = "http://terminology.hl7.org/CodeSystem/v3-ActReason" (exactly)
    * code 1..
    * code = #HTEST (exactly)
* extension 0..1
  * ^short = "Extension for the PHG"
  * url = "http://hl7.org/fhir/StructureDefinition/observation-gatewayDevice" (exactly)
    * ^short = "Url indicating this is the gateway device extension"
  * value[x] 1..
  * value[x] only Reference
    * ^short = "Reference to the Personal Health Gateway (PHG) Device"
* category ..* 
* category only CodeableConcept
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "coding.code"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "coding.system"
  * ^slicing.ordered = false
  * ^slicing.rules = #open
* category contains PHD-Observation 1..1
* category[PHD-Observation] only CodeableConcept
  * coding 1..*
  * coding only Coding
    * system 1..1
    * system only uri
    * system = "http://hl7.org/fhir/uv/phd/CodeSystem/PhdObservationCategoriesCS" (exactly)
    * code 1..1
    * code only code
    * code = #phd-observation (exactly)
* identifier ^slicing.discriminator[0].type = #exists
  * ^slicing.discriminator[=].path = "value"
  * ^slicing.discriminator[+].type = #exists
  * ^slicing.discriminator[=].path = "system"
  * ^slicing.discriminator[+].type = #exists
  * ^slicing.discriminator[=].path = "type"
  * ^slicing.rules = #open
* identifier contains conditionalCreate 0..1
* identifier[conditionalCreate] ^short = "Unique identifier of this measurement for a given patient and device"
  * ^definition = "An identifier created from a combination of the measurement parameters like sensor time stamp, type code, value, units code, patient and device identifiers, and selected elements of any component elements."
  * ^comment = "This value is used in the conditional create to prevent data duplication. PHDs will often re-send already sent data for a variety of reasons. This element is required unless the metric measurement contains no time stamp or is a measurement containing a time stamp that is real time. By real time the time stamp reported by the PHD must be later than the current time reported by the PHD before any measurements are received. There might be other means to ascertain whether the data is real time. Temporarily stored data from IEEE 11073-20601 devices, which are required to delete the data after sending, can also be considered real time. Temporarily stored data from Bluetooth Low Energy Health devices may be resent so these cannot be considered as real time. "
  * ^requirements = "Allows observations to be distinguished in a selective enough manner to prevent resource duplication."
  * type ..0
  * system ..0
  * value 1..
* status ^definition = "The status of the result value. Either 'final' or 'preliminary'"
  * ^comment = "The value shall be set to 'final' unless a Measurement-Status attribute or Nu-Observed-Value attribute status field indicates that the measurement is preliminary. In that case this field shall be set to 'preliminary'"
* code
  * coding ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "system"
    * ^slicing.rules = #open
  * coding contains
      MDCType 1..1 and
      LoincCoding 0..1
  * coding[MDCType] ^short = "The 11073-10101 MDC code for the measurement"
    * ^definition = "This MDC code expresses what the measurement is"
    * ^comment = "For non-compound 11073-20601 metric numeric measurements, this code is obtained from one or more of the Type, Metric-Id, Nu-Observed-Value, and Metric-Id-Partition attributes. The algorithm to get the 16-bit partition and 16-bit term code is as follows:  1. The partition and term code are obtained from the Type attribute. 2. If there is a Metric-Id attribute the term code comes from this attribute. 3. If there is a Nu-Observed-Value attribute the term code comes from this attribute. 4. If the term code is NOT from the Type attribute, and there is a Metric-Id-Partition attribute, the partition comes from this attribute. 5. The 32-bit 11073-10101 code value is given by partition * 2 **16 + term code.  It is this value that is placed in the code.coding.code element for this MDCType slice.\r\nFor compound numeric measurements, the code comes from the Type attribute."
    * system 1..
    * system = "urn:iso:std:iso:11073:10101" (exactly)
    * code 1..
      * ^comment = "Required for all measurements"
  * coding[LoincCoding] ^short = "The LOINC code for the measurement"
    * ^definition = "This LOINC code expresses what the measurement is"
    * ^comment = "If the measurement is one of the magic vital signs, the Magic LOINC code for that vital sign as specified by FHIR appears here."
    * system 1..
    * system = "http://loinc.org" (exactly)
    * code 1..
      * ^comment = "Required if the measurement is a vital sign"
  * text ^short = "It is recommended to display at least the reference identifier for the MDC code"
* subject 1..
  * reference 1..
* effective[x] 1..
* effective[x] only dateTime or Period
  * ^definition = "The time or time-period the observed value is asserted as being true. It is a time period if a Measure-Active-Period (duration) attribute is part of the metric measurement sent by the PHD. Otherwise it is the time stamp sent by the PHD or the time of reception by the PHG if the PHD sent no time stamp."
* interpretation
  * coding ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "system"
    * ^slicing.rules = #open
  * coding contains MsmtStatusInterpretation 1..1
  * coding[MsmtStatusInterpretation] ^short = "Measurement status interpretation when questionable, calibration-ongoing, validated, early-indication, threshold exceeded, alarm inhibited"
    * system 1..
    * system = "http://hl7.org/fhir/uv/pocd/CodeSystem/measurement-status" (exactly)
    * code 1..
* device 1..
  * ^comment = "This field will reference the PHD Device."
  * reference 1..
    * ^short = "Reference to the device responsible for the measurement"
    * ^definition = "Reference to the device-related resources that describe the sensor device taking the measurement. This element will point to a Device resource following the Phd Device Profile."
    * ^comment = "This reference points to the Device resource containing information about the sensor device that took the measurement."
* derivedFrom ^short = "Reference to the Coincident Time Stamp Observation and/or Source-Handle-Reference Observation"
  * ^comment = "When the PHD reports a time stamp a reference to the Coincident Time Stamp Observation is placed here. When the PHD reports a Source-Handle-Reference/-List attribute the Observation(s) pointed to by that Source-Handle-Reference/-List is (are) placed here. One may end up with several Observation.derivedFrom elements."
* component ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "code"
  * ^slicing.rules = #open
* component contains
    supplementalTypesComponent 0..* and
    relativeTimeComponent 0..1 and
    hiresRelativeTimeComponent 0..1
* component[supplementalTypesComponent] ^short = "Supplemental Type: A further description of the measurement type."
  * ^definition = "For each partition:term code pair contained in the Supplemental-Types attribute, a separate supplementalTypesComponent element is generated. The component is not generated if the attribute is absent or empty. The component shall be generated otherwise."
  * ^comment = "A PHD may send a Supplemental-Types attribute as part of the measurement. This attribute consists of a set of MDC nomenclature codes as partition:term code pairs. Each pair is a code describing something additional about the measurement, such as MDC_MODALITY_SPOT in the pulse oximeter which indicates that the provided measurement is a stable average. An MDC_MODALITY_FAST would indicate that a short averaging is used and the result reported regardless of stability."
  * code from $CodeableConcept11073MDC (required)
    * coding 1..
      * ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.rules = #open
    * coding contains MdcType 1..1
    * coding[MdcType] ^short = "The 11073-10101 MDC code for the measurement"
      * system 1..
      * system = "urn:iso:std:iso:11073:10101" (exactly)
      * code 1..
      * code = #68193 (exactly)
        * ^definition = "68193 is the 32-bit nomenclature code indicating a 'Supplemental-Types' value"
    * text ^definition = "It is recommended to display at least the reference identifier for the Supplemental-Types which is MDC_ATTR_SUPPLEMENTAL_TYPES"
  * value[x] 1..
  * valueCodeableConcept 1..1
  * valueCodeableConcept only CodeableConcept
    * ^sliceName = "valueCodeableConcept"
    * ^definition = "The supplemental information determined as a result of making the observation, if the information is a code."
    * coding ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.rules = #open
    * coding contains MDCType 1..1
    * coding[MDCType] ^short = "Required MDC code entry."
      * system 1..
      * system = "urn:iso:std:iso:11073:10101" (exactly)
      * code 1..
        * ^definition = "For the given Supplemental-Types entry the code here is given by: partition * 2**16 + term code"
  * dataAbsentReason ..0
* component[relativeTimeComponent] ^short = "Relative time stamp of the measurement reported by the PHD."
  * ^definition = "This component shall be present if the measurement contains a Relative-Time-Stamp."
  * ^comment = "Relative time stamps are converted to wall clock time by the PHG through the Coincident Time Stamp Observation. The original relative time value shall be provided here in order to recover the data sent by the sensor device. It also provided a higher time resolution than permitted by the effective[x] time stamp should it be needed.\r\nThe Relative-Time-Stamp is a 32-bit unsigned integer in units of 1/8th ms. It is reported here scaled to microseconds."
  * code from $Quantity11073MDC (required)
    * coding 1..
      * ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.rules = #open
    * coding contains MdcType 1..1
    * coding[MdcType] ^short = "The 11073-10101 MDC code for the measurement"
      * system 1..
      * system = "urn:iso:std:iso:11073:10101" (exactly)
      * code 1..
      * code = #67985 (exactly)
        * ^definition = "The MDC code of the Relative-Time-Stamp attribute"
    * text ^definition = "The reference identifier should be included in the description. For a Relative-Time-Stamp the ref id is MDC_ATTR_TIME_STAMP_REL"
  * value[x] 1..
  * valueQuantity 1..1
  * valueQuantity only Quantity
    * ^sliceName = "valueQuantity"
    * value 1..
      * ^definition = "The value of the relative time attribute which is in units of 1/8th milliseconds scaled to microseconds."
    * system 1..
    * system = "http://unitsofmeasure.org" (exactly)
      * ^definition = "The unit code shall use the UCUM system"
    * code 1..
    * code = #us (exactly)
      * ^definition = "The UCUM code for microseconds"
  * dataAbsentReason ..0
* component[hiresRelativeTimeComponent] ^short = "Hi-Resolution Relative time stamp of the measurement reported by the PHD."
  * ^definition = "This component shall be present if the measurement contains Hi-Res-Relative-Time-Stamp."
  * ^comment = "Hi Res Relative time stamps are converted to wall clock time by the PHG through the Coincident Time Stamp Observation. The original relative time value shall be provided here in order to recover the data sent by the sensor device. It also allows much higher time resolution than permitted in the effective{x] element should it be needed.\r\nThe Hi-Res-Relative-Time-Stamp is a 64-bit unsigned interger in units of microseconds."
  * code from $Quantity11073MDC (required)
    * coding 1..
      * ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.description = "Slice by coding..."
      * ^slicing.rules = #open
    * coding contains MdcType 1..1
    * coding[MdcType] ^short = "The 11073-10101 MDC code for the measurement"
      * system 1..
      * system = "urn:iso:std:iso:11073:10101" (exactly)
      * code 1..
      * code = #68073 (exactly)
        * ^definition = "The MDC code for the Hi-Res-Relative-Time-Stamp attribute"
    * text ^definition = "The reference identifier should be included in the description. For a Hi-Res-Relative-Time-Stamp the ref id is MDC_ATTR_TIME_STAMP_REL_HI_RES"
  * value[x] 1..
  * valueQuantity 1..1
  * valueQuantity only Quantity
    * ^sliceName = "valueQuantity"
    * value 1..
      * ^short = "Numerical value"
      * ^definition = "The value of the hi res relative time attribute (already in microseconds)."
    * system 1..
    * system = "http://unitsofmeasure.org" (exactly)
      * ^definition = "The unit code shall use the UCUM system"
    * code 1..
    * code = #us (exactly)
      * ^definition = "The UCUM code for microseconds"
  * dataAbsentReason ..0