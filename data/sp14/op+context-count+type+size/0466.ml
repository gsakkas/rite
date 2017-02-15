
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile ((let k x = (f x) != x in k b), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,29)-(7,58)
(7,40)-(7,50)
(7,49)-(7,50)
(7,54)-(7,55)
(7,54)-(7,57)
(7,56)-(7,57)
(7,60)-(7,61)
*)

(* type error slice
(2,3)-(5,16)
(2,16)-(5,14)
(4,18)-(4,19)
(4,18)-(4,21)
(4,52)-(4,60)
(4,52)-(4,65)
(4,61)-(4,62)
(5,2)-(5,10)
(5,2)-(5,14)
(5,11)-(5,12)
(7,21)-(7,27)
(7,21)-(7,62)
(7,28)-(7,62)
(7,29)-(7,58)
(7,29)-(7,58)
(7,36)-(7,50)
(7,40)-(7,50)
(7,54)-(7,55)
(7,54)-(7,57)
*)
