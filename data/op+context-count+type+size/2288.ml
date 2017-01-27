
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | head::tail -> (listReverse tail) @ [head];;

let palindrome w =
  if (explode w) = (explode (listReverse w)) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | head::tail -> (listReverse tail) @ [head];;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;

*)

(* changed spans
(11,21)-(11,28)
(11,30)-(11,43)
(11,42)-(11,43)
*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(3,3)-(5,7)
(4,14)-(4,27)
(4,14)-(4,29)
(4,28)-(4,29)
(4,56)-(4,58)
(4,56)-(4,65)
(4,60)-(4,65)
(5,3)-(5,5)
(5,3)-(5,7)
(5,6)-(5,7)
(8,3)-(8,70)
(8,44)-(8,55)
(8,44)-(8,60)
(8,56)-(8,60)
(11,7)-(11,14)
(11,7)-(11,16)
(11,15)-(11,16)
(11,30)-(11,41)
(11,30)-(11,43)
(11,42)-(11,43)
*)
