# Description
Provides installation and configuration tasks for project service.

# Using this role with tags
- `overview` Information about the role operations
- `install` Install the package in the virtual env
- `reinstall` Install the package in the virtual env
- `configure` Template the service configuration file
- `state-started` Control the state of package service
- `state-restarted` Control the state of package service
- `state-stopped` Control the state of package service

# Example with role and tags
```yaml
- hosts: ...
  tasks:

    - name: Information about the role operations
      import_role:
        name: enasisnetwork.projects.enrobie
      tags: overview

    - name: Install the package in the virtual env
      import_role:
        name: enasisnetwork.projects.enrobie
      tags: install
```

# Example from command line
*Information about the role operations*
```
ansible-playbook \
  ...
  --tags "overview" \
  enasisnetwork.projects.enrobie
```

## Variables for Ansible inventory
- `enrobie_unique` Unique name for the deployment
- `enrobie_directory` Base directory for the package
- `enrobie_user` Local system user for deployment
- `enrobie_group` Local system group for deployment
- `enrobie_python` Python for creating virtual env
- `enrobie_package` Installation package or path
- `enrobie_version` Which version instead of latest
- `enrobie_repo_path` Clone configuration repository
- `enrobie_repo_version` Clone configuration repository
- `enrobie_config` Clone configuration repository
- `enrobie_logging` Enable logging to the log file
- `enrobie_console` Enable logging to the console
- `enrobie_autostart` Automatic startup with system
- `enrobie_elevate` Whether to elevate privileges

Check out the parameter model on
[GitHub](https://github.com/enasisnetwork/ansible-projects/blob/main/collection/plugins/action/enrobie/params.py)
for more information.
