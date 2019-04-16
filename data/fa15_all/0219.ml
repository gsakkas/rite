
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile ((let n z = let xx = f in (xx, (b = (f b))) in n), b);;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(7,10)-(7,63)
let n =
  fun x ->
    (let ff = f b in
     (ff , b = ff)) in
(n , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (TupleG (fromList [EmptyG]))

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
(7,3)-(7,63)
(7,10)-(7,63)
(7,11)-(7,59)
(7,18)-(7,53)
(7,22)-(7,53)
(7,31)-(7,32)
(7,36)-(7,53)
(7,37)-(7,39)
(7,46)-(7,51)
(7,47)-(7,48)
(7,49)-(7,50)
(7,57)-(7,58)
(7,61)-(7,62)
*)
