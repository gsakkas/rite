
let pipe fs =
  let f a x = (fun a'  -> fun x'  -> x' a') a x in
  let base b = b in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 4;;
