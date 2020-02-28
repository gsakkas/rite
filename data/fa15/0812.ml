
let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec loop x y =
    if x < 10 then y else (sumList (digitsOfInt (loop x))) + y in
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
(11,49)-(11,57)
x
VarG

*)

(* type error slice
(2,4)-(5,47)
(2,21)-(5,45)
(5,3)-(5,45)
(5,9)-(5,10)
(10,3)-(12,42)
(10,16)-(11,63)
(10,18)-(11,63)
(11,36)-(11,58)
(11,37)-(11,48)
(11,49)-(11,57)
(11,50)-(11,54)
(12,33)-(12,37)
(12,33)-(12,42)
*)
