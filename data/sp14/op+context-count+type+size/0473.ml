
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile (let g x = f x in (((g b) != b), b));;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,28)-(7,64)
(7,35)-(7,42)
(7,39)-(7,42)
(7,47)-(7,59)
(7,48)-(7,53)
(7,49)-(7,50)
(7,51)-(7,52)
(7,61)-(7,62)
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
(7,21)-(7,64)
(7,28)-(7,64)
(7,46)-(7,63)
(7,47)-(7,59)
*)
