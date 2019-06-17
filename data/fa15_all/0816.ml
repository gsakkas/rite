
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
(11,27)-(11,63)
loop (sumList (digitsOfInt x))
     (sumList (digitsOfInt x) + y)
AppG [AppG [EmptyG],BopG EmptyG EmptyG]

*)

(* type error slice
(10,3)-(12,42)
(10,16)-(11,63)
(10,18)-(11,63)
(11,5)-(11,63)
(11,20)-(11,21)
(11,27)-(11,31)
(11,27)-(11,63)
(11,32)-(11,63)
(11,61)-(11,62)
(12,33)-(12,37)
(12,33)-(12,42)
*)
