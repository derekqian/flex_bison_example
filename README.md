# flex_bison_example
A calculator example to use flex and bison in Windows. Version 2.5 (win_flex_bison-2.5.zip) is used in the test.  C/C++ compiler is from Visual Studio 2005.

Things to make Windows happy:
1. "%option nounistd" to avoid unisdt.h missing error.
2. "%option noyywrap" to avoid undefined function "_yywrap" error.

References:
1. http://web.iitd.ac.in/~sumeet/flex__bison.pdf
2. https://www.cs.wmich.edu/~bhardin/cs4850/flexbison.pdf
3. https://sourceforge.net/projects/winflexbison/files/old_versions/win_flex_bison-2.5.zip/download
