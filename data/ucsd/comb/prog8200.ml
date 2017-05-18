
let pipe fs =
  let f a x g = x a g in let base f = f in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + 3)] 3;;
