
let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let f a x = (string_of_int a) ^ x in
      let base = h in let l = t in List.fold_left f base l;;
