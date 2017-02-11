
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (List.rev t) ^ a in
      let base = h ^ sep in let l = sl in List.fold_left f base l;;
