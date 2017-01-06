
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile (let k x = f x in ((b, (b != b)), b));;



let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;


(* changed spans
(7,34)-(7,35)
(7,48)-(7,50)
(7,53)-(7,54)
(7,65)-(7,66)
*)

(* type error slice
(7,22)-(7,64)
*)
