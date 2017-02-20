
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

(* all spans
(2,12)-(2,51)
(2,16)-(2,51)
(2,22)-(2,23)
(2,37)-(2,39)
(2,50)-(2,51)
(4,12)-(4,51)
(4,16)-(4,51)
(4,22)-(4,23)
(4,37)-(4,39)
(4,50)-(4,51)
(6,20)-(7,57)
(7,2)-(7,57)
(7,8)-(7,9)
(7,23)-(7,25)
(7,36)-(7,57)
(7,52)-(7,53)
(7,36)-(7,51)
(7,37)-(7,48)
(7,49)-(7,50)
(7,54)-(7,57)
(7,55)-(7,56)
(9,12)-(12,6)
(10,2)-(12,6)
(10,13)-(11,66)
(11,4)-(11,66)
(11,7)-(11,29)
(11,7)-(11,8)
(11,12)-(11,29)
(11,13)-(11,26)
(11,27)-(11,28)
(11,35)-(11,37)
(11,43)-(11,66)
(11,43)-(11,50)
(11,44)-(11,49)
(11,44)-(11,45)
(11,47)-(11,48)
(11,54)-(11,66)
(11,55)-(11,57)
(11,58)-(11,65)
(11,59)-(11,60)
(11,63)-(11,64)
(12,2)-(12,6)
(12,2)-(12,4)
(12,5)-(12,6)
(14,17)-(14,77)
(14,22)-(14,77)
(14,28)-(14,30)
(14,44)-(14,48)
(14,45)-(14,47)
(14,59)-(14,77)
(14,63)-(14,64)
(14,59)-(14,62)
(14,60)-(14,61)
(14,65)-(14,77)
(14,66)-(14,74)
(14,75)-(14,76)
(16,19)-(20,77)
(17,2)-(20,77)
(17,8)-(17,9)
(18,10)-(18,14)
(20,6)-(20,77)
(20,9)-(20,24)
(20,9)-(20,10)
(20,13)-(20,24)
(20,14)-(20,21)
(20,22)-(20,23)
(20,30)-(20,66)
(20,30)-(20,40)
(20,41)-(20,66)
(20,42)-(20,49)
(20,50)-(20,65)
(20,51)-(20,62)
(20,63)-(20,64)
(20,72)-(20,77)
(22,15)-(25,45)
(23,2)-(25,45)
(23,8)-(23,17)
(23,8)-(23,15)
(23,16)-(23,17)
(24,10)-(24,14)
(25,12)-(25,45)
(25,12)-(25,22)
(25,23)-(25,45)
(25,24)-(25,32)
(25,33)-(25,44)
(25,34)-(25,41)
(25,42)-(25,43)
*)
