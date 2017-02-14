
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads (x,y) =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead y)
      then matchHeads (t, (getTail y))
      else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;


(* fix

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

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads [["b"]];;

*)

(* changed spans
(6,12)-(9,6)
(7,2)-(9,6)
(11,20)-(17,16)
(15,32)-(15,33)
(16,11)-(16,21)
(16,22)-(16,38)
(16,23)-(16,24)
(16,35)-(16,36)
(17,11)-(17,16)
(20,2)-(20,68)
(20,8)-(20,15)
(20,8)-(20,17)
(20,16)-(20,17)
(20,31)-(20,35)
(20,46)-(20,56)
(20,46)-(20,68)
(20,57)-(20,68)
(20,58)-(20,65)
(20,66)-(20,67)
*)

(* type error slice
(6,3)-(9,8)
(6,12)-(9,6)
(7,2)-(9,6)
(8,43)-(8,66)
(8,54)-(8,66)
(8,55)-(8,57)
(9,2)-(9,4)
(9,2)-(9,6)
(16,11)-(16,21)
(16,11)-(16,38)
(16,22)-(16,38)
(20,46)-(20,56)
(20,46)-(20,68)
(20,57)-(20,68)
(20,58)-(20,65)
*)
