
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
(8,40)-(8,42)
(8,40)-(8,45)
(9,7)-(9,16)
(9,7)-(9,22)
(9,18)-(9,22)
*)
