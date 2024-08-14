This example is a full transaction bundle where the Patient and Device resources are using a conditional create transaction. In this manner the PHG specifies a temporary id and uses that temporary id in the bundle where it needs to without waiting for a server response. The PHG also needs to specify a sufficiently selective criterion identifying those resources that only one or none should be found on the server. When a server response is obtained, the actual logical ids can be used in Observations. Subsequent bundles can be sent without the Patient and Device resources since they have already been uploaded and can be referenced by their ids.

Fixme: The udiCarrier element present in the example was constructed from information sent by the device to illustrate what a UDI might look like; an actual UDI was not sent by protocol from the device. 