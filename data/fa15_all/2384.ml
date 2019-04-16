
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
      if (getHead x) = (getHead (listReverse x))
      then matchHeads (getTail (listReverse t))
      else false;;

let palindrome w = match explode w with | [] -> true | h::t -> matchHeads t;;


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
(18,7)-(20,17)
false
LitG

(22,75)-(22,76)
explode w
AppG (fromList [VarG])

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
(18,10)-(18,21)
(18,11)-(18,18)
(18,19)-(18,20)
(18,33)-(18,48)
(18,34)-(18,45)
(18,46)-(18,47)
(19,12)-(19,22)
(19,12)-(19,48)
(19,23)-(19,48)
(19,24)-(19,31)
(19,32)-(19,47)
(19,33)-(19,44)
(22,20)-(22,76)
(22,26)-(22,33)
(22,26)-(22,35)
(22,64)-(22,74)
(22,64)-(22,76)
(22,75)-(22,76)
*)
