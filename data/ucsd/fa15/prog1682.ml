
let rec helper (rand,depth) =
  let x = rand (0, 6) in
  match depth with
  | 0 -> (match x with | 0::1::2::3::[] -> "0" | _ -> "1")
  | _ ->
      (match x with
       | 0 -> "0" ^ (helper (rand, (depth - 1)))
       | 1 -> "1" ^ (helper (rand, (depth - 1)))
       | 2 -> "2" ^ (helper (rand, (depth - 1)))
       | 3 -> "3" ^ (helper (rand, (depth - 1)))
       | 4 -> "4" ^ (helper (rand, (depth - 1)))
       | 5 -> "5" ^ (helper (rand, (depth - 1)))
       | _ -> "6" ^ (helper (rand, (depth - 1))));;
