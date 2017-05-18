
let rec helper t1 t2 =
  match t1 with | [] -> [] | h::t -> (h, t2) :: (helper (t, t2));;
