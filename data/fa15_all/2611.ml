
let rec clone x n =
  let acc = [] in if n > 0 then clone (x :: acc) (n - 1) else [];;


(* fix

let rec clone x n =
  let acc = [] in if n > 0 then clone (x @ acc) (n - 1) else [];;

*)

(* changed spans
(3,38)-(3,48)
x @ acc
AppG (fromList [VarG])

(3,39)-(3,40)
(@)
VarG

*)
