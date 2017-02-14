
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile
    (let f x = let xx = (x * x) * x in (xx, (xx < 100)) in
     ((wwhile (f, 2)), b));;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(8,6)-(9,25)
(8,16)-(8,54)
(8,26)-(8,27)
(8,26)-(8,31)
(8,26)-(8,36)
(8,30)-(8,31)
(8,35)-(8,36)
(8,46)-(8,54)
(8,51)-(8,54)
(9,8)-(9,20)
*)

(* type error slice
(4,3)-(4,49)
(4,3)-(4,49)
(4,19)-(4,25)
(4,19)-(4,36)
(4,27)-(4,36)
(4,30)-(4,36)
(4,43)-(4,49)
(7,3)-(7,9)
(7,3)-(9,25)
(8,6)-(9,25)
(8,6)-(9,25)
(8,12)-(8,54)
(9,8)-(9,14)
(9,8)-(9,20)
(9,8)-(9,25)
(9,16)-(9,17)
(9,16)-(9,20)
(9,19)-(9,20)
*)
