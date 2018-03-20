NAME = ext2simg
SOURCES = ext2simg.c
SOURCES := $(foreach source, $(SOURCES), ext4_utils/$(source))
CFLAGS +=  -Iext4_utils
LDFLAGS += -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
           -Wl,-rpath-link=. \
           -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
           -lz -lsparse -lselinux -lext4_utils

build: $(SOURCES)
	$(CC) $^ -o ext4_utils/$(NAME) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)

clean:
	$(RM) ext4_utils/$(NAME)


