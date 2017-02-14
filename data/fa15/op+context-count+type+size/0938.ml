
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
(14,31)-(14,38)
*)

(* type error slice
(2,23)-(2,76)
(2,23)-(2,76)
(2,23)-(2,76)
(2,23)-(2,76)
(2,45)-(2,47)
(2,58)-(2,59)
(2,58)-(2,76)
(2,58)-(2,76)
(2,63)-(2,76)
(2,64)-(2,70)
(2,71)-(2,72)
(2,73)-(2,75)
(10,2)-(10,62)
(10,2)-(10,62)
(10,36)-(10,42)
(10,36)-(10,62)
(10,43)-(10,58)
(10,44)-(10,55)
(10,56)-(10,57)
(10,59)-(10,62)
(10,59)-(10,62)
(10,60)-(10,61)
(14,2)-(14,59)
(14,11)-(14,22)
(14,11)-(14,24)
(14,23)-(14,24)
(14,28)-(14,59)
(14,31)-(14,32)
(14,31)-(14,38)
(14,31)-(14,38)
(14,31)-(14,38)
(14,36)-(14,38)
*)
