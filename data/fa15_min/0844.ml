
let checkSame (x,y) = x == y;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  if checkSame ((listReverse (explode w)), (explode w))
  then true
  else explode w;;


(* fix

let checkSame (x,y) = x == y;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  if checkSame ((listReverse (explode w)), (explode w)) then true else false;;

*)

(* changed spans
(15,8)-(15,17)
false
LitG

*)

(* type error slice
(4,4)-(7,9)
(4,13)-(7,7)
(5,3)-(7,7)
(6,44)-(6,67)
(6,55)-(6,67)
(6,56)-(6,58)
(7,3)-(7,5)
(7,3)-(7,7)
(13,3)-(15,17)
(14,8)-(14,12)
(15,8)-(15,15)
(15,8)-(15,17)
*)
