
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile (let g x = f x in (((g b), ((g b) != b)), b));;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,30)-(7,72)
(7,36)-(7,43)
(7,40)-(7,43)
(7,50)-(7,51)
(7,50)-(7,53)
(7,50)-(7,67)
(7,52)-(7,53)
(7,58)-(7,59)
(7,58)-(7,61)
(7,60)-(7,61)
(7,71)-(7,72)
*)

(* type error slice
(2,4)-(5,17)
(2,17)-(5,15)
(4,19)-(4,20)
(4,19)-(4,22)
(4,53)-(4,61)
(4,53)-(4,66)
(4,62)-(4,63)
(5,3)-(5,11)
(5,3)-(5,15)
(5,12)-(5,13)
(7,22)-(7,28)
(7,22)-(7,72)
(7,30)-(7,72)
(7,50)-(7,67)
(7,50)-(7,72)
*)
