
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
loop (sumList (digitsOfInt x))
     (sumList (digitsOfInt x) + y)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(11,33)-(11,44)
sumList
VarG

(11,33)-(11,44)
digitsOfInt x
AppG (fromList [VarG])

(11,45)-(11,70)
x
VarG

(11,45)-(11,70)
sumList (digitsOfInt x) + y
BopG (AppG (fromList [EmptyG])) VarG

*)
