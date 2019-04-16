
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (fun y  -> fun b  -> if (f b) = b then (b, true) else ((y b), b));;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(7,10)-(7,75)
let y =
  fun x ->
    (let xx = f x in
     (xx , xx <> x)) in
(y , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(4,19)-(4,25)
(4,19)-(4,37)
(4,26)-(4,37)
(7,3)-(7,9)
(7,3)-(7,75)
(7,10)-(7,75)
*)
