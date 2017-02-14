
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let palindrome w = if w = (explode w) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l = List.rev l;;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;

*)

(* changed spans
(7,16)-(7,59)
(7,23)-(7,24)
(7,44)-(7,48)
*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(3,3)-(5,7)
(4,14)-(4,27)
(4,14)-(4,29)
(4,28)-(4,29)
(4,45)-(4,65)
(4,56)-(4,58)
(4,56)-(4,65)
(5,3)-(5,5)
(5,3)-(5,7)
(7,23)-(7,24)
(7,23)-(7,37)
(7,23)-(7,37)
(7,28)-(7,35)
(7,28)-(7,37)
(7,36)-(7,37)
*)
