
let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = string_of_int h in let l = t in List.fold_left f base l;;
