
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
       if x' > 9 then (i + 1) + (itt x') else 1) in
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
(15,22)-(15,29)
(15,23)-(15,24)
(15,32)-(15,40)
(15,46)-(15,47)
(16,32)-(16,38)
*)

(* type error slice
(10,2)-(16,38)
(10,14)-(15,48)
(10,16)-(15,48)
(15,22)-(15,40)
(15,32)-(15,40)
(15,33)-(15,36)
*)
