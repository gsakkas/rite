
let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listCompare l k =
  if ((List.hd l) = []) && ((List.hd k) = [])
  then true
  else
    if (List.hd l) = (List.hd k)
    then listCompare (List.tl l) (List.tl k)
    else false;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> myAppend (listReverse t) h;;

let palindrome w = listCompare (explode w) (listReverse (explode w));;


(* fix

let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> myAppend (listReverse t) h;;

let palindrome w = (explode w) = (listReverse (explode w));;

*)

(* changed spans
(9,23)-(15,15)
(10,3)-(15,15)
(10,8)-(10,15)
(10,8)-(10,17)
(10,8)-(10,23)
(10,8)-(10,45)
(10,30)-(10,37)
(10,30)-(10,39)
(10,30)-(10,45)
(10,38)-(10,39)
(10,43)-(10,45)
(11,8)-(11,12)
(13,5)-(15,15)
(13,9)-(13,16)
(13,9)-(13,32)
(13,17)-(13,18)
(13,23)-(13,32)
(14,10)-(14,44)
(15,10)-(15,15)
(17,21)-(18,63)
(20,16)-(20,67)
*)

(* type error slice
(4,4)-(7,9)
(4,13)-(7,7)
(5,3)-(7,7)
(6,14)-(6,27)
(6,14)-(6,29)
(6,28)-(6,29)
(6,56)-(6,58)
(6,56)-(6,65)
(6,60)-(6,65)
(7,3)-(7,5)
(7,3)-(7,7)
(7,6)-(7,7)
(10,8)-(10,15)
(10,8)-(10,17)
(10,16)-(10,17)
(10,30)-(10,37)
(10,30)-(10,39)
(10,38)-(10,39)
(14,10)-(14,21)
(14,10)-(14,44)
(14,23)-(14,30)
(14,23)-(14,32)
(14,31)-(14,32)
(14,35)-(14,42)
(14,35)-(14,44)
(14,43)-(14,44)
(18,3)-(18,63)
(18,47)-(18,58)
(18,47)-(18,60)
(18,59)-(18,60)
(20,20)-(20,31)
(20,20)-(20,67)
(20,33)-(20,40)
(20,33)-(20,42)
(20,41)-(20,42)
(20,45)-(20,56)
(20,45)-(20,67)
(20,58)-(20,65)
(20,58)-(20,67)
(20,66)-(20,67)
*)
