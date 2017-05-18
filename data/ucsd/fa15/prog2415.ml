
let stringOfList f l =
  let fx a b = match b with | [] -> "" | h::t -> a ^ h in
  let base = "" in List.fold_left fx base l;;

let _ = stringOfList (fun x  -> x) ["foo"];;
