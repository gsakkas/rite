
let rec fold_l f base xs =
  match xs with | [] -> base | h::t -> f h fold_l f base t;;
