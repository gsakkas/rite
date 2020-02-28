
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
  let y = sumList (digits n) in
  match y / 10 with | 0 -> if (y mod 10) = 0 then 0 else y | z -> y;;

let rec addHelp (n,m) =
  let y = oneRoot n in
  match y / 10 with | 0 -> m + 1 | z -> addHelp (y, (m + 1));;

let rec additivePersistence n = if n / 10 then 0 else addHelp (n, 0);;


(* fix

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
  let y = sumList (digits n) in
  match y / 10 with | 0 -> if (y mod 10) = 0 then 0 else y | z -> y;;

let rec addHelp (n,m) =
  let y = oneRoot n in
  match y / 10 with | 0 -> m + 1 | z -> addHelp (y, (m + 1));;

let rec additivePersistence n = if (n / 10) = 0 then 0 else addHelp (n, 0);;

*)

(* changed spans
(24,36)-(24,42)
(n / 10) = 0
BopG (BopG EmptyG EmptyG) LitG

*)

(* type error slice
(24,33)-(24,69)
(24,36)-(24,42)
*)
