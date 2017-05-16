
let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let m a b = "[" ^ (a ^ ((";" b) ^ "]")) in
      let base = f h in List.fold_left m base l;;
