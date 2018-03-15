NAME = mkext4fs
SOURCES = make_ext4fs.c sparse_crc32.c
SOURCES := $(foreach source, $(SOURCES), libsparse/$(source))
CFLAGS += -Ilibsparse/include -fpermissive
LDFLAGS += -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
           -Wl,-rpath-link=. \
           -lz -L. -lsparse

build: $(SOURCES)
	$(CXX) $^ -o libsparse/$(NAME) $(CFLAGS) $(LDFLAGS)

clean:
	$(RM) libsparse/$(NAME)
