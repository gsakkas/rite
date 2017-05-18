
let _ = List.fold_left (fun a  -> fun x  -> ((x a), (fun x  -> (x, [])))) 3;;
