
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec revexp (x,y) = match x with | [] -> y | h::t -> revexp (t, (h ^ y));;

let palindrome w = if w = (revexp ((explode w), "")) then true else false;;


(* fix

let rec reverse (x,y) =
  match x with | [] -> y | h::t -> reverse (t, (h :: y));;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l = match l with | [] -> [] | h::t -> reverse (l, []);;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;

*)

(* changed spans
(2,13)-(5,7)
(3,3)-(5,7)
(7,17)-(7,74)
(7,30)-(7,31)
(7,45)-(7,46)
(7,57)-(7,63)
(7,57)-(7,74)
(7,65)-(7,66)
(7,69)-(7,70)
(7,69)-(7,74)
(7,71)-(7,72)
(7,73)-(7,74)
(9,16)-(9,74)
(9,23)-(9,24)
(9,28)-(9,34)
(9,37)-(9,46)
(9,37)-(9,51)
(9,49)-(9,51)
*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(3,3)-(5,7)
(4,45)-(4,50)
(4,45)-(4,50)
(4,45)-(4,65)
(4,45)-(4,65)
(4,56)-(4,58)
(4,56)-(4,65)
(5,3)-(5,5)
(5,3)-(5,7)
(7,24)-(7,74)
(7,24)-(7,74)
(7,57)-(7,63)
(7,57)-(7,74)
(7,65)-(7,66)
(7,65)-(7,74)
(7,69)-(7,70)
(7,69)-(7,74)
(7,71)-(7,72)
(9,28)-(9,34)
(9,28)-(9,51)
(9,37)-(9,44)
(9,37)-(9,46)
(9,37)-(9,51)
*)
