
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let xx = f in (f, (b < (f b))) in (n, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(7,21)-(7,51)
let ff = f b in (ff , b = ff)
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(3,3)-(4,72)
(3,14)-(3,15)
(3,14)-(3,17)
(4,3)-(4,72)
(4,9)-(4,13)
(4,52)-(4,58)
(4,52)-(4,65)
(4,59)-(4,65)
(4,60)-(4,61)
(4,63)-(4,64)
(7,3)-(7,9)
(7,3)-(7,62)
(7,10)-(7,62)
(7,17)-(7,51)
(7,21)-(7,51)
(7,35)-(7,51)
(7,36)-(7,37)
(7,44)-(7,49)
(7,45)-(7,46)
(7,47)-(7,48)
(7,55)-(7,61)
(7,56)-(7,57)
(7,59)-(7,60)
*)
