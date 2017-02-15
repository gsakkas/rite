
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
  match explode w with | [] -> true | h::t -> matchHeads (listList w);;


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
(23,67)-(23,68)
*)

(* type error slice
(9,3)-(12,8)
(9,12)-(12,6)
(11,12)-(11,29)
(11,13)-(11,26)
(11,27)-(11,28)
(14,22)-(14,77)
(14,22)-(14,77)
(14,22)-(14,77)
(14,22)-(14,77)
(14,65)-(14,77)
(14,66)-(14,74)
(14,75)-(14,76)
(23,8)-(23,15)
(23,8)-(23,17)
(23,16)-(23,17)
(23,57)-(23,69)
(23,58)-(23,66)
(23,67)-(23,68)
*)
