
let rec digitsOfInt n =
  let rec integers a b =
    match a with | [] -> b | x::xs -> integers xs ((a mod 10) :: b) in
  integers n [];;


(* fix

let rec digitsOfInt n =
  let rec integers a b =
    if a = 0 then b else integers (a / 10) ((a mod 10) :: b) in
  integers n [];;

*)

(* changed spans
(4,4)-(4,67)
(4,10)-(4,11)
(4,25)-(4,26)
(4,47)-(4,49)
(4,50)-(4,67)
*)

(* type error slice
(4,4)-(4,67)
(4,10)-(4,11)
(4,51)-(4,61)
(4,52)-(4,53)
*)

(* all spans
(2,20)-(5,15)
(3,2)-(5,15)
(3,19)-(4,67)
(3,21)-(4,67)
(4,4)-(4,67)
(4,10)-(4,11)
(4,25)-(4,26)
(4,38)-(4,67)
(4,38)-(4,46)
(4,47)-(4,49)
(4,50)-(4,67)
(4,51)-(4,61)
(4,52)-(4,53)
(4,58)-(4,60)
(4,65)-(4,66)
(5,2)-(5,15)
(5,2)-(5,10)
(5,11)-(5,12)
(5,13)-(5,15)
*)
