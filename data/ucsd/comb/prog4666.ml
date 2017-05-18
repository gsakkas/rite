
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sepConcat a x) in
      let base = h ^ sep in let l = List.rev t in List.fold_left f base l;;
