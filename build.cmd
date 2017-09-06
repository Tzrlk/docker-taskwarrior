@ECHO OFF

docker build ^
	--build-arg HTTP_PROXY=%http_proxy% ^
	--build-arg HTTPS_PROXY=%https_proxy% ^
	--build-arg NO_PROXY=%no_proxy% ^
	--tag tzrlk/taskwarrior:latest ^
	.

