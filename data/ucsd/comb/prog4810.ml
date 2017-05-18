
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sepConcat (h ^ (sep t)) in
      let base = "" in let l = t in List.fold_left f base l;;
