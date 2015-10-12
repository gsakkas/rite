2584 bad programs with known types

- 74 do not fail dynamically

- 2510 do fail dynamically
  - 91 fail with unbound variable (possible bug in program extractor)
  - of remaining 2419:
    - average of 2 tests needed to trigger runtime exception

- OCaml primitives are listed in
  - `bytecomp/lambda.mli`
  - `bytecomp/translcore.ml`
  - `external f : t = "prim"` defines primitive wrapper
  - stdlib implemented with many `external`
    - should implement actual primitives, then load stdlib from source

[X] ADTs

[ ] extend interpreter with "fail safe"
  - when program would go wrong, e.g. int + bool
  - just return one, e.g. int
  - count number of places where program goes wrong picking one vs other

[ ] from symptom to cause
  - simplify counterexample trace

[X] collect sample outputs to webpage (with trace)

[ ] look at physical subtyping
  - (similar to soft typing)
  - also discriminative union types

[X] dig up extra benchmarks from other "locating type error papers"
  - andrew myers
  - dan grossman

[X] configurable failure options
  - heterogeneous equality vs. homogeneous
  - check ADT arguments at application site (IMPORTANT FOR SEMINAL)
    - need to carry fully instantiated type around with values
      (type-carrying operational semantics)
  - STILL NEED TO MAKE IT CONFIGURABLE

[ ] add post-hoc generalization a la smartcheck

[ ] go backwards from crash
  - where did value `x` come from?
  - PSE (ESP done backwards) dump checker

[X] for seminal programs that don't crash, WHY??
  - 20060305-21:49:26-9fc379ff0ebf471cca400f4c3b144205.seminal.ml
    - just need a type for `mapHelp` so we actually generate inputs
  - 20060305-21:56:00-9af22179cf4408715cbf337f5c3a534f.seminal.ml
    - used if-then instead of if-then-else, type mismatch between [] and ()
  - 20060316-19:34:40-21991f746ce1d63c2b7ecd57ca2fccea.seminal.ml
    - partially applied function, so we don't reduce anything, need to supply extra arg
  - 20060321-17:38:52-5224914e10b7b5eacd09bb21ab53a674.seminal.ml
    - type mismatch in result of match, () vs string
    - value is discarded though (with ;) so it can't go wrong

  - USED TO PASS, BUT NO LONGER DO
    - 20060313-22:39:42-644d210e9d66cf006f61c64435b0efb3.seminal.ml
      20060313-23:03:58-c9d9c96a5c92d44ea888b2bf8287ed92.seminal.ml
      - datacon name shadowing
      - we should probably forbid shadowing datacons, even though ocaml allows it..


[ ] a few concrete examples of programs that crash at ML level

[X] add extra language features for seminal benchmarks
  - records
  - references
  - arrays

[ ] keep going after MLExceptions
  - ml exceptions are annoying, because they can prevent access to the ill-typed code, e.g.
```
let interpSmall (movelist : move list) : (float*float) list = 
  let interpSmallStep movelist x y dir : move list * float * float * float = 
  match movelist with
    [] -> raise Unimplemented
  | Home::tl -> raise Unimplemented
  | Forward(f)::tl -> raise Unimplemented
  | Turn(f)::tl -> raise Unimplemented
  | For(i,lst)::tl -> raise Unimplemented
  in
  let rec loop movelist x y dir acc =
    raise Unimplemented
  in 
  List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])
```
    - `List.rev (loop ...)` is ill-typed, but we can't reach it since
      `interpSmallStep` always throws an exception.
    - IDEA: throw exceptions *lazily*
      - wrap `raise Foo` in a thunk
      - when is thunk forced? (maybe when part of primitive application?)
      - this won't help the example above. are there actual benchmarks where it would?
    - IDEA: replace `raise Foo` with random value of expected type
  - ml exceptions are uninteresting, they don't signify a type error
    - don't kill test harness on first MLException
      - may only be thrown on a particular branch
    - keep log of tests that threw MLException
      - may indicate that type error is unreachable
  
[X] don't try to specialize datacons with multiple arguments, just let them be tuples...
```
# type ('a,'b) myoption = Mynone | Mysome of ('a * 'b);;
# let Mysome x = Mysome (1,2);;
val x : int * int = (1, 2)
```
  - turns out OCaml distinguishes between datacons that take multiple
    args vs a tuple, we just have to mimic the behavior..

[ ] Just evaluate the crash
  - Given a program trace, remove everything that is not related to the crash
  - RELATED: use lazy-smallcheck style holes for function arguments and exceptions
    - iterative refinement of input vs post-hoc generalization from multiple witnesses

[ ] visualizations
  - todd millstein interactive d3.js
  - plt-redex??

[ ] generate tree of reductions
  - given an input term, return all possible sequences of reductions
  - find shortest path that goes wrong
  - interactive visualization to choose path

```
  fun (f,b) ->
    let f = fun b -> (x,y) in
    if y = true then wwhile (f,x) else x
==>
  fun (f,b) ->
    let f = fun b -> (x,y) in
    if y = true then wwhile (f,x) else x

wwhile := fun (f,b) ->
            let f = fun b -> (x,y) in
            if y = true then wwhile (f,x) else x
```


[ ] compress reduction steps
  - "recursive explanation algorithm"
    - crash because `1 * true`
    - where did `true` come from? `fac 0`
  - which are the salient bits in an explanation?

[ ] what are the claims to make in the paper?
  - expressive? efficient? usable?
  - design tool / experiment to support claims
  - measure the number choices a human would have to make to reach the "fix" they made
    - grab bad program and subsequent fix
    - how many steps in tool to reach changed expression

[ ] sketch out exploration for some examples
  - `fac`, let-swap bug, a few others
  - for each, show a single ideal trace, e.g.
    - 5: 1 * true  (* pick [1] or [2] *)
    - 3: true

```

------------------------------------------------------------
1	let rec fac n =
2	  if n = 0 then
3	    true
4	  else
5	    n * fac (n - 1);;
6	
7	fac 1;;

error: 5: could not match 'int' with 'bool' in
  1 * true

[1]: 1
[2]: *
[3]: true

> 3

------------------------------------------------------------
1	let rec fac n =
2	  if n = 0 then
3	    true
4	  else
5	    n * fac (n - 1);;
6	
7	fac 1;;

error: 5: could not match 'int' with 'bool' in
  1 * true

  fac 0 ==> true

[1]: fac
[2]: 0

> 2

------------------------------------------------------------
1	let rec fac n =
2	  if n = 0 then
3	    true
4	  else
5	    n * fac (n - 1);;
6	
7	fac 1;;

error: 5: could not match 'int' with 'bool' in
  1 * true

  5: fac 0 ==> true

  5: 1 - 1 ==> 0

[1]: 1
[2]: -
[3]: 1

> 1

------------------------------------------------------------
1	let rec fac n =
2	  if n = 0 then
3	    true
4	  else
5	    n * fac (n - 1);;
6	
7	fac 1;;

error: could not match 'int' with 'bool' in
  5: 1 * true

  5: fac 0 ==> true

  5: 1 - 1 ==> 0

  1: n ==> 1

[1]: n

> 1

------------------------------------------------------------
1	let rec fac n =
2	  if n = 0 then
3	    true
4	  else
5	    n * fac (n - 1);;
6	
7	fac 1;;

error: could not match 'int' with 'bool' in
  5: 1 * true

  5: fac 0 ==> true

  5: 1 - 1 ==> 0

  1: n ==> 1

  7: fac 1

[1]: fac
[2]: 1

>

```

```

------------------------------------------------------------
1  let (x,y) = ("5", 5);;
2
3  let rec wwhile (f,b) =
4    let f b = (x, y) in
5    if x = true then
6      wwhile (f, x)
7    else x;;
8
9  wwhile (fun x => x, 1);;

error: could not match 'string' with 'bool' in
  5: "5" = true

[1]: "5"
[2]: =
[3]: true

> 1

------------------------------------------------------------
1  let (x,y) = ("5", 5);;
2
3  let rec wwhile (f,b) =
4    let f b = (x, y) in
5    if x = true then
6      wwhile (f, x)
7    else x;;
8
9  wwhile (fun x => x, 1);;

error: could not match 'string' with 'bool' in
  5: "5" = true

  5: x ==> "5"

[1]: x

> 1

------------------------------------------------------------
1  let (x,y) = ("5", 5);;
2
3  let rec wwhile (f,b) =
4    let f b = (x, y) in
5    if x = true then
6      wwhile (f, x)
7    else x;;
8
9  wwhile (fun x => x, 1);;

error: could not match 'string' with 'bool' in
  5: "5" = true

  5: x ==> "5"

  1: let (x,y) = ("5", 5);;

[1]: "5"
[2]: 5

>

```

```
------------------------------------------------------------
 1  let explode s =
 2    let rec go i =
 3      if i >= (String.length s) 
 4      then [] 
 5      else (s.[i]) :: (go (i + 1)) 
 6    in go 0;;
 7
 8  let listReverse l =
 9    let rec helper xs = function 
10      | [] -> xs 
11      | hd::tl -> helper (hd :: xs) tl 
12    in helper [];;
13
14  let palindrome w =
15    if (listReverse (explode w)) = (explode w) 
16    then true 
17    else false;;
18
19  palindrome "a";;

error: could not match ''a -> 'b' with 'char list' in
  15: <fun> = ['a']

[1]: <fun>
[2]: =
[3]: ['a']

> 1

------------------------------------------------------------
 1  let explode s =
 2    let rec go i =
 3      if i >= (String.length s) 
 4      then [] 
 5      else (s.[i]) :: (go (i + 1)) 
 6    in go 0;;
 7
 8  let listReverse l =
 9    let rec helper xs = function 
10      | [] -> xs 
11      | hd::tl -> helper (hd :: xs) tl 
12    in helper [];;
13
14  let palindrome w =
15    if (listReverse (explode w)) = (explode w) 
16    then true 
17    else false;;
18
19  palindrome "a";;

error: could not match ''a -> 'b' with 'char list' in
  15: <fun> = ['a']

  15: listReverse ['a'] ==> <fun>

[1]: listReverse
[2]: ['a']
[3]: single step

> 3

------------------------------------------------------------
 1  let explode s =
 2    let rec go i =
 3      if i >= (String.length s) 
 4      then [] 
 5      else (s.[i]) :: (go (i + 1)) 
 6    in go 0;;
 7
 8  let listReverse l =
 9    let rec helper xs = function 
10      | [] -> xs 
11      | hd::tl -> helper (hd :: xs) tl 
12    in helper [];;
13
14  let palindrome w =
15    if (listReverse (explode w)) = (explode w) 
16    then true 
17    else false;;
18
19  palindrome "a";;

error: could not match ''a -> 'b' with 'char list' in
  15: <fun> = ['a']

  15: listReverse ['a'] ==> <fun>

  9: let rec helper xs = ...
     in helper []

[1]: single step

> 1

------------------------------------------------------------
 1  let explode s =
 2    let rec go i =
 3      if i >= (String.length s) 
 4      then [] 
 5      else (s.[i]) :: (go (i + 1)) 
 6    in go 0;;
 7
 8  let listReverse l =
 9    let rec helper xs = function 
10      | [] -> xs 
11      | hd::tl -> helper (hd :: xs) tl 
12    in helper [];;
13
14  let palindrome w =
15    if (listReverse (explode w)) = (explode w) 
16    then true 
17    else false;;
18
19  palindrome "a";;

error: could not match ''a -> 'b' with 'char list' in
  15: <fun> = ['a']

  15: listReverse ['a'] ==> <fun>

   9: let rec helper xs = ...
      in helper []

  12: helper []

[1]: helper
[2]: []
[3]: single step

> 3

------------------------------------------------------------
 1  let explode s =
 2    let rec go i =
 3      if i >= (String.length s) 
 4      then [] 
 5      else (s.[i]) :: (go (i + 1)) 
 6    in go 0;;
 7
 8  let listReverse l =
 9    let rec helper xs = function 
10      | [] -> xs 
11      | hd::tl -> helper (hd :: xs) tl 
12    in helper [];;
13
14  let palindrome w =
15    if (listReverse (explode w)) = (explode w) 
16    then true 
17    else false;;
18
19  palindrome "a";;

error: could not match ''a -> 'b' with 'char list' in
  15: <fun> = ['a']

  15: listReverse ['a'] ==> <fun>

   9: let rec helper xs = ...
      in helper []

  12: helper []

   9: function
       | [] -> []
       | hd::tl -> helper (hd :: []) Tl


```

```
listReverse (explode w)
  ==>
(fun l => let rec helper xs = ... in helper []) (explode w)
  ==>
(fun l => let rec helper xs = ... in helper []) ((fun s => ...) w)
  ==>
(fun l => let rec helper xs = ... in helper []) ((fun s => ...) "a")
  ==>
(fun l => let rec helper xs = ... in helper []) ['a']
  ==>
let rec helper xs = ... in helper []
  ==>
helper []
  ==>
(fun xs => function ...) []
  ==>
(function ...)


```

- preliminary results from `Misc.facProg`:
  - bfs: 30 (19 skipping seen nodes) steps to reach target `true`
  - dfs: 11 steps
  - human: 9 steps (same path as dfs after first backtrack)
  - worst-case: 62 nodes in graph
  - is this a good example or a pathological case?
    - target expression is actually a subterm of the stuck term
    - how common will that be?

- preliminary results from `Misc.badProg`:
  - bfs: 110 (32 skipping seen nodes) steps to reach target `()`
  - dfs: 13 steps
  - human: 13 steps (same path as dfs)
  - worst-case: 100 nodes in graph

- preliminary results from `Misc.wwhileProg`:
  - can't even reach target using proposed rules
  - worst-case: 52 nodes in graph

- preliminary results from `Misc.palindromeProg`:
  - bfs: 12 (11 skipping seen nodes) steps to reach target `helper []`
  - dfs: 6 steps to reach target
  - human: 6 steps (same path as dfs)
  - worst-case: 94 nodes in graph

- will the target expression always be a subterm of the stuck term?
  - no, see `Misc.wwhileProg`
    - type error occurs because `let f b = (x, y)` defines `f` instead
      of calling `f` and matching on the result.
    - target is entire binding, which needs to be reversed
    - but the binding of `y` on line 1 *is* used by the stuck term; so
      all is not lost, blaming `y` on line 1 should highlight the
      scoping problem.
  - but for the most part, *maybe*?
    - type errors can appear far removed from their source because of
      unification variables
    - at run-time we always have concrete values, no unification variables
      - by extension, perhaps run-time type errors cannot be far removed
        from their source
      - i.e. follow the bad value back to its source
  - since ocaml does not have overloading, we always know which value to blame
    - not quite true! what if type error is from applying the wrong
      function/constructor? could have multiple errors

- [ ] generate ordered list of interesting paths
  - given `prim v1 v2 vn`
    1. paths that end in `vi` that incur type error
    2. path that ends in `prim` (alternatively, path that ends in `prim v1 v2 vn`)
    3. paths that end in other `vi`


- start with source term --> stuck term
  - set of stepping operations
    1. small step forward
    2. small step back
    3. "big" step forward (skip over next function call)
    4. "big" step back (step back to last function call)
    5. zoom in on a specific function call

    fac 1 ---> 1 * true

      ==> { big-step back from `1 * true` }

    fac 1 ---> 1 * fac 0 ---> 1 * true

      ==> { small-step forward from `1 * fac 0` }

    fac 1 ---> 1 * fac 0 ---> 1 * if ... then ... else ... ---> 1 * true

      ==> { click hyper-edge from `fac 0` to `true` }

    fac 0 ---> true

---------------

- [ ] catch functions that return different types depending on input
    - first run, capture full trace
    - if any subsequent run produces a different output type, ERROR

- [ ] demo programs
  1. fac / fib
  2. qsort
  3. recursive sum
  4. fold
  5. vanilla-rec vs tail-rec


- [X] add nonce to ocaml's URLs to identify traces
  - can correlate with ocaml-top data

- [ ] list of stuff for UGs to do
  - anonymize raw data
  - test web ui
  - data analysis
    - how long does it take students to complete homeworks?
    - where do the errors show up?
      - which homework?
      - which problem?
    - what kind of errors do they encounter?
      - categories (syntax, monotype, polytype, hof)
      - frequency
    - how long does it take them to fix the error?
      - by category
      - by homework (do they get better over time?)
    - underlying issue of dealing with large time gaps
      - how to decide when they stopped working?
      - can use timer events (large gap with no timer events indicates ocaml-top closed)

- [ ] prepare for A/B study
  - 5-10 bad programs
    - identify source of type error, explain, fix
    - A: just ocaml / ocaml-top
    - B: ocaml + web ui
  - 2 sessions
    - 1st after ADT homework
    - 2nd?
  - willing to pay $20-25/hr
    - does this mean new IRB?

- [X] connect the editor, type error, and bad term
  - also highlight corresponding source node of selected graph node

- [ ] insert subterm edge to BAD term when the STUCK term contains it as a subterm

- [ ] prepare 20min intro to tool

- [ ] maybe symbolic evaluator to improve coverage

- [ ] test different timeouts

- [X] debug filter example!!!
  - `let` binder seems to be problematic

- [ ] visualize environment when you click on a node

- [ ] step-into grabs the immediate subterm, not the nested subterm that we want

- [ ] weird criss-crossing of edges between nodes when you do multiple step-intos

- [X] add step-over, which crunches the next expression down to a value

- [X] jump forward should jump to the next "return"
  - if there are no more beta reductinos?
  - or next beta/return whichever comes first?

1. ff, env stack (with freshening of shadowed vars), highlight bad subterm
2. gather sample problems from logs on goto
