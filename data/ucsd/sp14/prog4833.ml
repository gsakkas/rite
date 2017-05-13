
let pipe fs = let f a x g = a x in let base y = y in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x); (fun x  -> x)] 4;;
