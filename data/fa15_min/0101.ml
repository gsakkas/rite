
let rec digitsOfInt n =
  let return = [] in if n < 0 then return else return :: 1;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else 1 :: return;;

*)

(* changed spans
(3,48)-(3,54)
1
LitG

(3,58)-(3,59)
return
VarG

*)

(* type error slice
(3,22)-(3,59)
(3,36)-(3,42)
(3,48)-(3,54)
(3,48)-(3,59)
(3,58)-(3,59)
*)
