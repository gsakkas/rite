
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
(14,58)-(14,64)
n - 50
BopG VarG LitG

*)
