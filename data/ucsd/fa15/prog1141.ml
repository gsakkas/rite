
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ t) in
      let base = "" in let l = sl in List.fold_left f base l;;
