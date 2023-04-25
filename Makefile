include ./config.mak

default_target: all
.PHONY : default_target


SHAREDLIB = libc_common.so
STATICLIB = libc_common.a



OBJS = $(patsubst %.c,%.o,$(ARCH_SRCS)) $(patsubst %.c,%.o,$(COMMON_SRCS)) $(patsubst %.c,%.o,$(AVX2_SRCS))



$(SHAREDLIB): $(OBJS)
ifneq ($(STATIC),y)
	$(CC) $(CFLAGS) -v $^ -o $@ $(LDFLAGS)
endif

$(STATICLIB): $(OBJS)
	$(AR) $(ARFLAGS) $@ $(OBJS)
	-@ ($(RANLIB) $@ || true) >/dev/null 2>&1


# STATICLIB: $(OBJS)
# 	$(AR) $(ARFLAGS) $@ $(OBJS)
# 	-@ ($(RANLIB) $@ || true) >/dev/null 2>&1

all: $(SHAREDLIB) $(STATICLIB)

.PHONY : clean
clean:
	$(shell find ./ -name "*.o" -type f -delete)
	$(shell find ./ -name "*.so" -type f -delete)
	$(shell find ./ -name "*.a" -type f -delete)
	@echo "clean finished."