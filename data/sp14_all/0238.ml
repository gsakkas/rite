
let rec append x y = match y with | [] -> [x] | h::t -> h :: (append x t);;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let (x,y) = ((n mod 10), (n / 10)) in
     if n < 10 then [n] else append x (digitsOfInt y));;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n =
  let x = 0 in if n < 10 then x else additivePersistence (digits n);;


(* fix

let rec additivePersistence n =
  let x = 0 in if n < 10 then x else additivePersistence (n - 50);;

*)

(* changed spans
(14,58)-(14,68)
n - 50
BopG VarG LitG

*)

(* type error slice
(2,22)-(2,74)
(2,62)-(2,74)
(2,63)-(2,69)
(2,72)-(2,73)
(9,30)-(9,36)
(9,30)-(9,54)
(9,39)-(9,54)
(9,40)-(9,51)
(11,4)-(11,37)
(11,12)-(11,35)
(11,16)-(11,27)
(11,16)-(11,35)
(13,4)-(14,70)
(13,29)-(14,68)
(14,19)-(14,20)
(14,19)-(14,25)
(14,23)-(14,25)
(14,38)-(14,57)
(14,38)-(14,68)
(14,58)-(14,68)
(14,59)-(14,65)
*)
