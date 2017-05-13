
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ h in
      let base = h in let l = sepConcat t in List.fold_left f base l;;
