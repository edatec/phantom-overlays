# Overlays for the Amlogic meson platform

DTC = dtc
SOURCE = $(wildcard *.dts)
DTBOS = $(patsubst %-overlay.dts,%.dtbo,$(SOURCE))
	
all: main
main: ${DTBOS}

%.dtbo: %-overlay.dts
	$(DTC) -@ -I dts -O dtb -o $@ $<

PHONY += clean
clean:
	rm -f *.dtbo