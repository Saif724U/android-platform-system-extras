NAME = libext4_utils
SOURCES = make_ext4fs.c \
          ext4fixup.c \
          ext4_utils.c \
          allocate.c \
          contents.c \
          extent.c \
          indirect.c \
          sha1.c \
          wipe.c \
          crc16.c \
          ext4_sb.c
SOURCES := $(foreach source, $(SOURCES), ext4_utils/$(source))
CFLAGS += -fno-strict-aliasing 
LDFLAGS += -shared -Wl,-soname,$(NAME).so.0 \
           -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
           -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
           -lsparse -lselinux

build: $(SOURCES)
	$(CC) $^ -o $(NAME).so.0 $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)
	ln -s $(NAME).so.0 $(NAME).so

clean:
	$(RM) $(NAME).so*