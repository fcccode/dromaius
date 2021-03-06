CXX = g++ --std=c++11
CFLAGS =-g -O0 -I libs/imgui -I libs/gl3w `sdl2-config --cflags`
LDFLAGS =`sdl2-config --libs` -lm -lGL -ldl

SOURCES = audio.cc cpu.cc graphics.cc input.cc main.cc memory.cc imgui_impl_sdl_gl3.cc
LIBSOURCES = libs/imgui/imgui.cpp libs/imgui/imgui_demo.cpp
LIBSOURCES += libs/imgui/imgui_draw.cpp libs/gl3w/GL/gl3w.c


.PHONY: all
all: gbemu

gbemu: $(subst .cc,.o,$(SOURCES))
	$(CXX) $^ $(LIBSOURCES) -o $@ $(CFLAGS) $(LDFLAGS)

%.o: src/%.cc
	$(CXX) -c $< $(CFLAGS)

clean:
	rm *.o gbemu