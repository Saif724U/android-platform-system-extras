NAME = mkext4fs
SOURCES = make_ext4fs.c
SOURCES := $(foreach source, $(SOURCES), ext4_utils/$(source))
CFLAGS += -fno-strict-aliasing 
LDFLAGS += -shared -Wl,-soname,$(NAME).so.0 \
           -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
           -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
           -lsparse -lselinux

build: $(SOURCES)
	$(CC) $^ -o ext4_utils/$(NAME) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)

clean:
	$(RM) ext4_utils/$(NAME)

