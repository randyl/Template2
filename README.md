[![](https://github.com/abw/Template2/workflows/linux/badge.svg)](https://github.com/abw/Template2/actions) [![](https://github.com/abw/Template2/workflows/macos/badge.svg)](https://github.com/abw/Template2/actions)

                            Template Toolkit

                              Version 3.100

                                July 2020

        Copyright (C) 1996-2020 Andy Wardley.  All Rights Reserved

          This is free software; you can redistribute it and/or
             modify it under the same terms as Perl itself.


INSTALLATION
------------

If you have the CPAN module installed then you can install the Template
Toolkit from the command line like so:

    $ cpan Template

Please see the separate INSTALL file for further information on installing
the Template Toolkit, including what to do if you don't have the CPAN
module installed, and/or installation on MS Windows.


DESCRIPTION
-----------

The Template Toolkit is a collection of modules which implement a
fast, flexible, powerful and extensible template processing system.
It was originally designed and remains primarily useful for generating
dynamic web content, but it can be used equally well for processing
any other kind of text based documents: HTML, XML, POD, PostScript,
LaTeX, and so on.

It can be used as a stand-alone Perl module or embedded within an
Apache/mod_perl server for generating highly configurable dynamic web
content.  A number of Perl scripts are also provided which can greatly
simplify the process of creating and managing static web content and
other offline document systems.


WHAT'S NEW?
-----------

Version 3.100 Maintenance release: several fixes and documentation improvements.
              ttree updates.

Version 3.009 revert "Allow SET to have FILTER used in it"

Version 3.008 fixes some testing issue with CGI and taint issues.

Version 3.007 fixes a cpanm issue.

Version 3.006 adds an encoding option to Datafile plugin
and refresh the contributor list and copyrights for 2020.

Version 3.004 enforced three-args open.

Version 3.003 fixes some compatibility issues with several Plugins.

Version 3.002 is a maintenance release fixing a warning during install.

Version 3.001 officially drops Perl 5.6 support.

Version 3.000 provides several performance improvements.

Version 2.29 is a maintenance release fixing a cycling weaken issue.

Version 2.28 is a maintenance release fixing some minor bugs and warnings.
GitHub is now the official bug tacker tool for the project.

Version 2.27 is a maintenance release fixing some minor bugs and warnings.

Version 2.26 adds the new outline tag style and fixes various minor bugs.

Version 2.25 fixes compatibility with Perl version 5.18 and fixes a numer of
other minor bugs, typos, etc.

Version 2.24 adds some new text virtual methods and fixes a silly bug in the
Makefile.PL.

Version 2.23 is a maintenance release which fixes a few bugs, including one
in the XS Stash which caused problems when using third party modules (e.g.
DateTime) which use the string-based form of eval.

Version 2.22 is mostly a bug fixing release.  The XS Stash now works with
utf8 data.  Tests that were failing on Win32 platforms have been fixed.  Pod
coverage and quality tests have been disabled except for release testing.
The Autoformat plugin has been moved into a separate distribution.

Version 2.21 featured a complete clean-out of all the old HTML documentation,
examples, libraries and other cruft that was way out of date and badly
unloved. A new version of the HTML documentation is available for download
from http://tt2.org/download/index.html#html_docs. v2.21 also fixes a memory
leak in the XS Stash.

Version 2.21 also adds the STRICT option which reports the use of undefined
variable values. The ANYCASE option has been improved so that you can write
things like 'data.last' without the 'last' bit being interpreted as the LAST
keyword. The xml filter is also new, providing a slightly more rigourous
version of the html filter for use in XML documents.

Version 2.20 fixed all known bugs.  It also added the Scalar and Assert
plugins.  The HTML documentation, examples, libraries and other bits
and pieces are still provided with the distribution, but are no longer
installed by the Makefile.PL.  If you want them (and very few people do,
it seems), then you'll need to dig them out of the distribution by yourself
(or uncomment the commented-out lines in Makefile.PL that handle the
installation).  This has been done in an effort to simplify the installation
process.  All of the HTML documentation is available online at http://tt2.org/

Version 2.19 fixed some minor bugs in both Perl and XS versions of the Template
Stash, and fixed a problem with a test in the test suite failing under Win32.
It also added the url filter as a version of what the uri filter used to do
before we fixed it to do the right thing.

Version 2.18 fixes a number of minor bugs. It also includes a modification to
the parser grammar so that you can write expressions as arguments to
subroutine, method or vmethod calls.

Versions 2.17 and 2.16 were interim releases by Adam Kennedy who took care of
some installation problems on Mac OSX while Andy was busy elsewhere.

Version 2.15 is a major maintenance release.  It applies all outstanding
patches and closes all open bugs listed on http://rt.cpan.org/  It
includes:

 * XS Stash: enhancements include support for tied hashes/arrays
   and "fallback" methods on objects (e.g. accessing hash and
   list items and calling virtual methods)

 * Virtual Methods: added the scalar.remove, scalar.substr,
   hash.delete, hash.items, hash.pairs, list.import and list.hash
   virtual methods.  Added support for backreferences to
   scalar.replace and other improvements to list.push, list.unshift,
   list.hash, hash.list

 * Plugins: Added Math plugin, Bug fixes and enhancements to File,
   Image, URL and String plugins.  Moved DBI, XML and GD plugins
   into separate distributions.

 * Numerous other bug fixes, enhancements, documentation updates, all
   described in detail in the Changes file.

More significant is what's not in version 2.15.  The DBI plugin has
been moved into a separate Template-DBI distribution, the GD plugins
into Template-GD, the XML plugins into Template-XML, and the Latex
filters into Template-Latex.  This has been done in an effort to make
the Template Toolkit core distribution smaller, cleaner and easier to
configure and install.

Version 2.14 added Unicode support to TT, a full set of command line
options for tpage, the 'caller' and 'callers' items to each template
component, some enhancements to the XML::Simple plugin, and a number
of minor bug fixes.

See the Changes file for further details of the changes in these and
earlier releases.


GENERAL FEATURES
----------------

Some of the key features of the Template Toolkit are listed below.
See the documentation for further detail.

  * simple but powerful template language

  * promotes a clear separation between application functionality and
    presentation elements

  * variable substitution allows binding to any Perl data types
    (scalars, hashes, lists, subs, objects)

  * conditional blocks (IF/UNLESS/ELSIF/ELSE, SWITCH/CASE)

  * loops and iterators (FOREACH, WHILE)

  * file/template inclusion (INSERT, INCLUDE, PROCESS, WRAPPER)

  * definition of local template components (BLOCK)

  * post-processing filters (FILTER)

  * plugin module architecture for easy extensibility (USE)

  * embedded Perl can be optionally enabled (PERL/RAWPERL)

  * full exception handling (TRY/THROW/CATCH/FINAL)

  * user-defined macros (MACRO)

  * definition of template metadata (META)

  * virtual methods for complex data types (e.g. list.size, hash.keys, etc.)

  * numerous configuration options

  * modular OO architecture allows extensive customisation

  * fast LALR(1) parser modules compiles templates according to a
    YACC-like grammar.

  * templates compiled to Perl code for efficient runtime execution

  * in-memory and on-disk caching of compiled templates

  * simple front end module (Template.pm) for ease of use

  * numerous plugin modules: CGI, DBI, XML, URL, Date, Table, etc

  * standard filters for html, case folding, regex search and replace, etc.


DOCUMENTATION
-------------

The Template Toolkit is provided with enough documentation to keep all
but the most voracious reader happy for quite some time.

The 'Changes' file in the distribution directory documents all visible
changes between versions of the Template Toolkit.  See the section
'VERSION COMPATABILITY' below for further details.

The 'TODO' file, also in the distribution directory, lists known bugs,
planned enhancements and possible new features for future versions.

The 'INSTALL' file covers the configuration and installation process.

The rest of the documentation is distributed in Pod format. The Pod pages
are installed when you 'make install' and can be viewed using 'perldoc',
e.g.

    perldoc Template

If you're using a Unix based system then the pages should also be
converted to manpages during 'make install'.  Thus, you can also:

    man Template

(the man pages shouldn't have any problems relating to older versions)

The documentation is also available in HTML format at the TT web site:

    http://tt2.org/docs/

The documentation is now split into several sections.  The 'Template'
page is now much shorter, containing information relating to the
specifics of using the Template module, and a brief summary of
everything else.  Information relating more generally to the Template
Toolkit, features, syntax of the template language, plugins and so
forth, has been split up into a number of Template::Manual::* pages.
Template::Manual provides the index for the manual.

    perldoc Template::Manual

Individual sections can be viewed as, for example,

    perldoc Template::Manual::Syntax
    perldoc Template::Manual::Directives
    perldoc Template::Manual::Plugins

The Template::Tutorial provides an index to the tutorial documents.
There are currently 2 tutorials, on generating web content, and on
creating and using data files.

    perldoc Template::Tutorial
    perldoc Template::Tutorial::Web
    perldoc Template::Tutorial::Datafile

Each of the various modules that comprise the Template Toolkit has its
own associated documention.  The 'Template::Modules' manpage lists
these modules along with a brief description of their functions.

    perldoc Template::Modules

See the individual pages for further detail:

    perldoc Template::Context
    perldoc Template::Parser
    perldoc Template::Provider

If you're interested in the internals of the Template Toolkit and want
to know more about how it all works, then you might like to have a look
at the following:

    perldoc Template::Manual::Internals

This document also contains important information for people wishing
to hack on the Template Toolkit.

The final bit of good news is that there is now a FAQ for the Template
Toolkit.

    perldoc Template::FAQ

It's now got a few question in it, and better still, some answers!
Further contributions welcome.

Most of the documentation is stable and reliable.  Where it's not then
it's usually marked as such.  In particular, the documentation for the
internals (Template::Manual::Internals) and FAQ (Template::FAQ) are
perpetually under construction.


SOURCE CODE
-----------

The source code for the Template Toolkit is maintained in a public git
repository at github:

    https://github.com/abw/Template2

If you want to hack on the source code, either to fix a bug or add a feature
then you should fork the repository, make the changes, commit them, and then
send me a pull request.  See this guide for further information.

    http://help.github.com/send-pull-requests/

Any non-trivial new features should be discussed on the Template Toolkit
mailing list first (see below). Don't forget to update the documentation and
tests where relevant


SUPPORT
-------

The Template Toolkit mailing list provides a forum for discussing
issues relating to the use and abuse of the Template Toolkit.  There
are a number of knowledgeable and helpful individuals who frequent the
list (including the author) who can often offer help or suggestions.
Please respect their time and patience by checking the documentation
and/or mailing list archives before asking questions that may already
have been answered.

To subscribe to the mailing list, send an email to:

    template-toolkit+subscribe@groups.io

You can also use the web interface:

    https://groups.io/g/template-toolkit

For information about commercial support and consultancy for the Template
Toolkit, please contact the author.


AUTHOR
------

The Template Toolkit was written by Andy Wardley <abw@wardley.org> with
the invaluable assistance and contributions from many other people.
See Template::Manual::Credits for details.


COPYRIGHT
---------

Copyright (C) 1996-2020 Andy Wardley.  All Rights Reserved.

This is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.
