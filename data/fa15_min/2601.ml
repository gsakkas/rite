
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let a = n mod 10 in
     let b = n / 10 in
     match b with
     | 0 -> if a = 0 then [] else (digitsOfInt b) @ [a]
     | x -> (digitsOfInt b) @ [a]);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let oneRoot n =
  let x = digits n in
  let y = sumList x in
  let a = y mod 10 in
  let b = y / 10 in match b with | 0 -> if a = 0 then 0 else y | z -> y;;

let rec addHelp (n,m) =
  let x = oneRoot n in match x with | 0 -> m + 1 | z -> addHelp (x, (m + 1));;

let rec additivePersistence n = let (a,b) = addHelp (n, 0) in b;;


(* fix

let rec additivePersistence n = 0;;

*)

(* changed spans
(25,33)-(25,64)
0
LitG

*)

(* type error slice
(23,24)-(23,77)
(23,44)-(23,49)
(23,57)-(23,64)
(23,57)-(23,77)
(25,33)-(25,64)
(25,45)-(25,52)
(25,45)-(25,59)
*)
