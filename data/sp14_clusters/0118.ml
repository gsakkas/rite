
let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g b =
       let helper = f b in
       match helper with | (x,y) -> if x = b then (f, false) else (f, true) in
     (g, b));;


(* fix

let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g b =
       let helper = f b in
       match helper with | f -> if f = b then (f, false) else (f, true) in
     (g, b));;

*)

(* changed spans
(10,7)-(10,75)
match helper with
| f -> if f = b
       then (f , false)
       else (f , true)
CaseG VarG [(Nothing,IteG EmptyG EmptyG EmptyG)]

(10,39)-(10,40)
f
VarG

*)
