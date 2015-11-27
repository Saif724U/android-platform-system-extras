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
CFLAGS += -fPIC
CPPFLAGS += -include android/arch/AndroidConfig.h -I/usr/include/android
LDFLAGS += -shared -Wl,-soname,$(NAME).so.0 -Wl,-rpath=/usr/lib/android \
           -L/usr/lib/android -lsparse -lselinux

build: $(SOURCES)
	$(CC) $^ -o $(NAME).so.$(ANDROID_LIBVERSION) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)
	ln -s $(NAME).so.$(ANDROID_LIBVERSION) $(NAME).so
	ln -s $(NAME).so.$(ANDROID_LIBVERSION) $(NAME).so.0

clean:
	$(RM) $(NAME).so*