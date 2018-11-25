This example is a transaction bundle where the Patient and Device resources are using an update transaction. In this manner the PHG specifies the logical id, uses that logical id in the bundle where it needs to without waiting for a server response, and retains those logical id for the Observation resources where it needs them in subsequent uploads. Subsequent bundles can be sent without the Patient and Device resources since they have already been uploaded.

<pre>
{
    "resourceType": "Bundle",
    "id": "nonin-hdp-1542718631721",
    "type": "transaction",
    "entry": [
        {
            "fullUrl": "Patient/sisansarahId.1.2.3.4.5.6.7.8.10",
            "resource": {
                "resourceType": "Patient",
                "id": "sisansarahId.1.2.3.4.5.6.7.8.10",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdPatient"
                    ]
                },
                "identifier": [
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                                    "code": "MR"
                                }
                            ]
                        },
                        "system": "urn:oid:1.2.3.4.5.6.7.8.10",
                        "value": "sisansarahId"
                    }
                ],
                "name": [
                    {
                        "family": "Piggy",
                        "given": [
                            "Sisansarah",
                            "Lorianthah"
                        ]
                    }
                ]
            },
            "request": {
                "method": "PUT",
                "url": "Patient/sisansarahId.1.2.3.4.5.6.7.8.10"
            }
        },
        {
            "fullUrl": "Device/ecde3d4e58532d31.000000000000",
            "resource": {
                "resourceType": "Device",
                "id": "ecde3d4e58532d31.000000000000",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/uv/phd/StructureDefinition/PhgDevice"
                    ]
                },
                "identifier": [
                    {
                        "use": "official",
                        "system": "urn:oid:1.2.840.10004.1.1.1.0.0.1.0.0.1.2680",
                        "value": "ec-de-3d-4e-58-53-2d-31",
                        "assigner": {
                            "display": "EUI-64"
                        }
                    }
                ],
                "type": {
                    "coding": [
                        {
                            "system": "urn:iso:std:iso:11073:10101",
                            "code": "531981"
                        }
                    ],
                    "text": "MDC_MOC_VMS_MDS_AHD"
                },
                "version": [
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "urn:iso:std:iso:11073:10101",
                                    "code": "532352"
                                }
                            ],
                            "text": "MDC_REG_CERT_DATA_CONTINUA_VERSION: Continua version"
                        },
                        "value": "5.0"
                    }
                ],
                "property": [
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "urn:iso:std:iso:11073:10101",
                                    "code": "68220"
                                }
                            ],
                            "text": "MDC_TIME_SYNC_PROTOCOL: Time synchronization protocol"
                        },
                        "valueCode": [
                            {
                                "coding": [
                                    {
                                        "system": "urn:iso:std:iso:11073:10101",
                                        "code": "532226"
                                    }
                                ],
                                "text": "MDC_TIME_SYNC_NTPV4: "
                            }
                        ]
                    },
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "urn:iso:std:iso:11073:10101",
                                    "code": "532353"
                                }
                            ],
                            "text": "MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST: certified device list as transport-specialization combo"
                        },
                        "valueCode": [
                            {
                                "coding": [
                                    {
                                        "system": "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaPAN",
                                        "code": "4"
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "urn:iso:std:iso:11073:10101",
                                    "code": "532355"
                                }
                            ],
                            "text": "MDC_REG_CERT_DATA_CONTINUA_AHD_CERT_LIST: certified Upload classes"
                        },
                        "valueCode": [
                            {
                                "coding": [
                                    {
                                        "system": "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaHFS",
                                        "code": "0"
                                    }
                                ]
                            },
                            {
                                "coding": [
                                    {
                                        "system": "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaHFS",
                                        "code": "3"
                                    }
                                ]
                            },
                            {
                                "coding": [
                                    {
                                        "system": "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaHFS",
                                        "code": "7"
                                    }
                                ]
                            },
                            {
                                "coding": [
                                    {
                                        "system": "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaHFS",
                                        "code": "2"
                                    }
                                ]
                            },
                            {
                                "coding": [
                                    {
                                        "system": "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaHFS",
                                        "code": "6"
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7",
                                    "code": "532354.0"
                                }
                            ],
                            "text": "regulation-status"
                        },
                        "valueCode": [
                            {
                                "coding": [
                                    {
                                        "system": "http://terminology.hl7.org/CodeSystem/v2-0136",
                                        "code": "Y"
                                    }
                                ],
                                "text": "Device is not regulated"
                            }
                        ]
                    }
                ]
            },
            "request": {
                "method": "PUT",
                "url": "Device/ecde3d4e58532d31.000000000000"
            }
        },
        {
            "fullUrl": "Device/001C050400007825.001C05007825",
            "resource": {
                "resourceType": "Device",
                "id": "001C050400007825.001C05007825",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdDevice"
                    ]
                },
                "identifier": [
                    {
                        "use": "official",
                        "system": "urn:oid:1.2.840.10004.1.1.1.0.0.1.0.0.1.2680",
                        "value": "00-1C-05-04-00-00-78-25",
                        "assigner": {
                            "display": "EUI-64"
                        }
                    },
                    {
                        "system": "urn:oid:1.2.840.10004.1.1.1.0.0.1.0.0.1.2680",
                        "value": "00-1C-05-00-78-25",
                        "assigner": {
                            "display": "EUI-48"
                        }
                    }
                ],
                "manufacturer": "Nonin Medical, Inc.",
                "serialNumber": "0400007825",
                "modelNumber": "Model 3150",
                "type": {
                    "coding": [
                        {
                            "system": "urn:iso:std:iso:11073:10101",
                            "code": "65573"
                        }
                    ],
                    "text": "MDC_MOC_VMS_MDS_SIMP"
                },
                "specialization": [
                    {
                        "systemType": {
                            "coding": [
                                {
                                    "system": "urn:iso:std:iso:11073:10101",
                                    "code": "528388"
                                }
                            ],
                            "text": "MDC_DEV_SPEC_PROFILE_PULS_OXIM: Pulse Oximeter"
                        },
                        "version":"1"
                    }
                ],
                "version": [
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "urn:iso:std:iso:11073:10101",
                                    "code": "531976"
                                }
                            ],
                            "text": "MDC_ID_PROD_SPEC_FW: Firmware revision"
                        },
                        "value": "0.9C"
                    },
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "urn:iso:std:iso:11073:10101",
                                    "code": "532352"
                                }
                            ],
                            "text": "MDC_REG_CERT_DATA_CONTINUA_VERSION: Continua version"
                        },
                        "value": "1.0"
                    }
                ],
                "property": [
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "urn:iso:std:iso:11073:10101",
                                    "code": "532353"
                                }
                            ],
                            "text": "MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST: certified device list as transport-specialization combo"
                        },
                        "valueCode": [
                            {
                                "coding": [
                                    {
                                        "system": "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaPAN",
                                        "code": "4" 
                                        // The '4' means pulse ox. This is a continua version 1 device and there were no transport codes
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7",
                                    "code": "532354.0"
                                }
                            ],
                            "text": "regulation-status"
                        },
                        "valueCode": [
                            {
                                "coding": [
                                    {
                                        "system": "http://terminology.hl7.org/CodeSystem/v2-0136",
                                        "code": "N"
                                    }
                                ],
                                "text": "Device is Regulated"
                            }
                        ]
                    },
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "urn:iso:std:iso:11073:10101",
                                    "code": "68220"
                                }
                            ],
                            "text": "MDC_TIME_SYNC_PROTOCOL: Time synchronization protocol"
                        },
                        "valueCode": [
                            {
                                "coding": [
                                    {
                                        "system": "urn:iso:std:iso:11073:10101",
                                        "code": "532224"
                                    }
                                ],
                                "text": "MDC_TIME_SYNC_NONE: "
                            }
                        ]
                    },
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7",
                                    "code": "68219.0"
                                }
                            ],
                            "text": "mds-time-capab-real-time-clock"
                        },
                        "valueCode": [
                            {
                                "coding": [
                                    {
                                        "system": "http://terminology.hl7.org/CodeSystem/v2-0136",
                                        "code": "Y"
                                    }
                                ],
                                "text": "This field is set"
                            }
                        ]
                    },
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7",
                                    "code": "68219.1"
                                }
                            ],
                            "text": "mds-time-capab-set-clock"
                        },
                        "valueCode": [
                            {
                                "coding": [
                                    {
                                        "system": "http://terminology.hl7.org/CodeSystem/v2-0136",
                                        "code": "Y"
                                    }
                                ],
                                "text": "This field is set"
                            }
                        ]
                    },
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7",
                                    "code": "68219.2"
                                }
                            ],
                            "text": "mds-time-capab-relative-time"
                        },
                        "valueCode": [
                            {
                                "coding": [
                                    {
                                        "system": "http://terminology.hl7.org/CodeSystem/v2-0136",
                                        "code": "Y"
                                    }
                                ],
                                "text": "This field is set"
                            }
                        ]
                    },
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "urn:iso:std:iso:11073:10101",
                                    "code": "68222"
                                }
                            ],
                            "text": "MDC_TIME_RES_ABS: Time resolution"
                        },
                        "valueQuantity": [
                            {
                                "value": 1000000,
                                "system": "http://unitsofmeasure.org",
                                "code": "us"
                            }
                        ]
                    }
                ]
            },
            "request": {
                "method": "PUT",
                "url": "Device/001C050400007825.001C05007825"
            }
        },
        {
            "fullUrl": "urn:oid:3.14159.20181120075654",
            "resource": {
                "resourceType": "Observation",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCoincidentTimeStampObservation"
                    ]
                },
                "status": "final",
                "code": {
                    "coding": [
                        {
                            "system": "urn:iso:std:iso:11073:10101",
                            "code": "67975"
                        }
                    ],
                    "text": "MDC_ATTR_TIME_ABS"
                },
                "effectiveDateTime": "2018-11-20T07:56:54-05:00",
                "valueDateTime": "2018-11-20T08:58:04-05:00"
            },
            "request": {
                "method": "POST",
                "url": "Observation"
            }
        },
        {
            "fullUrl": "urn:oid:1.0.0.1",
            "resource": {
                "resourceType": "Observation",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdNumericObservation"
                    ]
                },
                "extension": [
                    {
                        "url": "http://hl7.org/fhir/StructureDefinition/observation-gatewayDevice",
                        "valueReference": {
                            "reference": "Device/ecde3d4e58532d31.000000000000"
                        }
                    }
                ],
                "identifier": [
                    {
                        "value": "sisansarahId-urn:oid:1.2.3.4.5.6.7.8.10-001C050400007825-150456-20181116212837-95-544-150588"
                    }
                ],
                "status": "final",
                "category": [
                    {
                        "coding": [
                            {
                                "system": "http://terminology.hl7.org/CodeSystem/observation-category",
                                "code": "vital-signs"
                            }
                        ],
                        "text": "Vital Signs"
                    }
                ],
                "code": {
                    "coding": [
                        {
                            "system": "urn:iso:std:iso:11073:10101",
                            "code": "150456"
                        },
                        {
                            "system": "http://loinc.org",
                            "code": "59408-5"
                        }
                    ],
                    "text": "MDC_PULS_OXIM_SAT_O2"
                },
                "subject": {
                    "reference": "Patient/sisansarahId.1.2.3.4.5.6.7.8.10"
                },
                "effectiveDateTime": "2018-11-16T20:27:27-05:00",
                "valueQuantity": {
                    "value": 95,
                    "system": "http://unitsofmeasure.org",
                    "code": "%"
                },
                "device": {
                    "reference": "Device/001C050400007825.001C05007825"
                },
                "derivedFrom": [
                    {
                        "reference": "Observation/urn:oid:3.14159.20181120075654"
                    }
                ],
                "component": [
                    {
                        "code": {
                            "coding": [
                                {
                                    "system": "urn:iso:std:iso:11073:10101",
                                    "code": "68193"
                                }
                            ],
                            "text": "MDC_ATTR_SUPPLEMENTAL_TYPES"
                        },
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "urn:iso:std:iso:11073:10101",
                                    "code": "150588"
                                }
                            ],
                            "text": "MDC_MODALITY_SPOT"
                        }
                    }
                ]
            },
            "request": {
                "method": "POST",
                "url": "Observation",
                "ifNoneExist": "identifier=sisansarahId-urn:oid:1.2.3.4.5.6.7.8.10-001C050400007825-150456-20181116212837-95-544-150588"
            }
        },
        {
            "fullUrl": "urn:oid:1.0.0.2",
            "resource": {
                "resourceType": "Observation",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdNumericObservation"
                    ]
                },
                "extension": [
                    {
                        "url": "http://hl7.org/fhir/StructureDefinition/observation-gatewayDevice",
                        "valueReference": {
                            "reference": "Device/ecde3d4e58532d31.000000000000"
                        }
                    }
                ],
                "identifier": [
                    {
                        "value": "sisansarahId-urn:oid:1.2.3.4.5.6.7.8.10-001C050400007825-149530-20181116212837-52-2720-150588"
                    }
                ],
                "status": "final",
                "category": [
                    {
                        "coding": [
                            {
                                "system": "http://terminology.hl7.org/CodeSystem/observation-category",
                                "code": "vital-signs"
                            }
                        ],
                        "text": "Vital Signs"
                    }
                ],
                "code": {
                    "coding": [
                        {
                            "system": "urn:iso:std:iso:11073:10101",
                            "code": "149530"
                        },
                        {
                            "system": "http://loinc.org",
                            "code": "8867-4"
                        }
                    ],
                    "text": "MDC_PULS_OXIM_PULS_RATE"
                },
                "subject": {
                    "reference": "Patient/sisansarahId.1.2.3.4.5.6.7.8.10"
                },
                "effectiveDateTime": "2018-11-16T20:27:27-05:00",
                "valueQuantity": {
                    "value": 52,
                    "system": "http://unitsofmeasure.org",
                    "code": "{beat}/min"
                },
                "device": {
                    "reference": "Device/001C050400007825.001C05007825"
                },
                "derivedFrom": [
                    {
                        "reference": "Observation/urn:oid:3.14159.20181120075654"
                    }
                ],
                "component": [
                    {
                        "code": {
                            "coding": [
                                {
                                    "system": "urn:iso:std:iso:11073:10101",
                                    "code": "68193"
                                }
                            ],
                            "text": "MDC_ATTR_SUPPLEMENTAL_TYPES"
                        },
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "urn:iso:std:iso:11073:10101",
                                    "code": "150588"
                                }
                            ],
                            "text": "MDC_MODALITY_SPOT"
                        }
                    }
                ]
            },
            "request": {
                "method": "POST",
                "url": "Observation",
                "ifNoneExist": "identifier=sisansarahId-urn:oid:1.2.3.4.5.6.7.8.10-001C050400007825-149530-20181116212837-52-2720-150588"
            }
        },
        {
            "fullUrl": "urn:oid:1.0.0.3",
            "resource": {
                "resourceType": "Observation",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdNumericObservation"
                    ]
                },
                "extension": [
                    {
                        "url": "http://hl7.org/fhir/StructureDefinition/observation-gatewayDevice",
                        "valueReference": {
                            "reference": "Device/ecde3d4e58532d31.000000000000"
                        }
                    }
                ],
                "identifier": [
                    {
                        "value": "sisansarahId-urn:oid:1.2.3.4.5.6.7.8.10-001C050400007825-150456-20181120085653-100-544-150588"
                    }
                ],
                "status": "final",
                "category": [
                    {
                        "coding": [
                            {
                                "system": "http://terminology.hl7.org/CodeSystem/observation-category",
                                "code": "vital-signs"
                            }
                        ],
                        "text": "Vital Signs"
                    }
                ],
                "code": {
                    "coding": [
                        {
                            "system": "urn:iso:std:iso:11073:10101",
                            "code": "150456"
                        },
                        {
                            "system": "http://loinc.org",
                            "code": "59408-5"
                        }
                    ],
                    "text": "MDC_PULS_OXIM_SAT_O2"
                },
                "subject": {
                    "reference": "Patient/sisansarahId.1.2.3.4.5.6.7.8.10"
                },
                "effectiveDateTime": "2018-11-20T07:55:43-05:00",
                "valueQuantity": {
                    "value": 100,
                    "system": "http://unitsofmeasure.org",
                    "code": "%"
                },
                "device": {
                    "reference": "Device/001C050400007825.001C05007825"
                },
                "derivedFrom": [
                    {
                        "reference": "Observation/urn:oid:3.14159.20181120075654"
                    }
                ],
                "component": [
                    {
                        "code": {
                            "coding": [
                                {
                                    "system": "urn:iso:std:iso:11073:10101",
                                    "code": "68193"
                                }
                            ],
                            "text": "MDC_ATTR_SUPPLEMENTAL_TYPES"
                        },
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "urn:iso:std:iso:11073:10101",
                                    "code": "150588"
                                }
                            ],
                            "text": "MDC_MODALITY_SPOT"
                        }
                    }
                ]
            },
            "request": {
                "method": "POST",
                "url": "Observation",
                "ifNoneExist": "identifier=sisansarahId-urn:oid:1.2.3.4.5.6.7.8.10-001C050400007825-150456-20181120085653-100-544-150588"
            }
        },
        {
            "fullUrl": "urn:oid:1.0.0.4",
            "resource": {
                "resourceType": "Observation",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdNumericObservation"
                    ]
                },
                "extension": [
                    {
                        "url": "http://hl7.org/fhir/StructureDefinition/observation-gatewayDevice",
                        "valueReference": {
                            "reference": "Device/ecde3d4e58532d31.000000000000"
                        }
                    }
                ],
                "identifier": [
                    {
                        "value": "sisansarahId-urn:oid:1.2.3.4.5.6.7.8.10-001C050400007825-149530-20181120085653-42-2720-150588"
                    }
                ],
                "status": "final",
                "category": [
                    {
                        "coding": [
                            {
                                "system": "http://terminology.hl7.org/CodeSystem/observation-category",
                                "code": "vital-signs"
                            }
                        ],
                        "text": "Vital Signs"
                    }
                ],
                "code": {
                    "coding": [
                        {
                            "system": "urn:iso:std:iso:11073:10101",
                            "code": "149530"
                        },
                        {
                            "system": "http://loinc.org",
                            "code": "8867-4"
                        }
                    ],
                    "text": "MDC_PULS_OXIM_PULS_RATE"
                },
                "subject": {
                    "reference": "Patient/sisansarahId.1.2.3.4.5.6.7.8.10"
                },
                "effectiveDateTime": "2018-11-20T07:55:43-05:00",
                "valueQuantity": {
                    "value": 42,
                    "system": "http://unitsofmeasure.org",
                    "code": "{beat}/min"
                },
                "device": {
                    "reference": "Device/001C050400007825.001C05007825"
                },
                "derivedFrom": [
                    {
                        "reference": "Observation/urn:oid:3.14159.20181120075654"
                    }
                ],
                "component": [
                    {
                        "code": {
                            "coding": [
                                {
                                    "system": "urn:iso:std:iso:11073:10101",
                                    "code": "68193"
                                }
                            ],
                            "text": "MDC_ATTR_SUPPLEMENTAL_TYPES"
                        },
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "urn:iso:std:iso:11073:10101",
                                    "code": "150588"
                                }
                            ],
                            "text": "MDC_MODALITY_SPOT"
                        }
                    }
                ]
            },
            "request": {
                "method": "POST",
                "url": "Observation",
                "ifNoneExist": "identifier=sisansarahId-urn:oid:1.2.3.4.5.6.7.8.10-001C050400007825-149530-20181120085653-42-2720-150588"
            }
        }
    ]
}
</pre>