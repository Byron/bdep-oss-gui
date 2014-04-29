This assembly contains all open-source dependencies as required by `bdistribution` and `bdevel`, for all supported platforms and in all required versions.

All other, non-free dependencies are described in the `bdep-nonfree` assembly. The latter will not contain the actual software due to restrictive licenses, but have to be added by the user who has to provide his own copy the the licensed software.

We depend on the following variable to be set within the yaml settings: `assembly.trees.oss-dependencies`. It is set by either `bdevel` or `bdistribution` to point to our respective root.

## License and Copyright

The files and code in this repository are licensed under the [MIT License](http://opensource.org/licenses/MIT)

All projects distributed here have their own open-source license, please see their respective LICENSE files for details.