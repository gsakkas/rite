
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (listReverse explode w) == w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (listReverse (explode w)) == (explode w);;

*)

(* changed spans
(10,20)-(10,43)
listReverse (explode w)
AppG [AppG [EmptyG]]

(10,47)-(10,48)
explode w
AppG [VarG]

*)

(* type error slice
(8,37)-(8,52)
(8,37)-(8,58)
(8,38)-(8,49)
(8,53)-(8,54)
(10,20)-(10,43)
(10,21)-(10,32)
*)
