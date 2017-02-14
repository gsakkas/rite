
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec matchHeads (x,y) =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead y)
      then matchHeads (t, (getTail y))
      else false;;

let palindrome w =
  match explode w with
  | [] -> true
  | h::t -> matchHeads (listReverse (explode w)) (listReverse (explode w));;


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
(6,13)-(9,7)
(7,3)-(9,7)
(11,21)-(12,58)
(12,3)-(12,58)
(12,9)-(12,10)
(12,24)-(12,26)
(12,38)-(12,49)
(12,38)-(12,51)
(12,38)-(12,58)
(12,50)-(12,51)
(12,53)-(12,54)
(12,55)-(12,58)
(12,56)-(12,57)
(14,21)-(20,17)
(18,33)-(18,34)
(19,12)-(19,22)
(19,24)-(19,25)
(19,24)-(19,37)
(19,36)-(19,37)
(20,12)-(20,17)
(25,13)-(25,23)
(25,13)-(25,73)
(25,25)-(25,36)
(25,38)-(25,45)
(25,38)-(25,47)
(25,46)-(25,47)
(25,51)-(25,73)
*)

(* type error slice
(18,7)-(20,17)
(18,7)-(20,17)
(19,12)-(19,22)
(19,12)-(19,37)
(20,12)-(20,17)
(25,13)-(25,23)
(25,13)-(25,73)
*)
