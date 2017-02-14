
let rec digitsOfInt n =
  let returnList = [] in
  if n < 0 then [] else returnList @ ((n mod 10) digitsOfInt (n /. 10));;


(* fix

let rec digitsOfInt n =
  let returnList = [] in if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(4,25)-(4,35)
(4,25)-(4,70)
(4,36)-(4,37)
(4,40)-(4,41)
(4,40)-(4,48)
(4,40)-(4,70)
(4,50)-(4,61)
(4,63)-(4,70)
*)

(* type error slice
(4,6)-(4,7)
(4,6)-(4,11)
(4,6)-(4,11)
(4,10)-(4,11)
(4,40)-(4,48)
(4,40)-(4,70)
(4,63)-(4,64)
(4,63)-(4,70)
(4,63)-(4,70)
(4,68)-(4,70)
*)
