# Functions and routines associated with Enasis Network Orchestrations.

# This file is part of Enasis Network software eco-system. Distribution
# is permitted, for more information consult the project license file.



.PHONY: enrobie-overview
enrobie-overview: \
	.check-stage .check-limit
	@## Information about the role operations
	@#
	$(call MAKE_PR2NT,\
		<cD>make <cL>enrobie-overview<c0>)
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
			enasisnetwork.projects.enrobie; \
		deactivate)



.PHONY: enrobie-install
enrobie-install: \
	.check-stage .check-limit
	@## Install the package in the virtual env
	@#
	$(call MAKE_PR2NT,\
		<cD>make <cL>enrobie-install<c0>)
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
			enasisnetwork.projects.enrobie; \
		deactivate)



.PHONY: enrobie-reinstall
enrobie-reinstall: \
	.check-stage .check-limit
	@## Install the package in the virtual env
	@#
	$(call MAKE_PR2NT,\
		<cD>make <cL>enrobie-reinstall<c0>)
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
			enasisnetwork.projects.enrobie; \
		deactivate)



.PHONY: enrobie-configure
enrobie-configure: \
	.check-stage .check-limit
	@## Template the service configuration file
	@#
	$(call MAKE_PR2NT,\
		<cD>make <cL>enrobie-configure<c0>)
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
			enasisnetwork.projects.enrobie; \
		deactivate)



.PHONY: enrobie-state
enrobie-state: \
	.check-stage .check-limit
	@## Control the state of package service
	@#
ifndef state
	$(error state not defined)
endif
	@#
	$(call MAKE_PR2NT,\
		<cD>make <cL>enrobie-state<c0>)
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
			enasisnetwork.projects.enrobie; \
		deactivate)
