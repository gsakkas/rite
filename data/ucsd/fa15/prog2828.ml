
let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (x ^ sep) :: a in
      let base = "a" in let l = t in List.fold_left f base l;;
