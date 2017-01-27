
let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' b' = let fOfB = f' b' in (b', (b' = fOfB)) in
      whilesFun (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' b' = let fOfB = f' b' in (b', (b' = fOfB)) in
      whilesFun f), b);;

*)

(* changed spans
(9,18)-(9,22)
(9,26)-(9,27)
*)

(* type error slice
(8,7)-(9,22)
(8,21)-(8,64)
(8,24)-(8,64)
(8,29)-(8,64)
(8,40)-(8,42)
(8,40)-(8,45)
(8,43)-(8,45)
(8,50)-(8,52)
(8,50)-(8,64)
(8,55)-(8,57)
(8,55)-(8,64)
(8,60)-(8,64)
(9,7)-(9,16)
(9,7)-(9,22)
(9,18)-(9,19)
(9,18)-(9,22)
(9,21)-(9,22)
*)
