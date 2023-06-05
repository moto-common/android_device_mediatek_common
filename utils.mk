define check-property
$(if $(findstring $(1),$(PRODUCT_PROPERTY_OVERRIDES)),,\
    $(warning $(1) is unset!)
)
endef
