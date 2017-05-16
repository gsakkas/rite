
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (x ^ sep) :: a in
      let base = h in let l = sepConcat (sep t) in List.fold_left f base l;;
