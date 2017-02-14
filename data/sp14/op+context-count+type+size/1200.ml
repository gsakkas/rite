
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
(9,9)-(9,24)
(9,28)-(9,29)
*)

(* type error slice
(3,12)-(3,13)
(3,12)-(3,15)
(4,53)-(4,59)
(4,53)-(4,66)
(4,61)-(4,62)
(4,61)-(4,66)
(7,3)-(7,9)
(7,3)-(9,29)
(8,7)-(9,24)
(8,7)-(9,29)
(9,9)-(9,24)
*)
