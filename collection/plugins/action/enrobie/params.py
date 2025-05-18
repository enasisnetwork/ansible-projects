"""
Functions and routines associated with Enasis Network Orchestrations.

This file is part of Enasis Network software eco-system. Distribution
is permitted, for more information consult the project license file.
"""



# NOTE Do not forget about params.yml



from typing import Annotated
from typing import Optional

from ansible.plugins.action import ActionBase  # type: ignore

from encommon.types import BaseModel
from encommon.types import DictStrAny
from encommon.types import sort_dict

from pydantic import Field



class RoleParams(BaseModel, extra='forbid'):
    """
    Process and validate the Orche configuration parameters.
    """

    unique: Annotated[
        str,
        Field(...,
              description='Unique name for the deployment',
              min_length=1)]

    directory: Annotated[
        str,
        Field(...,
              description='Base directory for the package',
              min_length=1)]

    user: Annotated[
        str,
        Field(...,
              description='Local system user for deployment',
              min_length=1)]

    group: Annotated[
        str,
        Field(...,
              description='Local system group for deployment',
              min_length=1)]

    python: Annotated[
        str,
        Field(...,
              description='Python for creating virtual env',
              min_length=1)]

    package: Annotated[
        str,
        Field(...,
              description='Installation package or path',
              min_length=1)]

    version: Annotated[
        Optional[str],
        Field(None,
              description='Which version instead of latest',
              min_length=1)]

    repo_path: Annotated[
        Optional[str],
        Field(None,
              description='Clone configuration repository',
              min_length=1)]

    repo_version: Annotated[
        Optional[str],
        Field(None,
              description='Clone configuration repository',
              min_length=1)]

    config: Annotated[
        Optional[DictStrAny],
        Field(None,
              description='Clone configuration repository',
              min_length=1)]

    logging: Annotated[
        bool,
        Field(...,
              description='Enable logging to the log file')]

    console: Annotated[
        bool,
        Field(...,
              description='Enable logging to the console')]

    autostart: Annotated[
        bool,
        Field(...,
              description='Automatic startup with system')]

    elevate: Annotated[
        bool,
        Field(...,
              description='Whether to elevate privileges')]



class ActionModule(ActionBase):  # type: ignore
    """
    Perform whatever operation is associated with the file.
    """


    def run(
        # NOCVR
        self,
        tmp: Optional[str] = None,
        task_vars: Optional[DictStrAny] = None,
    ) -> DictStrAny:
        """
        Perform whatever operation is associated with the file.

        :param tmp: Placeholder for since deprecated parameter.
        :param task_vars: Variables associated around this task.
        :returns: Dictionary of results for the module process.
        """

        result: DictStrAny = {
            'params': None,
            'changed': False}

        args = self._task.args

        assert task_vars is not None

        prefix = args['prefix']
        source = task_vars

        source = {
            k[len(prefix):]: v
            for k, v in source.items()
            if k.startswith(prefix)
            and v not in [None, '']}


        try:

            params = (
                RoleParams(**source)
                .endumped)

            result['params'] = (
                sort_dict(params))


        except Exception as reason:
            result |= {
                'failed': True,
                'exception': reason}


        return sort_dict(result)
