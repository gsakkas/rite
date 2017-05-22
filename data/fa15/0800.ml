
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then [n] else (let d = digitsOfInt (n / 10) in d @ [n mod 10]);;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> let s = sumList t in h + s;;

let rec digitalRoot n =
  if n < 10 then n else digitalRoot sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then [n] else (let d = digitsOfInt (n / 10) in d @ [n mod 10]);;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> let s = sumList t in h + s;;

let rec digitalRoot n =
  if n < 10 then n else digitalRoot (sumList (digitsOfInt n));;

*)

(* changed spans
(12,24)-(12,57)
(12,36)-(12,43)
(12,44)-(12,55)
*)

(* type error slice
(11,3)-(12,59)
(11,20)-(12,57)
(12,2)-(12,57)
(12,24)-(12,35)
(12,24)-(12,57)
*)

(* all spans
(2,20)-(6,76)
(3,2)-(6,76)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(4,7)-(4,9)
(6,4)-(6,76)
(6,7)-(6,13)
(6,7)-(6,8)
(6,11)-(6,13)
(6,19)-(6,22)
(6,20)-(6,21)
(6,28)-(6,76)
(6,37)-(6,57)
(6,37)-(6,48)
(6,49)-(6,57)
(6,50)-(6,51)
(6,54)-(6,56)
(6,61)-(6,75)
(6,63)-(6,64)
(6,61)-(6,62)
(6,65)-(6,75)
(6,66)-(6,74)
(6,66)-(6,67)
(6,72)-(6,74)
(8,16)-(9,62)
(9,2)-(9,62)
(9,8)-(9,10)
(9,24)-(9,25)
(9,36)-(9,62)
(9,44)-(9,53)
(9,44)-(9,51)
(9,52)-(9,53)
(9,57)-(9,62)
(9,57)-(9,58)
(9,61)-(9,62)
(11,20)-(12,57)
(12,2)-(12,57)
(12,5)-(12,11)
(12,5)-(12,6)
(12,9)-(12,11)
(12,17)-(12,18)
(12,24)-(12,57)
(12,24)-(12,35)
(12,36)-(12,43)
(12,44)-(12,55)
(12,56)-(12,57)
*)
