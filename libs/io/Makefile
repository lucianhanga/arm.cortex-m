objdir = obj
bindir = ../bin
libdir = ../lib

library	 = lh-io.a
sources	 = print-array.s

# listings = $(sources:.s=.lst)
# objects  = $(sources:.s=.o)
objects  := $(patsubst %.s,$(objdir)/%.o,$(sources))
listings := $(patsubst %.s,$(objdir)/%.lst,$(sources))


all:	$(library)
		@echo "build the library $<"

$(library):	$(objects)
		mkdir -p $(libdir)
		@echo "building the library $@ from $(objects)"
		ar rcs $(libdir)/$@ $<

$(objdir)/%.o:	%.s
		mkdir -p $(objdir)
		@echo "build the dependency: $@ ..."
		as -a=$(@:.o=.lst) -o $@ $<

clean:
		@echo "cleaning up ..."
		rm -rf $(objdir) $(libdir)/$(library)




