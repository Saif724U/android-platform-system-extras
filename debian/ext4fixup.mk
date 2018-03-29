NAME = ext4fixup
SOURCES = ext4fixup_main.c
SOURCES := $(foreach source, $(SOURCES), ext4_utils/$(source)) 
<<<<<<< HEAD
CFLAGS +=  -Iext4_utils
=======
>>>>>>> c7c28b456e5098011d401a171273883a90471d0c
LDFLAGS += -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
	   -Wl,-rpath-link=. \
           -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
           -lz -lsparse -lext4_utils

build: $(SOURCES)
<<<<<<< HEAD
	$(CC) $^ -o ext4_utils/$(NAME) $(CFLAGS) $(LDFLAGS)
=======
	$(CC) $^ -o ext4_utils/$(NAME) $(CPPFLAGS) $(LDFLAGS)
>>>>>>> c7c28b456e5098011d401a171273883a90471d0c

clean:
	$(RM) ext4_utils/$(NAME)

