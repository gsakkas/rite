
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec matchHeads x =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead (listReverse x))
      then matchHeads (getTail (listReverse t))
      else false;;

let palindrome w =
  match explode w with
  | [] -> true
  | h::t -> matchHeads (listReverse (explode w));;


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
(25,23)-(25,48)
(25,24)-(25,35)
(25,36)-(25,47)
(25,37)-(25,44)
(25,45)-(25,46)
*)

(* type error slice
(2,3)-(2,53)
(2,12)-(2,51)
(2,16)-(2,51)
(2,16)-(2,51)
(2,16)-(2,51)
(2,16)-(2,51)
(2,22)-(2,23)
(2,37)-(2,39)
(2,50)-(2,51)
(6,3)-(9,8)
(6,12)-(9,6)
(7,2)-(9,6)
(8,43)-(8,50)
(8,43)-(8,66)
(8,43)-(8,66)
(8,44)-(8,49)
(8,54)-(8,66)
(8,55)-(8,57)
(9,2)-(9,4)
(9,2)-(9,6)
(18,9)-(18,20)
(18,10)-(18,17)
(18,18)-(18,19)
(18,32)-(18,47)
(18,33)-(18,44)
(18,45)-(18,46)
(25,23)-(25,48)
(25,24)-(25,35)
(25,36)-(25,47)
(25,37)-(25,44)
*)
