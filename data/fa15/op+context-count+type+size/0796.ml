
let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec itt x i =
    if x < 10
    then i
    else
      (let x' = sumList (digitsOfInt x) in
       if x' > 9 then 1 + (itt x' i) else 1) in
  match n with | 0 -> 0 | y' -> itt y';;


(* fix

let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec itt x i =
    if x < 10
    then i
    else
      (let x' = sumList (digitsOfInt x) in
       if x' > 9 then 1 + (itt x' i) else 1) in
  match n with | 0 -> 0 | y' -> itt y' 0;;

*)

(* changed spans
(16,33)-(16,39)
*)

(* type error slice
(15,28)-(15,31)
(15,28)-(15,36)
(16,3)-(16,39)
(16,3)-(16,39)
(16,23)-(16,24)
(16,33)-(16,36)
(16,33)-(16,39)
*)
