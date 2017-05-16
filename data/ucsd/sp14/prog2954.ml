
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length t) > 2 then a ^ (x ^ sep) else x ^ x in
      let base = "" in let l = sepConcat sep t in List.fold_left f base l;;
