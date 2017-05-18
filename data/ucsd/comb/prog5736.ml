
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sl t) in
      let base = x in
      let l = failwith "to be implemented" in List.fold_left f base l;;
