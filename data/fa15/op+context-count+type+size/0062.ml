
let rec digitsOfInt n =
  let return = [] in if n = 0 then return else print_int n; digitsOfInt 0;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n = 0 then return else digitsOfInt 0;;

*)

(* changed spans
(3,21)-(3,73)
(3,47)-(3,56)
(3,57)-(3,58)
(3,60)-(3,73)
*)

(* type error slice
(3,2)-(3,73)
(3,15)-(3,17)
(3,21)-(3,58)
(3,21)-(3,58)
(3,21)-(3,73)
(3,35)-(3,41)
(3,47)-(3,56)
(3,47)-(3,58)
*)
