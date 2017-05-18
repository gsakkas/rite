
let rec helper (c,rand,depth) =
  match depth with
  | 0 -> let x = rand (0, 1) in (match x with | 0 -> c ^ "0" | _ -> c ^ "1")
  | _ ->
      let y = rand (0, 6) in
      (match y with
       | 0 -> helper ("0", rand, (depth - 1))
       | 1 -> helper ("1", rand, (depth - 1))
       | 2 -> helper ("2", rand, (depth - 1))
       | 3 -> helper ("3", rand, (depth - 1))
       | 4 -> helper ("4", rand, (depth - 1))
       | 5 -> helper ("5", rand, (depth - 1))
       | _ -> helper ("6", rand, (depth - 1)));;

let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  fun (x,y)  -> x + (Random.State.int s (y - x));;

let _ = helper ("0", makeRand, 5);;
