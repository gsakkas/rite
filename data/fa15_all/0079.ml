
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let result = f b in if result = b then b else wwhile (f, b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let foo b =
    let result = f b in
    if result = b then (result, false) else (result, true) in
  wwhile (foo, b);;

*)

(* changed spans
(5,3)-(5,62)
let foo =
  fun b ->
    (let result = f b in
     if result = b
     then (result , false)
     else (result , true)) in
wwhile (foo , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,24)-(2,78)
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(2,67)-(2,69)
(5,3)-(5,62)
(5,16)-(5,17)
(5,16)-(5,19)
(5,26)-(5,32)
(5,26)-(5,36)
(5,35)-(5,36)
(5,49)-(5,55)
(5,49)-(5,62)
(5,56)-(5,62)
(5,57)-(5,58)
(5,60)-(5,61)
*)
