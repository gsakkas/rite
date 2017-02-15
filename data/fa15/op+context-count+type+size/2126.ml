
let getHead h = match h with | [] -> [] | h::t -> h;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let getTail t = match t with | [] -> [] | h::t -> t;;

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
  | h::t -> matchHeads (getTail (explode w));;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match x with | [] -> true | h::t -> false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;

*)

(* changed spans
(2,12)-(2,51)
(2,16)-(2,51)
(2,22)-(2,23)
(2,37)-(2,39)
(2,50)-(2,51)
(4,20)-(5,57)
(5,2)-(5,57)
(5,8)-(5,9)
(5,23)-(5,25)
(5,36)-(5,51)
(5,36)-(5,57)
(5,37)-(5,48)
(5,49)-(5,50)
(5,52)-(5,53)
(5,54)-(5,57)
(5,55)-(5,56)
(8,2)-(10,6)
(12,12)-(12,51)
(12,22)-(12,23)
(12,37)-(12,39)
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
(5,2)-(5,57)
(5,2)-(5,57)
(5,36)-(5,51)
(5,36)-(5,57)
(5,37)-(5,48)
(5,49)-(5,50)
(5,52)-(5,53)
(5,54)-(5,57)
(5,54)-(5,57)
(5,55)-(5,56)
(7,3)-(10,8)
(7,12)-(10,6)
(8,2)-(10,6)
(9,43)-(9,50)
(9,43)-(9,66)
(9,43)-(9,66)
(9,44)-(9,49)
(9,54)-(9,66)
(9,55)-(9,57)
(10,2)-(10,4)
(10,2)-(10,6)
(18,9)-(18,20)
(18,10)-(18,17)
(18,18)-(18,19)
(18,32)-(18,47)
(18,33)-(18,44)
(18,45)-(18,46)
(19,22)-(19,47)
(19,23)-(19,30)
(19,31)-(19,46)
(19,32)-(19,43)
(25,23)-(25,44)
(25,24)-(25,31)
(25,32)-(25,43)
(25,33)-(25,40)
*)
