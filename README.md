# A testing library for parcelify's command line functionality.

Requires a globally installed parcelify, but the path to parcelify can be specified when calling the shell command.

## Current usage instructions.

on the commandline execute the following:

    ./run-cli-tests.sh -h

this prints out a basic help menu

    ./run-cli-tests.sh -d

this runs the suite of cli tests in debug mode, which can be verbose.

    ./run-cli-tests.sh -c

this cleans up the generated bundle files

## Structure

The top level browserify project require()s a module called "my-module" that has very basic template, css, and js files.

The test suite calls the parcelify command on the top level project's main.js to test the generation of bundle files.

It then calls parcelify with the watch option to test realtime updating of the bundles based upon modification of files in "my-module"

The top level test script is run-cli-tests.sh, which should be executable.  The sub test scripts are in the directory called cli-tests.

## Current issues

* an error is generated when testing the module watching `Watch error: ReferenceError: Parcel is not defined`
* the watch testing doesn't cover templates or javascript yet, should be easy to add.
* bundle testing doesn't test the content of the bundles for correctness, only that they exist.  This is a TODO.
* sleep statements are used to give a chance for generated files to appear.  This cannot be truely trusted and another mechanism needs to be used.
* not driven by any sort of modern javascript utilities like grunt or tape, which is a TODO.
* code spacing and style is not in line with Rotunda's best practices.
* only tested using Mac OS X 10.9.2.  Need to test with Linux, cygwin and other command line usage.
