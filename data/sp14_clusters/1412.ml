
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n / 10 with | 0 -> [0] | _ -> digitsOfInt n []);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (match n / 10 with | 0 -> [0] | _ -> digitsOfInt n);;

*)

(* changed spans
(5,44)-(5,60)
digitsOfInt n
AppG [VarG]

*)
