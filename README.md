# Docker: Taskwarrior

This is a customised taskwarrior cli image with plugins pre-installed and configured to my needs. Not really useful for anyone else unless they want to build their own version like mine.

## Usage

This requires that a script be put on the path that will run the image with all the right mount points. Since I use Windows, this will be a `.cmd` file:

```batch
@ECHO OFF

docker run -it ^
	-v "/etc/localtime:/etc/localtime:ro" ^
	-v "%HOME%/.taskrc:/root/.taskrc:rw" ^
	-v "%HOME%/.taskbw:/root/.config/bugwarrior/bugwarriorrc:rw" ^
	-v "%HOME%/.task:/root/.task:rw" ^
	-v "%CD%:/root" ^
	-w "/root" ^
	tzrlk/taskwarrior %*

```

Before actually running the script for the first time, make sure to create the `.taskrc`, `.taskbw`, and `.task` files so docker doesn't mistake them for directories, and make sure the `HOME` environment variable points to your user directory (or alternately, use `%USERPROFILE%` instead).

## Plugins

The plugins are preinstalled with their dependencies, but require some configuration to make sure that the aliases are set up to support them. Run the following commands to enable the various plugin executions:

* [graphdeps][1]: `task config alias.graph execute graphdeps.py`
* [bugwarrior][2]: `task config alias.bugs execute bugwarrior`


[1]: https://gist.github.com/BrianHicks/2769821
[2]: https://bugwarrior.readthedocs.io/en/latest/

## Credit

Thanks to James Netherton for creating the image on which this one is based ([`jamesnetherton/taskwarrior`][0]), and to the Taskwarrior team for making such an awesome task management application.

[0]: https://hub.docker.com/r/jamesnetherton/taskwarrior/

