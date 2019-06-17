
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

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
  | h::t -> matchHeads (listReverse (explode w));;


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

(25,24)-(25,49)
explode w
AppG [VarG]

*)

(* type error slice
(2,4)-(2,54)
(2,13)-(2,52)
(2,17)-(2,52)
(2,23)-(2,24)
(2,38)-(2,40)
(2,51)-(2,52)
(6,4)-(9,9)
(6,13)-(9,7)
(7,3)-(9,7)
(8,44)-(8,51)
(8,44)-(8,67)
(8,45)-(8,50)
(8,55)-(8,67)
(8,56)-(8,58)
(9,3)-(9,5)
(9,3)-(9,7)
(18,10)-(18,21)
(18,11)-(18,18)
(18,19)-(18,20)
(18,33)-(18,48)
(18,34)-(18,45)
(18,46)-(18,47)
(25,24)-(25,49)
(25,25)-(25,36)
(25,37)-(25,48)
(25,38)-(25,45)
*)
