
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = b in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = ((f b), ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(6,35)-(6,36)
(f b , f b = b)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* type error slice
(3,3)-(4,69)
(3,13)-(3,14)
(3,13)-(3,16)
(4,3)-(4,69)
(4,9)-(4,12)
(4,43)-(4,49)
(4,43)-(4,56)
(4,50)-(4,56)
(4,51)-(4,52)
(4,54)-(4,55)
(6,22)-(6,56)
(6,31)-(6,36)
(6,35)-(6,36)
(6,40)-(6,46)
(6,40)-(6,56)
(6,47)-(6,56)
(6,48)-(6,52)
(6,54)-(6,55)
*)
