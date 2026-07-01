include config.mk

all: $(target)

BOLD  = \033[1m
DIM   = \033[2m
CYAN  = \033[1;36m
GREEN = \033[1;32m
ORANGE = \033[38;5;208m
BLUE    = \033[1;34m
RESET = \033[0m

define compile_c
	@t=$$(date +%s%N); \
	printf "$(GREEN)%-7s$(RESET) $(BOLD)%-25s$(RESET) %-25s" \
		"$(CC)" "$<" "$@"; \
	$(CC) $(1) -c $< -o $@; \
	rc=$$?; \
	ms=$$((($$(date +%s%N)-t)/1000000)); \
	[ $$rc -eq 0 ] && printf " $(CYAN)%5dms$(RESET)\n" $$ms || exit $$rc
endef

define link
	@t=$$(date +%s%N); \
	printf "$(MAGENTA)%-7s$(RESET) $(BOLD)%-35s$(RESET)" \
		"LINK" "$@"; \
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^; \
	rc=$$?; \
	ms=$$((($$(date +%s%N)-t)/1000000)); \
	[ $$rc -eq 0 ] && printf " $(CYAN)%5dms$(RESET)\n" $$ms || exit $$rc
endef

$(target): $(objs)
	@mkdir -p $(@D)
	$(call link)

$(dep_dir)/%.d: %.c
	@mkdir -p $(@D); \
		rm -f $@; \
		$(CC) $(CFLAGS) -E -MM -MP -MF $@__ $<; \
		sed 's,\($(basename $(<F))\)\.o[ :]*,$(obj_dir)/$(<D)/\1.o $@: ,g' $@__ > $@; \
		rm -f $@__

$(obj_dir)/%.o: %.c
	@mkdir -p $(@D)
	$(call compile_c,$(CFLAGS))

clean:
	rm -rf $(dep_dir)/*
	rm -rf $(obj_dir)/*
	rm -f $(target)

install: $(target)
	cp -f $(target) $(APP)

uninstall:
	rm -f $(APP)/$(target)

.PHONY: all clean install uninstall

include $(deps)
