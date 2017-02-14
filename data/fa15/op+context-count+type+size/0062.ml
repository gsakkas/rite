
let rec digitsOfInt n =
  let return = [] in if n = 0 then return else print_int n; digitsOfInt 0;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n = 0 then return else digitsOfInt 0;;

*)

(* changed spans
(3,22)-(3,74)
(3,48)-(3,57)
(3,58)-(3,59)
(3,61)-(3,74)
*)

(* type error slice
(3,3)-(3,74)
(3,16)-(3,18)
(3,22)-(3,59)
(3,22)-(3,59)
(3,22)-(3,74)
(3,36)-(3,42)
(3,48)-(3,57)
(3,48)-(3,59)
*)
