
let rec digitsOfInt n =
  let rec integers a b =
    if a = 0 then b else integers (a / 10) ((a mod 10) :: b) in
  integers n 0;;


(* fix

let rec digitsOfInt n =
  if n = 0
  then [0]
  else
    (let rec integers a b =
       if a = 0 then b else integers (a / 10) ((a mod 10) :: b) in
     integers n []);;

*)

(* changed spans
(3,3)-(5,15)
(5,3)-(5,11)
(5,12)-(5,13)
(5,14)-(5,15)
*)

(* type error slice
(4,26)-(4,34)
(4,26)-(4,60)
(4,36)-(4,42)
(4,46)-(4,60)
(5,3)-(5,11)
(5,3)-(5,15)
(5,12)-(5,13)
(5,14)-(5,15)
*)
