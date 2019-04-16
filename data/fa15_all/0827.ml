
let lt10 q = q < 10;;

let rec additivePersistence n = if lt10 n then n else 55 :: 66;;


(* fix

let incre i = i + 1;;

let lt10 q = q < 10;;

let rec additivePersistence n =
  if lt10 n then n else (match n with | n -> incre n);;

*)

(* changed spans
(4,55)-(4,63)
match n with
| n -> incre n
CaseG VarG (fromList [(VarPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(2,4)-(2,22)
(2,10)-(2,20)
(2,14)-(2,15)
(2,14)-(2,20)
(2,18)-(2,20)
(4,33)-(4,63)
(4,36)-(4,40)
(4,36)-(4,42)
(4,41)-(4,42)
(4,48)-(4,49)
(4,55)-(4,63)
(4,61)-(4,63)
*)
