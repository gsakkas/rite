SHErrLoc 1.0.0

			     The SHErrLoc Tool
			     ----------------

SHErrLoc (Static Holistic Error Locator) is an implementation of the general
error diagnostic approach described in the 2014 paper, "Toward General Diagnosis
of Static Errors", published in the Proceedings of the 41th ACM Symposium on
Principles of Programming Languages (POPL), January 2014, pp. 569-581, by
Danfeng Zhang and Andrew C. Myers. In a nutshell, SHErrLoc takes a constraint
file describing program analysis, and diagnoses the most likely cause of
errors detected by the static analysis.


Contents
------------------------------------------------------------------------

- The SHErrLoc tool
- Some Jif/Fabric test cases and constraints used in the POPL'14 paper
- Other test cases
- Web support (style files)

The following contents are NOT included:

EasyOcaml++, the constraint generator for OCaml type inference, is released
separately at 
http://www.cs.cornell.edu/projects/sherrloc/EasyOCaml++.tar.gz

The constraint generator for the Jif compiler is currently not released. Please
refer to the Jif homepage, http://www.cs.cornell.edu/jif/, for future release.

The OCaml test cases used in the POPL paper are provided by Ben Lerner and Dan
Grossman. Please acquire these test cases from them, and use EasyOcaml++ and
SHErrLoc to generate error reports.


Organization
------------------------------------------------------------------------

Your installation directory contains the following sub-directories:

  - src:      the complete source code of the SHErrLoc tool
  - doc:      documentation 
  - lib:      needed JAR files
  - HTML:     needed style file and js files to show HTML reports
  - examples: SHErrLoc examples
  - tests:    a collection of test cases and constraint files

The installation directory also contains a script "sherrloc" to run the
SHErrLoc tool in a convenient way.


Requirements
------------------------------------------------------------------------

The SHErrLoc tool is compiled with the Ant build tool
(http://jakarta.apache.org/ant). You must ensure that java and javac are in
your path.

Softare Versions: We recommend that you use JDK 1.6.0 or later.  Ant
   1.8.2 is known to work with SHErrLoc 1.0.0.

This SHErrLoc distribution contains the files JFlex.jar, java-cup-11a.jar,
junit-4.5.jar and commons-cli-1.2.jar. These files are required to build.


Building SHErrLoc
------------------------------------------------------------------------

SHErrLoc is compiled with the Ant build tool (http://jakarta.apache.org/ant).
Follow these steps to build the SHErrLoc tool:

1. Ensure javac is on your path and that you are using JDK 1.6.0 or
   later. Set the JAVA_HOME environment variable to the Java home
   directory.

2. Go to the root directory of the SHErrLoc installation (the directory
   this README is in). We'll call this directory $HOME from now on.

    $ cd $HOME

3. Run ant to build the SHErrLoc tool.

        $ ant

   This compiles the $HOME/src.

   The resulting .class files for the source code in $HOME/src, will be stored
   in $HOME/build.

4. You are now ready to try out SHErrLoc. A suggested starting point is the
   examples in the directory $HOME/examples. See the README file in that
   directory for more detailed instructions.


Running SHErrLoc
------------------------------------------------------------------------

A script named "sherrloc" is available in the $HOME directory. The sherrloc
script provides a convenient way to execute the compiled SHErrLoc code.

The command line options for SHErrLoc can be viewed by running sherrloc with
the "-h" flag:
    $ $HOME/sherrloc -h

usage: diagnostic <options> <constraint file>
 -c         generate likely wrong constraints
 -d         output the constraint graph as a DOT file
 -e         generate likely wrong constraint elements
 -f         show full constraint graph (use with -d)
 -h         generate likely missing hypothesis
 -n <arg>   number of suboptimal suggestions to report. Default value is
            zero
 -o <arg>   output file
 -r         allow recursion (e.g., x = list x)
 -s <arg>   the source file that generated the constraints (use with -w)
 -u         unified report with wrong constraint elements and missing
            hypothesis (experimental)
 -v         verbose mode (for evaluation)
 -w         HTML report

See the SHErrLoc documentation ($HOME/doc/index.html) for more information
about the SHErrLoc source code. See the directory $HOME/examples for some
examples of constraint inputs.


Restrictions on use
------------------------------------------------------------------------

This free release of the SHErrLoc tool may be used, modified, and redistributed
as governed by the license included in the attached file LICENSE.

This software is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the file
LICENSE for more details.


More information
------------------------------------------------------------------------

More information about SHErrLoc, including the latest release, can be found
at the SHErrLoc web site at

    http://www.cs.cornell.edu/projects/sherrloc

If you use SHErrLoc, we'd appreciate your letting us know. Send your comments
and bug reports to Danfeng Zhang at zhangdf@cs.cornell.edu, or Andrew C. Myers
at andru@cs.cornell.edu.


Changes
------------------------------------------------------------------------

1.0.0
    The initial release


Acknowledgments
------------------------------------------------------------------------

The development and maintenance of this SHErrLoc software release has been
supported by by two grants from the Office of Naval Research, N00014-09-1-0652
and N00014-13-1-0089, by MURI grant FA9550-12-1-0400, by a grant from the
National Science Foundation (CCF-09644909), and by a grant administered by the
Air Force Research Laboratory.
