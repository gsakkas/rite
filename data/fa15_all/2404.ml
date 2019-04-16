
let getHead y = match y with | [] -> "u" | h::t -> h;;

let getTail i = match i with | [] -> [] | h::t -> t;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match x with
  | [] -> true
  | h::t ->
      if h = (getHead t) then matchHeads (getTail (listReverse t)) else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;


(* fix

let getHead y = match y with | [] -> 'u' | h::t -> h;;

let getTail i = match i with | [] -> [] | h::t -> t;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match x with
  | [] -> true
  | h::t ->
      if h = (getHead t) then matchHeads (getTail (listReverse t)) else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;

*)

(* changed spans
(2,38)-(2,41)
'u'
LitG

*)

(* type error slice
(2,4)-(2,55)
(2,13)-(2,53)
(2,17)-(2,53)
(2,23)-(2,24)
(2,38)-(2,41)
(2,52)-(2,53)
(4,4)-(4,54)
(4,13)-(4,52)
(4,17)-(4,52)
(4,23)-(4,24)
(4,51)-(4,52)
(7,3)-(7,58)
(7,37)-(7,52)
(7,37)-(7,58)
(7,38)-(7,49)
(7,50)-(7,51)
(7,53)-(7,54)
(7,55)-(7,58)
(7,56)-(7,57)
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
(18,14)-(18,25)
(18,15)-(18,22)
(18,23)-(18,24)
(18,31)-(18,41)
(18,31)-(18,67)
(18,42)-(18,67)
(18,43)-(18,50)
(18,51)-(18,66)
(18,52)-(18,63)
(18,64)-(18,65)
(21,47)-(21,57)
(21,47)-(21,69)
(21,58)-(21,69)
(21,59)-(21,66)
*)
