
let getHead h = match h with | [] -> [] | h::t -> h;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec matchHeads x =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead (listReverse x))
      then matchHeads (getTail (listReverse t))
      else false;;

let palindrome w =
  match explode w with
  | [] -> true
  | h::t -> matchHeads (getTail (listReverse (explode w)));;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match x with | [] -> true | h::t -> false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;

*)

(* changed spans
(2,12)-(2,51)
(2,16)-(2,51)
(2,22)-(2,23)
(2,37)-(2,39)
(2,50)-(2,51)
(5,2)-(7,6)
(9,12)-(9,51)
(9,22)-(9,23)
(9,37)-(9,39)
(9,50)-(9,51)
(11,20)-(12,57)
(12,2)-(12,57)
(12,8)-(12,9)
(12,23)-(12,25)
(12,36)-(12,57)
(12,52)-(12,53)
(12,54)-(12,57)
(14,19)-(20,16)
(22,15)-(25,58)
*)

(* type error slice
(2,3)-(2,53)
(2,12)-(2,51)
(2,16)-(2,51)
(2,16)-(2,51)
(2,16)-(2,51)
(2,16)-(2,51)
(2,22)-(2,23)
(2,37)-(2,39)
(2,50)-(2,51)
(4,3)-(7,8)
(4,12)-(7,6)
(5,2)-(7,6)
(6,43)-(6,50)
(6,43)-(6,66)
(6,43)-(6,66)
(6,44)-(6,49)
(6,54)-(6,66)
(6,55)-(6,57)
(7,2)-(7,4)
(7,2)-(7,6)
(18,9)-(18,20)
(18,10)-(18,17)
(18,18)-(18,19)
(18,32)-(18,47)
(18,33)-(18,44)
(18,45)-(18,46)
(25,32)-(25,57)
(25,33)-(25,44)
(25,45)-(25,56)
(25,46)-(25,53)
*)
