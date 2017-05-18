
let rec fold_l f base xs =
  match xs with | [] -> base | h::t -> f (fold_l f base t) h;;

let list2 = [(-1); (-2); (-3); (-4)];;

let concatL = fold_l (fun temp  -> fun h  -> h ^ temp) 0 list2;;
