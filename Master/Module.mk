# svn $Id: Module.mk 1099 2022-01-06 21:01:01Z arango $
#::::::::::::::::::::::::::::::::::::::::::::::::::::: Hernan G. Arango :::
# Copyright (c) 2002-2022 The ROMS/TOMS Group             Kate Hedstrom :::
#   Licensed under a MIT/X style license                                :::
#   See License_ROMS.txt                                                :::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

local_sub  := Master

local_src  := $(wildcard $(local_sub)/*.F)
#local_objs := $(call source-to-object,$(local_src))
local_objs := $(subst .F,.o,$(local_src))
local_objs := $(addprefix $(SCRATCH_DIR)/, $(notdir $(local_objs)))

sources    += $(local_src)

ifdef LD_WINDOWS
$(BIN):	$(libraries) $(local_objs)
	$(LD) $(FFLAGS) $(local_objs) -o $@ $(libraries) $(LIBS_WIN32) $(LDFLAGS)
else
$(BIN):	$(libraries) $(local_objs)
	$(LD) $(FFLAGS) $(LDFLAGS) $(local_objs) -o $@ $(libraries) $(LIBS)
endif

$(eval $(compile-rules))
