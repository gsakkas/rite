
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let x = 1.0;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in ((y x), b));;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(6,9)-(6,12)
(9,58)-(9,61)
(9,60)-(9,61)
*)

(* type error slice
(3,26)-(3,27)
(3,26)-(3,29)
(3,28)-(3,29)
(4,19)-(4,25)
(4,19)-(4,36)
(4,27)-(4,28)
(4,27)-(4,36)
(4,30)-(4,36)
(6,4)-(6,14)
(6,9)-(6,12)
(9,3)-(9,9)
(9,3)-(9,65)
(9,11)-(9,65)
(9,17)-(9,50)
(9,21)-(9,50)
(9,38)-(9,40)
(9,38)-(9,50)
(9,43)-(9,50)
(9,58)-(9,59)
(9,58)-(9,61)
(9,58)-(9,65)
(9,60)-(9,61)
(9,64)-(9,65)
*)
