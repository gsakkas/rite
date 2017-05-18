
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = "" in let l = h in List.fold_left f base l;;

let _ = sepConcat "" ["a"; "b"; "c"; "d"; "e"];;
