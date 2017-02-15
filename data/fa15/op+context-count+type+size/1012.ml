
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
(15,7)-(15,14)
(15,7)-(15,16)
(15,15)-(15,16)
*)

(* type error slice
(4,3)-(7,8)
(4,12)-(7,6)
(5,2)-(7,6)
(6,43)-(6,66)
(6,54)-(6,66)
(6,55)-(6,57)
(7,2)-(7,4)
(7,2)-(7,6)
(13,2)-(15,16)
(13,2)-(15,16)
(14,7)-(14,11)
(15,7)-(15,14)
(15,7)-(15,16)
*)
