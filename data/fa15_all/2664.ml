
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f' b = (f b) = b in wwhile (f', b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = if (f b) = b then (true, (f b)) else (false, (f b)) in
  wwhile (helper, b);;

*)

(* changed spans
(4,22)-(4,60)
let helper =
  fun b ->
    if f b = b
    then (true , f b)
    else (false , f b) in
wwhile (helper , b)
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
(4,22)-(4,60)
(4,29)-(4,42)
(4,33)-(4,42)
(4,46)-(4,52)
(4,46)-(4,60)
(4,53)-(4,60)
(4,54)-(4,56)
*)
