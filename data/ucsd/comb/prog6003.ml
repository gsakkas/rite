
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ h) in
      let base = "" in let l = sepConcat sep t in List.fold_left f base l;;
