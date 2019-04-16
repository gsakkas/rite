
let digitsOfInt n =
  if n < 0
  then []
  else
    (let rec loop n acc =
       if n = 0 then acc else loop (n / 10) ((n mod 10) :: acc) in
     match n with | 0 -> [0] | _ -> loop n []);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let x = sumList (digits n) in if x > 9 then digitalRoot x else sumList x;;


(* fix

let digitsOfInt n =
  if n < 0
  then []
  else
    (let rec loop n acc =
       if n = 0 then acc else loop (n / 10) ((n mod 10) :: acc) in
     match n with | 0 -> [0] | _ -> loop n []);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if (sumList (digits n)) > 9
  then digitalRoot (sumList (digits n))
  else sumList (digits n);;

*)

(* changed spans
(15,3)-(15,75)
if sumList (digits n) > 9
then digitalRoot (sumList (digits n))
else sumList (digits n)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* type error slice
(12,22)-(12,71)
(12,56)-(12,71)
(12,60)-(12,71)
(12,61)-(12,68)
(12,69)-(12,70)
(15,3)-(15,75)
(15,11)-(15,18)
(15,11)-(15,29)
(15,66)-(15,73)
(15,66)-(15,75)
(15,74)-(15,75)
*)
