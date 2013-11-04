SSCANF V1.01
------------

(C) Clinton R. Johnson, January 27, 1999

Conditions of use :

        This code is provided as Delphi 4 source code only, and is provided
        FREE OF CHARGE.

        By using this code, you agree to release the author (Clinton R.
        Johnson) from any liabilities.  You may not seek legal recourse
        against the author for damages arising directly, or indirectly
        from the use of this code (including, but not limited to : loss of data,
        time, business or income).

        This code is provided AS-IS.  The author reserves the right to cease
        development at any time, add features, remove features (even if this
        results in a loss or change of functionality).


NOTES FROM THE AUTHOR :


FORMAT in Delphi is the equivalent of C's sprintf.  An exceptionally
useful feature.  Unfortunately, Inprise never created the inverse feature
sscanf.  I've really missed the function in my data parsing, so I've recreated
it for myself.  If you are not sure what sscanf does, I highly recommend that
you consult C doucmentation (or a C programmer).  It does a beautiful job of
pulling apart a string, and loading parts of it into variables.  There is
litterally nothing else like it.

I have included a series of other C functions in the CFunctions unit.

xdfUtils contains a few of my favorite functions, and some helper functions for
sscanf's set support.  The most useful feature you will find in xdfUtils will
probably be the InStringList function.  It lets you quickly compare a string to
a list of strings to see if its in the list.  (which is a lot nicer than
a series of IFs or an if statement with a large # of ANDS).


This version 1.01 replaces V1.0 of sscanf.  It had a flaw which would cause 
statements like :

sscanf('12, 13','%d %d',[@a,@b]);

to behave in an unpredictable method.  This has been corrected.


I have finally decided to release source.  I thought that I would have more 
time than, in fact, I have had.  In the spirit of seeing that more people
get access to the code, I have decided to adopt an open source policy for
sscanf.  I retain the copyright, but I am making the source available.  
From this point forward, sscanf will be totally free of charge.  No royalties
or fees will be levied at any time.

The documentation stinks, its true.  If someone would like to improve this
offering by writing a simple help file, I would appreciate it greatly.

- Clinton R. Johnson
Xepol's Delphi Files @ http://www.poboxes.com/xepol
