
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
(14,61)-(14,62)
*)

(* type error slice
(9,4)-(12,9)
(9,13)-(12,7)
(10,3)-(12,7)
(11,45)-(11,50)
(11,45)-(11,50)
(11,45)-(11,65)
(11,45)-(11,65)
(11,56)-(11,58)
(11,56)-(11,65)
(12,3)-(12,5)
(12,3)-(12,7)
(14,23)-(14,77)
(14,23)-(14,77)
(14,23)-(14,77)
(14,23)-(14,77)
(14,45)-(14,49)
(14,45)-(14,49)
(14,46)-(14,48)
(14,60)-(14,63)
(14,60)-(14,63)
(14,60)-(14,77)
(14,61)-(14,62)
(14,64)-(14,65)
(14,67)-(14,75)
(14,67)-(14,77)
(14,76)-(14,77)
(25,25)-(25,33)
(25,25)-(25,44)
(25,35)-(25,42)
(25,35)-(25,44)
*)
