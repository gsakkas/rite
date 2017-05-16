
let pipe fs = let f a x = x a in let base f = 0 in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + x)] 2;;
