default: tests.log

include ../../src/config.inc
include ../../src/common

GOTO_INSTRUMENT_EXE=../../../src/goto-instrument/goto-instrument
CBMC_EXE=../../../src/cbmc/cbmc

ifeq ($(BUILD_ENV_),MSVC)
	GOTO_CC_EXE=../../../src/goto-cc/goto-cl
	is_windows=true
else
	GOTO_CC_EXE=../../../src/goto-cc/goto-cc
	is_windows=false
endif

test:
	@../test.pl -e -p -c "../accelerate.sh $(GOTO_CC_EXE) $(GOTO_INSTRUMENT_EXE) $(CBMC_EXE) $(is_windows)"

tests.log: ../test.pl
	@../test.pl -e -p -c "../accelerate.sh $(GOTO_CC_EXE) $(GOTO_INSTRUMENT_EXE) $(CBMC_EXE) $(is_windows)"

show:
	@for dir in *; do \
		if [ -d "$$dir" ]; then \
			vim -o "$$dir/*.c" "$$dir/*.out"; \
		fi; \
	done;

clean:
	$(RM) tests.log
	$(RM) */main.out
