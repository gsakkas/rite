
let rec sumHelper xs =
  match xs with | [] -> 0 | h::t -> (h * h) :: (sumHelper t);;
