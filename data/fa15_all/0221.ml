
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
(8,29)-(8,40)
let n =
  fun x ->
    (let ff = f b in
     (ff , b = ff)) in
(n , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(2,4)-(2,32)
(2,8)-(2,30)
(2,10)-(2,30)
(2,14)-(2,30)
(2,15)-(2,16)
(2,23)-(2,28)
(2,24)-(2,25)
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
(6,52)-(6,65)
(6,59)-(6,65)
(6,63)-(6,64)
(8,22)-(8,28)
(8,22)-(8,40)
(8,29)-(8,40)
(8,30)-(8,36)
(8,31)-(8,33)
*)
