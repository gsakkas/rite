
let rec build (rand,depth) =
  match rand with | 1 -> 1 | 2 -> 2 | 3 -> 3 | _ -> 4;;

let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  fun (x,y)  -> x + (Random.State.int s (y - x));;

let _ = build ((makeRand (2, 3)), 2);;
