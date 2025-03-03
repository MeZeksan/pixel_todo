DART = dart

format:
	$(DART) run import_sorter:main
	$(DART) format . --line-length 120 --fix;