
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ sep in
      let base = "" in let l = h in List.fold_left f base l;;

let _ = sepConcat ", " ["foo"; "bar"; "baz"];;
