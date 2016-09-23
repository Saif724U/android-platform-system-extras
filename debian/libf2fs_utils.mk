NAME = libf2fs_utils
SOURCES = f2fs_utils.c f2fs_ioutils.c f2fs_dlutils.c make_f2fs_main.c
SOURCES := $(foreach source, $(SOURCES), f2fs_utils/$(source))
CPPFLAGS += -I/usr/include/f2fs-tools -include stddef.h
LDFLAGS += -shared -Wl,-soname,$(NAME).so.0 \
           -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
           -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
           -lsparse -ldl

build: $(SOURCES)
	$(CC) $^ -o $(NAME).so.0 $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)
	ln -s $(NAME).so.0 $(NAME).so

clean:
	$(RM) $(NAME).so*