
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
(8,29)-(8,42)
let n =
  fun x ->
    (let ff = f b in
     (ff , b = ff)) in
(n , b)
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (TupleG [EmptyG,EmptyG])

*)

(* type error slice
(2,4)-(2,32)
(2,8)-(2,30)
(2,10)-(2,30)
(2,14)-(2,30)
(5,14)-(5,15)
(5,14)-(5,17)
(6,52)-(6,58)
(6,52)-(6,65)
(6,59)-(6,65)
(6,60)-(6,61)
(8,22)-(8,28)
(8,22)-(8,42)
(8,29)-(8,42)
(8,30)-(8,38)
(8,31)-(8,33)
*)
