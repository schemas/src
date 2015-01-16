SCHEMAS = twitter/status twitter/user

all: $(SCHEMAS:%=schemas.github.io/%)

schemas.github.io:
	git clone git@github.com:schemas/schemas.github.io.git

schemas.github.io/%: %.yaml | schemas.github.io
	yaml2json <$< | jq . > $@
