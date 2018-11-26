
let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

let rec digitalRoot n = if n < 10 then n else digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

let rec digitalRoot n = sumList (digitsOfInt n);;

*)

(* changed spans
(8,20)-(8,59)
xs
VarG

(8,20)-(8,59)
List.hd
VarG

(8,20)-(8,59)
xs
VarG

(8,20)-(8,59)
sumList
VarG

(8,20)-(8,59)
List.tl
VarG

(8,20)-(8,59)
xs
VarG

(8,20)-(8,59)
fun xs ->
  match xs with
  | [] -> 0
  | xs -> List.hd xs + sumList (List.tl xs)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(8,20)-(8,59)
List.hd xs
AppG (fromList [VarG])

(8,20)-(8,59)
sumList (List.tl xs)
AppG (fromList [AppG (fromList [EmptyG])])

(8,20)-(8,59)
List.tl xs
AppG (fromList [VarG])

(8,20)-(8,59)
List.hd xs + sumList (List.tl xs)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(8,20)-(8,59)
0
LitG

(8,20)-(8,59)
match xs with
| [] -> 0
| xs -> List.hd xs + sumList (List.tl xs)
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

(8,46)-(8,57)
sumList
VarG

(8,46)-(8,57)
digitsOfInt n
AppG (fromList [VarG])

*)
