
let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g =
       let self = f b in
       match self with | b -> (self, true) | _ -> (self, false) in
     (g, b));;



let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g b =
       let self = f b in
       match b with | self -> (self, false) | _ -> (self, true) in
     (g, b));;


(* changed spans
(10,14)-(10,18)
(10,26)-(10,27)
(10,38)-(10,42)
(10,58)-(10,63)
*)

(* type error slice
(4,57)-(4,69)
(7,3)-(11,11)
*)
