
let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let digits = digitsOfInt n in
  let s = sumList digits in
  if (n / 10) <> 0
  then (print_int n; print_endline " "; digitalRoot)
  else digits;;


(* fix

let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let d = digits n in
  let s = sumList d in if (n / 10) <> 0 then digitalRoot s else s;;

*)

(* changed spans
(11,3)-(15,14)
let d = digits n in
let s = sumList d in
if (n / 10) <> 0
then digitalRoot s
else s
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(5,8)-(5,63)
(5,9)-(5,29)
(10,4)-(15,16)
(10,21)-(15,14)
(11,3)-(15,14)
(12,3)-(15,14)
(13,3)-(15,14)
(14,8)-(14,53)
(14,22)-(14,52)
(14,41)-(14,52)
*)
