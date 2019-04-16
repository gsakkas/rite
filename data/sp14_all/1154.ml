
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let a = n / 10 in
     let b = n mod 10 in let c = [a; b] in if a > 9 then (digitsOfInt a) :: c);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let a = n / 10 in
     let b = n mod 10 in
     let c = [a; b] in if a < 10 then c else digitsOfInt (a / 10));;

*)

(* changed spans
(7,47)-(7,52)
a < 10
BopG VarG LitG

(7,58)-(7,78)
c
VarG

(7,78)-(7,78)
digitsOfInt (a / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(7,44)-(7,78)
(7,58)-(7,78)
(7,78)-(7,78)
*)
