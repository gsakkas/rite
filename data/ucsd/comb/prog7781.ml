
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sl in
      let l = failwith "to be implemented" in List.fold_left f base l;;
