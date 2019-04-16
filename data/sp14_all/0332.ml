
let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  wwhile ((if b = (f b) then (b, false) else ((f b), true)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  let helper x = if x = (f x) then (x, false) else ((f x), true) in
  wwhile (helper, b);;

*)

(* changed spans
(6,3)-(6,64)
let helper =
  fun x ->
    if x = f x
    then (x , false)
    else (f x , true) in
wwhile (helper , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,33)-(3,39)
(3,33)-(3,46)
(3,40)-(3,46)
(3,41)-(3,42)
(6,3)-(6,9)
(6,3)-(6,64)
(6,10)-(6,64)
(6,11)-(6,60)
(6,46)-(6,59)
*)
