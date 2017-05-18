
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = List.append h sep in
      let base = h in let l = sl in List.fold_left f base l;;
