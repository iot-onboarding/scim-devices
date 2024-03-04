DOCS=	draft-ietf-scim-device-model.txt \
	draft-ietf-scim-device-model.xml \
	draft-ietf-scim-device-model.html

FTXT= extensions/SCIM_BLE_extension_schema.ftxt \
	extensions/SCIM_DPP_extension_schema.ftxt \
	extensions/SCIM_endpoint_extension_schema.ftxt \
	extensions/SCIM_zigbee_extension_schema.ftxt \
	extensions/SCIM_mab_extension_schema.ftxt \
	extensions/SCIM_fdo_extension_schema.ftxt \
	SCIM_resource_type.ftxt \
	examples/README.md examples/SCIM_device_core_schema_object.ftxt \
	examples/SCIM_device_ble_object_v1.ftxt \
	examples/SCIM_device_ble_object_v2.ftxt \
	examples/SCIM_device_ble_object_v3.ftxt \
	examples/SCIM_device_dpp_object.ftxt \
	examples/SCIM_device_mab_object.ftxt \
	examples/SCIM_device_fdo_object.ftxt \
	examples/SCIM_device_zigbee_object.ftxt \
	SCIM_device_core_schema_representation.ftxt \
	examples/SCIM_device_endpoints_with_ble_object.ftxt \
	examples/SCIM_endpointapp_schema_object.ftxt \
	SCIM_endpointApp_schema_representation.ftxt


JSON= 	extensions/SCIM_BLE_extension_schema.json \
	extensions/SCIM_DPP_extension_schema.json \
	extensions/SCIM_endpoint_extension_schema.json \
	extensions/SCIM_mab_extension_schema.json \
	extensions/SCIM_fdo_extension_schema.json \
	extensions/SCIM_zigbee_extension_schema.json \
	SCIM_resource_type.json \
	examples/SCIM_device_core_schema_object.json \
	examples/SCIM_device_ble_object_v1.json \
	examples/SCIM_device_ble_object_v2.json \
	examples/SCIM_device_ble_object_v3.json \
	examples/SCIM_device_dpp_object.json \
	examples/SCIM_device_mab_object.json \
	examples/SCIM_device_fdo_object.json \
	examples/SCIM_device_zigbee_object.json \
	examples/SCIM_device_endpoints_with_ble_object.json \
	examples/SCIM_endpointapp_schema_object.json \
	SCIM_endpointApp_schema_representation.json



YAML=	openapi/SCIM_BLE_extension_schema.yml \
	openapi/SCIM_DPP_extension_schema.yml \
	openapi/SCIM_endpoint_extension_schema.yml \
	openapi/SCIM_MAB_extension_schema.yml \
	openapi/SCIM_FDO_extension_schema.yml \
	openapi/SCIM_zigbee_extension_schema.yml \
	openapi/device_schema.yml \
	openapi/endpointapp_schema.yml

FYAML=	openapi/SCIM_BLE_extension_schema.fyml \
	openapi/SCIM_DPP_extension_schema.fyml \
	openapi/SCIM_endpoint_extension_schema.fyml \
	openapi/SCIM_MAB_extension_schema.fyml \
	openapi/SCIM_FDO_extension_schema.fyml \
	openapi/SCIM_zigbee_extension_schema.fyml \
	openapi/device_schema.fyml \
	openapi/endpointapp_schema.fyml


all: $(DOCS)

%.xml:	%.mkd extensions/README.md $(FTXT) $(FYAML) \
	draft-ietf-scim-device-model.mkd
	kramdown-rfc2629 -3 $< > $@
%.html %.txt:	%.xml
	xml2rfc --html $<
	xml2rfc --text $<

%.ftxt: %.json $(JSON)
	@python3 fold.py < $< > $@

%.fyml: %.yml $(YAML)
	@python3 fold.py < $< > $@
