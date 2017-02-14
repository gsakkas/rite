
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
(11,48)-(11,56)
(11,49)-(11,53)
*)

(* type error slice
(2,3)-(5,46)
(2,20)-(5,44)
(5,2)-(5,44)
(5,2)-(5,44)
(5,8)-(5,9)
(10,2)-(12,41)
(10,15)-(11,62)
(10,17)-(11,62)
(11,35)-(11,57)
(11,36)-(11,47)
(11,48)-(11,56)
(11,49)-(11,53)
(12,32)-(12,36)
(12,32)-(12,41)
*)
