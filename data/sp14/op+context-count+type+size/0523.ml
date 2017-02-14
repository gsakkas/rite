
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile ((let k x = (f x) = x in f), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,31)-(7,55)
(7,42)-(7,50)
(7,49)-(7,50)
(7,54)-(7,55)
(7,58)-(7,59)
*)

(* type error slice
(2,4)-(5,17)
(2,17)-(5,15)
(3,3)-(5,15)
(3,20)-(4,66)
(3,22)-(4,66)
(4,5)-(4,66)
(4,19)-(4,20)
(4,19)-(4,22)
(4,21)-(4,22)
(4,53)-(4,61)
(4,53)-(4,66)
(4,64)-(4,66)
(5,3)-(5,11)
(5,3)-(5,15)
(5,12)-(5,13)
(7,22)-(7,28)
(7,22)-(7,59)
(7,31)-(7,55)
(7,31)-(7,59)
(7,42)-(7,43)
(7,42)-(7,45)
(7,42)-(7,50)
(7,42)-(7,50)
(7,44)-(7,45)
(7,49)-(7,50)
(7,54)-(7,55)
*)
