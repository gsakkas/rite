
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
(8,31)-(8,37)
(8,31)-(8,41)
(8,34)-(8,35)
(8,40)-(8,41)
*)

(* type error slice
(2,4)-(2,32)
(2,8)-(2,27)
(2,10)-(2,27)
(2,15)-(2,27)
(5,14)-(5,15)
(5,14)-(5,17)
(6,52)-(6,58)
(6,52)-(6,64)
(6,60)-(6,61)
(6,60)-(6,64)
(8,22)-(8,28)
(8,22)-(8,41)
(8,31)-(8,33)
(8,31)-(8,37)
(8,31)-(8,41)
*)
