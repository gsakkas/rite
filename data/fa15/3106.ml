
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((not f), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = if (f b) = b then (b, false) else ((f b), true) in
  wwhile (helper, b);;

*)

(* changed spans
(4,22)-(4,41)
let helper =
  fun b ->
    if f b = b
    then (b , false)
    else (f b , true) in
wwhile (helper , b)
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (AppG [EmptyG])

*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(4,22)-(4,28)
(4,22)-(4,41)
(4,29)-(4,41)
(4,30)-(4,37)
(4,31)-(4,34)
*)
