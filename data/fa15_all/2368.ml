
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let cutTail z = match listReverse z with | [] -> [] | h::t -> t;;

let getHeads x = match listReverse x with | [] -> [] | h::t -> h;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads y =
  match y with
  | [] -> true
  | h::t -> if h = (getHeads t) then matchHeads (cutTail t) else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match explode x with | h::t -> false;;

let palindrome w = match explode w with | [] -> true | h::t -> matchHeads w;;

*)

(* changed spans
(14,20)-(17,71)
fun x ->
  match explode x with
  | h :: t -> false
LamG VarPatG (CaseG EmptyG [(EmptyPatG,Nothing,EmptyG)])

(20,58)-(20,69)
w
VarG

*)

(* type error slice
(5,4)-(5,66)
(5,13)-(5,64)
(5,17)-(5,64)
(5,23)-(5,34)
(5,23)-(5,36)
(5,63)-(5,64)
(7,18)-(7,65)
(7,24)-(7,35)
(7,24)-(7,37)
(7,51)-(7,53)
(7,64)-(7,65)
(9,4)-(12,9)
(9,13)-(12,7)
(10,3)-(12,7)
(11,44)-(11,51)
(11,44)-(11,67)
(11,45)-(11,50)
(11,55)-(11,67)
(11,56)-(11,58)
(12,3)-(12,5)
(12,3)-(12,7)
(17,38)-(17,48)
(17,38)-(17,60)
(17,49)-(17,60)
(17,50)-(17,57)
(20,47)-(20,57)
(20,47)-(20,69)
(20,58)-(20,69)
(20,59)-(20,66)
*)
