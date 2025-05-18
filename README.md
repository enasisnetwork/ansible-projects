# Enasis Network Ansible Projects Collection

> :warning: This project has not released its first major version.

Project for executing the Ansible playbooks for system automation.

## Playbooks and roles within project
- `enhomie` Deploy and update [Homie Automate](https://github.com/enasisnetwork/enhomie).
- `enrobie` Deploy and update [Chatting Robie](https://github.com/enasisnetwork/enrobie).

## Variables for Ansible inventory

### Homie Automate
Validation using [this model](collection/plugins/action/enhomie/params.py)
after [Ansible Jinja2 parsing](collection/roles/enhomie/tasks/params.yml).
- `enhomie_unique`
- `enhomie_directory`
- `enhomie_user`
- `enhomie_group`
- `enhomie_python`
- `enhomie_package`
- `enhomie_version`
- `enhomie_repo_path`
- `enhomie_repo_version`
- `enhomie_config`
- `enhomie_logging`
- `enhomie_console`
- `enhomie_autostart`
- `enhomie_elevate`

### Chatting Robie
Validation using [this model](collection/plugins/action/enrobie/params.py)
after [Ansible Jinja2 parsing](collection/roles/enrobie/tasks/params.yml).
- `enrobie_unique`
- `enrobie_directory`
- `enrobie_user`
- `enrobie_group`
- `enrobie_python`
- `enrobie_package`
- `enrobie_version`
- `enrobie_repo_path`
- `enrobie_repo_version`
- `enrobie_config`
- `enrobie_logging`
- `enrobie_console`
- `enrobie_autostart`
- `enrobie_elevate`

## Quick start for local development
Start by cloning the repository to your local machine.
```
git clone https://github.com/enasisnetwork/ansible-projects.git
```
Set up the Python virtual environments expected by the Makefile.
```
make -s venv-create
```

### Execute the linters and tests
The comprehensive approach is to use the `check` recipe. This will stop on
any failure that is encountered.
```
make -s check
```
However you can run the linters in a non-blocking mode.
```
make -s linters-pass
```

## Version management
> :warning: Ensure that no changes are pending.

1. Rebuild the environment.
   ```
   make -s check-revenv
   ```

1. Update the [galaxy.yml](galaxy.yml) file.

1. Push to the `main` branch.

1. Create [repository](https://github.com/enasisnetwork/ansible-projects) release.

1. Build the Galaxy package.<br>Be sure no uncommited files in tree.
   ```
   make -s galaxy-build
   ```

1. Upload Galaxy package to Ansible servers.
   ```
   make -s galaxy-upload
   ```
