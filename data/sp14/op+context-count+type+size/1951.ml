
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
(15,11)-(15,28)
(15,33)-(15,75)
(15,36)-(15,37)
(15,36)-(15,41)
(15,59)-(15,60)
(15,74)-(15,75)
*)

(* type error slice
(12,22)-(12,70)
(12,22)-(12,70)
(12,56)-(12,70)
(12,61)-(12,68)
(12,61)-(12,70)
(12,69)-(12,70)
(15,3)-(15,75)
(15,11)-(15,18)
(15,11)-(15,28)
(15,66)-(15,73)
(15,66)-(15,75)
(15,74)-(15,75)
*)
