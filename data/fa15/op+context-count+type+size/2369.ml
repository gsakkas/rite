
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
(2,13)-(2,52)
(2,17)-(2,52)
(2,23)-(2,24)
(2,38)-(2,40)
(2,51)-(2,52)
(5,3)-(7,7)
(9,13)-(9,52)
(9,23)-(9,24)
(9,38)-(9,40)
(9,51)-(9,52)
(11,21)-(12,58)
(12,3)-(12,58)
(12,9)-(12,10)
(12,24)-(12,26)
(12,38)-(12,58)
(12,53)-(12,54)
(12,55)-(12,58)
(14,20)-(20,17)
(22,16)-(25,56)
*)

(* type error slice
(2,4)-(2,54)
(2,13)-(2,52)
(2,17)-(2,52)
(2,17)-(2,52)
(2,17)-(2,52)
(2,17)-(2,52)
(2,23)-(2,24)
(2,38)-(2,40)
(2,51)-(2,52)
(4,4)-(7,9)
(4,13)-(7,7)
(5,3)-(7,7)
(6,45)-(6,50)
(6,45)-(6,50)
(6,45)-(6,65)
(6,45)-(6,65)
(6,56)-(6,58)
(6,56)-(6,65)
(7,3)-(7,5)
(7,3)-(7,7)
(18,11)-(18,18)
(18,11)-(18,20)
(18,19)-(18,20)
(18,34)-(18,45)
(18,34)-(18,47)
(18,46)-(18,47)
(25,34)-(25,45)
(25,34)-(25,56)
(25,47)-(25,54)
(25,47)-(25,56)
*)
