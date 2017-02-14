
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
(6,12)-(9,6)
(7,2)-(9,6)
(11,20)-(12,57)
(12,2)-(12,57)
(12,8)-(12,9)
(12,23)-(12,25)
(12,36)-(12,51)
(12,36)-(12,57)
(12,37)-(12,48)
(12,49)-(12,50)
(12,52)-(12,53)
(12,54)-(12,57)
(12,55)-(12,56)
(14,20)-(20,16)
(18,32)-(18,33)
(19,11)-(19,21)
(19,22)-(19,38)
(19,23)-(19,24)
(19,35)-(19,36)
(20,11)-(20,16)
(25,12)-(25,22)
(25,12)-(25,74)
(25,24)-(25,35)
(25,36)-(25,47)
(25,37)-(25,44)
(25,45)-(25,46)
(25,49)-(25,74)
*)

(* type error slice
(18,6)-(20,16)
(18,6)-(20,16)
(19,11)-(19,21)
(19,11)-(19,38)
(20,11)-(20,16)
(25,12)-(25,22)
(25,12)-(25,74)
*)
