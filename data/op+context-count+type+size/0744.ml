
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
(2,16)-(2,67)
(2,20)-(2,67)
(2,26)-(2,27)
(2,41)-(2,43)
(2,54)-(2,55)
(2,54)-(2,67)
(2,56)-(2,57)
(2,59)-(2,65)
(2,59)-(2,67)
(2,66)-(2,67)
*)

(* type error slice
(2,20)-(2,67)
(2,59)-(2,65)
(2,59)-(2,67)
(2,66)-(2,67)
(4,4)-(7,9)
(4,13)-(7,7)
(5,3)-(7,7)
(6,14)-(6,27)
(6,14)-(6,29)
(6,28)-(6,29)
(6,56)-(6,58)
(6,56)-(6,65)
(6,60)-(6,65)
(7,3)-(7,5)
(7,3)-(7,7)
(7,6)-(7,7)
(10,3)-(10,58)
(10,38)-(10,49)
(10,38)-(10,51)
(10,50)-(10,51)
(12,21)-(12,27)
(12,21)-(12,51)
(12,29)-(12,40)
(12,29)-(12,51)
(12,42)-(12,49)
(12,42)-(12,51)
(12,50)-(12,51)
*)
