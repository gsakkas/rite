
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
(6,13)-(9,7)
(7,3)-(9,7)
(11,21)-(17,17)
(15,33)-(15,34)
(16,12)-(16,22)
(16,24)-(16,25)
(16,24)-(16,37)
(16,36)-(16,37)
(17,12)-(17,17)
(20,3)-(20,68)
(20,9)-(20,16)
(20,9)-(20,18)
(20,17)-(20,18)
(20,32)-(20,36)
(20,47)-(20,57)
(20,47)-(20,68)
(20,59)-(20,66)
(20,59)-(20,68)
(20,67)-(20,68)
*)

(* type error slice
(6,4)-(9,9)
(6,13)-(9,7)
(7,3)-(9,7)
(8,45)-(8,65)
(8,56)-(8,58)
(8,56)-(8,65)
(9,3)-(9,5)
(9,3)-(9,7)
(16,12)-(16,22)
(16,12)-(16,37)
(16,24)-(16,37)
(20,47)-(20,57)
(20,47)-(20,68)
(20,59)-(20,66)
(20,59)-(20,68)
*)
