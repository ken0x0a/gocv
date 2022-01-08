SHARED_LIB=libvcv.so

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

# out/%.o: %.cc $(HEADERS) Makefile out/elf/.keep out/macho/.keep
out/%.o: %.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS) $(EXTRA_LDFLAGS) $(LIBS) -fPIC -I/usr/local/include/opencv4 -c -o $@ $<
# $(CXX) $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS) $(EXTRA_LDFLAGS) $(OBJS) -o $@ $(LIBS)
# c++-11 -shared -fPIC -o libcpp_lib.so 
# $(CXX) $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS) $(EXTRA_LDFLAGS) -o $@ -shared -fPIC -L/usr/local/lib -I/usr/local/include/opencv4 -lopencv_core -lopencv_imgproc -lopencv_imgcodecs -lopencv_highgui $(LIBS) $(OBJS)
$(SHARED_LIB): $(OBJS)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS) $(EXTRA_LDFLAGS) -o $@ -shared -fPIC $(CVOPT) $(LIBS) $(OBJS)

clean:
	-rm $(OBJS) libvcv.so
