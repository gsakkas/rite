
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listList xs = match xs with | [] -> [[]] | h::t -> [h] @ (listList t);;

let rec matchHeads x =
  match x with
  | [] -> true
  | h::t ->
      if h = (getHead t) then matchHeads (getTail (listReverse t)) else false;;

let palindrome w =
  match explode w with
  | [] -> true
  | h::t -> matchHeads (listList (explode w));;


(* fix

let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listList xs =
  match xs with | [] -> [[]] | h::t -> [[h]] @ (listList t);;

let rec matchHeads x =
  match x with
  | [] -> true
  | h::t ->
      if h = (getHead t) then matchHeads (getTail (listReverse t)) else false;;

let palindrome w =
  match explode w with
  | [] -> true
  | h::t -> matchHeads (listList (explode w));;

*)

(* changed spans
(14,60)-(14,61)
*)

(* type error slice
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
(14,22)-(14,77)
(14,22)-(14,77)
(14,22)-(14,77)
(14,22)-(14,77)
(14,44)-(14,48)
(14,44)-(14,48)
(14,45)-(14,47)
(14,59)-(14,62)
(14,59)-(14,62)
(14,59)-(14,77)
(14,60)-(14,61)
(14,63)-(14,64)
(14,65)-(14,77)
(14,66)-(14,74)
(14,75)-(14,76)
(25,23)-(25,45)
(25,24)-(25,32)
(25,33)-(25,44)
(25,34)-(25,41)
*)
