
let helper f b = if (f b) = b then true else false;;

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;


(* fix

let helper f b = if (f b) = b then (true, b) else (false, (f b));;

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((helper f), b);;

*)

(* changed spans
(2,36)-(2,40)
(true , b)
TupleG (fromList [VarG,LitG])

(2,46)-(2,51)
(false , f b)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(7,38)-(7,44)
f
VarG

*)

(* type error slice
(2,4)-(2,53)
(2,12)-(2,51)
(2,21)-(2,26)
(2,22)-(2,23)
(7,30)-(7,45)
(7,31)-(7,37)
(7,38)-(7,44)
*)
