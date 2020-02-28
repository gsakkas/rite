
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
(10,25)-(10,30)
x < 10
BopG VarG LitG

(10,43)-(10,73)
sumList (digitsOfInt x)
AppG [AppG [EmptyG]]

*)

(* type error slice
(2,4)-(5,47)
(2,21)-(5,45)
(3,3)-(5,45)
(5,3)-(5,45)
(5,23)-(5,26)
(7,60)-(7,71)
(7,61)-(7,68)
(10,3)-(11,42)
(10,16)-(10,77)
(10,25)-(10,26)
(10,25)-(10,30)
(10,29)-(10,30)
(10,43)-(10,73)
(10,44)-(10,48)
(10,49)-(10,56)
(10,57)-(10,72)
(10,58)-(10,69)
(11,3)-(11,42)
(11,33)-(11,37)
(11,33)-(11,42)
(11,38)-(11,40)
(11,41)-(11,42)
*)
