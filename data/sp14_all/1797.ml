
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
(9,23)-(9,24)
explode w
AppG (fromList [VarG])

(9,27)-(9,53)
listReverse (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(3,3)-(5,7)
(4,44)-(4,51)
(4,44)-(4,67)
(4,45)-(4,50)
(4,55)-(4,67)
(4,56)-(4,58)
(5,3)-(5,5)
(5,3)-(5,7)
(7,24)-(7,76)
(7,57)-(7,63)
(7,57)-(7,76)
(7,64)-(7,76)
(7,65)-(7,66)
(7,68)-(7,75)
(7,69)-(7,70)
(7,71)-(7,72)
(9,27)-(9,53)
(9,28)-(9,34)
(9,35)-(9,52)
(9,36)-(9,47)
(9,37)-(9,44)
*)
