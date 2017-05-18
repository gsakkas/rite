
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ (sepConcat sep t)) in
      let base = t in
      let l = failwith "to be implemented" in List.fold_left f base l;;
