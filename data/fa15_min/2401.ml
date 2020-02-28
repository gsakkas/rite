
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
(14,61)-(14,62)
[h]
ListG [VarG]

(23,68)-(23,69)
explode w
AppG [VarG]

*)

(* type error slice
(9,4)-(12,9)
(9,13)-(12,7)
(11,13)-(11,30)
(11,14)-(11,27)
(11,28)-(11,29)
(14,23)-(14,78)
(14,66)-(14,78)
(14,67)-(14,75)
(14,76)-(14,77)
(23,9)-(23,16)
(23,9)-(23,18)
(23,17)-(23,18)
(23,58)-(23,70)
(23,59)-(23,67)
(23,68)-(23,69)
*)
