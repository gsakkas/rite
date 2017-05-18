
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ x in
      let base x = h ^ x in let l = t in List.fold_left f base l;;
