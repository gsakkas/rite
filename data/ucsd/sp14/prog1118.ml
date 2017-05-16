
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

let fixpoint (f,b) = wwhile (let xx = (x * x) * x in ((xx, (xx < 100)), b));;
