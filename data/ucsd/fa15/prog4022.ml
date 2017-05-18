
let compose f g x = f (g x);;

let pipe fs =
  let f a x = compose x a in let base f x = x in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + 3)] 3;;
