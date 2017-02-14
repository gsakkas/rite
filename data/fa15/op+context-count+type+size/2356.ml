
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let getHeads y = match listReverse y with | [] -> [] | h::t -> [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match explode x with
  | h::t ->
      if (getHeads (explode x)) = []
      then true
      else if [h] = (getHeads t) then true else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let getHeads y = match listReverse y with | [] -> [] | h::t -> [h];;

let loseTail z = match listReverse z with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match x with
  | h::t ->
      if (getHeads x) = []
      then true
      else if [h] = (getHeads t) then matchHeads (loseTail t) else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;

*)

(* changed spans
(7,12)-(10,6)
(8,2)-(10,6)
(13,8)-(13,15)
(13,8)-(13,17)
(15,19)-(15,30)
(15,20)-(15,27)
(17,38)-(17,42)
(17,48)-(17,53)
(20,46)-(20,56)
(20,57)-(20,68)
(20,58)-(20,65)
(20,66)-(20,67)
*)

(* type error slice
(7,3)-(10,8)
(7,12)-(10,6)
(8,2)-(10,6)
(9,12)-(9,29)
(9,13)-(9,26)
(9,27)-(9,28)
(9,43)-(9,66)
(9,54)-(9,66)
(9,55)-(9,57)
(10,2)-(10,4)
(10,2)-(10,6)
(12,3)-(17,55)
(12,19)-(17,53)
(13,8)-(13,15)
(13,8)-(13,17)
(13,16)-(13,17)
(20,46)-(20,56)
(20,46)-(20,68)
(20,57)-(20,68)
(20,58)-(20,65)
*)
