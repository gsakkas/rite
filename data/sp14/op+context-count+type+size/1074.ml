
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
(9,6)-(9,24)
(9,27)-(9,28)
*)

(* type error slice
(3,11)-(3,12)
(3,11)-(3,14)
(4,52)-(4,58)
(4,52)-(4,66)
(4,59)-(4,66)
(4,60)-(4,61)
(7,2)-(7,8)
(7,2)-(9,29)
(8,4)-(9,29)
(8,5)-(9,25)
(9,6)-(9,24)
*)
