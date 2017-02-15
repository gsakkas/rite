
let rec digitsOfInt n =
  let return = [] in if n <> 0 then (n mod 10) digitsOfInt 0 else return;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n <> 0 then (n mod 10) :: return else return;;

*)

(* changed spans
(3,36)-(3,60)
(3,47)-(3,58)
(3,59)-(3,60)
*)

(* type error slice
(3,36)-(3,46)
(3,36)-(3,60)
*)
