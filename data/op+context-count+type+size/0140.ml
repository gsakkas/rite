
let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g =
       let self = f b in
       match self with | b -> (self, true) | _ -> (self, false) in
     (g, b));;


(* fix

let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g b =
       let self = f b in
       match b with | self -> (self, false) | _ -> (self, true) in
     (g, b));;

*)

(* changed spans
(9,8)-(10,63)
(10,8)-(10,63)
(10,14)-(10,18)
(10,32)-(10,42)
(10,38)-(10,42)
(10,58)-(10,63)
*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,19)
(4,57)-(4,63)
(4,57)-(4,69)
(4,65)-(4,66)
(4,65)-(4,69)
(7,3)-(7,9)
(7,3)-(11,11)
(8,6)-(11,11)
(8,6)-(11,11)
(9,8)-(10,63)
(10,8)-(10,63)
(10,32)-(10,42)
(11,7)-(11,8)
(11,7)-(11,11)
*)
