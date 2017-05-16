
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = List.append (List.append a sep) h in
      let base = "" in let l = sl in List.fold_left f base l;;
