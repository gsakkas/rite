
let fu x b = (x, (b < (x b)));;

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile ((fu f), b);;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(2,8)-(2,27)
(2,10)-(2,27)
(2,15)-(2,16)
(2,15)-(2,27)
(2,19)-(2,20)
(2,19)-(2,27)
(2,24)-(2,25)
(2,24)-(2,27)
(2,26)-(2,27)
(5,3)-(6,72)
(8,31)-(8,33)
(8,31)-(8,35)
(8,31)-(8,39)
*)

(* type error slice
(2,4)-(2,32)
(2,8)-(2,27)
(2,10)-(2,27)
(2,15)-(2,16)
(2,15)-(2,27)
(2,24)-(2,25)
(2,24)-(2,27)
(2,26)-(2,27)
(4,4)-(6,74)
(4,17)-(6,72)
(5,3)-(6,72)
(5,14)-(5,15)
(5,14)-(5,17)
(5,16)-(5,17)
(6,3)-(6,72)
(6,9)-(6,13)
(6,52)-(6,58)
(6,52)-(6,64)
(6,60)-(6,64)
(6,63)-(6,64)
(8,22)-(8,28)
(8,22)-(8,39)
(8,31)-(8,33)
(8,31)-(8,35)
(8,31)-(8,39)
*)
