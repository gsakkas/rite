
let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec loop x y =
    if x = 0 then y else loop ((sumList (digitsOfInt x)) + y) in
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
(11,7)-(11,12)
(11,11)-(11,12)
(11,25)-(11,29)
(11,25)-(11,61)
*)

(* type error slice
(10,2)-(12,41)
(10,15)-(11,61)
(10,17)-(11,61)
(11,4)-(11,61)
(11,4)-(11,61)
(11,18)-(11,19)
(11,25)-(11,29)
(11,25)-(11,61)
(11,30)-(11,61)
(11,59)-(11,60)
(12,32)-(12,36)
(12,32)-(12,41)
*)

(* all spans
(2,20)-(5,44)
(3,2)-(5,44)
(3,15)-(4,64)
(3,17)-(4,64)
(4,4)-(4,64)
(4,7)-(4,12)
(4,7)-(4,8)
(4,11)-(4,12)
(4,18)-(4,23)
(4,29)-(4,64)
(4,29)-(4,33)
(4,34)-(4,42)
(4,35)-(4,36)
(4,39)-(4,41)
(4,43)-(4,64)
(4,44)-(4,54)
(4,45)-(4,46)
(4,51)-(4,53)
(4,58)-(4,63)
(5,2)-(5,44)
(5,8)-(5,9)
(5,22)-(5,25)
(5,23)-(5,24)
(5,34)-(5,44)
(5,34)-(5,38)
(5,39)-(5,41)
(5,42)-(5,44)
(7,16)-(7,70)
(7,21)-(7,70)
(7,27)-(7,29)
(7,43)-(7,44)
(7,55)-(7,70)
(7,55)-(7,56)
(7,59)-(7,70)
(7,60)-(7,67)
(7,68)-(7,69)
(9,28)-(12,41)
(10,2)-(12,41)
(10,15)-(11,61)
(10,17)-(11,61)
(11,4)-(11,61)
(11,7)-(11,12)
(11,7)-(11,8)
(11,11)-(11,12)
(11,18)-(11,19)
(11,25)-(11,61)
(11,25)-(11,29)
(11,30)-(11,61)
(11,31)-(11,56)
(11,32)-(11,39)
(11,40)-(11,55)
(11,41)-(11,52)
(11,53)-(11,54)
(11,59)-(11,60)
(12,2)-(12,41)
(12,8)-(12,9)
(12,22)-(12,23)
(12,32)-(12,41)
(12,32)-(12,36)
(12,37)-(12,39)
(12,40)-(12,41)
*)
