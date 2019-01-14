
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
l = lr
BopG VarG VarG

*)
