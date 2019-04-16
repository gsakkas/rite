
let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' b' = let fOfB = f' b' in (b', (fOfB = b')) in
      ((whilesFun f), b)), b);;


(* fix

let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' b' = let fOfB = f' b' in (b', (fOfB = b')) in
      whilesFun f), b);;

*)

(* changed spans
(9,7)-(9,25)
whilesFun f
AppG (fromList [VarG])

*)

(* type error slice
(3,12)-(3,13)
(3,12)-(3,15)
(4,53)-(4,59)
(4,53)-(4,67)
(4,60)-(4,67)
(4,61)-(4,62)
(7,3)-(7,9)
(7,3)-(9,30)
(8,5)-(9,30)
(8,6)-(9,26)
(9,7)-(9,25)
*)
