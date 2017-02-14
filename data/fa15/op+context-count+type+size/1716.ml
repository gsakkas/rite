
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f' x = ((f x), ((not f x) = x)) in f'), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((let f' x = ((f x), (not ((f x) = x))) in f'), b);;

*)

(* changed spans
(4,31)-(4,72)
(4,52)-(4,59)
(4,52)-(4,64)
(4,56)-(4,57)
*)

(* type error slice
(4,52)-(4,55)
(4,52)-(4,59)
*)
