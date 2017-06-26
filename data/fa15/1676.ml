
let rec digitsOfInt n =
  if n <= 0
  then []
  else (let x = n mod 10
        and n = n / 10 in (digitsOfInt n) @ [x]);;

let rec additivePersistence n = if n >= 10 then digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let x = n mod 10
        and n = n / 10 in (digitsOfInt n) @ [x]);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let myHelper n = let n = digitsOfInt n in sumList n;;

let rec additivePersistence n =
  if n < 10 then 0 else (let x = myHelper n in 1 + (additivePersistence x));;

*)

(* changed spans
(8,28)-(8,61)
(8,32)-(8,61)
(8,35)-(8,42)
(8,48)-(8,59)
(8,48)-(8,61)
*)

(* type error slice
(6,26)-(6,41)
(6,26)-(6,47)
(6,27)-(6,38)
(6,42)-(6,43)
(8,32)-(8,61)
(8,48)-(8,59)
(8,48)-(8,61)
*)

(* all spans
(2,20)-(6,48)
(3,2)-(6,48)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(4,7)-(4,9)
(5,7)-(6,48)
(5,16)-(5,24)
(5,16)-(5,17)
(5,22)-(5,24)
(6,16)-(6,22)
(6,16)-(6,17)
(6,20)-(6,22)
(6,26)-(6,47)
(6,42)-(6,43)
(6,26)-(6,41)
(6,27)-(6,38)
(6,39)-(6,40)
(6,44)-(6,47)
(6,45)-(6,46)
(8,28)-(8,61)
(8,32)-(8,61)
(8,35)-(8,42)
(8,35)-(8,36)
(8,40)-(8,42)
(8,48)-(8,61)
(8,48)-(8,59)
(8,60)-(8,61)
*)
