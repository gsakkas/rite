
let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec loop x y = if x = 0 then y else (loop sumList (digitsOfInt x)) + y in
  match n with | 0 -> 0 | x' -> loop x' 0;;


(* fix

let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec loop x y = if x < 10 then y else (sumList (digitsOfInt x)) + y in
  match n with | 0 -> 0 | x' -> loop x' 0;;

*)

(* changed spans
(10,24)-(10,29)
(10,28)-(10,29)
(10,42)-(10,72)
(10,43)-(10,47)
*)

(* type error slice
(2,3)-(5,46)
(2,20)-(5,44)
(3,2)-(5,44)
(5,2)-(5,44)
(5,22)-(5,25)
(7,59)-(7,70)
(7,60)-(7,67)
(10,2)-(11,41)
(10,15)-(10,76)
(10,24)-(10,25)
(10,24)-(10,29)
(10,24)-(10,29)
(10,28)-(10,29)
(10,42)-(10,72)
(10,43)-(10,47)
(10,48)-(10,55)
(10,56)-(10,71)
(10,57)-(10,68)
(11,2)-(11,41)
(11,2)-(11,41)
(11,2)-(11,41)
(11,32)-(11,36)
(11,32)-(11,41)
(11,37)-(11,39)
(11,40)-(11,41)
*)
