
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile ((let k x = (f x) = x in f b), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,29)-(7,57)
(7,40)-(7,49)
(7,48)-(7,49)
(7,53)-(7,54)
(7,53)-(7,56)
(7,55)-(7,56)
(7,59)-(7,60)
*)

(* type error slice
(2,3)-(5,16)
(2,16)-(5,14)
(4,4)-(4,65)
(4,18)-(4,19)
(4,18)-(4,21)
(4,52)-(4,60)
(4,52)-(4,65)
(4,61)-(4,62)
(4,63)-(4,65)
(5,2)-(5,10)
(5,2)-(5,14)
(5,11)-(5,12)
(5,13)-(5,14)
(7,21)-(7,27)
(7,21)-(7,61)
(7,28)-(7,61)
(7,29)-(7,57)
(7,40)-(7,45)
(7,40)-(7,49)
(7,40)-(7,49)
(7,41)-(7,42)
(7,43)-(7,44)
(7,48)-(7,49)
(7,53)-(7,54)
(7,53)-(7,56)
(7,55)-(7,56)
(7,59)-(7,60)
*)
