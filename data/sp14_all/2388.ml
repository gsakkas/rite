
let rec digitsOfInt n =
  let rec digitsOfIntHelper n result =
    if n > 0
    then (digitsOfIntHelper (n / 10) (n mod 10)) :: result
    else result in
  digitsOfIntHelper n [];;


(* fix

let rec digitsOfInt n =
  let rec digitsOfIntHelper n result =
    if n > 0
    then digitsOfIntHelper (n / 10) ((n mod 10) :: result)
    else result in
  digitsOfIntHelper n [];;

*)

(* changed spans
(5,10)-(5,59)
digitsOfIntHelper (n / 10)
                  ((n mod 10) :: result)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* type error slice
(3,3)-(7,25)
(3,29)-(6,16)
(3,31)-(6,16)
(5,10)-(5,49)
(5,10)-(5,59)
(5,11)-(5,28)
(5,38)-(5,48)
(5,53)-(5,59)
(7,3)-(7,20)
(7,3)-(7,25)
(7,23)-(7,25)
*)
