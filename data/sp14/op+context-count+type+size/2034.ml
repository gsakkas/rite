
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
(6,8)-(6,11)
(9,9)-(9,66)
(9,20)-(9,51)
(9,56)-(9,61)
(9,59)-(9,60)
*)

(* type error slice
(3,25)-(3,26)
(3,25)-(3,28)
(4,18)-(4,24)
(4,18)-(4,36)
(4,25)-(4,36)
(4,26)-(4,27)
(9,2)-(9,8)
(9,2)-(9,66)
(9,9)-(9,66)
(9,9)-(9,66)
(9,16)-(9,51)
(9,20)-(9,51)
(9,36)-(9,51)
(9,55)-(9,65)
(9,56)-(9,61)
(9,57)-(9,58)
*)
