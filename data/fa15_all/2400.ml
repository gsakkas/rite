
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
[h]
ListG (fromList [VarG])

*)

(* type error slice
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
(14,23)-(14,78)
(14,45)-(14,49)
(14,46)-(14,48)
(14,60)-(14,63)
(14,60)-(14,78)
(14,61)-(14,62)
(14,64)-(14,65)
(14,66)-(14,78)
(14,67)-(14,75)
(14,76)-(14,77)
(25,24)-(25,46)
(25,25)-(25,33)
(25,34)-(25,45)
(25,35)-(25,42)
*)
