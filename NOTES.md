```
ghci> let rs = map fromJust . filter isJust $ results
rs :: [(FilePath, Result)]
ghci> length rs
2584
ghci> let (ss, fs) = partition (isSuccess . snd) rs
fs :: [(FilePath, Result)]
ss :: [(FilePath, Result)]
ghci> length fs
2510
it :: Int
ghci> length ss
74
it :: Int
ghci> length (filter (("unbound" `isInfixOf`) . reason . snd) fs)
91
it :: Int
ghci> let interesting = filter (not . ("unbound" `isInfixOf`) . reason . snd) fs
interesting :: [(FilePath, Result)]
ghci> length interesting
2419
ghci> fromIntegral (sum (map (numTests . snd) interesting)) / fromIntegral (length interesting)
2.0400992145514674
```

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

[ ] dig up extra benchmarks from other "locating type error papers"
  - andrew myers
  - dan grossman

[ ] configurable failure options
  - heterogeneous equality vs. homogeneous
  - check ADT arguments at application site (IMPORTANT FOR SEMINAL)

[ ] add post-hoc generalization a la smartcheck

[ ] go backwards from crash
  - where did value `x` come from?
  - PSE (ESP done backwards) dump checker

[X] for seminal programs that don't crash, WHY??
  - 20060305-21:49:26-9fc379ff0ebf471cca400f4c3b144205.seminal.ml
    - just need a type for `mapHelp` so we actually generate inputs
  - 20060305-21:56:00-9af22179cf4408715cbf337f5c3a534f.seminal.ml
    - used if-then instead of if-then-else, type mismatch between [] and ()
  - 20060313-22:39:42-644d210e9d66cf006f61c64435b0efb3.seminal.ml
    20060313-23:03:58-c9d9c96a5c92d44ea888b2bf8287ed92.seminal.ml
    - datacon name shadowing
    - we should probably forbid shadowing datacons, even though ocaml allows it..
  - 20060316-19:34:40-21991f746ce1d63c2b7ecd57ca2fccea.seminal.ml
    - partially applied function, so we don't reduce anything, need to supply extra arg
  - 20060319-13:25:22-d82ce217b923933f541e5e4c291912ff.seminal.ml
    20060321-16:05:32-9fac1c5709dc4756677dea761359bb07.seminal.ml
    20060321-18:07:56-3c4adbec38600fff622eabc0dbcae305.seminal.ml
    - not checking types of arguments to datacons
  - 20060321-17:38:52-5224914e10b7b5eacd09bb21ab53a674.seminal.ml
    - type mismatch in result of match, () vs string
    - value is discarded though (with ;) so it can't go wrong

[ ] a few concrete examples of programs that crash at ML level

[ ] add extra language features for seminal benchmarks

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
  - ml exceptions are uninteresting, they don't signify a type error
    - don't kill test harness on first MLException
      - may only be thrown on a particular branch
    - keep log of tests that threw MLException
      - may indicate that type error is unreachable
  


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
