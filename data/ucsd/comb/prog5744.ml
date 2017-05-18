
let rec clone x n =
  match n with
  | 0 -> []
  | h::t ->
      let f a x = a in let base = "[" in let l = a in List.fold_left f base l;;
