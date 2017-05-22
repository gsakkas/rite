
let rec digitsOfInt n =
  let return = [] in if n != 0 then (n mod 10) digitsOfInt 0 else return;;


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

(* all spans
(2,20)-(3,72)
(3,2)-(3,72)
(3,15)-(3,17)
(3,21)-(3,72)
(3,24)-(3,30)
(3,24)-(3,25)
(3,29)-(3,30)
(3,36)-(3,60)
(3,36)-(3,46)
(3,37)-(3,38)
(3,43)-(3,45)
(3,47)-(3,58)
(3,59)-(3,60)
(3,66)-(3,72)
*)
