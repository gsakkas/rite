
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
(4,5)-(4,68)
if a = 0
then b
else integers (a / 10)
              ((a mod 10) :: b)
IteG (BopG EmptyG EmptyG) VarG (AppG (fromList [EmptyG]))

*)

(* type error slice
(4,5)-(4,68)
(4,11)-(4,12)
(4,52)-(4,62)
(4,53)-(4,54)
*)
