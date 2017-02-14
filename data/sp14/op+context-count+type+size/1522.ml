
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
(4,5)-(4,67)
(4,11)-(4,12)
(4,26)-(4,27)
(4,48)-(4,50)
(4,53)-(4,67)
(5,3)-(5,11)
(5,12)-(5,13)
(5,14)-(5,16)
*)

(* type error slice
(4,5)-(4,67)
(4,5)-(4,67)
(4,5)-(4,67)
(4,5)-(4,67)
(4,11)-(4,12)
(4,53)-(4,54)
(4,53)-(4,61)
*)
