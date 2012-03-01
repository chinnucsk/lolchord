.PHONY: test compile
compile:
	@erlc -o ebin src/*.erl
shell: compile
	@erl -pa ebin
test:
	@mkdir -p .eunit
	@erlc -o .eunit src/*.erl test/*.erl
	@erl -pa .eunit -eval 'eunit:test(lolchord_math, [verbose]).' -eval 'init:stop().' -noshell