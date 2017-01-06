
let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  fun (x,y)  -> x + (Random.State.int s (y - x));;

let rand = makeRand (10, 39);;

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let x = rand (1, 4);;

let fixpoint (f,b) =
  wwhile (let k x = let y = f x in f x in ((x, (y != x)), b));;



let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;


(* changed spans
(2,5)-(9,4)
(14,5)-(16,4)
(17,15)-(17,16)
(17,25)-(17,26)
(17,36)-(17,42)
(17,44)-(17,46)
(17,49)-(17,50)
(17,54)-(17,55)
(17,61)-(17,62)
*)

(* type error slice
*)
