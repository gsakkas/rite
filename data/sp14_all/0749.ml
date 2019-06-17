
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((let h a = ((f a), false) in h b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let h x = ((f x), false) in (h, b));;

*)

(* changed spans
(5,29)-(5,67)
let h =
  fun x -> (f x , false) in
(h , b)
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (TupleG [EmptyG,EmptyG])

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,50)-(3,56)
(3,50)-(3,63)
(3,57)-(3,63)
(3,58)-(3,59)
(5,22)-(5,28)
(5,22)-(5,67)
(5,29)-(5,67)
(5,30)-(5,63)
(5,37)-(5,55)
(5,41)-(5,55)
(5,59)-(5,60)
(5,59)-(5,62)
*)
