
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = if (List.length t) <> 0 then t else [] in
      let l = if (List.length t) <> 0 then "" else sep in
      List.fold_left f base l;;
