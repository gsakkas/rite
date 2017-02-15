
let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec loop x y =
    if x < 10 then y else loop ((sumList (digitsOfInt x)) + y) in
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
(11,26)-(11,62)
(11,31)-(11,62)
(12,32)-(12,36)
(12,37)-(12,39)
(12,40)-(12,41)
*)

(* type error slice
(10,2)-(12,41)
(10,15)-(11,62)
(10,17)-(11,62)
(11,4)-(11,62)
(11,4)-(11,62)
(11,19)-(11,20)
(11,26)-(11,30)
(11,26)-(11,62)
(11,31)-(11,62)
(11,60)-(11,61)
(12,32)-(12,36)
(12,32)-(12,41)
*)
