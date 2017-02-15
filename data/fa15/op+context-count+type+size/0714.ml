
let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec loop x y = if x < 10 then y else (sumList (digitsOfInt loop x)) + y in
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
(10,52)-(10,72)
(10,65)-(10,69)
*)

(* type error slice
(2,3)-(5,46)
(2,20)-(5,44)
(3,2)-(5,44)
(5,2)-(5,44)
(5,2)-(5,44)
(5,2)-(5,44)
(5,8)-(5,9)
(5,22)-(5,25)
(10,2)-(11,41)
(10,15)-(10,77)
(10,52)-(10,72)
(10,53)-(10,64)
(10,65)-(10,69)
(11,32)-(11,36)
(11,32)-(11,41)
*)
