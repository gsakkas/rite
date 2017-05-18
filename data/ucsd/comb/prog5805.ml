
let rec helper l1 l2 =
  match l1 with | [] -> [] | h::t -> (h, l2) :: (helper (t, l2));;
