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
        name: enasisnetwork.projects.enhomie
      tags: overview

    - name: Install the package in the virtual env
      import_role:
        name: enasisnetwork.projects.enhomie
      tags: install
```

# Example from command line
*Information about the role operations*
```
ansible-playbook \
  ...
  --tags "overview" \
  enasisnetwork.projects.enhomie
```

## Variables for Ansible inventory
- `enhomie_unique` Unique name for the deployment
- `enhomie_directory` Base directory for the package
- `enhomie_user` Local system user for deployment
- `enhomie_group` Local system group for deployment
- `enhomie_python` Python for creating virtual env
- `enhomie_package` Installation package or path
- `enhomie_version` Which version instead of latest
- `enhomie_repo_path` Clone configuration repository
- `enhomie_repo_version` Clone configuration repository
- `enhomie_config` Clone configuration repository
- `enhomie_logging` Enable logging to the log file
- `enhomie_console` Enable logging to the console
- `enhomie_autostart` Automatic startup with system
- `enhomie_elevate` Whether to elevate privileges

Check out the parameter model on
[GitHub](https://github.com/enasisnetwork/ansible-projects/blob/main/collection/plugins/action/enhomie/params.py)
for more information.
