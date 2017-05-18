
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sepConcat sep t) in
      let base = if (List.length t) > 0 then h ^ sep else h in
      let l = if (List.length t) > 0 then [t] else [] in
      List.fold_left f base l;;

let _ = sepConcat "X" [("hello", "yo")];;
