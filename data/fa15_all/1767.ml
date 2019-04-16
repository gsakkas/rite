
let helper f b = if (f b) = b then true else false;;

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((helper f b), b);;


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

(7,30)-(7,42)
helper f
AppG (fromList [VarG])

*)

(* type error slice
(2,4)-(2,53)
(2,12)-(2,51)
(2,14)-(2,51)
(2,18)-(2,51)
(2,46)-(2,51)
(5,17)-(5,18)
(5,17)-(5,20)
(5,42)-(5,48)
(5,42)-(5,56)
(5,49)-(5,56)
(5,50)-(5,51)
(7,22)-(7,28)
(7,22)-(7,46)
(7,29)-(7,46)
(7,30)-(7,42)
(7,31)-(7,37)
*)
