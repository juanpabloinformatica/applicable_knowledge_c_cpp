ifeq (1,$(shell command -v clang-format &>/dev/null \
	&& pip list \
	| grep -Pi "mbake" &>/dev/null \
	&& echo 1))

format:
	find ${src_dir} -type f -name "*.c" -exec clang-format -i {} ';'
	find ${inc_dir} -type f -name "*.h" -exec clang-format -i {} ';'
	if [[ -d "venv" ]];then \
		source venv/bin/activate; \
	find ${work_dir} -type f -name "*.mk" -print0 \
		| xargs -0 -I {} mbake format {} ; \
		deactivate; \
	fi

endif