
let pipe fs =
  let f a x = (fun x  -> fun a  -> x a) x a in
  let base x = x in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
