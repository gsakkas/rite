
let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g b =
       let helper = f b in
       match helper with | b -> if f = b then (f, false) else (f, true) in
     (g, b));;



let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g b =
       let helper = f b in
       match helper with | f -> if f = b then (f, false) else (f, true) in
     (g, b));;


(* changed spans
(10,28)-(10,29)
*)

(* type error slice
(10,8)-(10,71)
*)
