
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (listReverse (explode w)) == w;;


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
(10,48)-(10,49)
*)

(* type error slice
(2,3)-(5,8)
(2,12)-(5,6)
(4,12)-(4,29)
(4,13)-(4,26)
(4,27)-(4,28)
(8,36)-(8,51)
(8,36)-(8,57)
(8,37)-(8,48)
(8,52)-(8,53)
(10,19)-(10,44)
(10,19)-(10,49)
(10,19)-(10,49)
(10,20)-(10,31)
(10,32)-(10,43)
(10,33)-(10,40)
(10,41)-(10,42)
(10,48)-(10,49)
*)
