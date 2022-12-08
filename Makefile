DOCS=	draft-shahzad-scim-device-model.txt \
	draft-shahzad-scim-device-model.xml \
	draft-shahzad-scim-device-model.html

all: $(DOCS)

%.xml:	%.mkd extensions/README.md SCIM_device_core_schema_representation.json \
	extensions/SCIM_BLE_extension_schema.json \
	extensions/SCIM_DPP_extension_schema.json \
	extensions/SCIM_endpoint_extension_schema.json \
	extensions/SCIM_zigbee_extension_schema.json \
	SCIM_resource_type.json \
	examples/README.md examples/SCIM_device_core_schema_object.json \
	examples/SCIM_device_ble_object.json \
	examples/SCIM_device_dpp_object.json \
	examples/SCIM_device_zigbee_object.json \
	examples/SCIM_device_endpoints_with_ble_object.json \
	draft-shahzad-scim-device-model.mkd
	kramdown-rfc2629 -3 $< > $@
%.html %.txt:	%.xml
	xml2rfc --html $<
	xml2rfc --text $<


