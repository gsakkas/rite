
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if a = "a" then a ^ (x ^ sep) in
      let base = "" in let l = sl in List.fold_left f base l;;
