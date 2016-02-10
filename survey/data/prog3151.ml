let rec sqsum xs =
  match xs with
  | [] -> 0
  | h::t -> (sqsum t) @ (h * h)

let _ = sqsum [1; 2]
