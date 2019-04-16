
let rec append first second =
  match first with | [] -> second | h::t -> h :: (append t second);;

let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else append ((digitsOfInt (n / 10)) [n mod 10]);;


(* fix

let rec append first second =
  match first with | [] -> second | h::t -> h :: (append t second);;

let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(8,30)-(8,72)
append (digitsOfInt (n / 10))
       [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(3,50)-(3,67)
(3,51)-(3,57)
(8,8)-(8,72)
(8,22)-(8,24)
(8,30)-(8,36)
(8,30)-(8,72)
*)
