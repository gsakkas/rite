
let rec digitsOfInt n =
  let return = [] in if n <> 0 then (n mod 10) digitsOfInt 0 else return;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n <> 0 then (n mod 10) :: return else return;;

*)

(* changed spans
(3,38)-(3,61)
(3,48)-(3,59)
(3,60)-(3,61)
*)

(* type error slice
(3,38)-(3,46)
(3,38)-(3,61)
*)
