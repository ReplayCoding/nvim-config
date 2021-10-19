src_files = $(shell find fnl/ -type f)
out_files = $(src_files:fnl/%.fnl=lua/%.lua)

compile: $(out_files)

lua/%.lua: fnl/%.fnl lua/
	mkdir -p "$(@D)"
	fennel --compile $< > $@

lua/:
	mkdir -p lua

clean:
	rm -rf lua

.PHONY: clean compile
