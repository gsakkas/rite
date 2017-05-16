
let rec fold_l f base xs =
  match xs with
  | [] -> base
  | h::t -> let temp = fold_l f base t in temp (f h);;
