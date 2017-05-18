
let pipe fs =
  let f a x = x (fun a  -> a) in let base b = b in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 4;;
