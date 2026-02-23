# Functions and routines associated with Enasis Network Orchestrations.

# This file is part of Enasis Network software eco-system. Distribution
# is permitted, for more information consult the project license file.



ENHOMIE_ANSIBLE_PLAYBOOK ?= enasisnetwork.projects.enhomie



.PHONY: enhomie-overview
enhomie-overview: \
	.check-stage .check-limit
	@## Information about the role operations
	@#
	$(call MAKE_PR2NT,\
		<cD>make <cL>enhomie-overview<c0>)
	@#
	@( \
		set -e; \
		[ -f ./orchestro.env ] \
			&& set -a \
			&& . ./orchestro.env \
			&& set +a || true; \
		. $(VENVP)/bin/activate; \
		PYTHONPATH=. \
		ansible-playbook \
			$(ansible_args) \
			--limit="$(limit)" \
			--tags=overview \
			$(ENHOMIE_ANSIBLE_PLAYBOOK); \
		deactivate)



.PHONY: enhomie-install
enhomie-install: \
	.check-stage .check-limit
	@## Install the package in the virtual env
	@#
	$(call MAKE_PR2NT,\
		<cD>make <cL>enhomie-install<c0>)
	@#
	@( \
		set -e; \
		[ -f ./orchestro.env ] \
			&& set -a \
			&& . ./orchestro.env \
			&& set +a || true; \
		. $(VENVP)/bin/activate; \
		ansible_gather="yes" \
		PYTHONPATH=. \
		ansible-playbook \
			$(ansible_args) \
			--limit="$(limit)" \
			--tags=install \
			$(ENHOMIE_ANSIBLE_PLAYBOOK); \
		deactivate)



.PHONY: enhomie-reinstall
enhomie-reinstall: \
	.check-stage .check-limit
	@## Install the package in the virtual env
	@#
	$(call MAKE_PR2NT,\
		<cD>make <cL>enhomie-reinstall<c0>)
	@#
	@( \
		set -e; \
		[ -f ./orchestro.env ] \
			&& set -a \
			&& . ./orchestro.env \
			&& set +a || true; \
		. $(VENVP)/bin/activate; \
		orche_ensured="yes" \
		orche_confirm="yes" \
		ansible_gather="yes" \
		PYTHONPATH=. \
		ansible-playbook \
			$(ansible_args) \
			--limit="$(limit)" \
			--tags=reinstall \
			$(ENHOMIE_ANSIBLE_PLAYBOOK); \
		deactivate)



.PHONY: enhomie-configure
enhomie-configure: \
	.check-stage .check-limit
	@## Template the service configuration file
	@#
	$(call MAKE_PR2NT,\
		<cD>make <cL>enhomie-configure<c0>)
	@#
	@( \
		set -e; \
		[ -f ./orchestro.env ] \
			&& set -a \
			&& . ./orchestro.env \
			&& set +a || true; \
		. $(VENVP)/bin/activate; \
		ansible_gather="yes" \
		PYTHONPATH=. \
		ansible-playbook \
			$(ansible_args) \
			--limit="$(limit)" \
			--tags=configure \
			$(ENHOMIE_ANSIBLE_PLAYBOOK); \
		deactivate)



.PHONY: enhomie-state
enhomie-state: \
	.check-stage .check-limit
	@## Control the state of package service
	@#
ifndef state
	$(error state not defined)
endif
	@#
	$(call MAKE_PR2NT,\
		<cD>make <cL>enhomie-state<c0>)
	@#
	@( \
		set -e; \
		[ -f ./orchestro.env ] \
			&& set -a \
			&& . ./orchestro.env \
			&& set +a || true; \
		. $(VENVP)/bin/activate; \
		ansible_gather="yes" \
		PYTHONPATH=. \
		ansible-playbook \
			$(ansible_args) \
			--limit="$(limit)" \
			--tags="state-$(state)" \
			$(ENHOMIE_ANSIBLE_PLAYBOOK); \
		deactivate)
