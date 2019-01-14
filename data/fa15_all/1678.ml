
let rec digitsOfInt n =
  if n <= 0
  then []
  else (let x = n mod 10
        and n = n / 10 in (digitsOfInt n) @ [x]);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if n >= 10
  then let n = digitsOfInt n
       and f = sumList n in digitalRoot n
  else n;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let x = n mod 10
        and n = n / 10 in (digitsOfInt n) @ [x]);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec helper n = let n = digitsOfInt n in sumList n;;

let rec digitalRoot n = if n < 10 then n else helper n;;

*)

(* changed spans
(12,7)-(13,41)
let n = digitsOfInt n in
sumList n
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(13,28)-(13,39)
fun n ->
  if n < 10 then n else helper n
LamG (IteG EmptyG EmptyG EmptyG)

(13,40)-(13,41)
n < 10
BopG VarG LitG

(13,40)-(13,41)
if n < 10 then n else helper n
IteG (BopG EmptyG EmptyG) VarG (AppG (fromList [EmptyG]))

(14,7)-(14,8)
10
LitG

*)
