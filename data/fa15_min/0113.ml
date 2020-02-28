
let rec digitsOfInt n =
  let return = [] in
  if n <> 0 then (n mod 10) :: (return digitsOfInt 0) else return;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n <> 0 then (n mod 10) :: return else return;;

*)

(* changed spans
(4,32)-(4,54)
return
VarG

*)

(* type error slice
(3,3)-(4,66)
(3,16)-(3,18)
(4,32)-(4,54)
(4,33)-(4,39)
*)
