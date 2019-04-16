
let modulus ss = ss mod 10;;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | x -> (digitsOfInt (n / 10)) @ [modulus x]);;

let lt10 q = q < 10;;

let rec additivePersistence n = if lt10 n then n else 55 :: (digitsOfInt n);;


(* fix

let incre i = i + 1;;

let lt10 q = q < 10;;

let rec additivePersistence n =
  if lt10 n then n else (match n with | n -> incre n);;

*)

(* changed spans
(11,55)-(11,76)
match n with
| n -> incre n
CaseG VarG (fromList [(VarPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(9,4)-(9,22)
(9,10)-(9,20)
(9,14)-(9,15)
(9,14)-(9,20)
(9,18)-(9,20)
(11,33)-(11,76)
(11,36)-(11,40)
(11,36)-(11,42)
(11,41)-(11,42)
(11,48)-(11,49)
(11,55)-(11,76)
*)
