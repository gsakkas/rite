
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | [] -> [] | h::t -> h @ [digitsOfInt t]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else (match n with | 0 -> []);;

*)

(* changed spans
(5,8)-(5,63)
match n with
| 0 -> []
CaseG (fromList [(LitPatG,Nothing,ListG (fromList []))])

*)

(* type error slice
(3,6)-(3,7)
(3,6)-(3,11)
(3,10)-(3,11)
(5,8)-(5,63)
(5,15)-(5,16)
*)
