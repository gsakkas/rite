
let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile f b';;



let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile (f, b');;


(* changed spans
*)

(* type error slice
(3,47)-(3,58)
*)
