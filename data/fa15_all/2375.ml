
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
(13,9)-(13,18)
x
VarG

(15,20)-(15,31)
x
VarG

(17,39)-(17,43)
matchHeads (loseTail t)
AppG [AppG [EmptyG]]

*)

(* type error slice
(7,4)-(10,9)
(7,13)-(10,7)
(8,3)-(10,7)
(9,13)-(9,30)
(9,14)-(9,27)
(9,28)-(9,29)
(9,44)-(9,67)
(9,55)-(9,67)
(9,56)-(9,58)
(10,3)-(10,5)
(10,3)-(10,7)
(12,4)-(17,56)
(12,20)-(17,54)
(13,9)-(13,16)
(13,9)-(13,18)
(13,17)-(13,18)
(20,47)-(20,57)
(20,47)-(20,69)
(20,58)-(20,69)
(20,59)-(20,66)
*)
