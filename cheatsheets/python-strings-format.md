---
title: Python
cheatsheet: Python Strings
topic: Python strings and formatting
author: Mael Stor
date: 22-04-2019
headergfx: false
credits: true
...

# Strings {-}

[A string](https://docs.python.org/3.7/library/stdtypes.html#text-sequence-type-str)
: is an immutable sequence that represent _Unicode_ code points.

```python
'Single "embedded"'
"Hello 'embedded'"
'''Three single
   quotes'''
"""Hello  
World"""
str(8) # Convert to string
```

# Formatting Strings {-}

[The String Literal](https://docs.python.org/3.7/reference/lexical_analysis.html#string-and-bytes-literals)
:   \

Prefixes:
```python
"f"|"F" # Formatted String 
        # Literals
"r"|"R" # Raw strings
and any combination of those.

"u"|"U" # Unicode
```

[The Bytes Literal](https://docs.python.org/3.7/reference/lexical_analysis.html#string-and-bytes-literals)
:   \

Prefixes:
```python
"b"|"B" # Bytes prefix
may be combined with "r"|"R"
```

[Formatted String Literals](https://docs.python.org/3.7/reference/lexical_analysis.html#formatted-string-literals)
: _New in version 3.6_. A formatted string literal is prefixed with `f` or `F`
which may contain replacement fields delimited by curly braces `{}`.

```python
> name = "Fred"
> f"He said his name is {name!r}."
"He said his name is 'Fred'."
> f"His name is {repr(name)}."
"His name is 'Fred'."

> from decimal import Decimal
> w = 10
> precision = 4
> v = Decimal("12.34567")
> f"result: {v:{w}.{precision}}"
'result:      12.35'
```

Backslashes are not allowed in format expressions:
```python
> f"newline: {ord('\n')}" # raises
    # SyntaxError
> newline = ord('\n')
> f"newline: {newline}"
'newline: 10' # works
```

See also [__PEP 498__](https://www.python.org/dev/peps/pep-0498)


<!-- \vfill\null -->
\columnbreak

[Format String](https://docs.python.org/3.7/library/string.html#format-string-syntax)
: with
[__str.format__](https://docs.python.org/3.7/library/stdtypes.html#str.format)
or with the
[__Formatter__](https://docs.python.org/3.7/library/string.html#string.Formatter)
class

```python
replacement_field ::=  
    "{" [field_name]
     ["!" conversion]
     [":" format_spec] "}"}"
```

The _replacement\_field_ can start with a _field\_name_ to specify the object
whose value is to be formatted.

```python
"Bring me a {}".format('beer')
"Weight in tons {0.weight}".
    format(dict_of_weightwatchers)
"Units destroyed: {players[0]}".
    format(list_of_players)
```
 The _field\_name_ may be followed by a
_conversion_ field

```python
!s  # calls str()
!r  # calls repr()
!a  # calls ascii()
```

and a _format\_spec_ (See below)

[Format Specification Mini-Language](https://docs.python.org/3.7/library/string.html#formatspec)
: is used within _replacement\_fields_ to define how individual values are
presented.

```
format_spec ::= [[fill]align]
    [sign][#][0][width]
    [grouping_option][.precision]
    [type]
```

If there is an _align_ value, it can be preceded by a _fill_ character (default
is space).

```
<   # Left alignment
>   # Right alignment 
=   # padding before the digits
^   # Center alignment
```

Available integer presentation types:

```python
b    # Binary format (Base 2)
c    # Character
d    # Decimal integer (Base 10) 
o    # Octal format (Base 8)
x    # Hex format in lower case
X    # Hex format in upper case
n    # Number ('d' but localized)
None # Same as 'd'
```

<!-- \vfill\null -->
\columnbreak

Floating point and decimal presentation types

```python
e    # Exponent notation
E    # Like e but uppercase E
f    # Fixed-point notation (.6)
F    # Like f but nan -> NAN
     #            inf -> INF
g    # General format
G    # Same as g but uppercase E
n    # Like g but localized
%    # Percentage (in f format)
None # Like g but at least one
     # digit after decimal point
```

# Methods {-}

[str.capitalize\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.capitalize)
: Return a copy of the string with its first character capitalized and the rest
lowercased


[str.casefold\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.casefold)
: Return a casefolded copy of the string like descibed in [Unicode Standard](http://www.unicode.org/versions/latest/) Section 3.13

More aggresive like
[__str.lowercase__](https://docs.python.org/3.7/library/stdtypes.html#str.lowercase) and converts 'ß' to 'ss'.

[str.center\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.center)
: Return centered in a string of length _width_ using _fillchar_, if present

```javascript
str.center(width[,fillchar])
fillchar=' '
```

[str.count\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.count)
: Return the number of non-overlapping occurrences of substring _sub_ in the
range _[stard, end]_. _start_ and _end_ are interpreted as in
[__slice__](https://docs.python.org/3.7/reference/expressions.html?highlight=slice#slicings)
notation.

```javascript
str.count(sub[,start[,end]])
```

[str.encode\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.encode)
: Return an encoded version of the string as a bytes object.

```javascript
str.encode(encodig="utf-8"
error="strict")
```
More on 
[__encoding__](https://docs.python.org/3.7/library/codecs.html#standard-encodings)
and
[__error__](https://docs.python.org/3.7/library/stdtypes.html#str.encode).


[str.endswith\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.endswith)
: Return `True` if the string ends with _suffix_, otherwise return `False`.
_suffix_ can be a
[__tuple__](https://docs.python.org/3.7/tutorial/datastructures.html?highlight=tuple#tuples-and-sequences).

```javascript
str.endswith(suffix[,start[,end]])
```

<!-- \newpage -->

[str.expandtabs\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.expandtabs)
: Replaces all tab characters by one or more spaces, depending on the current
column and the given tab size

```javascript
str.expandtabs(tabsize=8)
```


[str.find\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.find)
: Return lowest index where substring _sub_ is found within the 
[__slice__](https://docs.python.org/3.7/reference/expressions.html?highlight=slice#slicings) `s[start:end]` or if _sub_ is not found `-1`

```javascript
str.find[sub[,start[,end]]]
```


[str.format\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.format)
: Performs a string formatting operation. More about the [__Format String
Syntax__](https://docs.python.org/3.7/library/string.html#formatstrings) in the
section below.


```javascript
str.format(*args,**kwargs)
```

[str.format_map\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.format_map)
: Similar to `str.format(**mapping)` except that `mapping` is used directly.

[str.index\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.index)
: Like [__find__](https://docs.python.org/3.7/library/stdtypes.html#str.find), but raise [__ValueError__](https://docs.python.org/3.7/library/exceptions.html#ValueError) when the substring is not found.


[str.is...\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.isalnum)
: Perform checks about ascii type and classes.


[str.join\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.join)
: Concatenate strings in _iterable_ with str as separator.

```javascript
str.join(iterable)
```

[str.ljust\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.ljust)
: Left justify __str__ in string of length _width_ padded with _fillchar_, if
present (default is ASCII space).

```javascript
str.ljust(width[,fillchar])
```

[str.lower\(\)](\https://docs.python.org/3.7/library/stdtypes.html#str.lower)
: Converts all cased characters to lowercase as of [__Unicode Standard__](http://www.unicode.org/versions/latest/) Section 3.13

[str.lstrip\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.lstrip)
: Removes leading characters _chars_ defaults to any whitespace.

```javascript
str.lstrip([chars])
```

_static_ [str.maketrans\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.maketrans)
: Returns a translation table usable for
[__str.translate__](https://docs.python.org/3.7/library/stdtypes.html#str.translate)

```javascript
str.maketrans(x[,y[,z]])
```

<!-- \vfill\null -->
\columnbreak

[str.partition\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.partition)
: Splits the string at the first occurrence of _sep_ and return a 3-[__tuple__](https://docs.python.org/3.7/tutorial/datastructures.html?highlight=tuple#tuples-and-sequences).
containig the part before _sep_, _sep_ and the part after _sep_ or if _sep_ is
not found the string followed by two empty strings.

```javascript
str.partition(sep)
```

[str.replace\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.replace)
: Replaces all occurrences of substring _old_ replaced by _new_, _count_ times if
present.

```javascript
str.replace(old,new[,count])
```

[str.rfind\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.rfind)
: Returns the highest index in the string where substring _sub_ is found, such
that _sub_ is contained within `s[start:end]`, or return `-1` on failure.

```javascript
str.rfind(sub[,start[,end]])
```

[str.rindex\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.rindex)
: Like [__rfind__](https://docs.python.org/3.7/library/stdtypes.html#str.rfind)
but raises
[__ValueError__](https://docs.python.org/3.7/library/exceptions.html#ValueError)
when _sub_ is not found

```javascript
str.rindex(sub[,start[,end]])
```

[str.rjust\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.rjust)
: Right justify in a string of length _width_ padded with _fillchar_ if present
(default is ASCII space)

```javascript
str.rjust(width[,fillchar])
```

[str.rpartition\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.rpartition)
: Splits the string at the last occurrence of _sep_ and return a 3-[__tuple__](https://docs.python.org/3.7/tutorial/datastructures.html?highlight=tuple#tuples-and-sequences).
containig the part before _sep_, _sep_ and the part after _sep_ or if _sep_ is
not found two empty strings followed by __str__.

```javascript
str.rpartition(sep)
```

[str.rsplit\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.rsplit)
: Return a list of words, using _sep_ as delimiter at most _maxsplit_ times if given splitting from the right. _sep_ defaults to any whitespace character.

```javascript
str.rsplit(sep=None, maxsplit=-1)
```

<!-- \vfill\null -->
\columnbreak

[str.rstrip\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.rstrip)
: Removes trailing characters _chars_, which default to any whitespace.

```javascript
str.rstrip([chars])
```

[str.split\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.split)
: Like [str.rsplit\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.rsplit)
but from splitting from the left. Splits around whitespace if _sep_ is `None` or missing regarding consecutive whitespace characeters as one.

```javascript
str.split(sep=None,maxsplit=-1)
```

[str.splitlines\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.splitlines)
: Breaks a string around [__line
boundaries__](https://docs.python.org/3.7/library/stdtypes.html#str.splitlines) and returns a list of lines and if _keepends_ is given including the line breaks.

```javascript
str.splitlines([keepends])
```

[str.startswith\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.startswith)
: `True` if string starts with the _prefix_ if given starting at _start_ and
stopping at _end_ position. _prefix_ can also be a tuple.

```javascript
str.startswith(prefix[,start[
    ,end]])
```

[str.strip\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.strip)
: like [str.rstrip\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.rstrip)
but removes leading __and__ trailing whitespace or _chars_ if present.

```javascript
str.strip([chars])
```

[str.swapcase\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.swapcase)
: Converts uppercase characters to lowercase and vice versa. It is not
necessarily true that `s.swapcase().swapcase() == s`.
[str.title\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.title)
: Words start with an Uppercase character and remaining characters are
lowercase.

[str.translate\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.translate)
: Maps each character through a given translation table.

```javascript
str.translate(table)
```

[str.upper\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.upper)
: Converts all [__cased
characters__](https://docs.python.org/3.7/library/stdtypes.html#id15) to
uppercase like it is described in the [__Unicode Standard__](http://www.unicode.org/versions/latest/).

[str.zfill\(\)](https://docs.python.org/3.7/library/stdtypes.html#str.zfill)
: Fills the string from the left with ASCII `0` digits to make a string of length _width_
after a possible leading sign prefix `+`/`-`. 

```javascript
str.zfill(width)
```

