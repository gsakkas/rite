
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
digitalRoot (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

(12,36)-(12,43)
sumList (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG])])

(12,44)-(12,55)
digitsOfInt n
AppG (fromList [VarG])

*)
