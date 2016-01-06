NAME = libf2fs_utils
SOURCES = f2fs_utils.c f2fs_ioutils.c f2fs_dlutils.c make_f2fs_main.c
SOURCES := $(foreach source, $(SOURCES), f2fs_utils/$(source))
CFLAGS += -fPIC
CPPFLAGS += -include android/arch/AndroidConfig.h \
            -I/usr/include/android \
            -I/usr/include/f2fs-tools \
            -include stddef.h
LDFLAGS += -shared -Wl,-soname,$(NAME).so.0 -Wl,-rpath=/usr/lib/android \
           -ldl -lf2fs -lf2fs_format -L/usr/lib/android -lsparse

build: $(SOURCES)
	$(CC) $^ -o $(NAME).so.$(ANDROID_LIBVERSION) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)
	ln -s $(NAME).so.$(ANDROID_LIBVERSION) $(NAME).so
	ln -s $(NAME).so.$(ANDROID_LIBVERSION) $(NAME).so.0

clean:
	$(RM) $(NAME).so*