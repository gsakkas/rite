
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
(10,53)-(10,73)
digitsOfInt x
AppG (fromList [VarG])

*)

(* type error slice
(2,4)-(5,47)
(2,21)-(5,45)
(3,3)-(5,45)
(5,3)-(5,45)
(5,9)-(5,10)
(5,23)-(5,26)
(10,3)-(11,42)
(10,16)-(10,78)
(10,53)-(10,73)
(10,54)-(10,65)
(10,66)-(10,70)
(11,33)-(11,37)
(11,33)-(11,42)
*)
