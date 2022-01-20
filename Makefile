SHARED_LIB=libvcv.so
LIB_A=out/libvcv.a
LIBTOOL=libtool
STATIC=-static
LIBCFLAGS_TARGET=-mmacosx-version-min=10.9
CWD=$(shell pwd)

OS ?= $(shell uname -s)
ARCH ?= $(shell uname -m)

ifeq ($(origin CXX), default)
  CXX = c++
endif

# COMMON_FLAGS = -pthread -fPIE -fno-unwind-tables -fno-asynchronous-unwind-tables
COMMON_FLAGS = -pthread

CFLAGS ?= -O2
CFLAGS += $(COMMON_FLAGS) $(EXTRA_CFLAGS)

CXXFLAGS ?= -O2
CXXFLAGS += $(COMMON_FLAGS) $(EXTRA_CXXFLAGS) -std=c++20
CPPFLAGS += -DLIBDIR="\"$(LIBDIR)\""
# LIBS = -pthread
# LIBS = -pthread -lz -ldl -lm

SRCS=$(wildcard *.cpp elf/*.cpp macho/*.cpp)
HEADERS=$(wildcard *.h elf/*.h macho/*.h)
OBJS=$(SRCS:%.cpp=out/%.o)
CVOPT=$(shell pkg-config --cflags --libs opencv4)

$(LIB_A): $(OBJS)
	$(LIBTOOL) $(STATIC) -o $@ $(OBJS)

# out/%.o: %.cc $(HEADERS) Makefile out/elf/.keep out/macho/.keep
out/%.o: %.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS) $(EXTRA_LDFLAGS) $(LIBS) -fPIC -I/usr/local/include/opencv4 -c -o $@ $<
# $(CXX) $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS) $(EXTRA_LDFLAGS) $(OBJS) -o $@ $(LIBS)
# c++-11 -shared -fPIC -o libcpp_lib.so 
# $(CXX) $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS) $(EXTRA_LDFLAGS) -o $@ -shared -fPIC -L/usr/local/lib -I/usr/local/include/opencv4 -lopencv_core -lopencv_imgproc -lopencv_imgcodecs -lopencv_highgui $(LIBS) $(OBJS)
$(SHARED_LIB): $(OBJS)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS) $(EXTRA_LDFLAGS) -o $@ -shared -fPIC -install_name $(CWD)/$@ -current_version0.1.1 -compatibility_version0.1.0 $(CVOPT) $(LIBS) $(OBJS)

clean:
	-rm $(OBJS) libvcv.so

example.prepare:
	cd examples/ && ln -s ../ cv

example.clean:
	rm examples/cv

# install:
# 	echo $(CWD)
# 	# install -m 644 $(SHARED_LIB) $(CWD)
# 	install_name_tool -id "$(CWD)/$(SHARED_LIB)" $(SHARED_LIB)
