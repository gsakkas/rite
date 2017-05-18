
let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g b =
       let helper = f b in
       match helper with | (x,y) -> if x = b then (f, false) else (f, true) in
     (g, b));;
