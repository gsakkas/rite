
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (x ^ sep) ^ a in
      let base = "" in let l = h ^ t in List.fold_left f base l;;
