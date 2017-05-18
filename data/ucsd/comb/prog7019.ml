
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x a in
      let base = if (List.length t) <> 0 then "" else sep in
      let l = if (List.length t) <> 0 then t else [] in
      List.fold_left f base l;;

let _ = sepConcat "" ["a"; "b"; "c"; "d"; "e"];;
