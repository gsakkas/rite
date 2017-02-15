
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
(3,2)-(5,14)
(3,19)-(4,60)
(5,2)-(5,10)
(5,11)-(5,12)
(5,13)-(5,14)
*)

(* type error slice
(4,25)-(4,33)
(4,25)-(4,60)
(4,43)-(4,60)
(5,2)-(5,10)
(5,2)-(5,14)
(5,13)-(5,14)
*)
