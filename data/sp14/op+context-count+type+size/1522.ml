
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
(5,2)-(5,10)
(5,11)-(5,12)
(5,13)-(5,15)
*)

(* type error slice
(4,4)-(4,67)
(4,4)-(4,67)
(4,4)-(4,67)
(4,4)-(4,67)
(4,10)-(4,11)
(4,51)-(4,61)
(4,52)-(4,53)
*)
