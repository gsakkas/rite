
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let g x = let x = f in (x, (b = (f b))) in (g, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(7,11)-(7,59)
(7,21)-(7,47)
(7,29)-(7,30)
(7,35)-(7,36)
(7,35)-(7,47)
(7,44)-(7,45)
(7,44)-(7,47)
(7,46)-(7,47)
(7,55)-(7,56)
*)

(* type error slice
(3,3)-(4,72)
(3,14)-(3,15)
(3,14)-(3,17)
(4,3)-(4,72)
(4,9)-(4,13)
(4,52)-(4,58)
(4,52)-(4,64)
(4,60)-(4,61)
(4,60)-(4,64)
(4,63)-(4,64)
(7,3)-(7,9)
(7,3)-(7,59)
(7,11)-(7,59)
(7,11)-(7,59)
(7,17)-(7,47)
(7,21)-(7,47)
(7,21)-(7,47)
(7,29)-(7,30)
(7,35)-(7,36)
(7,35)-(7,47)
(7,44)-(7,45)
(7,44)-(7,47)
(7,46)-(7,47)
(7,55)-(7,56)
(7,55)-(7,59)
(7,58)-(7,59)
*)
