
DOCS=	draft-shahzad-scim-device-model.txt \
	draft-shahzad-scim-device-model.xml \
	draft-shahzad-scim-device-model.html

all: $(DOCS)

%.xml:	%.mkd extensions/README.md extensions/SCIM_BLE_extension_schema.json \
	extensions/SCIM_DPP_extension_schema.json SCIM_device_core_schema.json \
	extensions/SCIM_endpoint_extension_schema.json \
	extensions/SCIM_zigbee_extension_schema.json \
	draft-shahzad-scim-device-model.mkd
	kramdown-rfc2629 -3 $< > $@
%.html %.txt:	%.xml
	xml2rfc --html $<
	xml2rfc --text $<



