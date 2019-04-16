
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n / 10 with | 0 -> [0] | _ -> digitsOfInt n []);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (match n / 10 with | 0 -> [0] | _ -> digitsOfInt n);;

*)

(* changed spans
(5,45)-(5,61)
digitsOfInt n
AppG (fromList [VarG])

*)

(* type error slice
(2,4)-(5,64)
(2,21)-(5,62)
(3,3)-(5,62)
(5,8)-(5,62)
(5,45)-(5,56)
(5,45)-(5,61)
*)
