NAME = mkext4fs
SOURCES = make_ext4fs.c sparse_crc32.c
SOURCES := $(foreach source, $(SOURCES), ext4_utils/$(source))
CFLAGS += -Iext4_utils/include -fpermissive
LDFLAGS += -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
           -Wl,-rpath-link=. \
           -lz -L. -lsparse

build: $(SOURCES)
	$(CXX) $^ -o ext4_utils/$(NAME) $(CFLAGS) $(LDFLAGS)

clean:
	$(RM) ext4_utils/$(NAME)
