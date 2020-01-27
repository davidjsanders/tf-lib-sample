ifndef WORKDIR
  override WORKDIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
endif

ifndef ENVIRONMENT
  override ENVIRONMENT=dev
endif

.PHONY: init taint plan apply destroy

taint:
	@start="`date`"; \
	terraform taint $(EXTRA_ARGS); \
	echo ; \
	echo "Started taint at  : $$start"; \
	echo "Finished taint at : `date`"; \
	echo

init:
	@start="`date`"; \
	terraform init -backend-config=beconf.tfvars ; \
	echo ; \
	echo "Started init at  : $$start"; \
	echo "Finished init at : `date`"; \
	echo

plan:
	@start="`date`"; \
	terraform plan \
		-input=false \
		-out=$(ENVIRONMENT)-run \
		-var-file=$(ENVIRONMENT).tfvars \
		-var-file=credentials.secret\
		${EXTRA_ARGS}; \
	echo ; \
	echo "Started plan at  : $$start"; \
	echo "Finished plan at : `date`"; \
	echo

apply:
	@start="`date`"; \
	terraform apply \
		-input=false \
		$(ENVIRONMENT)-run; \
	echo ; \
	echo "Started apply at  : $$start"; \
	echo "Finished apply at : `date`"; \
	echo

destroy:
	@start="`date`"; \
	terraform destroy \
		-var-file=$(ENVIRONMENT).tfvars \
		-var-file=credentials.secret; \
	echo ; \
	echo "Started destroy at  : $$start"; \
	echo "Finished destroy at : `date`"; \
	echo
