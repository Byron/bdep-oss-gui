This assembly contains all open-source dependencies as required by `bdistribution` and `bdevel`, for all supported platforms and in all required versions.

All other, non-free dependencies are described in the `bdep-nonfree` assembly. The latter will not contain the actual software due to restrictive licenses, but have to be added by the user who has to provide his own copy the the licensed software.

A dependency in our sense of the word is a python or c/c++ library for the sole purpose of importing or linking against it at runtime, as appropriate. Dependencies suitable for building programs are provided in a separate assembly as needed.

## Assembly Requirements

We depend on the following variable to be set within the yaml settings: `assembly.trees.oss-dependencies`. It is set by either `bdevel` or `bdistribution` to point to our respective root.

The reason for this is that we want to be easily integrated, either to be part of another assembly, or to live side-by-side, whatever fits best to the respective user.

## Directory Structure

Packages we depend on are kep in the `lib/` directory, and each package follows the structure below.

```
.
`-- <package>
    `-- <version>
        `-- <platform>
```

As each package is configured via yaml files in `etc/`, arbitrary package structures can be used if necessary or useful. However, to reduce confusion, we try not to deviate from the rules unless absolutely required.

## License and Copyright

The files and code in this repository are licensed under the [MIT License](http://opensource.org/licenses/MIT)

All projects distributed here have their own open-source license, please see their respective LICENSE files for details.