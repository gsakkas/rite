
let pipe fs = let f a x p = a x in let base z = z in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + x)] 3;;
