
let rec concat w = match w with | [] -> "" | h::t -> h ^ (concat t);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (concat (listReverse (explode w))) == w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (listReverse (explode w)) == (explode w);;

*)

(* changed spans
(12,20)-(12,54)
listReverse (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

(12,58)-(12,59)
explode w
AppG (fromList [VarG])

*)

(* type error slice
(2,20)-(2,68)
(2,54)-(2,55)
(2,54)-(2,68)
(2,56)-(2,57)
(2,58)-(2,68)
(2,59)-(2,65)
(2,66)-(2,67)
(4,4)-(7,9)
(4,13)-(7,7)
(5,3)-(7,7)
(6,44)-(6,51)
(6,44)-(6,67)
(6,45)-(6,50)
(6,55)-(6,67)
(6,56)-(6,58)
(7,3)-(7,5)
(7,3)-(7,7)
(10,3)-(10,58)
(10,37)-(10,52)
(10,37)-(10,58)
(10,38)-(10,49)
(10,50)-(10,51)
(10,53)-(10,54)
(10,55)-(10,58)
(10,56)-(10,57)
(12,20)-(12,54)
(12,21)-(12,27)
(12,28)-(12,53)
(12,29)-(12,40)
(12,41)-(12,52)
(12,42)-(12,49)
*)
