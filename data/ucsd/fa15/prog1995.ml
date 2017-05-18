
let rec helper (rand,depth) =
  match depth with
  | 0 -> let x = rand (0, 1) in (match x with | 0 -> "0" | _ -> "1")
  | _ ->
      let y = rand (0, 6) in
      (match y with
       | 0 -> "0" ^ (helper (rand, (depth - 1)))
       | 1 -> "1" ^ (helper (rand, (depth - 1)))
       | 2 -> "2" ^ (helper (rand, (depth - 1)))
       | 3 -> "3" ^ (helper (rand, (depth - 1)))
       | 4 -> "4" ^ (helper (rand, (depth - 1)))
       | 5 -> "5" ^ (helper (rand, (depth - 1)))
       | _ -> "6" ^ (helper (rand, (depth - 1))));;

let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  fun (x,y)  -> x + (Random.State.int s (y - x));;

let _ = helper ("4", (makeRand (10, 50)), 3);;
