
let rec digitsOfInt n =
  let ns = [] in match n with | n -> (List.hd (n mod 10)) :: ns;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | n -> digitsOfInt (n - (List.hd ((n mod 10) :: ns)));;

*)

(* changed spans
(3,37)-(3,63)
(3,38)-(3,45)
(3,46)-(3,56)
*)

(* type error slice
(3,37)-(3,57)
(3,38)-(3,45)
(3,46)-(3,56)
*)

(* all spans
(2,20)-(3,63)
(3,2)-(3,63)
(3,11)-(3,13)
(3,17)-(3,63)
(3,23)-(3,24)
(3,37)-(3,63)
(3,37)-(3,57)
(3,38)-(3,45)
(3,46)-(3,56)
(3,47)-(3,48)
(3,53)-(3,55)
(3,61)-(3,63)
*)
