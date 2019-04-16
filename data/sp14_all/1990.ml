
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
(20,20)-(20,69)
explode w = listReverse (explode w)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* type error slice
(4,4)-(7,9)
(4,13)-(7,7)
(5,3)-(7,7)
(6,44)-(6,51)
(6,44)-(6,67)
(6,45)-(6,50)
(6,55)-(6,67)
(6,56)-(6,58)
(7,3)-(7,5)
(7,3)-(7,7)
(10,28)-(10,46)
(10,29)-(10,40)
(10,30)-(10,37)
(10,38)-(10,39)
(10,43)-(10,45)
(13,8)-(13,19)
(13,8)-(13,33)
(13,9)-(13,16)
(13,17)-(13,18)
(13,22)-(13,33)
(13,23)-(13,30)
(13,31)-(13,32)
(14,10)-(14,21)
(14,10)-(14,45)
(14,22)-(14,33)
(14,23)-(14,30)
(14,31)-(14,32)
(20,20)-(20,31)
(20,20)-(20,69)
(20,32)-(20,43)
(20,33)-(20,40)
*)
