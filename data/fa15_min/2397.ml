
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

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
      if h = (getHead (listReverse x))
      then matchHeads (getTail (listReverse t))
      else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let palindrome w = match explode w with | [] -> true | h::t -> true;;

*)

(* changed spans
(23,47)-(23,69)
true
LitG

*)

(* type error slice
(2,4)-(2,54)
(2,13)-(2,52)
(2,17)-(2,52)
(2,23)-(2,24)
(2,38)-(2,40)
(2,51)-(2,52)
(4,4)-(4,54)
(4,13)-(4,52)
(4,17)-(4,52)
(4,23)-(4,24)
(4,51)-(4,52)
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
(18,14)-(18,39)
(18,15)-(18,22)
(18,23)-(18,38)
(18,24)-(18,35)
(19,12)-(19,22)
(19,12)-(19,48)
(19,23)-(19,48)
(19,24)-(19,31)
(19,32)-(19,47)
(19,33)-(19,44)
(23,47)-(23,57)
(23,47)-(23,69)
(23,58)-(23,69)
(23,59)-(23,66)
*)
