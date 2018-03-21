NAME = mkext4fs
SOURCES = make_ext4fs_main.c
SOURCES := $(foreach source, $(SOURCES), ext4_utils/$(source))
CFLAGS += -I/usr/include/android/ -DHOST -DANDROID
LDFLAGS += -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
           -Wl,-rpath-link=. \
	   -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
           -lz -lselinux -lsparse -lext4_utils -lcutils

build: $(SOURCES)
	$(CC) $^ -o ext4_utils/$(NAME) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)

clean:
	$(RM) ext4_utils/$(NAME)

