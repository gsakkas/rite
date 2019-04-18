
let rec wwhile (f,b) =
  let x = f b in
  match x with | h::t -> if t = false then h else wwhile (f, h);;


(* fix

let rec wwhile (f,b) =
  let x = f b in
  match x with | (x,y) -> if y = false then x else wwhile (f, x);;

*)

(* changed spans
(4,3)-(4,64)
match x with
| (x , y) -> if y = false
             then x
             else wwhile (f , x)
CaseG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* type error slice
(4,3)-(4,64)
(4,29)-(4,30)
(4,29)-(4,38)
(4,33)-(4,38)
*)
