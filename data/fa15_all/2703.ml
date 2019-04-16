
let rec wwhile (f,b) =
  let x = f b in match x with | h::t -> if t = true then wwhile (f, h) else h;;


(* fix

let rec wwhile (f,b) =
  let x = f b in
  match x with | (x,y) -> if y = false then x else wwhile (f, x);;

*)

(* changed spans
(3,18)-(3,78)
match x with
| (x , y) -> if y = false
             then x
             else wwhile (f , x)
CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* type error slice
(3,18)-(3,78)
(3,44)-(3,45)
(3,44)-(3,52)
(3,48)-(3,52)
*)
