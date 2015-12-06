# Dockerfiles
This is a repository for all my Dockerfiles used to build my own Docker images

You can find specific details for each of the Docker files in each of the directories of this repository.

# Docker Hub
My images are available on Docker Hub [here](https://hub.docker.com/u/ryantheallmighty/).

# Warnings and General Notices
These images are based mostly off their Docker Hub official image Dockerfiles with some tweaks here and there to suit my own setup.

While I do use these images, I don't recommend using them for anything production worthy simply due to the fact that the official images will probably work better for that.

# Build Arguments
Pretty much all of my Dockerfiles are meant to take in build arguments (available since Docker 1.9) and as such may or may not build on older versions of Docker.

There is only 1 build argument which can be passed to most build processes using the [--build-arg](http://docs.docker.com/engine/reference/builder/#arg) argument:

VERSION: This will set the version of the software to build.

Any extra build arguments will be provided in each of the README files in the build's directory.

# Directories
Each build will use the /mnt/ directory as it's base of operations for any files it uses.

All logs will be stored in the /mnt/logs/{build name}/ directory for instance.

All the important directories will be listed in each of the README files in the build's directory.

# License
This work is licensed under the GNU General Public License v3.0. To view a copy of this license, visit http://www.gnu.org/licenses/gpl-3.0.txt or see the LICENSE file in the root of this repository.
