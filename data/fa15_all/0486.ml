
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) [h];;

let palindrome w =
  let l = explode w in
  let lr = listReverse l in if l :: lr then true else false;;


(* fix

let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) [h];;

let palindrome w =
  let l = explode w in
  let lr = listReverse l in if l = lr then true else false;;

*)

(* changed spans
(14,32)-(14,39)
l = lr
BopG VarG VarG

*)

(* type error slice
(2,24)-(2,77)
(2,46)-(2,48)
(2,59)-(2,60)
(2,59)-(2,77)
(2,64)-(2,77)
(2,65)-(2,71)
(2,72)-(2,73)
(2,74)-(2,76)
(10,3)-(10,63)
(10,37)-(10,43)
(10,37)-(10,63)
(10,44)-(10,59)
(10,45)-(10,56)
(10,57)-(10,58)
(10,60)-(10,63)
(10,61)-(10,62)
(14,3)-(14,60)
(14,12)-(14,23)
(14,12)-(14,25)
(14,24)-(14,25)
(14,29)-(14,60)
(14,32)-(14,33)
(14,32)-(14,39)
(14,37)-(14,39)
*)
