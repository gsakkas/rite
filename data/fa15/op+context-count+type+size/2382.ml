
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
(2,37)-(2,40)
*)

(* type error slice
(2,3)-(2,54)
(2,12)-(2,52)
(2,16)-(2,52)
(2,16)-(2,52)
(2,16)-(2,52)
(2,16)-(2,52)
(2,22)-(2,23)
(2,37)-(2,40)
(2,51)-(2,52)
(4,3)-(4,53)
(4,12)-(4,51)
(4,16)-(4,51)
(4,16)-(4,51)
(4,16)-(4,51)
(4,22)-(4,23)
(4,50)-(4,51)
(7,2)-(7,57)
(7,2)-(7,57)
(7,36)-(7,51)
(7,36)-(7,57)
(7,37)-(7,48)
(7,49)-(7,50)
(7,52)-(7,53)
(7,54)-(7,57)
(7,54)-(7,57)
(7,55)-(7,56)
(9,3)-(12,8)
(9,12)-(12,6)
(10,2)-(12,6)
(11,43)-(11,50)
(11,43)-(11,66)
(11,43)-(11,66)
(11,44)-(11,49)
(11,54)-(11,66)
(11,55)-(11,57)
(12,2)-(12,4)
(12,2)-(12,6)
(18,13)-(18,24)
(18,14)-(18,21)
(18,22)-(18,23)
(18,30)-(18,40)
(18,30)-(18,66)
(18,41)-(18,66)
(18,42)-(18,49)
(18,50)-(18,65)
(18,51)-(18,62)
(18,63)-(18,64)
(21,46)-(21,56)
(21,46)-(21,68)
(21,57)-(21,68)
(21,58)-(21,65)
*)
