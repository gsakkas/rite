
let temp = List.fold_left (fun x  -> fun y  -> y x) [] [(fun x  -> x + 1)];;
