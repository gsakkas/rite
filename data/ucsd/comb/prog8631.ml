
let pipe fs n = let f a x = a + x in let base = n in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
