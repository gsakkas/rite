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

- extend interpreter with "fail safe"
  - when program would go wrong, e.g. int + bool
  - just return one, e.g. int
  - count number of places where program goes wrong picking one vs other

- from symptom to cause
  - simplify counterexample trace

- collect sample outputs to webpage (with trace)

- look at physical subtyping
  - (similar to soft typing)
  - also discriminative union types

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
