
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
(15,23)-(15,30)
1
LitG

(15,33)-(15,41)
itt x' i
AppG (fromList [VarG])

(16,33)-(16,39)
itt y' 0
AppG (fromList [VarG,LitG])

*)

(* type error slice
(10,3)-(16,39)
(10,15)-(15,49)
(10,17)-(15,49)
(15,23)-(15,41)
(15,33)-(15,41)
(15,34)-(15,37)
*)
