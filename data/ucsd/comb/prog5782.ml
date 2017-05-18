
let rec tenEx x y =
  match y with | [] -> [] | h::t -> ((10.0 ** x) *. h) @ (tenEx (x +. 1.0) t);;
