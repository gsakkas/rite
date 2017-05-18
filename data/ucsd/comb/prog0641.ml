
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = "" in
      let l = [(fun x  -> x ^ sep)] in List.fold_left f base l;;
