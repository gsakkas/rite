
let rec removeZero l =
  List.fold_left (fun l  -> match l with | h::t -> if h = 0 then t else l) []
    l;;
