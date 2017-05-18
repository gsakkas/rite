
let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  fun (x,y)  -> x + (Random.State.int s (y - x));;

let g2 () = ((makeRand 0.1), (makeRand 0.1), (makeRand 10.18));;
