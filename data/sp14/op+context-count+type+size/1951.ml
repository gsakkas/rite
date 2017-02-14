
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
(15,2)-(15,74)
(15,10)-(15,28)
(15,32)-(15,74)
(15,35)-(15,36)
(15,35)-(15,40)
(15,58)-(15,59)
(15,73)-(15,74)
*)

(* type error slice
(12,21)-(12,70)
(12,21)-(12,70)
(12,55)-(12,70)
(12,59)-(12,70)
(12,60)-(12,67)
(12,68)-(12,69)
(15,2)-(15,74)
(15,10)-(15,17)
(15,10)-(15,28)
(15,65)-(15,72)
(15,65)-(15,74)
(15,73)-(15,74)
*)
