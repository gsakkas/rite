
let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g =
       let self = f b in
       match self with | b -> (self, true) | _ -> (self, false) in
     (g, b));;


(* fix

let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g b =
       let self = f b in
       match b with | self -> (self, false) | _ -> (self, true) in
     (g, b));;

*)

(* changed spans
(9,8)-(10,64)
fun b ->
  (let self = f b in
   match b with
   | self -> (self , false)
   | _ -> (self , true))
LamG VarPatG (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,19)
(4,57)-(4,63)
(4,57)-(4,70)
(4,64)-(4,70)
(4,65)-(4,66)
(7,3)-(7,9)
(7,3)-(11,13)
(8,5)-(11,13)
(9,8)-(10,64)
(10,8)-(10,64)
(10,31)-(10,43)
(11,6)-(11,12)
(11,7)-(11,8)
*)
