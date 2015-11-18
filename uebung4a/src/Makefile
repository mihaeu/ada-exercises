watch:
	while true; do \
		gnatmake main.adb; \
		ifeq ($?,0)
			notify-send Success;
		endif
		./main; \
		inotifywait -qre close_write .; \
	done