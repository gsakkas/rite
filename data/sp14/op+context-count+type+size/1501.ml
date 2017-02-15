
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
(9,19)-(9,72)
(9,22)-(9,51)
(9,36)-(9,51)
(9,49)-(9,50)
*)

(* type error slice
(2,3)-(5,8)
(2,12)-(5,6)
(4,12)-(4,29)
(4,13)-(4,26)
(4,27)-(4,28)
(7,3)-(7,36)
(7,20)-(7,34)
(7,24)-(7,32)
(7,24)-(7,34)
(7,33)-(7,34)
(9,22)-(9,33)
(9,23)-(9,30)
(9,31)-(9,32)
(9,36)-(9,51)
(9,37)-(9,48)
(9,49)-(9,50)
*)
