
let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec loop x y =
    if x < 10 then y else loop ((digitsOfInt (sumList (digitsOfInt x))) + y) in
  match n with | 0 -> 0 | x' -> loop x' 0;;


(* fix

let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec loop x y =
    if x < 10
    then y
    else loop (sumList (digitsOfInt x)) ((sumList (digitsOfInt x)) + y) in
  match n with | 0 -> 0 | x' -> loop x' 0;;

*)

(* changed spans
(11,26)-(11,76)
(11,31)-(11,76)
(11,33)-(11,44)
(11,45)-(11,70)
*)

(* type error slice
(2,3)-(5,46)
(2,20)-(5,44)
(3,2)-(5,44)
(5,2)-(5,44)
(5,22)-(5,25)
(10,2)-(12,41)
(10,15)-(11,76)
(10,17)-(11,76)
(11,4)-(11,76)
(11,4)-(11,76)
(11,19)-(11,20)
(11,26)-(11,30)
(11,26)-(11,76)
(11,31)-(11,76)
(11,31)-(11,76)
(11,32)-(11,71)
(11,33)-(11,44)
(11,74)-(11,75)
(12,32)-(12,36)
(12,32)-(12,41)
*)
