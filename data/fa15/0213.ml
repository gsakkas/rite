
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile (let g = f b in ((f, g), b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(6,29)-(6,57)
let n =
  fun x ->
    (let ff = f b in
     (ff , b = ff)) in
(n , b)
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (TupleG [EmptyG,EmptyG])

*)

(* type error slice
(3,14)-(3,15)
(3,14)-(3,17)
(4,52)-(4,58)
(4,52)-(4,65)
(4,59)-(4,65)
(4,60)-(4,61)
(6,22)-(6,28)
(6,22)-(6,57)
(6,29)-(6,57)
(6,45)-(6,56)
(6,46)-(6,52)
*)
