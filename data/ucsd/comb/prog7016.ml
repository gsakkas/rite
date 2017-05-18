
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x a in
      let base = h ^ (sepConcat sep t) in
      let l = t in List.fold_left f base l;;
