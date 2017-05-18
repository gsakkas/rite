
let rec tenEx x y =
  match y with | [] -> [] | h::t -> ((10 * x) *. h) @ (tenEx (x + 1) t);;
