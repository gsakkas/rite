
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if List.length < 2 then a ^ x in
      let base = "" in let l = sl in List.fold_left f base l;;
