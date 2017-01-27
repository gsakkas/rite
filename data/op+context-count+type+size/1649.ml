
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l = List.rev l;;

let palindrome w = if (explode w) = (listReverse w) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l = List.rev l;;

let palindrome w =
  let explosion = explode w in
  if explosion = (listReverse explosion) then true else false;;

*)

(* changed spans
(9,20)-(9,73)
(9,24)-(9,51)
(9,38)-(9,51)
(9,50)-(9,51)
*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(3,3)-(5,7)
(4,14)-(4,27)
(4,14)-(4,29)
(4,28)-(4,29)
(4,56)-(4,58)
(4,56)-(4,65)
(4,60)-(4,65)
(5,3)-(5,5)
(5,3)-(5,7)
(5,6)-(5,7)
(7,4)-(7,37)
(7,21)-(7,35)
(7,25)-(7,33)
(7,25)-(7,35)
(7,34)-(7,35)
(9,24)-(9,31)
(9,24)-(9,33)
(9,32)-(9,33)
(9,38)-(9,49)
(9,38)-(9,51)
(9,50)-(9,51)
*)
