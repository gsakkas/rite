
let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let g a x = a ^ (";" ^ x) in
      let base = f h in let x = f t in List.fold_left g base x;;
