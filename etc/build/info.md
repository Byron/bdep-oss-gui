This directory contains simple scripts to keep track of build options used when preparing compilation of more complex dependencies on various platforms.

It's not the goal to keep it that way, but to keep the knowledge somewhere until we have a fully integrated build system which can handle it all. It's already there, but needs some work to reach that point I suppose.

Scripts may carry the following prefixes:

* `fetch_source_`
    - obtain the source code
* `configure_`
    - run the package configuration script with all flags we need
* `install_`
    - puts the build result into the right spot in bdep-oss, possibly pruning it