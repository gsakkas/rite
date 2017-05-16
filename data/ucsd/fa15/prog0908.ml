
let rec helper x = if x = 0 then 1 else 10 * (helper (x - 1));;

let rec tenEx x y =
  match y with
  | [] -> []
  | h::t -> ((helper x) * h) @ (tenEx (helper (x + 1)) t);;
