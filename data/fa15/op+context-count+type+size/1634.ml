
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (explode w) = (listReverse explode w);;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (explode w) = (listReverse (explode w));;

*)

(* changed spans
(10,33)-(10,56)
(10,46)-(10,53)
*)

(* type error slice
(8,36)-(8,51)
(8,36)-(8,57)
(8,37)-(8,48)
(8,52)-(8,53)
(10,33)-(10,56)
(10,34)-(10,45)
*)
