.PHONY: reinstall
.PHONY: test
.PHONY: tests

reinstall:
	./scripts/reinstall.sh

test:
	./scripts/test.sh

tests:
	make test
