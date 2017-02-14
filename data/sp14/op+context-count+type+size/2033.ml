
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
(8,4)-(9,26)
(8,15)-(8,55)
(8,24)-(8,31)
(8,24)-(8,35)
(8,25)-(8,26)
(8,29)-(8,30)
(8,34)-(8,35)
(8,44)-(8,54)
(8,50)-(8,53)
(9,6)-(9,21)
*)

(* type error slice
(4,2)-(4,48)
(4,2)-(4,48)
(4,18)-(4,24)
(4,18)-(4,36)
(4,25)-(4,36)
(4,29)-(4,35)
(4,42)-(4,48)
(7,2)-(7,8)
(7,2)-(9,26)
(8,4)-(9,26)
(8,4)-(9,26)
(8,11)-(8,55)
(9,5)-(9,25)
(9,6)-(9,21)
(9,7)-(9,13)
(9,14)-(9,20)
(9,15)-(9,16)
(9,18)-(9,19)
*)
