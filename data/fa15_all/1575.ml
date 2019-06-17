
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::tail -> (listReverse tail) @ [h];;

let palindrome w = if (explode w) = (listReverse w) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::tail -> (listReverse tail) @ [h];;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;

*)

(* changed spans
(10,50)-(10,51)
explode w
AppG [VarG]

*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(4,13)-(4,30)
(4,14)-(4,27)
(4,28)-(4,29)
(8,3)-(8,64)
(8,40)-(8,58)
(8,41)-(8,52)
(8,53)-(8,57)
(10,23)-(10,34)
(10,24)-(10,31)
(10,32)-(10,33)
(10,37)-(10,52)
(10,38)-(10,49)
(10,50)-(10,51)
*)
