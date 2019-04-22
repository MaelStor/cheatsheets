---
title: Python
cheatsheet: Python
topic: Python (version 3)
author: Mael Stor
date: 22-04-2019
headergfx: false
credits: true
...


# Basics {-}

Indentation
: combines structures

```python
parent statement:
    statement block 1...
        ...
    parent statement:
        statement block 2...
        ...

next statements ...
``` 
Base Types
: _integer_, _float_, _boolean_, _string_, _bytes_ 

```python
int   433 0 -134 0b010  0o234 0xA3
                 binary octal hexa
float 3.34 0.0  -1.4e-3
                    x10^-3
bool  True False
str   "one\nTWo"  """A\tB\tc
                  C\t"""
bytes b"todo:\xce\770"
             hexa octal
```

Identifiers
: for _variables_, _functions_, _modules_, _classes_ ... _names_

Definition: `[a-zA-Z][a-zA-Z0-9\]*`

* Diacritics should be avoided
* Language keywords are forbidden
* snake\_case __or__ CamelCase


Variable assignment
: or __binding__ of a _name_ with a _value_

```python
x = 3.2 + 7 + cos(z)
a = b = c = 0
x,y = 1,2 # multiple assignments
a,b = b,a # swap values

a,*b = seq # unpacking sequence
*a,b = seq # in item and list

x += 3 # x = x + 3
x -= 4 # x = x - 4
... *= /= %= ...
x = None # undefined
del x    # remove name x
```

# Simple Statements {-}

Boolean Logic
:   \

```python
Comparisons: < > <= >= == !=
a and b (shortcut evaluation)
a or b  (shortcut evaluation)

not a   (logical not)
True, False (constants)
```

\vfill\null
\columnbreak

Basic Operators
:   \

```python
Operators: + - * / //  %   **
                   div mod a^b
Membership: op in seq
            op not in seq
Identity: type1 is type2
          type1 is not type2
(1+4.3)*2 -> 10.6
"Hello" + " World"->"Hello World"
abs(-2.3) -> 2.3
round(3.23,1) -> 3.2
pow(3,4) -> 81
```

Bitwise Operators
: or how to deal with Zeros and Ones

```python
Operators: 
  << # bitwise shift to the left
  >> # bitwise shift to the right
  &  # bitwise AND
  |  # bitwise OR
  ^  # bitwise XOR
  ~  # bitwise NOT
```

Shifting right by 1 means integer division by 2 without rest


Lambdas
: are used to create anonymous functions

```python
lambda [parameters]: expression

x = lambda a: a + 10 -> x(5) = 15

def func(n):
    return lambda a : a * n

mydoubler = func(2)
mytripler = func(3)
mydoubler(11) -> 22
mytripler(11) -> 33
```


Complex math:
: is integrated

```python
a, b = 2, 3
z = complex(a,b)
z = a + bj
z.real -> realpart
z.imag -> imaginary part
```

for complex functions: __import__ cmath


Math package
: brings more power: __from__ math __import__ _sin_, _cos_, ...

```python
sin(pi/4) -> 0.707
sqrt(81) -> 9.0
log(e**2) -> 2.0
ceil(12.5) -> 13
floor(12.5) -> 12
```

<!-- More Math  -->
<!-- : even more powerful -->
<!--  -->
<!-- with modules like: __statistics__, __random__, __decimal__, __fractions__,  -->
<!-- __numpy__, .... -->

\vfill\null
\columnbreak

Conversions
:   \

```python
int("14") -> 14 int("3f",16) -> 63
int(13.23) -> 13
float("-3.23e3") -> -3230.0
round(14.56,1) -> 14.6
bool(x) # False for 0, None,  empty
    # container or False; True for
    # everything else
str(x) -> "..." # __str__()
chr(64) -> '@' ord('@') -> 64
repr(x) -> "..." # literal x
bytes([34,67,12]) -> b'"C\x0c'
list("abs") -> ['a', 'b', 's']
dict([(4,'four'),(2,'two')])
    -> {4:'four',2:'two'}
set(['one','two']) ->{'one','two'}
','.join(['one','two'])->'one,two'
'some spac es'.split()
    -> ['some','spac','es']
[int(x) for x in ('1','10',-2)]
    -> [1,10,-2]
```


# Containers {-}

Types
: _list_, _tuple_, _str_, _dict_, _set_, _frozenset_

```python
list  [1,4,5]  ["s",11,4.2]
tuple (1,4,5)   "s",11,4.2
str bytes  # ordered seq of chars
dict  {"key": "value"}
set   {"key1", "key2"}
```

_tuple_, _str_ and __keys__ in _dict_, _set_ are immutable. _frozenset_ is an
immutable _set_.

Sequence Container Indexing
: or how to slice

```python
lst=[1, 2, 3, 4, 5]
lst[0]   -> 1  lst[1]  -> 2
lst[-1]  -> 5  lst[-2] -> 4
lst[start:end(exclusive):step]
lst[:-1] -> [1,2,3,4]
lst[::2] -> [1,3,5]
lst[::-2]-> [5,3,1]
lst[:] -> [1,2,3,4,5] shallow copy
```

On mutable sequences remove with `del lst[1]` or slices with `del lst[:3]`


Integer Sequences
: with __range()__ are immutable sequences of type _int_

```python
  range([start, ] end [, step])
# defaults 0   exclusive   1
range(5) -> 0 1 2 3 4
range(2,10,3) -> 2 5 8
```

\vfill\null
\columnbreak

Generic Operations
: on Containers. For _dict_ and _set_ these operations use __keys__

```python
len(c) -> items count
min(c)  max(c)  sum(c)
sorted(c) -> sorted list copy
enumerate(c) -> iterator on
             (index, value)
zip(c1,c2) -> iterator on tuples
           containing c_i items
all(c) -> True if all c items eva
          luate to True
any(c) -> True if at least one
       item in c evaluates True
```

Specific Operations
: on _ordered sequence containers_

```python
reversed(c) -> inverse iterator
c.index(val) -> position
c*2 -> duplicate
c + c2 -> concatenate
c.count(val) -> events count
```


Copy Containers
: with module: _import_ copy

```python
copy.copy(c) -> shallow copy of c
copy.deepcopy(c) -> deep copy
```


List Operations
:   \

```python
lst.append(val) # add item at end
lst.extend(seq) # add seq of item
lst.insert(idx,val) # add item at
    # index
lst.remove(val) # remove first 
    # item with val
lst.pop([idx]) # remove and return
    # item at idx. Default last.
lst.sort() # sort list inplace
lst.revers() # reverse list
    # inplace
```

Dictionary Operations
:   \

```python
d[key] = value
d[key] -> value
d.update(d2) # update associations
d.keys() -> key iterator
d.values() -> value iterator
d.items() -> key,value iterator
d.pop(key[,default]) -> value
d.popitem() -> (key,value)
d.get(key[,default]) -> value
d.setdefault(key[,default])->value
d.clear() # delete all keys,values
del d[key] # delete key
```

\vfill\null
\columnbreak

Set Operations
: see __Dictionary Operations__ for explanation of methods 

```python
Operators:
|   # union
&   # intersection
- ^ # difference/symmetric diff.
< > <= >= # inclusion relations

s.update(s2)    s.copy()
s.add(key)      s.remove(key)
s.discard(key)  s.clear()
s.pop()
```

# Compound Statements {-}

The If Statement
: is used for conditional execution

```python
if expression: ...
(elif expression: ...)*
[else: ...]

if bool(x)==True <-> if x:
if bool(x)==False <-> if not x:
```


The While Statement
: is used for repeated execution as long as an expression is true

```python
while expression: ...
[else: ...]
```

If the expression is true execute the __while__ statement and if false execute the
__else__ statement, if present and the loop terminates. A __break__ statement
in the __while__ loop terminates the loop without executing the __else__ clause.


The For Statement
: is used to iterate over elements of a sequence or other iterable objects.

```python
for targets in expression_list: ...
[else: ...]
```

The for statement is executed once for every item(s) provided by the iterator,
resulting from the expression\_list. Don't remove or add items from/to the list the
iterator is from instead create a copy:

```python
for x in a[:]:
    if x < 0: a.remove(x)
```


\vfill\null
\columnbreak


The Try Statement
: specifies exception handlers and/or cleanup code for a group of statements

```python
try: ...
(except [expression [as id]]:...)+
[else:...]
[finally:...]
or just
try:...
finally:...
```

The finally clause, if present specifies a 'cleanup' handler which is always
executed.


The With Statement
: is used to wrap the execution of a block with methods defined by a context
manager without the need for a try...except...finally block.

```python
with item (, item)*: ...
item is: expression [as target]
```

Function Definitions
:   \

```python
def func ( [parameters] ):...
default parameters: p [= expr ]
*p  # remaining positional args
**p # remaining dict (kw)args

myclass.func -> func object
r = myclass.func() # call func
```

Class Definitions
:   \

```python
class name ([inheritance]): ...
    def __init__([parameters]): ...
```

The __\_\_init\_\_()__ function initializes the parameters as instance
attributes.


\newpage
