NAME = make_ext4fs
SOURCES = make_ext4fs_main.c
SOURCES := $(foreach source, $(SOURCES), ext4_utils/$(source))
CFLAGS +=  -I -DREAL_UUID
LDFLAGS += -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
	   -Wl,-rpath-link=. \
           -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
           -lz -lselinux -lext4_utils -lext2_uuid -lcutils 

build: $(SOURCES)
	$(CXX) $^ -o ext4_utils/$(NAME) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)

clean:
	$(RM) ext4_utils/$(NAME)

