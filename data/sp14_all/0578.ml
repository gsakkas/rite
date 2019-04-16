
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
(8,5)-(9,27)
let y =
  fun x ->
    (let xx = f x in
     (xx , xx <> x)) in
(y , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(4,3)-(4,49)
(4,19)-(4,25)
(4,19)-(4,37)
(4,26)-(4,37)
(4,30)-(4,36)
(4,43)-(4,49)
(7,3)-(7,9)
(7,3)-(9,27)
(8,5)-(9,27)
(8,12)-(8,56)
(9,6)-(9,26)
(9,7)-(9,22)
(9,8)-(9,14)
(9,15)-(9,21)
(9,16)-(9,17)
(9,19)-(9,20)
*)
