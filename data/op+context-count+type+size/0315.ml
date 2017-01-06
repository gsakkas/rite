
let rec wwhile (f,b) =
  let check = f b in
  match (f, b) with | (x,y) -> if y = false then x else wwhile (f, x);;



let rec wwhile (f,b) =
  let check = f b in
  match check with | (x,y) -> if y = false then x else wwhile (f, x);;


(* changed spans
(4,9)-(4,15)
*)

(* type error slice
(4,57)-(4,69)
*)
