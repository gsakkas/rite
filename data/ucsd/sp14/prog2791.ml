
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = if t = sep then sep else h in
      let l = sl in List.fold_left f base l;;
