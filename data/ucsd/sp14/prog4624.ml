
let base x = x;;

let crack a x = x a;;

let _ = List.fold_left crack base [(fun x  -> x * x)] 3;;
