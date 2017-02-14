
let fu x b = (x, (b < (x b)));;

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile ((fu f b), b);;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(2,7)-(2,29)
(2,9)-(2,29)
(2,13)-(2,29)
(2,14)-(2,15)
(2,17)-(2,28)
(2,18)-(2,19)
(2,22)-(2,27)
(2,23)-(2,24)
(2,25)-(2,26)
(5,2)-(6,71)
(8,28)-(8,41)
(8,29)-(8,37)
(8,30)-(8,32)
(8,33)-(8,34)
(8,39)-(8,40)
*)

(* type error slice
(2,3)-(2,31)
(2,7)-(2,29)
(2,9)-(2,29)
(2,13)-(2,29)
(5,13)-(5,14)
(5,13)-(5,16)
(6,51)-(6,57)
(6,51)-(6,64)
(6,58)-(6,64)
(6,59)-(6,60)
(8,21)-(8,27)
(8,21)-(8,41)
(8,28)-(8,41)
(8,29)-(8,37)
(8,30)-(8,32)
*)
