
let rec digitsOfInt n =
  let ns = [] in match n with | n -> (List.hd (n mod 10)) :: ns;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | n -> digitsOfInt (n - (List.hd ((n mod 10) :: ns)));;

*)

(* changed spans
(3,39)-(3,46)
(3,39)-(3,64)
(3,48)-(3,49)
(3,48)-(3,56)
(3,54)-(3,56)
*)

(* type error slice
(3,39)-(3,46)
(3,39)-(3,56)
(3,48)-(3,56)
*)
