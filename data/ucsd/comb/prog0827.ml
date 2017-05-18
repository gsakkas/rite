
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ x in
      let base = "" in let l = sl in List.fold_left f base;;
